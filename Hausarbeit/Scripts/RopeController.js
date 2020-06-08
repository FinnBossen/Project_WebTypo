function Particle(x, y, mass) {
    this.x = x || 0;
    this.y = y || 0;
    this.ox = this.x;
    this.oy = this.y;
    this.mass = mass || 1.0;
    this.massInv = 1.0 / this.mass;
    this.fixed = false;

    this.update = function () {
    };
}

function Spring(p1, p2, restLength, strength) {

    this.p1 = p1;
    this.p2 = p2;
    this.restLength = restLength || 10;
    this.strength = strength || 1.0;

    this.update = function () {

        // Compute desired force
        var dx = p2.x - p1.x,
            dy = p2.y - p1.y,
            dd = Math.sqrt(dx * dx + dy * dy) + 0.0001,
            tf = (dd - this.restLength) / (dd * (p1.massInv + p2.massInv)) * this.strength,
            f;

        // Apply forces
        if (!p1.fixed) {
            f = tf * p1.massInv;
            p1.x += dx * f;
            p1.y += dy * f;
        }

        if (!p2.fixed) {
            f = -tf * p2.massInv;
            p2.x += dx * f;
            p2.y += dy * f;
        }
    };
}

function Sim() {

    this.particles = [];
    this.springs = [];

    this.tick = function (dt) {
        var p = this.particles.length;
        while (p--) this.particles[p].update();

        var s = this.springs.length;
        while (s--) this.springs[s].update();
    };
}


// Create a new system
var sim = new Sim(),
    sim2 = new Sim(),
    sim3 = new Sim(),
    sim4 = new Sim(),
    showParticle,
    old = new Date().getTime(),
    canvas = document.getElementById('NodeCanvasBackground'),
    ctx = canvas.getContext('2d'),

    width = canvas.width = window.innerWidth,
    height = canvas.height = window.innerHeight;


function init(Node1, Node2, Node3, Node4, Node5, showParticles) {

    showParticle = showParticles;

    var op,
        op2,
        op3,
        op4,
        mouse,
        mouse2,
        mouse3,
        mouse4,
        anchor,
        anchor2,
        anchor3,
        anchor4,
        step = 10,
        length = 100,
        count = length / step;

    for (var i = 0; i < count; ++i) {

        var np = new Particle(i * step, 20, 10.1);

        sim.particles.push(np);


        if (i > 0) {
            sim.springs.push(new Spring(np, op, step, 1.0));

        }
        ;

        op = np;
    }

    for (var a = 0; a < count; ++a) {


        var np2 = new Particle(a * step, 20, 10.1);

        sim2.particles.push(np2);

        if (a > 0) {
            sim2.springs.push(new Spring(np2, op2, step, 1.0));
        }
        ;
        op2 = np2;

    }

    for (var e = 0; e < count; ++e) {


        var np3 = new Particle(e * step, 20, 10.1);

        sim3.particles.push(np3);

        if (e > 0) {
            sim3.springs.push(new Spring(np3, op3, step, 1.0));
        }
        ;
        op3 = np3;

    }

    for (var d = 0; d < count; ++d) {


        var np4 = new Particle(d * step, 20, 10.1);

        sim4.particles.push(np4);

        if (d > 0) {
            sim4.springs.push(new Spring(np4, op4, step, 1.0));
        }
        ;
        op4 = np4;

    }


    // Fix the first particle
    anchor = sim.particles[0];
    anchor.fixed = true;

    anchor2 = sim2.particles[0];
    anchor2.fixed = true;

    anchor3 = sim3.particles[0];
    anchor3.fixed = true;

    anchor4 = sim4.particles[0];
    anchor4.fixed = true;

    // Move last particle
    mouse = sim.particles[count - 1];
    mouse.fixed = true;

    mouse2 = sim2.particles[count - 1];
    mouse2.fixed = true;

    mouse3 = sim3.particles[count - 1];
    mouse3.fixed = true;

    mouse4 = sim4.particles[count - 1];
    mouse4.fixed = true;

    anchor.x = Node1.offsetLeft + Node1.clientWidth / 2;
    anchor.y = Node1.offsetTop + 15;
    mouse.x = Node2.offsetLeft + Node2.clientWidth / 2;
    mouse.y = Node2.offsetTop + 15;

    mouse2.x = Node2.offsetLeft + Node2.clientWidth / 2;
    mouse2.y = Node2.offsetTop + 15;
    anchor2.x = Node3.offsetLeft + Node3.clientWidth / 2;
    anchor2.y = Node3.offsetTop + 15;


    mouse3.x = Node3.offsetLeft + Node3.clientWidth / 2;
    mouse3.y = Node3.offsetTop + 15;
    anchor3.x = Node4.offsetLeft + Node4.clientWidth / 2;
    anchor3.y = Node4.offsetTop + 15;

    mouse4.x = Node4.offsetLeft + Node4.clientWidth / 2;
    mouse4.y = Node4.offsetTop + 15;
    anchor4.x = Node5.offsetLeft + Node5.clientWidth / 2;
    anchor4.y = Node5.offsetTop + 15;


    window.addEventListener('mousemove', function () {

        anchor.x = Node1.offsetLeft + Node1.clientWidth / 2;
        anchor.y = Node1.offsetTop + 15;
        mouse.x = Node2.offsetLeft + Node2.clientWidth / 2;
        mouse.y = Node2.offsetTop + 15;

        mouse2.x = Node2.offsetLeft + Node2.clientWidth / 2;
        mouse2.y = Node2.offsetTop + 15;
        anchor2.x = Node3.offsetLeft + Node3.clientWidth / 2;
        anchor2.y = Node3.offsetTop + 15;


        mouse3.x = Node3.offsetLeft + Node3.clientWidth / 2;
        mouse3.y = Node3.offsetTop + 15;
        anchor3.x = Node4.offsetLeft + Node4.clientWidth / 2;
        anchor3.y = Node4.offsetTop + 15;

        mouse4.x = Node4.offsetLeft + Node4.clientWidth / 2;
        mouse4.y = Node4.offsetTop + 15;
        anchor4.x = Node5.offsetLeft + Node5.clientWidth / 2;
        anchor4.y = Node5.offsetTop + 15;


    });

    window.addEventListener('resize', function () {

        anchor.x = Node1.offsetLeft + Node1.clientWidth / 2;
        anchor.y = Node1.offsetTop + 15;
        mouse.x = Node2.offsetLeft + Node2.clientWidth / 2;
        mouse.y = Node2.offsetTop + 15;

        mouse2.x = Node2.offsetLeft + Node2.clientWidth / 2;
        mouse2.y = Node2.offsetTop + 15;
        anchor2.x = Node3.offsetLeft + Node3.clientWidth / 2;
        anchor2.y = Node3.offsetTop + 15;

        mouse3.x = Node3.offsetLeft + Node3.clientWidth / 2;
        mouse3.y = Node3.offsetTop + 15;
        anchor3.x = Node4.offsetLeft + Node4.clientWidth / 2;
        anchor3.y = Node4.offsetTop + 15;

        mouse4.x = Node4.offsetLeft + Node4.clientWidth / 2;
        mouse4.y = Node4.offsetTop + 15;
        anchor4.x = Node5.offsetLeft + Node5.clientWidth / 2;
        anchor4.y = Node5.offsetTop + 15;


    });

};


