Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306C8CB47B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 21:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BFAA820;
	Tue, 21 May 2024 21:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BFAA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716321433;
	bh=BhR7n9A/hSqg4/BjNXMPwn9gJKzWQmPCd5l+efcQRkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iVzLuBSTpsZOfKqt8+dm3eM63c3yjsz7PPv0THnqp1zMG8Ttv2vR4MBM8Q2IrwX5J
	 PRHsUXccrUWGKQqUGwqfQIOhC9kuW5xthped26CxvL6hZF5cbklQ5+mYaB2ZwIHew4
	 376S1AhRrPT6rW3aCijkr/gk1kZpfQ43hJu8yk7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A23F804FF; Tue, 21 May 2024 21:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 451A6F8042F;
	Tue, 21 May 2024 21:56:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A42F8026A; Tue, 21 May 2024 21:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B18C3F801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 21:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18C3F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NUmO8bdx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17B7DCE10C8;
	Tue, 21 May 2024 19:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF613C2BD11;
	Tue, 21 May 2024 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716321389;
	bh=BhR7n9A/hSqg4/BjNXMPwn9gJKzWQmPCd5l+efcQRkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUmO8bdxgcWu4thN41iyc7eSn2Nl1fuII0/mdbLdlOGmQQriQsunnpYTXKjbCYNFV
	 IjrQMqOW/AROaYsjg5T+sx4wCif3Y1UzeH4oGRRX5mb9CyVmw1NwFcqy7lpZinO6yW
	 unhi+iwOO/X+ebWKfpGEaljuKq2zWzDNzFA7+VNxSoHIVr58tGTI5Wsx9RodFvr0dt
	 vPDBPoWJqQ8v0pbnLXfW2pxNrEBaeORv8e243hc+KCymNU8mY1EjkBqO5hxUwzhUoF
	 j5j0HL8ahnLqxZNaZqgcMf3mfbjS1GrV154ExctmcnECUhAi7DrQ7foulQVXhWAQYG
	 Zldui32xVgovQ==
Date: Tue, 21 May 2024 20:56:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
	Jonathan Corbet <corbet@lwn.net>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
	imx@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
Message-ID: <37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
 <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="COqvHqSoIZIRRzxC"
Content-Disposition: inline
In-Reply-To: <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
X-Cookie: Eloquence is logic on fire.
Message-ID-Hash: Q34GE2HOMNQIXJGCK77GOES6XGCTON4B
X-Message-ID-Hash: Q34GE2HOMNQIXJGCK77GOES6XGCTON4B
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q34GE2HOMNQIXJGCK77GOES6XGCTON4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--COqvHqSoIZIRRzxC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 11:03:41AM -0500, Pierre-Louis Bossart wrote:
> On 5/21/24 10:12, Mark Brown wrote:
> > On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:

> > This is something we could do properly if we had full digital routing
> > rather than bolting things on the side of the CPU<->CODEC model - having
> > these things where we have to take a CODEC into account even though
> > we're not actually using it is one of the big issues with DPCM.

> No disagreement here, these echo references and loopbacks are ugly to
> support with the dependency between playback and capture directions that
> isn't well handled, e.g. if someone starts to capture before playback
> started.

> For now we're kind of stuck, what I would suggest is just to remove the
> extra check that both CPU and codec dai can support a direction, and
> move on with the other cleanups suggested by Morimoto-san.

Oh, I agree - my point is that as things stand the framework really
can't cope with what needs expressing so we need these things that don't
look quite right.

--COqvHqSoIZIRRzxC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZM/GEACgkQJNaLcl1U
h9CbEwf+MX3lQGK6hBcVLpF+lVcF5S6m6ku4LP0SgqRtocRWZXyW/66qCKgj8Bs3
k7c6uA/iYDef1tOTreWMVfWahBd3K+Gd8NXeRJRoDH3/xl/ga9F2FIkLLv6L3FxD
UeP57BQYJbH5gcbMMS833UEKIIzwvyc5zzeYnt/zHq8i3QhwH2/FFwFrY9WuAREY
hiv9ZN3NnLKO3P9AHvmzt0tPwcQcyH3bIWMKTWC+PYNIJIVCprvfXMW5yM2hgyAm
H9b3NE5JE1bpQ6aiTALtNpGWrbpdxR9h++OatHCJX/tSIW4Us2DtMbz8QmSmZ3to
pi8H/vVGJfoJqKn77s/eP4L4D2Lz/A==
=GKWS
-----END PGP SIGNATURE-----

--COqvHqSoIZIRRzxC--
