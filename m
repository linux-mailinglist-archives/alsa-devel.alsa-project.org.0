Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC98CA52C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 01:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C407284D;
	Tue, 21 May 2024 01:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C407284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716248613;
	bh=LvhNE47HwRc9IiFLm1WRvgRimgtExT7XKlEYXYcZPSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LAbfatcjw9qakEKmkFG8kxxNHNQzm5+2C+lGfib05lc7zdZBPbggzHUBHPXvchbBW
	 9HQwEggzMG9OWwCtL6Iocx8zWvrWTVcg5ipBOBM0D5h/x5IQ6aJRNAge7kwRjN4W2t
	 HiGJkLi3EED4+Qbdkir9LwGq2svS3k1heELav6o0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A5CFF805A0; Tue, 21 May 2024 01:43:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB796F8057A;
	Tue, 21 May 2024 01:43:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97DC4F8026A; Tue, 21 May 2024 01:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3114DF800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 01:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3114DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OQJPT0HH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716248580; x=1747784580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LvhNE47HwRc9IiFLm1WRvgRimgtExT7XKlEYXYcZPSw=;
  b=OQJPT0HH31lNzLKCN7kukNgCxQqrPmNgusB/xu8mDAqqZqBRp2ifisJa
   CpWadH9ncfzgAqcCI0Ao/lZyjNfa9pLH8ndWtGgUcRkN3x+tFK50c6lk8
   Fh5mtEShrV80shSAu1NwvLfZ1XKwVRe1ei2UzM4nkxgO7QskqNRHbJFpu
   gX390XnT44bC0MWwSOqqrIWhCW1mIgzvB+BT1EzQeasibmGE09YbQnkuZ
   fHnxZaJ6Ihd5bM9Hp5kvdSU72T14fGVuES656OI0tUwCh1CHD9c/pPnZ5
   wU2SJSviPro3DfzWdzqqR4IuprMWprXKT81UuJiwnpWYv6xXDFe3Umoia
   A==;
X-CSE-ConnectionGUID: QyNnhrnLTg2QjmUC8aLYuA==
X-CSE-MsgGUID: eXGIlf2aQUubZvZCdG+g/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23550051"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="23550051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 16:42:55 -0700
X-CSE-ConnectionGUID: b0vyrOh3RVCjrDoQ8W4qOg==
X-CSE-MsgGUID: kStHjqW3TkGraF/ISJU4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="55952024"
Received: from ldmartin-desk2.corp.intel.com (HELO [10.125.109.115])
 ([10.125.109.115])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 16:42:51 -0700
Message-ID: <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
Date: Mon, 20 May 2024 18:42:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
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
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DXPOT4KXUSBYTQNJGS5276IQY2YYHBBQ
X-Message-ID-Hash: DXPOT4KXUSBYTQNJGS5276IQY2YYHBBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXPOT4KXUSBYTQNJGS5276IQY2YYHBBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> I mentioned in my previous feedback that this isn't quite right. There
>> are cases where the CPU dai reports capabilities that the codec DAI does
>> not support - e.g. when the AEC reference is generated in firmware on
>> the host DSP.
> 
> Hmm... I thought all issue was solved...
> 
>> For those systems, trying to match CPU and codec dais is not going to
>> work. Either we skip this verification or we have an escape mechanism to
>> avoid triggering errors.
> 
> Sorry, but I'm not 100% understand about your situation.
> Why Codec can't have channels_min ?
> If the Codec can flexibly adjust to paired CPU, Codec can have full channels
> support, like dummy DAI ? This means verification is based on CPU only.
> Is it not enough ?  and/or Can you show me the driver ?
> 
> 	static struct snd_soc_dai_driver dummy_dai = {
> 		...
> 		.playback = {
> =>			.channels_min	= 1,
> =>			.channels_max	= 384,
> 			...
> 		},
> 		.capture = {
> 			...
> =>			.channels_min	= 1,
> =>			.channels_max	= 384,
> 			...
> 		 },
> 		...
> 	};

We cannot change the Maxim amplifier driver, it's used in a variety of
usages and platforms, and there's no reason to create a fake capture dai
just to reflect the use of a capture stream on the CPU side on some
Chromebooks.

The dailinks used for amplifiers in
sound/soc/intel/boards/sof_boards_helpers.c set dpcm_capture always

	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo
reference */

which means that this test will fail:

if ((dai_link->dpcm_capture || dai_link->capture_only) &&
		     !has_capture_both)

I don't disagree that the unconditional use of dpcm_capture isn't very
elegant, but it is what it is. This platform has been around since 2019
and still has about 6 or 7 years of support, so we can't break it with
stricter criteria.

