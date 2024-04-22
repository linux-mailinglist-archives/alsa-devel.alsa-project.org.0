Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90F8AD659
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 23:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7364CEB1;
	Mon, 22 Apr 2024 23:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7364CEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713820255;
	bh=xkzr9t0PiSOdV/YhktL0c5g9YLvJ/o3qHjC7xj1JhxE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mZM47W60nmVevQttXNbDubRMZlShwiGiIevZTeqAAfpRS4K+cbFbOhL8d+zOKPGmG
	 sHZNgtPdEOnKTi8EkyreYVZhCJXyA2IBcFphXpTVO7tyc1ZSjQQjsK53OybwEgb3cT
	 kXxVyILKxqjyFc6waAPINzGiNIyEAC4H72M/l4tU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08F5FF8057E; Mon, 22 Apr 2024 23:10:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 427BBF805A0;
	Mon, 22 Apr 2024 23:10:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E97F80423; Mon, 22 Apr 2024 23:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 707BCF8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 23:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707BCF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cJk0ZcaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713820215; x=1745356215;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xkzr9t0PiSOdV/YhktL0c5g9YLvJ/o3qHjC7xj1JhxE=;
  b=cJk0ZcaXV4glbtvr32sy2zDpxT2ro0q07ArZ8BNCqBOvxs2+KUxkCrxf
   zoi8NgM2tzLaJhD9N0Ob9StA7v2VUyfYeK8BZgsDDK/Ei4dniNxctAbf8
   esqZE2uRT3oy9KF0xOAw902T88nrtuW86Skk0RaDejtdEwgiZ1ULGQw6k
   650+5EKKCl2Qh8odvW1jyFId5zpf/+5SShwUp86vwW5+qjKvePxsgPrPK
   bijk/sJFgOxrn+53Jm0caOkquZq/KkzKSMBfsiJDEB2EskEi5SkQDC0jA
   oHLzAFpP7lcrqazMwDius/hnBMtK9NhmpLJnzGXQIMj7sg7cxGdnaHkql
   A==;
X-CSE-ConnectionGUID: E7sZn3OSR7SuChTO5VFAXQ==
X-CSE-MsgGUID: ZdupIMmIQK6+8mmUOGCUFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19933725"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000";
   d="scan'208";a="19933725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 14:10:10 -0700
X-CSE-ConnectionGUID: 0slg/LF+Q/OTgUwn2iL9FA==
X-CSE-MsgGUID: aDlAGt+2S9Oh4QeyVXSomw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000";
   d="scan'208";a="28591780"
Received: from leozhang-mobl.amr.corp.intel.com (HELO [10.212.37.174])
 ([10.212.37.174])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 14:10:08 -0700
Message-ID: <09b16c5f-12c1-46c8-ba52-2a7fe4756c44@linux.intel.com>
Date: Mon, 22 Apr 2024 16:10:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
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
 linux-sound@vger.kernel.org, Brent Lu <brent.lu@intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WI6BGNA7XDG4LF466YAIEH4TU2HG2GEK
X-Message-ID-Hash: WI6BGNA7XDG4LF466YAIEH4TU2HG2GEK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI6BGNA7XDG4LF466YAIEH4TU2HG2GEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM doesn't need such special flags.
> 
> OTOH, it cares playback/capture_only flag. It is needed.
> 
> This patch adds new assertion flag, and convert current dpcm_playback
> dpcm_capture flag and playback/capture_only flag to it.

The Intel CI flags a regression on a CometLake "Helios" Chromebook with
this patchset

https://github.com/thesofproject/linux/pull/4937

Apr 19 14:01:22 jf-cml-hel-rt5682-07 kernel:  SSP1-Codec: SSP1-Codec
capture assertion check error
Apr 19 14:01:22 jf-cml-hel-rt5682-07 kernel: sof_rt5682 cml_rt5682_def:
ASoC: can't create pcm SSP1-Codec :-22

https://github.com/thesofproject/linux/pull/4937

I don't have any specific knowledge on this device, hope Brent Lu can
shed some light on what is so special about this SSP1.

Regards,
-Pierre
