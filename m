Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786AB2EE8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Sep 2019 09:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9191679;
	Sun, 15 Sep 2019 09:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9191679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568531063;
	bh=ZJWyGoS5JGFlgjLYqLExyjZXxyohKy2rI66AHECup6c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lzMRmuAspIz3dHrkSBAd41K206cm38pFZLNJ5W/XsaRCzwQLN6BHQEgbiRMPqMzbr
	 IIUfnKr2ZY2WkEl1Lu/0sw7riXTHVgPNbWVe4yNUPCliVjZG6aeEjQ9beGNvtWgnyk
	 LudtlJR0prCc3MB+2bS1xKgD47SyPrU5weHQoSUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65223F805F7;
	Sun, 15 Sep 2019 09:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C9C5F8036A; Fri, 13 Sep 2019 18:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C5B4F802DF
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 18:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5B4F802DF
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <benjamin@sipsolutions.net>) id 1i8oEg-0002rJ-0X
 for alsa-devel@alsa-project.org; Fri, 13 Sep 2019 18:15:50 +0200
Message-ID: <6609a4e875ed6828d052d338b0bedbacb024a07f.camel@sipsolutions.net>
From: Benjamin Berg <benjamin@sipsolutions.net>
To: alsa-devel@alsa-project.org
Date: Fri, 13 Sep 2019 18:15:46 +0200
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Sep 2019 09:01:49 +0200
Subject: [alsa-devel] Jack detection in Lenovo OneLink+ and other docks
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
Content-Type: multipart/mixed; boundary="===============3728824961440611720=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3728824961440611720==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Jgcw9qey7CZTFnPNkoC4"


--=-Jgcw9qey7CZTFnPNkoC4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a Lenovo OneLink+ and TB3 docks here. The USB audio adapter on
these docks work fine. However, Jack detection is not functional
unfortunately which is somewhat annoying.

There are HID devices available on the docking stations which seem to
report the jack sensing information. Assuming we can decode this
information correctly, does anyone have an idea how this can be hooked
up so that the information will be available on the audio device
itself?

Benjamin

The OneLink+ dock exposes the following interfaces:
        |__ Port 1: Dev 90, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            |__ Port 3: Dev 92, If 1, Class=3DCDC Data, Driver=3Dcdc_ether,=
 480M
            |__ Port 3: Dev 92, If 0, Class=3DCommunications, Driver=3Dcdc_=
ether, 480M
            |__ Port 4: Dev 94, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio=
, 12M
            |__ Port 4: Dev 94, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio=
, 12M
            |__ Port 4: Dev 94, If 3, Class=3DHuman Interface Device, Drive=
r=3Dusbhid, 12M
            |__ Port 4: Dev 94, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio=
, 12M

Similar on the TB 3 Dock from Lenovo:
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
    |__ Port 1: Dev 2, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
    |__ Port 1: Dev 2, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 12M
    |__ Port 1: Dev 2, If 3, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
    |__ Port 4: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M

On each of these devices, plugging/unplugging will fire various HID
events, seemingly with some sensing information.

On the OneLink Plus:
D: 0
R: 69 05 0c 09 01 a1 01 85 01 15 00 25 01 09 e9 09 ea 75 01 95 02 81 42 09 =
e2 95 01 81 06 06 01 ff 09 01 95 09 81 06 05 0c 09 cd 09 b7 09 b5 09 b6 95 =
04 81 06 06 07 ff 09 01 75 08 95 0d 81 06 09 00 95 0f 91 02 c0
N: C-Media Electronics Inc. ThinkPad OneLink Plus Dock Audio
P: usb-0000:00:14.0-4.1.4/input3
I: 3 17ef 3055
# Plug Headphone
D: 0
E: 0.000000 16 01 00 06 00 00 20 83 ab 08 00 08 c0 10 00 00 00
E: 3.103810 16 01 00 0a 00 00 20 83 ab 08 00 03 80 10 00 00 00
# Unplug headphone
E: 9.951613 16 01 00 08 00 00 20 83 ab 08 00 03 80 00 00 00 00
E: 10.016073 16 01 00 04 00 00 20 83 ab 08 00 03 80 10 00 00 00
# Plug Microphone
E: 17.824186 16 01 00 06 00 00 20 83 ab 08 00 03 80 00 00 00 00
E: 20.928234 16 01 00 0a 00 00 20 83 ab 08 00 03 80 10 00 00 00
# Unplug Microphone
E: 26.734048 16 01 00 08 00 00 20 83 ab 08 00 08 c0 10 00 00 00
E: 26.784007 16 01 00 04 00 00 20 83 ab 08 00 03 80 10 00 00 00
# Plug headset
E: 44.160216 16 01 00 06 00 00 20 83 ab 08 00 03 80 00 00 00 00
# Unplug headset
E: 56.687367 16 01 00 04 00 00 20 83 ab 08 00 08 c0 10 00 00 00


