var camera, scene, renderer;
var geometry, material, mesh, geometry1, mesh1,geometry2, material2, mesh2, controls;
var  updates;


init();
animate();

function init() {
    updates = 0;
    camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 0.01, 10 );
    camera.position.z = 1;

    scene = new THREE.Scene();

    geometry = new THREE.BoxGeometry( 0.2, 0.2, 0.2 );
    geometry1 = new THREE.BoxGeometry( 0.4, 0.4, 0.4 );
    geometry2 = new THREE.SphereGeometry( 0.2, 8, 1 );
    material = new THREE.MeshNormalMaterial();
    material2 = new THREE.MeshBasicMaterial( {color: 0x00ff00} );

    mesh = new THREE.Mesh( geometry, material );
    mesh1 = new  THREE.Mesh(geometry1, material);
    mesh2 = new THREE.Mesh(geometry2, material)

    scene.add( mesh, mesh1, mesh2 );

    mesh1.position.setX(0.6);
    mesh2.position.setX(-0.6);
    renderer = new THREE.WebGLRenderer( { antialias: true } );
    renderer.setSize( window.innerWidth* 0.5, window.innerHeight*0.5 );
    document.body.appendChild( renderer.domElement );

}

function animate(event) {

    requestAnimationFrame( animate );

    updates++;

    mesh1.position.y = Math.sin(updates*0.05)*0.3;

    mesh2.rotation.x -= 0.05;


    mesh.rotation.x -= 0.05;
    mesh.rotation.y -= 0.08;

    renderer.render( scene, camera );

}

