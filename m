Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E098CD325
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 15:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A83823;
	Thu, 23 May 2024 15:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A83823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716469466;
	bh=jw4sR51kSbW7rHYB3afXhuNhtkpAyEH1zeZVnVImweU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D17rHrWIM40Bk6Ehigh/WCXEGMYajdKtSNKUbvmaXZGLCS+UE0afJVyR/zQDapgh0
	 jOI77ebc2t4S6hnkIDdVlauKhioiC/s29vlbk+Q235SpLAqt3kLMqLRlCNnBlmr+SG
	 Xg9b2ohGzKncoaecozdWJnld5FavZxES+U/RsPjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30FEFF80588; Thu, 23 May 2024 15:03:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7275DF8051F;
	Thu, 23 May 2024 15:03:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C8EF8028B; Thu, 23 May 2024 15:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 580B2F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 15:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 580B2F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ReZexvGj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716469420; x=1748005420;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jw4sR51kSbW7rHYB3afXhuNhtkpAyEH1zeZVnVImweU=;
  b=ReZexvGj8WVBpgGH+t5iRAGl/RlPA0FczYvbojfaexmkuWOgDJL0ykHy
   eptqvnKKEDx1ErqZa4hheuwRGZ9TxLNHP02B8xgQWYTYBg/BDjxJfu18D
   0wW4sa47/+yF2w5/v/IpvKYDylb2EUegaHSDV5Kn6jkACgGweeLRijaZm
   7JPyibyvV8MDRPE0YWzuuN9hhDKCvr9FS1ebxbVVF0kLEGdvCEmfx+nNt
   D7ZpHFHhdVgqZ+s5iyJ4l4slzKA0zvREN9X+P9S4xnIbvZPsXDmMkV3fX
   dOds7Dt3KIPXWxzix17+eMemmN/OlYQXCwrDrAhi+4nLY5e0jRTp7u+za
   g==;
X-CSE-ConnectionGUID: CyBQiOJJQ0aMCT7/kWFyMw==
X-CSE-MsgGUID: RwnSP/juQyuTC0sXk7GWKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12632714"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000";
   d="scan'208";a="12632714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:03:32 -0700
X-CSE-ConnectionGUID: c61xu0+GRl2iSbzHX4p83g==
X-CSE-MsgGUID: E1Ph9vJrQzqtcOJwbDdmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000";
   d="scan'208";a="33550436"
Received: from unknown (HELO [10.125.110.41]) ([10.125.110.41])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:03:29 -0700
Message-ID: <37615d72-762e-4ec7-b625-e275a96b2780@linux.intel.com>
Date: Wed, 22 May 2024 08:35:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
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
 Maso Huang <maso.huang@mediatek.com>,
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
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
 <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
 <37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
 <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KQR76KS7OM4UPYJ7UBNM6ZBGK4HODMDA
X-Message-ID-Hash: KQR76KS7OM4UPYJ7UBNM6ZBGK4HODMDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQR76KS7OM4UPYJ7UBNM6ZBGK4HODMDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> In case of ignoring Codec check on DPCM, it allows unexpected direction,
> I think. For example if it is not using dummy DAI, and in case of CPU can
> playback/capture, Codec can playback, and user expect playback only,
> in this case unexpected "capture" will be available. He need to add
> playback_only flag, but it is not good for me.
> 
> Can we avoid validation check if DAI has some kind of new flag, like
> ignore_pair ?
> 
> pseudo code is like this
> 
> 	if (valid(cpu, PLAYBACK))
> 		has_cpu_playback = 1;
> 
> 	if (valid(cpu, CAPTURE))
> 		has_cpu_capture = 1;
> 
> 	if (valid(codec, PLAYBACK))
> 		has_codec_playback = 1;
> 
> 	if (valid(codec, CAPTURE))
> 		has_codec_capture = 1;
> 
> 	if (cpu->ignore_pair) {
> 		has_codec_playback = 1;
> 		has_codec_capture  = 1;
> 	}
> 
> 	if (codec->ignore_pair) {
> 		has_cpu_playback = 1;
> 		has_cpu_capture  = 1;
> 	}
> 
> Or more detail ignore_pair_playback, ignore_pair_capture

There are two options
a) we don't even try to test the codec-cpu match in terms of
capabilities. That means the same behavior as today.
b) we add a chicken bit for platforms to disable the codec-cpu match if
it breaks specific platforms.

The problem with b) is that we don't know what platforms will break. I
reported one example that was caught by our CI, but there could be
additional Chromebooks impacted, who knows.

My vote is a).
