Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BAC74EBD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2F51AF5;
	Thu, 25 Jul 2019 15:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2F51AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564059773;
	bh=RfL8sj4Dxnim5IeO75a3VvkDFUrUlSfBb6BlWujb/EE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oKgK+u0z1VVdd9bP6qbbuMgp13YGi3nJkM3Nb0qXSs5D9LxPLOpYR+V+OHjtRG2aY
	 SiNDyWRsKFg73eDC7+oA5v/3T3x9KGXWynCqaXiogsJ0jaChSCW6wIe0TkQjMNo1pl
	 NIJWTz4qbXBCcjH02kdWQ4TnYuVgs3Hkkgce9Wgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B28D1F8044A;
	Thu, 25 Jul 2019 15:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1279F80448; Thu, 25 Jul 2019 15:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E73F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E73F8015A
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 35D59C0009;
 Thu, 25 Jul 2019 13:01:13 +0000 (UTC)
Date: Thu, 25 Jul 2019 15:01:12 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: alsa-devel@alsa-project.org
Message-ID: <20190725130112.3j2vi4dyngyr6yh3@flea>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Best representation for TDM devices
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
Content-Type: multipart/mixed; boundary="===============2926041762548973665=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2926041762548973665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rddslzkshiyxhiyb"
Content-Disposition: inline


--rddslzkshiyxhiyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm currently working on a device that has two Analog's ADAU7002
connected to an I2S/TDM Controller (sound/soc/sunxi/sun4i-i2s.c, with
some modifications), over the slots 1/2 and 3/4.

The capture itself is working fine, however I'm not quite sure about
the way to expose those streams to the userspace.

Since I have two codecs, I have two links (described through
simple-card) and thus two subdevices. However, the microphones
connected are really separate streams, so ideally (I guess?) we should
have 1 subdevice per microphone.

An alternative would be that we capture the whole 4 channels and use
dsnoop to demux them, but trying to use the device directly (using
arecord -D hw:0) results in the ioctl to change the number of channels
being rejected, I'm assuming because each codec only has 2 channels?

So I'm a bit lost at this point about how I should go and expose
this. I couldn't really find any similar setup either in the
kernel. Any preferred way of doing this?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rddslzkshiyxhiyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTmoGAAKCRDj7w1vZxhR
xTKUAPwPcJzEqkkoUcUYtmz9PUBumusjyVSRBmCPSBM/U/pQ2AD/UQWf6Jlc3JJN
BX8LFvZSo3fF7enhh05KgQsqvLuhIQo=
=hz2z
-----END PGP SIGNATURE-----

--rddslzkshiyxhiyb--

--===============2926041762548973665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2926041762548973665==--