On the TB 3 dock:
D: 0
R: 120 05 0c 09 01 a1 01 85 01 15 00 25 01 09 e9 09 ea 75 01 95 02 81 02 09=
 e2 95 01 81 06 09 00 95 02 81 03 09 36 a1 02 05 09 19 01 29 02 75 02 95 01=
 15 01 25 02 81 40 c0 05 0c 09 00 15 00 25 01 75 01 95 01 81 03 85 02 05 0c=
 09 00 95 10 81 02 85 03 09 00 91 02 85 04 09 00 75 08 95 26 91 02 85 05 09=
 00 95 22 81 02 85 06 09 00 95 24 91 02 85 07 09 00 95 20 81 02 c0
N: Lenovo ThinkPad Thunderbolt 3 Dock USB Audio
P: usb-0000:0a:00.0-1/input3
I: 3 17ef 306a
# Plug in headphone
D: 0
E: 0.000000 3 02 00 80
# Unplug headphone
E: 16.480011 3 02 00 00
# Plug in microphone
E: 34.224331 3 02 00 80
# Unplug microphone
E: 46.960128 3 02 00 00
# Plug in headset
E: 62.592182 3 02 00 80
E: 63.120449 3 02 00 c0
# Unplug headset
E: 72.608250 3 02 00 80
E: 72.624253 3 02 00 00


--=-Jgcw9qey7CZTFnPNkoC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl17wLIACgkQq6ZWhpmF
Y3CYSA/+KmLZkEVNmdXjv7+kaU71xE9q2I+4ByW+WQzVzDe60dwdlzvhA/MZfwQo
2FRA+p1Ia/bDfOLOgD5SAm4/1ITc39pV/hf4VC2C/4kOWkg63/akOsnW9mMOza9p
EdPUVK/pQFl4CfM8hOZl2tG4nzvQHbgaNx9OvlnwIA0dNUYMk0Mc8BgGYW7dAU3E
gLtWF0JcLP9hdUjqhoHwEfUBAdmyxEd619tOKghLs38njn8uAtCHX6YxH1VGu4cw
bpPhcKjhzSnIOC7pySES4atLUqPX1A1MsgTK7msJJ88lAPyUMzCqpQfqr5KfzHlg
z6KS6fS5LoIOnBO+hHu0l68coYZ7Dsf74XAAltB9e3K3kQn8XxMHrt9Hjg3vC0qM
x0wWJ/OPxPU4tUa6zJbAbyH8bLeR894OxKxDWCB2mAsa2FXrhnIG1NFIyAf2VQpD
2FIjR8AWwApwWBzKBFlwI1/3ukR2d4GsIJmmOJbr1t7tnZV0i/EqbhG5eJZN7/lZ
oHS66Z7Fv1O4v0JATY4LTTiz9oYpAUumFhQmLnbvJ6WB03wX2ApxXI3GMyxzIyP6
mRQ32RAjwX2I58CP+Exe4WRBQ+QC+zCZNcT61tS4Pj7kuQGb1K35YypaREzF2Hu+
Gaj89MtnRmbC/thSfRHqdx4QMq9pYz0v3XTH5Tg9yWA6AcPm+Jc=
=nEYy
-----END PGP SIGNATURE-----

--=-Jgcw9qey7CZTFnPNkoC4--


--===============3728824961440611720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3728824961440611720==--

