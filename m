Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9443896F54
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 14:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC2E2D07;
	Wed,  3 Apr 2024 14:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC2E2D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712148686;
	bh=D/FfpbAsiof89LgUZ4/UlHEJN8aXS0QySDUDCd5cFgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aneHhHjByayFDKUGQHqnMsgrQmfEy7LbuoBK6r7fR771pLflpKiy5TQrlIYiTa5Sd
	 dj9h5nXQO2oninWaZiQpWuPlCs+NmTPp6j7dIyB2z/6u5XpnyCKDa2xRf1PbmCoV+O
	 In7irIKUTRuK8rgNE3C5iGnT4muZ/kUdMvzwWaZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE416F805CB; Wed,  3 Apr 2024 14:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C69CF805C9;
	Wed,  3 Apr 2024 14:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8364F8055C; Wed,  3 Apr 2024 14:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2906DF8016E
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 14:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2906DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ONc6bG9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148631; x=1743684631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D/FfpbAsiof89LgUZ4/UlHEJN8aXS0QySDUDCd5cFgU=;
  b=ONc6bG9Fn5WXNe7gsl3MFxZnsKh2XtFfGIrrY9OASMkEXY/SzPf3rOCE
   z2YN7RH5aJMTjtOyl7w6Cj2p33d6L7cThfv5v6CFmefb5Gzmrg+Uh2s+m
   QHasVEisDBrNzN2irDi9iFsmLdeaB6qAjXpeBblZV9COo+rKfhJKkw3rR
   Cbht6HCYPo1dvYvWJFTpYpG+TfrtuWrl2KPel+hJrmyVDGjjSJxwwePt/
   OiUXvB2Up7xI+kp0fzS70/0o5XmHnjycoK0dy9cY1p3BudjH6f9s8KtDe
   pVLivksaeE5cTgc3cyrkGWWqxSdmsiUidJETmUFxBwORqAGAK5FM8Ui5V
   w==;
X-CSE-ConnectionGUID: VbQtxK1BTn+Ha3yDcZQO+A==
X-CSE-MsgGUID: jkTFcKw6SEiWVf8AGNduVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539335"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7539335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:28 -0700
X-CSE-ConnectionGUID: /D+wW3RkS/a6+yA0ZGswww==
X-CSE-MsgGUID: J/jGeT/nQbCMDRSoTLK5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18343238"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:26 -0700
Message-ID: <2cb2f96f-836c-4816-86f8-2262c2dd1ce3@linux.intel.com>
Date: Tue, 2 Apr 2024 09:09:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to
 playback/capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
 <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
 <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 37JLO2LGFQCGJ7G6Z2KZ3D5UJ5MTSWB7
X-Message-ID-Hash: 37JLO2LGFQCGJ7G6Z2KZ3D5UJ5MTSWB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37JLO2LGFQCGJ7G6Z2KZ3D5UJ5MTSWB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/1/24 18:27, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for the feedback
> 
>>>  			/* convert non BE into BE */
>>> -			if (!dai_link->no_pcm) {
>>> -				dai_link->no_pcm = 1;
>>> -
>>> -				if (dai_link->dpcm_playback)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
>>> -						 dai_link->name);
>>> -				if (dai_link->dpcm_capture)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
>>> -						 dai_link->name);
>>> -
>>> -				/* convert normal link into DPCM one */
>>> -				if (!(dai_link->dpcm_playback ||
>>> -				      dai_link->dpcm_capture)) {
>>> -					dai_link->dpcm_playback = !dai_link->capture_only;
>>> -					dai_link->dpcm_capture = !dai_link->playback_only;
>>> -				}
>>> -			}
>>> +			dai_link->no_pcm = 1;
> (snip)
>> It's not clear to me how this is related to the
>> dpcm_playback/dpcm_capture removal.
> 
> In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
> convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
> be 1 anyway after this code.
> And then, dpcm_playback/capture is no longer needed.
> So it just set no_pcm = 1 here. But am I wrong ??

The problem is that the patchset is supposed to be only about removal of
flags to align on one set, but then we also have "simplifications" or
removal of checks without explanations.

It would be far less invasive if we only replaced flags and had
iso-functionality. Then we can discuss the merits of simplifications.
