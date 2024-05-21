Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9168CB112
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 17:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49E6C1E7;
	Tue, 21 May 2024 17:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49E6C1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716304429;
	bh=gwzm8gYv8P6IYrQiWO8fD3QwjoBID6lrcbsigknNT9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=noQtgXEqMzIbCh9R+qKNCZcQOL8CatRpq3cO1ikBAnxOv+9jSOfk+UTuNnpfsNPdo
	 Qol0MhvEyZbAOxmY7dC42u/MdIBA+VYmI6S08iSqt7IF7KaZBiN2ol/LQ5hPYcyGD0
	 mCecermObGc4oICNQkyRu9xF8W5GN8Q0ljl/9ob0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89A8F80580; Tue, 21 May 2024 17:13:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DBFF805A8;
	Tue, 21 May 2024 17:13:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC88FF8026A; Tue, 21 May 2024 17:13:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F22D1F801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 17:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F22D1F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pFQKgmI8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56B15CE0EE3;
	Tue, 21 May 2024 15:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C3C2BD11;
	Tue, 21 May 2024 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716304373;
	bh=gwzm8gYv8P6IYrQiWO8fD3QwjoBID6lrcbsigknNT9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFQKgmI8fZQmR3X2wWT5+znBzGtX7oIU07rSTYW8weSCst+9eb2MeisG27oFiEgeU
	 UrGZ3Wel3StymxOt9CVZguX2OWDz42J77okxSGqY+i7vUiU6q9kDGhR91AVJRVZYqi
	 KXvIS4LRWu23oV9F0gd71JtzzT4NvFrYwJfOHDnek/JSWYtvQjq33UQqSKuVaPDD5/
	 b4CCvtWVtJ0/pHCPRupYO6uFwFNKBIMAdscugU3JRV74/0pfiKLi5VNftmBl/aOzWz
	 j41gJee/nqJKBiPVPO+00+P4zKrJ8PyFUvH6zNS8t/iSswsyUrjD36z+mpI7AxVsSK
	 xmwErKjp2+RLg==
Date: Tue, 21 May 2024 16:12:42 +0100
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
Message-ID: <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FlFpgoAWr8SBAUi2"
Content-Disposition: inline
In-Reply-To: <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
X-Cookie: Eloquence is logic on fire.
Message-ID-Hash: 3JZPBOTC5A4EYTF6DGNUUP35TDXFGDJC
X-Message-ID-Hash: 3JZPBOTC5A4EYTF6DGNUUP35TDXFGDJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JZPBOTC5A4EYTF6DGNUUP35TDXFGDJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FlFpgoAWr8SBAUi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:

> allow me to give you another counter example, beyond the AEC reference I
> mentioned earlier. It's not uncommon for CPU DAIs to have loopback
> capabilities, which are used for tests on boards where the codec has no
> capture capabilities. I think it's a feature that needs to be allowed,
> not a 'wrong setting'.

This is something we could do properly if we had full digital routing
rather than bolting things on the side of the CPU<->CODEC model - having
these things where we have to take a CODEC into account even though
we're not actually using it is one of the big issues with DPCM.

--FlFpgoAWr8SBAUi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZMuekACgkQJNaLcl1U
h9DXkAf/eKMKj9h8NR0eOAHhBEz4f302YpC54diLp0fUojlrg6wrqu+2jlSPQoT/
HWwDANuUGnWfWOOZVMge1aR43syvN4Qy6O8VBKwSy+1xDmgKOskO0zhC6p47NBlH
R99K+UmqxzXeoUmY29epW66azaj+q0MJXMla5WqiaaylWCV4tsyNCwIosHqaj5c/
kjfB+wibx5JXQRQfVRJtq3ajHSGuwDZV/yysCObfkoJLcvRbjEWF86aMFHNoycCe
5GNB1TsJYSOyP0qKGpBgBUGtN+IlBH/oSFk1A3y0a6Ok8CbHdEpe6FpNgzHAvI2v
SBMQmUSZ9dNcTTF7FDUo/45LZrXKng==
=EuNB
-----END PGP SIGNATURE-----

--FlFpgoAWr8SBAUi2--
