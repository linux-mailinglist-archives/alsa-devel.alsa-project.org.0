Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB031DB24E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 13:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21B717D3;
	Wed, 20 May 2020 13:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21B717D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589975541;
	bh=rJKI5KOw/P0DOI1eKou8pLex8CljJXr1baDb6mvdJXQ=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=atJVeEtRcBwZ9M1UGUK24Lj5r0nmxB5yGH4Lq0w4zCjJxUHA9SwOWNET8k5mqGD55
	 8OW8dmxz8ibKIzxJvoyH2C/VSoeK/5NHmR6CPq3XNqGKh7WIm/z17UwEtnAAAS/AwK
	 oVEhGB1CHYGDR+Y183cqC8H67KLIzTmxOtBZwYAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6601EF80272;
	Wed, 20 May 2020 13:50:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 664F2F801F9; Wed, 20 May 2020 13:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486CCF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 13:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486CCF80132
Received: from imladris.surriel.com ([96.67.55.152])
 by shelob.surriel.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <riel@shelob.surriel.com>)
 id 1jbMsE-0003xQ-7J; Wed, 20 May 2020 07:26:58 -0400
Message-ID: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
Subject: XHCI vs PCM2903B/PCM2904 part 2
From: Rik van Riel <riel@surriel.com>
To: linux-usb <linux-usb@vger.kernel.org>
Date: Wed, 20 May 2020 07:26:57 -0400
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-KZ0PlQuw8u0ClyxHg+lW"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 13:50:17 +0200
Cc: alsa-devel@alsa-project.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--=-KZ0PlQuw8u0ClyxHg+lW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After a few more weeks of digging, I have come to the tentative
conclusion that either the XHCI driver, or the USB sound driver,
or both, fail to handle USB errors correctly.

I have some questions at the bottom, after a (brief-ish) explanation
of exactly what seems to go wrong.

TL;DR: arecord from a misbehaving device can hang forever
after a USB error, due to poll on /dev/snd/timer never returning.

The details: under some mysterious circumstances, the PCM290x
family sound chips can send more data than expected during an
isochronous transfer, leading to a babble error. Those
circumstances seem to in part depend on the USB host controller
and/or the electrical environment, since the chips work just
fine for most people.

Receiving data past the end of the isochronous transfer window
scheduled for a device results in the XHCI controller throwing
a babble error, which moves the endpoint into halted state.

This is followed by the host controller software sending a
reset endpoint command, and moving the endpoint into stopped
state, as specified on pages 164-165 of the XHCI specification.

However, the USB sound driver seems to have no idea that this
error happened. The function retire_capture_urb looks at the
status of each isochronous frame, but seems to be under the
assumption that the sound device just keeps on running.

The function snd_complete_urb seems to only detect that the
device is not running if usb_submit_urb returns a failure.

        err =3D usb_submit_urb(urb, GFP_ATOMIC);
        if (err =3D=3D 0)
                return;

        usb_audio_err(ep->chip, "cannot submit urb (err =3D %d)\n", err);

        if (ep->data_subs && ep->data_subs->pcm_substream) {
                substream =3D ep->data_subs->pcm_substream;
                snd_pcm_stop_xrun(substream);
        }

However, the XHCI driver will happily submit an URB to a
stopped device. Looking at the call trace usb_submit_urb ->
xhci_urb_enqueue -> xhci_queue_isoc_tx_prepare -> prepare_ring,
you can see this code:

        /* Make sure the endpoint has been added to xHC schedule */
        switch (ep_state) {
...
        case EP_STATE_HALTED:
                xhci_dbg(xhci, "WARN halted endpoint, queueing URB anyway.\=
n");
        case EP_STATE_STOPPED:
        case EP_STATE_RUNNING:
                break;

This leads me to a few questions:
- should retire_capture_urb call snd_pcm_stop_xrun,
  or another function like it, if it sees certain
  errors in the iso frame in the URB?
- should snd_complete_urb do something with these
  errors, too, in case they happen on the sync frames
  and not the data frames?
- does the XHCI code need to ring the doorbell when
  submitting an URB to a stopped device, or is it
  always up to the higher-level driver to fully reset
  the device before it can do anything useful?
- if a device in stopped state does not do anything
  useful, should usb_submit_urb return an error?
- how should the USB sound driver recover from these
  occasional and/or one-off errors? stop the sound
  stream, or try to reinitialize the device and start
  recording again?

I am willing to write patches and can test with my
setup, but both the sound code and the USB code are
new to me so I would like to know what direction I
should go in :)

--=20
All Rights Reversed.

--=-KZ0PlQuw8u0ClyxHg+lW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEKR73pCCtJ5Xj3yADznnekoTE3oMFAl7FFAEACgkQznnekoTE
3oM+AAf+JhbuACD7UFirucp8tydQbMb1EuABebzvTo+DuA0miaAAYbfZu8o1g3P1
gg7edPquFrT88411j4qWGfHSBvG9n3WhF8qLm1aIdLB83K9Vi0R1oxDgizg8I4IR
R/EO16XdMWsOKAsv4yiKtuDGUZ8Y+TuGivRts6bTKjwqxABOVeX82zCPmHOPe6dI
z2EXhqmduk4W2Hfswz5ouBMHyNpPeMEMPWxlIwhU+d6a/5ZkhDcoWvaxC8sr5LRC
W4LhSZINZsMt+tzjy1dv7EkTQz/gGBKU+ZnTrA5XZxLAT83Y2YmdQd+76UUmSyzl
c9N17a9S0hnZ6luq73BDEh7vsj/ZZA==
=8U/0
-----END PGP SIGNATURE-----

--=-KZ0PlQuw8u0ClyxHg+lW--

