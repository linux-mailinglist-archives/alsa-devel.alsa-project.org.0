Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E011DBE78
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 21:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE491811;
	Wed, 20 May 2020 21:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE491811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590004527;
	bh=hL9Mvb7/w9/JnEtmueSFv30gA9RCNGU7Txf6bqyxAEk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEpZNQ6ztw1CZqUhygoL+ox8z7LAuryPQ0Fdlsx8oPvXhPDXnPoCaI+ipR2GEltLx
	 tWGC8rv4VI86vjX8TDEsTgkWC/bqbv2UedzwKhgEnFuyRXbtii91MUO2bNWQmn48hl
	 q0bMtxSt2MIABzIBjtpp7xm7RlyHVufMSRLWtxp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E165FF80090;
	Wed, 20 May 2020 21:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFD0EF801F9; Wed, 20 May 2020 21:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E23A2F80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 21:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E23A2F80090
Received: from imladris.surriel.com ([96.67.55.152])
 by shelob.surriel.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <riel@shelob.surriel.com>)
 id 1jbUmL-0006t9-QY; Wed, 20 May 2020 15:53:25 -0400
Message-ID: <438394b419955a430d884a175a6eda0a99ce4d08.camel@surriel.com>
Subject: Re: XHCI vs PCM2903B/PCM2904 part 2
From: Rik van Riel <riel@surriel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb
 <linux-usb@vger.kernel.org>
Date: Wed, 20 May 2020 15:53:25 -0400
In-Reply-To: <296d1b03-fbc3-6107-950e-00d38633ea1f@linux.intel.com>
References: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
 <296d1b03-fbc3-6107-950e-00d38633ea1f@linux.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-MCFKym22daNl+Rfy42MS"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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


--=-MCFKym22daNl+Rfy42MS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-20 at 16:50 +0300, Mathias Nyman wrote:
> On 20.5.2020 14.26, Rik van Riel wrote:
> > After a few more weeks of digging, I have come to the tentative
> > conclusion that either the XHCI driver, or the USB sound driver,
> > or both, fail to handle USB errors correctly.
> >=20
> > I have some questions at the bottom, after a (brief-ish)
> > explanation
> > of exactly what seems to go wrong.
> >=20
> > TL;DR: arecord from a misbehaving device can hang forever
> > after a USB error, due to poll on /dev/snd/timer never returning.
> >=20
> > The details: under some mysterious circumstances, the PCM290x
> > family sound chips can send more data than expected during an
> > isochronous transfer, leading to a babble error. Those
> > circumstances seem to in part depend on the USB host controller
> > and/or the electrical environment, since the chips work just
> > fine for most people.
> >=20
> > Receiving data past the end of the isochronous transfer window
> > scheduled for a device results in the XHCI controller throwing
> > a babble error, which moves the endpoint into halted state.
> >=20
> > This is followed by the host controller software sending a
> > reset endpoint command, and moving the endpoint into stopped
> > state, as specified on pages 164-165 of the XHCI specification.
>=20
> Note that isoch endpoints should generate buffer overrun instead of
> babble detect error on TD babble conditions.=20
> See xHCI spec 6.4.5 additional note 115.

Maybe it should, but I'm hitting this printk in handle_tx_event:

        case COMP_BABBLE_DETECTED_ERROR:
                xhci_dbg(xhci, "Babble error for slot %u ep %u on
endpoint\n",
                         slot_id, ep_index);
                status =3D -EOVERFLOW;
                break;

Tracing in the sound driver suggests that packet belongs to
the sound data device (not the sync device), because the
URB with -EOVERFLOW status for the isochronous packet in that
URB is the last one seen there.

> Or maybe a frame babble could halt an isoc endpoint, see xhci
> 4.10.2.4.1
> but then you should see a port error and port going to disabled
> state.
>=20
> Any logs of this?
>=20
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < trigger the issue >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace

dmesg:=20
https://drive.google.com/open?id=3D1S2Qc8lroqA5-RMukuLBLWFGx10vEjG-i

usbtrace:=20
https://drive.google.com/open?id=3D1cbLcOnAtQRW0Chgak6PNC0l4yJv__4uO

> > However, the USB sound driver seems to have no idea that this
> > error happened. The function retire_capture_urb looks at the
> > status of each isochronous frame, but seems to be under the
> > assumption that the sound device just keeps on running.
> >=20
> > The function snd_complete_urb seems to only detect that the
> > device is not running if usb_submit_urb returns a failure.
> >=20
> >         err =3D usb_submit_urb(urb, GFP_ATOMIC);
> >         if (err =3D=3D 0)
> >                 return;
> >=20
> >         usb_audio_err(ep->chip, "cannot submit urb (err =3D %d)\n",
> > err);
> >=20
> >         if (ep->data_subs && ep->data_subs->pcm_substream) {
> >                 substream =3D ep->data_subs->pcm_substream;
> >                 snd_pcm_stop_xrun(substream);
> >         }
> >=20
> > However, the XHCI driver will happily submit an URB to a
> > stopped device. Looking at the call trace usb_submit_urb ->
> > xhci_urb_enqueue -> xhci_queue_isoc_tx_prepare -> prepare_ring,
> > you can see this code:
> >=20
> >         /* Make sure the endpoint has been added to xHC schedule */
> >         switch (ep_state) {
> > ...
> >         case EP_STATE_HALTED:
> >                 xhci_dbg(xhci, "WARN halted endpoint, queueing URB
> > anyway.\n");
> >         case EP_STATE_STOPPED:
> >         case EP_STATE_RUNNING:
> >                 break;
> >=20
> > This leads me to a few questions:
> > - should retire_capture_urb call snd_pcm_stop_xrun,
> >   or another function like it, if it sees certain
> >   errors in the iso frame in the URB?
> > - should snd_complete_urb do something with these
> >   errors, too, in case they happen on the sync frames
> >   and not the data frames?
> > - does the XHCI code need to ring the doorbell when
> >   submitting an URB to a stopped device, or is it
> >   always up to the higher-level driver to fully reset
> >   the device before it can do anything useful?
>=20
> xhci driver should ring the doorbell.
>=20
> xhci_queue_isoc_tx()
>   giveback_first_trb()
>     xhci_ring_ep_doorbell()
>=20
> when we are talking about babble or transaction errors the device
> might be
> completely unaware of the situation. Device side of the endpoint is
> not necessarily halted.
> xHC host will only halt its internal endpoint state, and it needs a
> reset
> endopoint command from the xhci driver to clear the internal halt
> state.=20

Interesting. I had no idea the endpoint on each side
was controlled separately.

--=20
All Rights Reversed.

--=-MCFKym22daNl+Rfy42MS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEKR73pCCtJ5Xj3yADznnekoTE3oMFAl7FirUACgkQznnekoTE
3oMoKAf/erzL9vjQylVh7pfNIa1O//rcvujkIcOk+hfQlLRawA8DvrGCp1mbYosz
EbUYMpvccIaXQSIYwRKic2YrSzhL/NFxvu9fk1om0RuMfbdZ1npBuzhl+pOrb6cl
brPakWTKvcuJotTFtDWJ393okXp2wOR4+OJ62kyIz3suP3pZpXRQQeI+ox4qxDmn
fK3ghFOsW9f7p3oXjfvtHvcBLTO+mvdmp9EzCAKF8795A74aO3FPkweq28XZOOSM
QQiaKVE2aXoGJQV2Dg1UtokXSxyLQ6ytertV5PVzJDHcFS5JB/D0Pai56BQr8Sii
Hsf39gC0j/ZW44Pxe1uWIzsDo5CMEw==
=Qg0h
-----END PGP SIGNATURE-----

--=-MCFKym22daNl+Rfy42MS--

