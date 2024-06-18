Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F070090D490
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A51A4B;
	Tue, 18 Jun 2024 16:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A51A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720571;
	bh=iGI7rBJgHu8DUEHU/uaWXIvRgpjCEyXg+PI+OEEUOBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMmvqQN4r76A8Pz5BY4VygOUVyUTDWZiRIYzXhvkDk69+JVvnsGgQnNhXEpH3BsQg
	 XfXPW3GfwGouVGWBALCZRFulk3ZE2iRztwPfpLdt59MrLpD/vFOnFgMV+rUt8FT+8G
	 eBESbY/rF8CvTcxzU8pi6dMlDrCI0C0jQOsvr/e4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B84F805AC; Tue, 18 Jun 2024 16:22:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FA1F80578;
	Tue, 18 Jun 2024 16:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6588F804D6; Tue, 18 Jun 2024 15:42:17 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EDDEF80266
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 15:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDDEF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YaQRLVof
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB1066197E;
	Tue, 18 Jun 2024 13:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE65BC3277B;
	Tue, 18 Jun 2024 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718716812;
	bh=iGI7rBJgHu8DUEHU/uaWXIvRgpjCEyXg+PI+OEEUOBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaQRLVof/ZQnet0TvACOwyCCYrbmTv719c70lp/aFvnFh7gwRByME3Xc6l+v8DKet
	 R3FPcyFypjIlzmjAMiCp4xMKSIQuosdI+lUd4MeNDgX1df9cc3OLCpvKYnq8gt22m8
	 m/8wTmCEEQpu/7DPd+RUqxqKxB7jd5MWU8357PDDNJ9rkv99r/c3Pctz5eLjBG6pUh
	 qBSVkge7YkpreHJ3Ew21CKyXhSMdg5d6xrcv1d/aNrAQX6kOjUZ0+ZjdnVG7wtJr20
	 z4ttEKpGo2IOBn9N795cHmVNPRbEyhfi5jcXpd7OFNUYT5TZEfxVAhhidqPAXcOL60
	 Fbn++5te5qWGA==
Date: Tue, 18 Jun 2024 14:20:01 +0100
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
Message-ID: <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5HrHBf54JKzRBsN"
Content-Disposition: inline
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: If you can read this, you're too close.
Message-ID-Hash: XGTS6KA5AUBTHNMEZC43HKPT7T3YG7MZ
X-Message-ID-Hash: XGTS6KA5AUBTHNMEZC43HKPT7T3YG7MZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGTS6KA5AUBTHNMEZC43HKPT7T3YG7MZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e5HrHBf54JKzRBsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 01:17:39AM +0000, Kuninori Morimoto wrote:

> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.

This doesn't apply against current code, please check and resend (it's
simple-card and audio-graph-card2 that conflict).

--e5HrHBf54JKzRBsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxiYEACgkQJNaLcl1U
h9CT2Af/TIz3sGLRzIL23jSsjCN+Qsm7udl7I62HN0gip2VR9e0+otYDtGfJcXWp
zrVbznJTkkSt4SsAxfiucjtkhY+1m4IKnMmpSWwlgLqiDJiuFad2qVfWOsY6d+NY
3DNOj2KtwsvBhMpTTvsoX9H1r0iRcU9saFz0Os14iDcjbf2UAOO31vFaAqz8SMlN
05CFIk/QPU7k9iZN6iqrFkXlTya/VOJzGKPEqGq7pQ37+h4n2d6vLv2zCd/6l4at
fCMT2H+VgTGLQOcfA2ifL+q6KRlSm2A0ZIJk98lI2yNWUwEGdSK+Teea1J55K3MC
3ka6NLcUh4KixXZZgooMqJRn2KtHsA==
=Jc6T
-----END PGP SIGNATURE-----

--e5HrHBf54JKzRBsN--
