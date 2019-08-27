Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39DA1CFA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B112016A5;
	Thu, 29 Aug 2019 16:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B112016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089507;
	bh=6BV/Ft9iZ/DTds3Fmx1z7WCWXlhjWvLxpjx5zekq1Bg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHMp2jtrsUbZdp3rLOUaP4KwhKWFKrOQM6/t2dBUJMSXcPyM8o4mIT0nEOKIdVuNF
	 bwnhNh5ObZ1/5JhTBxpUk3EwcVt/+WF7E4yqcIyW2u99AW0OXOwYEi0zF8WBHBq4/c
	 9p2Q/mNHRjo9lkh+xAGIdLAfHt7M+dnGZ2vwkM8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89498F896EB;
	Wed, 28 Aug 2019 07:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78218F805F9; Tue, 27 Aug 2019 20:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79208F805F6
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 20:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79208F805F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sM2g0hij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epG1Jj0LZAm9JsQ4dirXtSr8T+ss8OxvKfoyO3+fm7o=; b=sM2g0hijUSswGlnHykjQw5vhb
 +nU6Ko6Hf8zMuJKHsKssVCeLZHvI91ek0A1SoM7ns98Ru2B23NI2E3movUEr8CrskL4MGyQItkPQt
 dpl5I24ouOTA5uIUuOnhN7xMJmnb+3/cWJw2OOcOVecSPVDRqugaUfYukM3421A8tu2H4=;
Received: from 92.41.142.151.threembb.co.uk ([92.41.142.151]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2gOa-0000xT-5B; Tue, 27 Aug 2019 18:40:45 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5ACE5D02CE6; Tue, 27 Aug 2019 19:40:39 +0100 (BST)
Date: Tue, 27 Aug 2019 19:40:39 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190827184039.GJ23391@sirena.co.uk>
Mail-Followup-To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Allison Randal <allison@lohutok.net>,
 Anders Roxell <anders.roxell@linaro.org>,
 Annaliese McDermond <nh6z@nh6z.net>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Enrico Weigelt <info@metux.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Jourdan <mjourdan@baylibre.com>,
 Nariman Poushin <npoushin@opensource.cirrus.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nikesh Oswal <nikesh@opensource.cirrus.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 zhong jiang <zhongjiang@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <cover.1566734630.git.mirq-linux@rere.qmqm.pl>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:25 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Maxime Jourdan <mjourdan@baylibre.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
 Annaliese McDermond <nh6z@nh6z.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Nariman Poushin <npoushin@opensource.cirrus.com>,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Allison Randal <allison@lohutok.net>, patches@opensource.cirrus.com,
 Randy Dunlap <rdunlap@infradead.org>,
 Nikesh Oswal <nikesh@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>
Subject: Re: [alsa-devel] [PATCH v2 0/4] wm8904: adapt driver for use with
	audio-graph-card
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
Content-Type: multipart/mixed; boundary="===============1110155380764717137=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1110155380764717137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5PPnVwj6ulmYFu5t"
Content-Disposition: inline


--5PPnVwj6ulmYFu5t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2019 at 02:17:30PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> This series allows to use WM8904 codec as audio-graph-card component.
> It starts with rework of FLL handling in the codec's driver, and as an
> example includes (untested) rework for codec with similar FLL: WM8994.

Please make some effort to focus your CC list on only relevant
people, many upstream developers get a lot of e-mail and cutting
down on that helps everyone stay more productive, too many can
also set off anti-spam software.  You've sent this to a lot of
people and I'm struggling to figure out why most of them are on
the list.

--5PPnVwj6ulmYFu5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1leSYACgkQJNaLcl1U
h9D/qAf/aDKjsXpu3OV9W/YRcVKa/q4lkLirQXvzegtCjjtctGiFmmTa8hRGeaU2
sHHo5pU4H6EDQZubuS3bnNWzE0SRout2VquNd1ddjAQoVCmRv2rfaGFpI2SelVqL
2lAMUx2niskdB2f1YFRIBbuvwfok6C3qew9aM3DZIDhD+foqHLWuwWYNDjjbwopR
rqLgjwGRoCwQQh9/HfhdWB7b94NQ74aPsa0xETo+dsR4z1k1PEjoThjBkckOI/eF
8yFtAR6coVQ2DHbsAKTO7ajC43cumNyh4XhYRAxBVrCJ6wG17AQTT23HTpNaLCGy
tYANpAltXhi4j1vd/QkH9wh3MvDFww==
=GFP7
-----END PGP SIGNATURE-----

--5PPnVwj6ulmYFu5t--

--===============1110155380764717137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1110155380764717137==--
