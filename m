Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9598CA057
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 17:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA011F4;
	Mon, 20 May 2024 17:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA011F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716220591;
	bh=PKOTCzh7s/Hlw+lCPuwNY7ZQb0fnb29mRHIC+H6JoNQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CYPU1weVwYfdL+Mup2UFlGR8jkj0M2H/CM9Z2UWgLhn8dJm77LMFANRy4/7qa8Mpr
	 pj/AN9/mrOY8YUVn0r1B8RtXi/F38/cNGVDYcs6460WX6X0nNtRLUWJd9bDom3KY53
	 FfzpyLMfSplK4fJ0AE/ZiPQ/pwHtI8BQEYhzDVPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F3D7F80579; Mon, 20 May 2024 17:55:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E54F804B2;
	Mon, 20 May 2024 17:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA634F8026A; Mon, 20 May 2024 17:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 578D9F801F5
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 17:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 578D9F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CIvevKup
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716220549; x=1747756549;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=PKOTCzh7s/Hlw+lCPuwNY7ZQb0fnb29mRHIC+H6JoNQ=;
  b=CIvevKupc7zS1moN3MjbrHYlia7BwOaVHRMhbUidT+FgjK98jjuJeoIu
   5QRHE6mzQ2pVuFPWz7FxcaTykxjq3sfHqUhsG6xEID4R4Yx4aojtHAxjO
   aDib6HgA1gtgr5H2Nre6KumEk4lnmYfrPpg2qtdsOViqJG5eTsj8rm8hL
   zwmSu8eAVjRnf+BRNdWy6yvccXKB00SqfgHeXr/Rkz1d1K349/+Mbf5dG
   f4LyupSWivk/Zyf7XCBLj8JoeJEER9oplypySpiWxhcb8hFzNx5wJcM6V
   lwifiptyTLD0LWmuLfaCABsR/b9S089u5s+gc26GTr58QLmvPx1GFWlNp
   A==;
X-CSE-ConnectionGUID: g0TAq+WfSgmyI+Uw1Jz64w==
X-CSE-MsgGUID: 8HSCiK5pQYmxBSNnW+rDCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12233885"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="12233885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:55:42 -0700
X-CSE-ConnectionGUID: Zk9AkXmXQXCmMVOXmQSITw==
X-CSE-MsgGUID: 9ILVEuteSYeDWdkOJH4GYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000";
   d="scan'208";a="37346120"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51])
 ([10.125.109.51])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:55:39 -0700
Message-ID: <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
Date: Mon, 20 May 2024 10:55:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
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
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6LXZFA62P666FU3P66MJWJ7DVQJWQCG3
X-Message-ID-Hash: 6LXZFA62P666FU3P66MJWJ7DVQJWQCG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LXZFA62P666FU3P66MJWJ7DVQJWQCG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/19/24 18:31, Kuninori Morimoto wrote:
> Current DCPM is checking CPU side availability only, but it should also
> check Codec availability. But because of long DPCM operation history,
> it is possible that the some Codec driver check have been bypassed.
> 
> It should be error, but let's add grace time to update driver.
> 
> This patch indicates warning in above case. Each applicable driver need
> to update during this grace time.

...

> +		/*
> +		 * REMOVE ME
> +		 *
> +		 * Current DPCM is checking CPU side only, but both CPU and Codec should be
> +		 * checked. Indicate warning if there was CPU / Codec mismatch.
> +		 * To keep compatibility, warning only for now.
> +		 */
> +		if ((dai_link->dpcm_playback || dai_link->playback_only) &&
> +		    !has_playback_both)
> +			dev_warn(rtd->card->dev,
> +				 "System requests playback, but not available (%s)."
> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +		if ((dai_link->dpcm_capture || dai_link->capture_only) &&
> +		     !has_capture_both)
> +			dev_warn(rtd->card->dev,
> +				 "System requests capture, but not available (%s)."
> +				 " Please update Codec driver\n",
> +				 dai_link->stream_name);
> +

I mentioned in my previous feedback that this isn't quite right. There
are cases where the CPU dai reports capabilities that the codec DAI does
not support - e.g. when the AEC reference is generated in firmware on
the host DSP.

And sure enough we get that warning in the first test:

https://sof-ci.01.org/linuxpr/PR5005/build3040/devicetest/index.html?model=GLK_BOB_DA7219-ipc3&testcase=verify-kernel-boot-log

May 20 13:35:38 jf-glk-bob-da7219-1 kernel: sof_da7219 glk_da7219_def:
System requests capture, but not available (SSP1-Codec). Please update
Codec driver

For those systems, trying to match CPU and codec dais is not going to
work. Either we skip this verification or we have an escape mechanism to
avoid triggering errors.
