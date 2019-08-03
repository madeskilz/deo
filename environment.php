<?php

if(! defined('ENVIRONMENT') )
{
    $domain = strtolower($_SERVER['HTTP_HOST']);

    switch($domain) {
        case 'deogratiaspoly.edu.ng' :
        case 'www.deogratiaspoly.edu.ng':
            define('ENVIRONMENT', 'production');
            break;

        case 'dev.deogratiaspoly.edu.ng' :
            //our staging server
            define('ENVIRONMENT', 'staging');
            break;

        default :
            define('ENVIRONMENT', 'development');
            break;
    }
}