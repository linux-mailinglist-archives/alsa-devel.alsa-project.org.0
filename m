Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6888C20B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 13:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F342355;
	Tue, 26 Mar 2024 13:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F342355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711455994;
	bh=4/FUC3PgeGbPj/ACm7P2erlBnN7nF3Qy/MNNSPLifnI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZvWFDiqIMXU9mZrer3ySli1suPyctxkQxdTsuUvG+uC2IcMT7zdAY4qZ99cEwTu+r
	 ConDS+maiad2zDGZ2CvGqSoSY6rYyPeMeJcwxEhsym/DT/7zcOAFFHsQHn2btXBDx9
	 Y1eSuKu8gBnpMfM2eqfa/JmdxzTFp5yik1nv/ePA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6716F8057D; Tue, 26 Mar 2024 13:26:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB342F805A0;
	Tue, 26 Mar 2024 13:26:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A5AFF801D5; Tue, 26 Mar 2024 13:25:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68DA5F801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 13:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DA5F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cYqfVGUX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711455953; x=1742991953;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4/FUC3PgeGbPj/ACm7P2erlBnN7nF3Qy/MNNSPLifnI=;
  b=cYqfVGUX7qI1z9b/CQn2RLW7Fsnd8lIJPnJ8A4b6mygxQiHht5bpJoQm
   pcofReuzwyqSnNDmmO6wPyb+Qneiym7iDowej4gZvOe9BrIpzk4XvuBFD
   n5C8PVySFxf4aQSCQ3wAv6Jdi9Qj5XEmZD71hKkNIwcwUstpXlXxZ3MFQ
   xWbIFgwh/B840iMPzBnWuP5UifSLUv+EA/tOYr7AfovAMrdlmVLLKlsmp
   7zc2ArlBRqPFOe6DCtjtfpmHB2dN5Lbw3rIhnbhqeIPPTbhraRlPCVc5v
   OtdrFyLO/oEju3KT6QvskaxFsCPaW/q7jRrviC1DvaZ0NTlbEFZkHsEWV
   Q==;
X-CSE-ConnectionGUID: f1+L/I0/TZW9FEOiL+6CRw==
X-CSE-MsgGUID: JocPyZHaSfu0UBh24PZpLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10299229"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="10299229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="47099724"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:25:41 -0700
Message-ID: <83d63442-ae4c-4e5e-a610-c0c0be54d50e@linux.intel.com>
Date: Tue, 26 Mar 2024 13:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] ASoC: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2NUI35HH76D4LFDFACJ46752STTHDIR4
X-Message-ID-Hash: 2NUI35HH76D4LFDFACJ46752STTHDIR4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NUI35HH76D4LFDFACJ46752STTHDIR4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/25/2024 5:35 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM case is checked without special flags.
> 
> OTOH, it cares playback/capture_only flag. It is needed.
> 
> This patch remove DPCM special flag, and replace it playback/capture_only
> flag if needed.
> 

One general note, I wonder if playback/capture_only should be renamed to 
something more descriptive, current names are a bit weird from use case 
point of view. I mean no flags, means both capture and playback are 
enabled. Then you do something like playback_only = 1, which effectively 
affects capture stream. Notice that flag is named playback, but affects 
capture. Perhaps, something like capture_disabled, playback_disabled 
would make more sense? This would also make more sense to me for 
something like playback_only = 1; capture_only = 1; which while weird 
doesn't instantly seem that wrong, while disable on both directions 
instantly seems broken.


