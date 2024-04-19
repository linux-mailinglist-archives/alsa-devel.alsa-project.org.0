Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0988AA93A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 09:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBDD3A4A;
	Fri, 19 Apr 2024 09:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBDD3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713511938;
	bh=1W1wKmyjgUnLlO7H58gYIoT+uueMc19QlOOhLij24FM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=arrMuT802uVHL49ds19gQF8Qfdii8nZYO0Tt61rSpFQ70wiBeosbtr7Z3bmPBHJTx
	 AeABIr0Fj4XKCX2/iOKbu1pTcfe9BiI76Yr/qBlgec8548/l9ota6JUNvkOACfeO6j
	 hPPRgj7As/jSBUrgQP3Nv2JDlFKrfEUcnYCLqzJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DEA3F80580; Fri, 19 Apr 2024 09:31:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 295ACF80589;
	Fri, 19 Apr 2024 09:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884FBF8025A; Fri, 19 Apr 2024 09:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0694AF801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 09:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0694AF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i+sRtcYO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713511885; x=1745047885;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=1W1wKmyjgUnLlO7H58gYIoT+uueMc19QlOOhLij24FM=;
  b=i+sRtcYOpA8oWHEu8EqRat33KRBeh1DTmf/jez7jgPRtiOewmSYwZd3I
   0zjq/RcnJJQP6mogk5OrqIMTbkkYQ+blpcNz6Z4hwQJUY8P/0RamSI4uv
   tL81eV9qgZsqUTG6AJQ3hLq9Vs1HTyf9j7L2w2icFrH2c+lTB4KP0d6i9
   2ONxA79AxOxr8NYHHS7EZXVrJUHyS6W1FU4akZbbmBiT+hBGWnSPM+kg7
   WxVbBSsfe0oS+IWfWshTzCsaawAl0AwlB8MO+2srPIkMrglw77nAR+msN
   ypzt/3eK3vvKVn9Hv9nY3cc6ixfw44LGqdRmVi+7HJN8zCGTzzqtDvn4Q
   A==;
X-CSE-ConnectionGUID: 8XT3UvwlRyKu3Hd9t8fUvQ==
X-CSE-MsgGUID: nzjSQxuwRBGYjXffpNRqNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8972453"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="8972453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:31:19 -0700
X-CSE-ConnectionGUID: fCprXCqsQCC9GuV7KLXVkg==
X-CSE-MsgGUID: 43memXPHTduSJHre2tY33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="23285237"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:31:10 -0700
Message-ID: <6bb27015-293d-403d-9144-b44454b6bc20@linux.intel.com>
Date: Fri, 19 Apr 2024 09:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
 <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <aa01d483-3a24-4388-be11-86b92bade374@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MB5DGQQVQFTZMFCWJFHBZHU2WFL4RXJR
X-Message-ID-Hash: MB5DGQQVQFTZMFCWJFHBZHU2WFL4RXJR
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MB5DGQQVQFTZMFCWJFHBZHU2WFL4RXJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/18/2024 6:26 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 4/18/24 06:19, Amadeusz Sławiński wrote:
>> On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
>>> soc_get_playback_capture() is now handling DPCM and normal
>>> comprehensively for playback/capture stream in same code.
>>> This patch converts xxx_only flag to xxx_assertion.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>    sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/intel/boards/bdw-rt5677.c
>>> b/sound/soc/intel/boards/bdw-rt5677.c
>>> index 54e3c5d3c251..9170b1d509e2 100644
>>> --- a/sound/soc/intel/boards/bdw-rt5677.c
>>> +++ b/sound/soc/intel/boards/bdw-rt5677.c
>>> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>>>        {
>>>            .name = "Codec DSP",
>>>            .stream_name = "Wake on Voice",
>>> -        .capture_only = 1,
>>> +        .capture_assertion = 1,
>>>            .ops = &bdw_rt5677_dsp_ops,
>>>            SND_SOC_DAILINK_REG(dsp),
>>>        },
>>
>> Should this have been part of patch 8?
> 
> Patch 8 deals with the following changes
> 
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1,
> +		.playback_assertion = 1,
> +		.capture_assertion = 1,
> 
> This case is about
> 
>> -        .capture_only = 1,
>> +        .capture_assertion = 1,
> 
> I think it's good to make this change separately.

Indeed, missed that.
