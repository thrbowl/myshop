<?php

session_start();

function get_uuid()
{
    return uniqid();
}

function render_to_web($sharp, $component = NULL, $data = NULL)
{
    $GLOBALS['component'] = $component;
    render($data, 'web', $sharp);
}

function forward($url)
{
    header("Location: " . $url);
}

function jsforword($url)
{
    return '<script>location="' . $url . '"</script>';
}
