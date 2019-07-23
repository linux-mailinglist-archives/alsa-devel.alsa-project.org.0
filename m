Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5571A99
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 16:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E4018B2;
	Tue, 23 Jul 2019 16:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E4018B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563892828;
	bh=ULxdw1Vu9lvlKDLdUMbS213CFmxV2Nsrz9ThzyzzqUA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOFfQftIHXoJSbCGtXAZudDgJZ9Ut0K+zwfdJGX4hAdA9L6zLPJNNHEGpR8WMnWF+
	 G2Pq0cqtpBTc6jFEBrtaCmvX/VeizBnsYROqbi8LrJCnGspma2g0Lkl3bJVBShi5I2
	 5FvVkUdmgw8MG1wDeU/WFxcYf9mqnBTfOlfvtfMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119CCF8045D;
	Tue, 23 Jul 2019 16:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80FB3F8044B; Tue, 23 Jul 2019 16:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FFA0F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFA0F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="M/2QvH2J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mLOZFxOrUS8K7a0PDxQTsCC5fV5Vu4xg3cPXLi1J6fc=; b=M/2QvH2JJqybfXaHLW6tR9gB/
 qYtVooNWlwO4Sd8+jo0RHdQ2hfDLxH1Bx5vkbsXSe08Vsdz0D675AQOVg2C4Cjvg6nMeCO/8Xe+Od
 Hm/zDv6iIqc6+CtJStU8x+eoOTcDhY4AemkI9nxtbUNQ7yM8gHbS04HrFo24/MmXD1kIo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpvw4-0003vC-Jy; Tue, 23 Jul 2019 14:38:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 454AB2742B59; Tue, 23 Jul 2019 15:38:35 +0100 (BST)
Date: Tue, 23 Jul 2019 15:38:35 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190723143835.GF5365@sirena.org.uk>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
 <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
 <20190723082716.GM54126@ediswmail.ad.cirrus.com>
 <20190723105248.GA5365@sirena.org.uk>
 <20190723115415.GA14036@qmqm.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <20190723115415.GA14036@qmqm.qmqm.pl>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 patches@opensource.cirrus.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: wm8904: rework FLL handling
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
Content-Type: multipart/mixed; boundary="===============9032503928241986313=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9032503928241986313==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline


--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 01:54:15PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> On Tue, Jul 23, 2019 at 11:52:48AM +0100, Mark Brown wrote:

> > Right, it's not like it's the same IP being dropped into multiple chips
> > in an identical fashion.  There's a lot of high level similarities in
> > the register interfaces but also many small per device tweaks, and it's
> > not clear what benefit we get from refactoring at this point.

> This would be mainly code separation, so it's easier to understand and
> has a potential for direct reuse. I can see that clock selection needs
> to be changed, but the idea is to have it configurable via device-tree.

Not all the world is DT...

> I picked at random WM9081. It's FLL implementation looks very similar -
> major diffferences being in FLL_OUTDIV selection (direct divider vs 2^N)
> and register block offset.

> Another random pick - WM8900. The general FLL idea seems the same, but
> this one has a bit more complicated register layout, so I wouldn't
> consider it at first.

Yeah, there's a lot that on the surface looks similar but there's a lot
of variations in the detail - different numbers getting plugged in,
register layouts getting tweaked, different sets of sources and so on.
I get that we can potentially combine the implementations which in
theory is code reuse but what is the end goal for that code reuse given
that all the refactoring is going to warrant some testing over a bunch
of different parts.

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03G+oACgkQJNaLcl1U
h9CI1gf/UNPF1xRtujg8VeDKY9wZc2+nweeVK+19nTrn8hsGY9isyGpvwlLE5E/K
JnNf+XeaKQkvsPM2h2c02z3sJJaSk9fCH9+m1dEfS+2hjFoYmvdQIepmTIU2Fosy
YE+XLRzYAL49m4b2SdRMosss5kN3cUSPqkVwf6p5lKTTo6uAE19TmS0L0NinrCbU
PC/CjdzYgtiDCQ8B4E9MEqcoKM/GZF26B2McxL6gaK7VF+BUb4gEZdyhfoK5jZhe
xVlyyFWggddfnUDjEoNw5pk1jM838i/S/VGYRXF5ma3YqwH0SCkHH6UiqmzO6dXP
3dhafvv8W2NnL8UZ54oYou+1MHRP/w==
=gNrk
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--

--===============9032503928241986313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9032503928241986313==--
