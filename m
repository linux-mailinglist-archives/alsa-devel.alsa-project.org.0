Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30E445BBD
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 22:39:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB10F1688;
	Thu,  4 Nov 2021 22:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB10F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636061942;
	bh=DWFhm9oEwYN58A9BFL9zVAClCVM5XOC07ZV8hkiKwgQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jALdJTm4txlj/LQrGNcF94XR+/avMCs9pQXf++j8t9AsIcM4VqRzv+aCuhCztyABI
	 /E2GqaSjb2dsQ4S4WLJi5ZuuXJv/9mo6gtH162oERTCkscctDf2lKT8h89vfMPWbAj
	 jaaRNkTC83gHYltZNFMaQU1NMS7nmqOv2KCsgv0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA93F80224;
	Thu,  4 Nov 2021 22:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D2F7F8025D; Thu,  4 Nov 2021 22:37:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cyan.ash.relay.mailchannels.net
 (cyan.ash.relay.mailchannels.net [23.83.222.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70011F80224
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 22:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70011F80224
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=thevertigo.com header.i=@thevertigo.com header.b="f24s0fJ9"
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 87D8A6216B8;
 Thu,  4 Nov 2021 21:37:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a271.central1.pdx1.dh-int.com (unknown
 [127.0.0.6]) (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 28BE3621191;
 Thu,  4 Nov 2021 21:37:28 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from pdx1-sub0-mail-a271.central1.pdx1.dh-int.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.118.34.197 (trex/6.4.3); Thu, 04 Nov 2021 21:37:28 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kip@thevertigo.com
X-MailChannels-Auth-Id: dreamhost
X-Battle-Name: 04fe496f636f6951_1636061848327_2888693879
X-MC-Loop-Signature: 1636061848327:2037722758
X-MC-Ingress-Time: 1636061848326
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a271.central1.pdx1.dh-int.com (Postfix) with ESMTPSA id
 4HlcRq4MXBz1RV; Thu,  4 Nov 2021 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1636061847; bh=XG4INMkjyaYPK9eJCgalHh2o1MY=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=f24s0fJ9nCCQiaNitugqiaz33Q1pBMtp41ZftAMgb/zV1Jh18Bmkt65aXZutqEiGn
 I6T2GNMQXJ+ZTnXuMeyuk4Rx03pyY8cjdrLB5Ssu6BdQ7uUzM30PleuUOZyY5j6ldc
 7Y/8Z+uTWpGgTlPc0vjG5xYaleVeO/+L3QMlMo98=
Message-ID: <e91d7a44b9a456141d856ea57aa2948c3be4422f.camel@thevertigo.com>
Subject: Re: [Alsa-user] USB audio on riscv64
From: Kip Warner <kip@thevertigo.com>
To: Dmitri Seletski <drjoms@gmail.com>
Date: Thu, 04 Nov 2021 14:37:26 -0700
In-Reply-To: <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
References: <f2ec64dab6a74c7eee0625533d3c3630adb62a41.camel@thevertigo.com>
 <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uwLt9ht8sPk+av+v7NoT"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Cc: Alsa-user@lists.sourceforge.net, alsa-devel@alsa-project.org
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


--=-uwLt9ht8sPk+av+v7NoT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-11-04 at 08:40 +0000, Dmitri Seletski wrote:
> I am just a user.
> Can't help but wonder if usb snd modules were compiled in or loaded?

Hey Dmitri,

CC'ing the lists. When I plug in the device, I see the following on the
bus:

   $ lsusb
   ...
   Bus 001 Device 003: ID 1908:2070 GEMBIRD Honk HK-5002 USB Speaker
   ...

The kernel logs the following in kern.log:

   [  291.681086] usb 1-2.3: new full-speed USB device number 3 using xhci_=
hcd
   [  291.850299] usb 1-2.3: New USB device found, idVendor=3D1908, idProdu=
ct=3D2070, bcdDevice=3D 1.00
   [  291.850333] usb 1-2.3: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D3
   [  291.850345] usb 1-2.3: Product: USB2.0 Device
   [  291.850355] usb 1-2.3: Manufacturer: Generic
   [  291.850365] usb 1-2.3: SerialNumber: 20130100ph0
   [  292.434209] mc: Linux media interface: v0.10
   [  292.734949] usb 1-2.3: 1:1: cannot get freq at ep 0x2
   [  292.802612] usb 1-2.3: 2:0: bogus dB values (-12800/-12700), disablin=
g dB reporting
   [  292.803733] usbcore: registered new interface driver snd-usb-audio

The device still doesn't appear to be visible to ALSA:

   $ aplay -l
   aplay: device_list:276: no soundcards found...

If I try playing an Ogg/Vorbis file with mpv, I see the following with
no sound:

   $ mpv "/usr/share/games/lincity-ng/music/default/01 - pronobozo - lincit=
y.ogg"
    (+) Audio --aid=3D1 (vorbis 2ch 44100Hz)
   AO: [pulse] 44100Hz stereo 2ch float
  =20
   A: 00:01:00 / 00:03:30 (28%)

The device works fine on arm64 via a Raspberry Pi 4.

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-uwLt9ht8sPk+av+v7NoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmGEUpYACgkQRLRlxF7U
4wQhGBAAiYrwyeMovyeOpTLVaGukFYIiRXknHTrP7Ergexp6dzkGHO9Qedw3F/cn
qfDavuOLCWpCRchhHh/E8raxLU1W/bbL/pV30mptnfzxfm7FihGa3s9Bj//2Jt+4
QjuajBVj6yqFeNoGMD44hhNb6xGDsgAVWrn318GCs4FxjAbfdnSCib8LjUNJxZ3N
1IyiK5K4KhEOWmhJyvv/D0+85s6BIzUxBynWfKMR8upbXFSfjOYKVrMBOSitbC3f
F5S5d8ZEBIN/QP/Jhj17CkHzqe0uWYBY8NhhKJqSwnpQocMeJOzHcfVFj5E9KA83
H3R6NgdS3sx1RrP/oHnvfpiuf0anaILqPjhj8VvlnrDxeZVQWasKG71YTHdgomDC
5+WEddahdMRgdx1LI4XUnbNh/L+MXKToU9b+dyt3X/YKIS1RCmdv9rx9vHKFNJSc
6H5GCZqx1PCKSFFebBvJCA7Vq8NWHSB5HI5eG5tMFR5AYeaRLQtQ0BJqWNbCECLv
jHdiiiDcpJ1lgq7sWDgEUo3399JAhyRa+X2oVB4BuNsJgcTbFpJfLT7BNGXeH7TG
DDf0Ig0xhi384UUgXKx4j8GC9+5eP+RU9RkqAM700saM+P1L0PbY9Ck0EWwyKucm
zhlOeOU5YClms4p1IcVOdVu4YQrp97WKhqW6EAy/d9cFGSoMgSE=
=nZte
-----END PGP SIGNATURE-----

--=-uwLt9ht8sPk+av+v7NoT--

