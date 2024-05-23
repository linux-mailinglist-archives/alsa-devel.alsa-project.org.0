Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6108CDCF4
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 00:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DDA9829;
	Fri, 24 May 2024 00:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DDA9829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716504274;
	bh=DeRznDUy6+k12p/OKJsq9wS5q2D71jokILR4vUud1xk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p/UAWRZQS45d1EU8YDoWNumBGDbrFP6l4W9A9f1W9/QSxrrz8DxxcL+SDLXXh8z+x
	 AmhRMd3A1ybq0lYFve4bAqINCni2I1jxUmWsLDyyU4GZcndGMxbNBsNkDEywG+rLZp
	 XGnc8Y/fud3m1z3NAwT3QKB5VnwFSvEP2lWCFLFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76543F80588; Fri, 24 May 2024 00:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07D2BF8051D;
	Fri, 24 May 2024 00:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99EBCF8020D; Fri, 24 May 2024 00:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CE23F800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 00:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE23F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=irjMSTjK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716504240; x=1748040240;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=DeRznDUy6+k12p/OKJsq9wS5q2D71jokILR4vUud1xk=;
  b=irjMSTjKMr19wLCbJcJbkM8JCHpXVjx7Ae1Bnd34/Staie6LBUs7JW6e
   oncGGRQUISmq7fPMhHakcciIw90U4xb5DMYYYP7rDFyxCGWmZ5YIH1UPN
   VdplBrlxpPcZQrOAZMei4deeBBvgq4S09DLuPODpVjX975RgIx20amKQ6
   uFn4xiw1dNTF9NvSN2vNp/y/2urKY9WmQNXlnOelRDUZH+yO0H+HGBvAi
   rod3EXZ7W0+/jjtEww8AtGzjX8ma+ENyjdroyDzccLk3CKAu4Z+UqcaEy
   LyOFDUyAlXryJI2vbFvK/Pxdj3m9yD72chUl/JzRSIpKs7Uh9Jn0ThfiN
   Q==;
X-CSE-ConnectionGUID: 8vw7oS9qR1OhGdk04eqYiQ==
X-CSE-MsgGUID: 32Jg2UQ+R9CmJ2j8SQMNYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24267617"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000";
   d="scan'208";a="24267617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 15:43:55 -0700
X-CSE-ConnectionGUID: tUWROIX/RrmqrcPvdGAnBQ==
X-CSE-MsgGUID: yZHJsThDQ2GV8X3EiMTVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000";
   d="scan'208";a="64641111"
Received: from unknown (HELO [10.125.110.41]) ([10.125.110.41])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 15:43:53 -0700
Message-ID: <179eb2b1-0103-4105-ae66-fd0a86bd9fd1@linux.intel.com>
Date: Thu, 23 May 2024 17:43:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ASoC: grace time for DPCM cleanup
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 26P7GPBAA5BCQXR7SNK4CCZVBYQ2AAOS
X-Message-ID-Hash: 26P7GPBAA5BCQXR7SNK4CCZVBYQ2AAOS
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26P7GPBAA5BCQXR7SNK4CCZVBYQ2AAOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

> This is v4 of DPCM cleanup
> 
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
> 
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
> error, but maybe v6.11 or v6.12 ?

We're already finding warnings on all Intel SoundWire platforms:

The DAIs are declared as supporting playback AND capture, but in
practice they can only support one direction at a time.

The direction is defined by the dailink when it includes specific DAIs.

So if you don't mind I'd prefer it if we shared a patch with you to be
included in a v5, to make sure at least the Intel platforms tested in CI
are all ok from Day1, otherwise we're going to get lots of noise
reported for no good reason.
Shouldn't take long.
