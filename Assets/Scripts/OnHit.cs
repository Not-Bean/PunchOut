using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class OnHit : MonoBehaviour
{
    public GameObject Player;
    public GameObject HitPlayer;
    [SerializeField] public bool hit = false;
    void Start()
    {
        HitPlayer.SetActive(false);//sets the hot player to false so it doesn't appear
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))//gets if the player is hit
        {
            hit = true;//sets hit to true
            StartCoroutine(FlashHit());//starts coroutine
        }
    }
    void Hit()//sets the player to be invisible and shows the hit player model
    {
        print("Hit");
        Player.SetActive(false);
        HitPlayer.SetActive(true);
    }

    void Flash()//sets the regular player model to be visible
    {
        print("Flash");
        Player.SetActive(true);
        HitPlayer.SetActive(false);
    }

    IEnumerator FlashHit()//flashes the hit and non hit player model
    {
        Hit();
        yield return new WaitForSeconds(0.5f);
        Flash();
        hit = false;

    }
}
