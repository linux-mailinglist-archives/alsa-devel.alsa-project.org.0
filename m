Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C48AA004
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 18:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355542356;
	Thu, 18 Apr 2024 18:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355542356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713457829;
	bh=n5UTBwm9LwxWCwUD5WYTPdP8hKDjMr22biXL1uuugRA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=swtRguDkkISDAX0EK31XBZ141jphFqLt/eDZOFc3qJBgLWn+AHFc0g+sFRExecRpf
	 3hWLW9Venla51rg9PcgvQegMhEMgLZVQMnbzKd9bKThcM8Jcj6I7c6hLewUO/cKa3v
	 ZV4nasI1w24oCXZOvz8JpBrRRUBFcMJAkpPr4rUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FFCCF805AE; Thu, 18 Apr 2024 18:29:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0360DF80589;
	Thu, 18 Apr 2024 18:29:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279EFF80423; Thu, 18 Apr 2024 18:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92EF2F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 18:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EF2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XJecNykd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713457777; x=1744993777;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=n5UTBwm9LwxWCwUD5WYTPdP8hKDjMr22biXL1uuugRA=;
  b=XJecNykdUQi84uD6gV8zZ0SWBbadjZCdA80/nb30658xR42prpg/22ad
   FwU5361lhqAANy35BLDuMD2Fr+qZiyojOF+sH8QXuW5k0HIbJdSgBPHj+
   pJKoa0BKljWIqi0SbPBG4I94xP/yhnc5YramkClM0zqUquXXjEIhOttt+
   8ixjCvObOTCjEdYbPBC+VJ0Q3p9AmgoRl3oi0akA8l1zT4VUHEOUvq1gf
   GAebaBpPUmYtMtQXkYZ1Kq+XoFcdv2ntQAbrvR53bL1LqtOAe19ovJS3R
   M2z1zMEg33/jFqBZvGiTTyO9tDe1GZzWfmiSImwMzXSzGgQhpt2dE9Hg9
   Q==;
X-CSE-ConnectionGUID: opKObz48QO6/L+3KoSntqQ==
X-CSE-MsgGUID: 0PH3t9P8RLaqX5bY4ly8MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8882355"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="8882355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 09:27:57 -0700
X-CSE-ConnectionGUID: QL+FsKavRtigEK3tKkR75g==
X-CSE-MsgGUID: ZaFP6k8bT0OPD8LxfPhFXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="23105114"
Received: from rswoodsx-mobl.amr.corp.intel.com (HELO [10.213.167.100])
 ([10.213.167.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 09:27:53 -0700
Message-ID: <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
Date: Thu, 18 Apr 2024 11:26:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
 <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UASGNDRHFVRXJKURBGJKHRNE6VABWLU2
X-Message-ID-Hash: UASGNDRHFVRXJKURBGJKHRNE6VABWLU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UASGNDRHFVRXJKURBGJKHRNE6VABWLU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/18/24 06:19, Amadeusz Sławiński wrote:
> On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
>> soc_get_playback_capture() is now handling DPCM and normal
>> comprehensively for playback/capture stream in same code.
>> This patch converts xxx_only flag to xxx_assertion.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>   sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/bdw-rt5677.c
>> b/sound/soc/intel/boards/bdw-rt5677.c
>> index 54e3c5d3c251..9170b1d509e2 100644
>> --- a/sound/soc/intel/boards/bdw-rt5677.c
>> +++ b/sound/soc/intel/boards/bdw-rt5677.c
>> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>>       {
>>           .name = "Codec DSP",
>>           .stream_name = "Wake on Voice",
>> -        .capture_only = 1,
>> +        .capture_assertion = 1,
>>           .ops = &bdw_rt5677_dsp_ops,
>>           SND_SOC_DAILINK_REG(dsp),
>>       },
> 
> Should this have been part of patch 8?

Patch 8 deals with the following changes

-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,

This case is about

> -        .capture_only = 1,
> +        .capture_assertion = 1,

I think it's good to make this change separately.
