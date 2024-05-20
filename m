Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDD8C9EC8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29761202;
	Mon, 20 May 2024 16:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29761202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716215496;
	bh=SA50Fidzaz+mQH+bd4BSpNCTlc4jQcQBqvPT1vMijp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFJpkg/YHQZDm8AcygzepeqntDdgimKb1mC6Cuzkd0oQ6DHBf5ZP4WcGYLCqrGtwH
	 kZ11WxWGDIna5Lf/eBT2aHUjCEwPRTLvfYRxf4NRsLEyqtHLY5qMwfU7vxBIClVNdv
	 G8Gk1MPVuWZPsUTIsacMR+vyxmNrMp2+B4Y5aAmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F55CF8026A; Mon, 20 May 2024 16:31:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 347B0F8058C;
	Mon, 20 May 2024 16:31:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A986F8026A; Mon, 20 May 2024 16:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFD2F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFD2F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fo3XfVq+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FFB461D23;
	Mon, 20 May 2024 14:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56422C2BD10;
	Mon, 20 May 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716215457;
	bh=SA50Fidzaz+mQH+bd4BSpNCTlc4jQcQBqvPT1vMijp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo3XfVq+o7CD87oXYLqm9K+VV720K+jMHJXMdVFVb/dscRtHBFfgzLA2W3r/5Bwev
	 eUJyoTIydmqZPJNXNnr1Hi5EdMyiTs82P9BbIutCWzKt6okW7n6Jg15hFwzJ58CCIu
	 9loBZGTMh3ksvs6U98dsUMnBuHPlnIbnvuivRuzroBTPl3TN9q/HDMYX5IDmxJna6v
	 U7xhOuaEbhE0sGEYeKDbqO9sS7GN8dyd4oyp+JmDi2oNgCtVaTIApuvPmfI3npgJKG
	 reFcJoEBpvP7F9pffC69yjZa5fOZEZmokxVJv65n5g/jJ+odqHZSD4KVgO155TYqVN
	 OmeSSriog0vKg==
Date: Mon, 20 May 2024 15:30:47 +0100
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
Subject: Re: [PATCH v3 0/3] ASoC: grace time for DPCM cleanup
Message-ID: <c2ba9a4a-0e01-43f5-8490-10aea6de72c5@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mdhF2muS7x2E9waK"
Content-Disposition: inline
In-Reply-To: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: We are what we are.
Message-ID-Hash: YW4KU6N4AK75MOGNSBCGORQKU2VO7533
X-Message-ID-Hash: YW4KU6N4AK75MOGNSBCGORQKU2VO7533
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW4KU6N4AK75MOGNSBCGORQKU2VO7533/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mdhF2muS7x2E9waK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 11:30:44PM +0000, Kuninori Morimoto wrote:

> v2 -> v3
> 	- tidyup typo (reuqsts -> requests)
> 	- add Tested-by on git-log

I was kind of expecting Jerome's patch to get integrated into the
series?

--mdhF2muS7x2E9waK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLXpYACgkQJNaLcl1U
h9CfQgf+LcB+1TKTBBA4hHpYhXN55tgh5Tu/21cm4fdCMW3GjrjcSq4zBWcQEI71
fgrl9ssXbVBDhI4FVPBaPgrwXl7cbf9CfDjnWrXhja7OiLrQjILTZI+lz17mg82b
9bBgi7vrB5m23qpjzRf+UwT7ykNyTCUMI/OMSSOsIsRXNmBD87QPPvwaWESi9Xhp
AjUgzqMDOJ7/mjU/LL2ecau88tEoBNRSB5D1XKlCh/EFqnElQGiaYRtJLEjHVE85
/4Jl0B0qL571d4qhJRaR42NBKO4v5tPb10baDaCu4d6qnN0kb6kT8WqeFkUHpY+U
gtCaVVyxvsVNnoCkyMEauISRQmD5VQ==
=/+yS
-----END PGP SIGNATURE-----

--mdhF2muS7x2E9waK--
