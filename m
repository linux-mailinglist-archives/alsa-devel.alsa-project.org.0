Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B490E8E3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 13:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6760AE8;
	Wed, 19 Jun 2024 13:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6760AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718794918;
	bh=wV3LwNiIkukhZS1LfFIfEtDSB8xpDVKZ9+NbICekbT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GoIPlmE69HoGx/RQHYfGiMkx6d4UViwzX9BuYsNfDC3ea30U8rzdf4zhkMh/mt//K
	 SPO/heEuhbjpH148c4wP8Si4mC0XDPoJn7BGgdbsZEiFHn67HLcrSZXMx8dKF5TURV
	 RGBIAxaijEb/cRh8pVRrnnWBPkR/qHp5EhvDti/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E66FEF805AB; Wed, 19 Jun 2024 13:01:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51781F805A0;
	Wed, 19 Jun 2024 13:01:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B176AF8023A; Wed, 19 Jun 2024 13:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8067F8010C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 13:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8067F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fwb3x8y0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CC0B61D41;
	Wed, 19 Jun 2024 11:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C301C2BBFC;
	Wed, 19 Jun 2024 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718794875;
	bh=wV3LwNiIkukhZS1LfFIfEtDSB8xpDVKZ9+NbICekbT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fwb3x8y0vt3PQhoI6ECI5rtqj/iau8k765t71XQQ87w34sDFSmKorGgLwfmis087j
	 RCCIL75jZQkMh04MdWBTKIW74y3GDKiFn3J24ffzUGWVds+InqpviRvGnnwRIbUJ0D
	 1dZJKdrq3Rzg1DgVvsOMBZu9+RA7KqnqksmxPteHYpLgykLrp1q8YO/Aa+5aUHxWDh
	 q2tCFNEsvdBYXn9lp7A5Gft6zJ+VN0Fa7wrESKoDz0BJXX4Hc/cPaq4nvgq7dgI+I1
	 10fucWe4lo8FDsF0hKxCcQgRQt8bfi7/P8U/RcjzSSy7y17TDkHOymPFI2JRmjyI1A
	 xsn4kIWtg+CtQ==
Date: Wed, 19 Jun 2024 12:01:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?=
 <amadeuszx.slawinski@linux.intel.com>,
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
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
Message-ID: <71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
 <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
 <877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4Pd4HMwg9L5DQDu"
Content-Disposition: inline
In-Reply-To: <877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Don't I know you?
Message-ID-Hash: OITVGT6KDQG7HXDK3EFBZGQJBOBCMAXA
X-Message-ID-Hash: OITVGT6KDQG7HXDK3EFBZGQJBOBCMAXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OITVGT6KDQG7HXDK3EFBZGQJBOBCMAXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--d4Pd4HMwg9L5DQDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:57:22AM +0000, Kuninori Morimoto wrote:

> > This doesn't apply against current code, please check and resend (it's
> > simple-card and audio-graph-card2 that conflict).

> Ah, I guess you used "v5 original" patch-set.
> "v5 resend" patch-set or today's "v6" patch-set should be OK.

Oh, if you mark something as a resend then it sounds like it should be
exactly the same as it was before, if you've rebased you should increase
the version number.

--d4Pd4HMwg9L5DQDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZyum4ACgkQJNaLcl1U
h9CY0gf9HLsXbwCJULJAm9FlV4eh/DYA7VbD8zXkipHVgvH0XIpxP3UGX+Bsl79r
Zoieqsq8m08fTI7MNaw0TIsb77di3O/LpWoxTfi56fDpBPmWPsS70cv0NO7eL5lb
AJHsWzfAdtzyRT8gUTJoUIimYvB8kwxuEpMhN6VRgIpTYZulN2JiBTfD+XypCdjY
ZCqFYh2GAISbrciQD5SVh0cLI9jkkF2OudyeY4rq8IIPGE8tggGuqDqjpUa79DNB
vyhxa0rCnlfjshMjFHgPfjHVytb7MuzSueN25L5iQvty/q/hzLX7C3dH9d3zRJWm
VFd4p0vPpH3kOL7x1+pzcUmVveO/mQ==
=OSUR
-----END PGP SIGNATURE-----

--d4Pd4HMwg9L5DQDu--
