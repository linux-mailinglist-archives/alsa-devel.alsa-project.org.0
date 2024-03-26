Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6888CE67
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 21:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EB82BD0;
	Tue, 26 Mar 2024 21:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EB82BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711484727;
	bh=3/laPbw4dZzLc5cIWlMGtQPK7sjd5djD9WWYkPnEIy8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EV5whyJHKHZPt6uApN/l+kfe44x9i0AnLklQu0R4EqjvXrKvQT09c8dyQX1tYcglq
	 +GgAs1AIAga3l8eyXV3z4XJz37/mP6sbpcnk5twvfs5yGUbop1suecGCI+mO61U6FI
	 4wsG7Xodltq649yZAHb+VJ31eDyIyhekTlcohWk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E15F805AD; Tue, 26 Mar 2024 21:24:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AB8F80571;
	Tue, 26 Mar 2024 21:24:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A02F8025F; Tue, 26 Mar 2024 21:24:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE027F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 21:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE027F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DrQ9L1Nq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711484672; x=1743020672;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=3/laPbw4dZzLc5cIWlMGtQPK7sjd5djD9WWYkPnEIy8=;
  b=DrQ9L1NqckEu6k1x8VslcIkV3yUzud7iVi8YtTJaltz4FZ89/FuD2clz
   VttCv2flVWkkvaJ3HGXPEtXMuCAvluyYVTEFGtCA9X7iyawJHWNusmX1w
   lD9ZBACbXaAxQr9bMmVJ0Fn+zYPVQ9d6t0VRJOn2YgXLPMbRwuRguQBBx
   1wMIYOiHa2srhCcfzo96G6DaZN21xJ1lltedk7qam0QbqloSocaavqX37
   Ju0Fy7b2JOIr2vCvigh9NFgcRvA5WiWLXUz3gOkfjwOWAMhJaw0Og65n6
   aUJ1NnRmXmL8v3r0aBKbhcFb1Dhv9iseoR97z1Y5JbUq/kMj00+C8aX+x
   g==;
X-CSE-ConnectionGUID: zY943PVdRaC868D7Add9aA==
X-CSE-MsgGUID: vz7Unv5mT5GTIpTw9zK9kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17946360"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000";
   d="scan'208";a="17946360"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000";
   d="scan'208";a="20716653"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO [10.212.65.108])
 ([10.212.65.108])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:24:24 -0700
Message-ID: <1c437229-cbc7-4e0c-987c-9ca31800a572@linux.intel.com>
Date: Tue, 26 Mar 2024 15:24:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] ASoC: Intel: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <87frwf53mq.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87frwf53mq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JHH5ZECM5F25TT3NZB3B7MTWDKY7JKO4
X-Message-ID-Hash: JHH5ZECM5F25TT3NZB3B7MTWDKY7JKO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHH5ZECM5F25TT3NZB3B7MTWDKY7JKO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.

This patch no longer applies since Mark merged
"[PATCH 00/21] ASoC: Intel: boards: updates for 6.10 - part1"

https://lore.kernel.org/linux-sound/20240325221059.206042-1-pierre-louis.bossart@linux.intel.com/

The odds of additional conflicts are very high due to the number of
queued changes in machine drivers, I really don't know how we're going
to find the time to solve those conflicts and test experimental
versions, while we're also busy checking the 6.9-rc1 transition.

In addition, I have a bit of heartburn with the concept of flipping the
logic from a clear description of playback or capture supported, to an
implicit 'both supported unless stated otherwise'. We are going to miss
some cases and have regressions, it's pretty much a given.

And then there are cases such as the following examples

> @@ -496,8 +494,6 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
>  		 */
>  		.name = "SSP1-Codec",
>  		.id = 6,
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1, /* Capture stream provides Feedback */
>  		.no_pcm = 1,
>  		.init = cml_rt1011_spk_init,
>  		.ops = &cml_rt1011_ops,

> @@ -293,8 +291,6 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
>  
>  	link->id = be_id;
>  	link->no_pcm = 1;
> -	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
> -	link->dpcm_playback = 1;
>  
>  	return 0;
>  }

> diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
> index 6eb5a6144e97..c7cca3e47ed9 100644
> --- a/sound/soc/intel/boards/sof_da7219.c
> +++ b/sound/soc/intel/boards/sof_da7219.c
> @@ -296,8 +296,6 @@ static struct snd_soc_dai_link jsl_dais[] = {
>  		.id = 0,
>  		.ignore_pmdown_time = 1,
>  		.no_pcm = 1,
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1, /* IV feedback */
>  		SND_SOC_DAILINK_REG(ssp1_pin, max_98373_components, platform),

where we lose comments on what the capture stream is. That's not so
good, we added those comments on purpose to explain that the capture
stream isn't a regular PCM format, I don't see a good reason to see them go?
