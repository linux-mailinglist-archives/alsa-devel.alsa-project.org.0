Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6048AAF4E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 15:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A3386F;
	Fri, 19 Apr 2024 15:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A3386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713533288;
	bh=Qnz9KkLZ0F/VZJLWO9UAiA4GTOIoA6FKmFggsIBghb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfRBl/1IdBQKYReMt1fJ+9QCVJo4UtyZSpZvIlZDyLmzXt4ykvs6h/Hr+jhLrWKIw
	 a09+5XoHOFpzyLwUi+GsnGowicIacYN7vuAzIvgB5L48FU0XJdcY2DszRc37atwfJZ
	 3zJHZno2qL5oESAUgXMWYljsI2Fv3dLgYzzNWkyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA396F805AF; Fri, 19 Apr 2024 15:27:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26165F80570;
	Fri, 19 Apr 2024 15:27:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12BA8F8025A; Fri, 19 Apr 2024 15:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE25DF801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 15:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE25DF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JNs7eX/X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713533240; x=1745069240;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qnz9KkLZ0F/VZJLWO9UAiA4GTOIoA6FKmFggsIBghb0=;
  b=JNs7eX/XUS+BmE7XBqXPGlQJK+3TKlb1GnsOPBFg1IX59ObGMSBjDklA
   RwF9UX7d/uiXkw5qRlBqc6GMNW4Dygutvox08cSs6rxRYFlEhnYE11YA/
   Cv9MKbq5/7lIcbGsED/4t/n5tRS3OhXoaxQSB6w7YeDXgIpPa19ED1dIm
   C+wlxk0ELJlHGeyjLhXfVjb/p6a4TX5QBeHLwT3EQFNhypzAeUk2REmlH
   xkVvLs3V4ripDyFpeEyCY6X95GdC35UbBigOLfgGcU/Lq35ahW7GzSNlp
   nRAjxg4y7HsD8tBzLJk4iRqPZt8Sj3BjQI2gjCYra7iBLzWuIdQKoJCMO
   Q==;
X-CSE-ConnectionGUID: bZkJY5yURM6LTEMot11WNw==
X-CSE-MsgGUID: vheZIZn8Tjij3YTtR+OfzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="34531840"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="34531840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:27:14 -0700
X-CSE-ConnectionGUID: QABg7rpFSuq0ZKNqFoAQ5A==
X-CSE-MsgGUID: 17elK82rR4SPLD6Vg+dLhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="23312212"
Received: from ymahendr-mobl1.amr.corp.intel.com (HELO [10.212.85.57])
 ([10.212.85.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:27:10 -0700
Message-ID: <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
Date: Fri, 19 Apr 2024 08:17:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
 <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
 <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GPMRRWFYKUS5CYIKJDPUR3BF7VYGQJZZ
X-Message-ID-Hash: GPMRRWFYKUS5CYIKJDPUR3BF7VYGQJZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPMRRWFYKUS5CYIKJDPUR3BF7VYGQJZZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> (X) part is for DPCM, and it checks playback/capture availability
>>> if dai_link has dpcm_playback/capture flag (a)(b).
>>> This availability check should be available not only for DPCM, but for
>>> all connections. But it is not mandatory option. Let's name it as
>>> assertion.
>>
>> I don't follow the 'not mandatory option'. Why not make these
>> 'assertions' mandatory? What happens in case the the option is not present?
> 
> The big reason why "assertion flag" is not mandatory is that non-DPCM doesn't
> have such flag before. I can't add such flags to all of non-DPCM,
> because I don't know which direction (playback/capture) is available on
> each DAIs.

Your explanation seems to contradict the sentence above "This
availability check should be available not only for DPCM, but for all
connections."

Can we actually do this 'availability check' for non-DPCM connections.

>>> In case of having assertion flag, non specific side will be disabled.
>>
>> Not following the wording, multiple negatives and not clear on what
>> 'side' refers to (direction or DPCM/non-DPCM).
> 
> How about this ?
> 
> 	If either playback or capture assertion flag was presented,
> 	not presented direction will be disabled by ASoC even if
> 	it was available.

Did you mean

"
The playback (resp. capture) direction will be disabled by ASoC if the
playback_assertion (resp. capture) flag is false - even if this
direction was available at the DAI level
"


> (playback_xxx, capture_xxx)
> 
> (0, 0) : Both are not must item. available direction is used as-is.
>          But it will be error if nothing was available.

That new wording makes me even more confused. What does 'available'
refer to and at which level is this?

This seems also to contradict the definitions above, "available
direction is used as-is" is not aligned with "not presented direction
will be disabled by ASoC even if it was available".
> (1, 0) : DAI must support selected direction.
> (0, 1)   Not selected direction will be disabled even though it was available
> 
> (1, 1) : Both must be supported.