function step() {

    ctx = canvas.getContext('2d'),
        width = canvas.width = window.innerWidth,
        height = canvas.height = window.innerHeight;


    var now = new Date().getTime(),
        delta = now - old;

    sim.tick(delta);
    sim2.tick(delta);
    sim3.tick(delta);
    sim4.tick(delta);

    // Draw
    ctx.clearRect(0, 0, width, height);


    if (showParticle) {
        var p = sim.particles.length;


        while (p--) {


            var particle = sim.particles[p];
            ctx.beginPath();
            ctx.arc(particle.x, particle.y, 5, Math.PI * 2, false);
            ctx.strokeStyle = 'black';

            ctx.fill();

            var particle2 = sim2.particles[p];

            ctx.beginPath();
            ctx.arc(particle2.x, particle2.y, 5, Math.PI * 2, false);
            ctx.strokeStyle = 'black';

            ctx.fill();


            var particle3 = sim3.particles[p];

            ctx.beginPath();
            ctx.arc(particle3.x, particle3.y, 5, Math.PI * 2, false);
            ctx.strokeStyle = 'black';

            ctx.fill();

            var particle4 = sim4.particles[p];

            ctx.beginPath();
            ctx.arc(particle4.x, particle4.y, 5, Math.PI * 2, false);
            ctx.strokeStyle = 'black';

            ctx.fill();


        }
    }
    var s = sim.springs.length;

    while (s--) {
        var spring = sim.springs[s];

        ctx.beginPath();
        ctx.moveTo(spring.p1.x, spring.p1.y);
        ctx.lineTo(spring.p2.x, spring.p2.y);
        ctx.strokeStyle = 'red';
        ctx.lineWidth = 2;

        ctx.stroke();

        var spring2 = sim2.springs[s];
        ctx.beginPath();
        ctx.moveTo(spring2.p1.x, spring2.p1.y);
        ctx.lineTo(spring2.p2.x, spring2.p2.y);
        ctx.strokeStyle = 'red';
        ctx.lineWidth = 2;

        ctx.stroke();

        var spring3 = sim3.springs[s];
        ctx.beginPath();
        ctx.moveTo(spring3.p1.x, spring3.p1.y);
        ctx.lineTo(spring3.p2.x, spring3.p2.y);
        ctx.strokeStyle = 'red';
        ctx.lineWidth = 2;

        ctx.stroke();

        var spring4 = sim4.springs[s];
        ctx.beginPath();
        ctx.moveTo(spring4.p1.x, spring4.p1.y);
        ctx.lineTo(spring4.p2.x, spring4.p2.y);
        ctx.strokeStyle = 'red';
        ctx.lineWidth = 2;

        ctx.stroke();
    }


    old = now;
};

init(document.getElementById("firstNode"), document.getElementById("secondNode"), document.getElementById("thirdNode"), document.getElementById("fourthNode"), document.getElementById("fifthNode"), false);

setInterval(step, 1000 / 30);






