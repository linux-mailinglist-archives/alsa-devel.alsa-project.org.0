Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD482895627
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 16:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39EA62C0E;
	Tue,  2 Apr 2024 16:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39EA62C0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712066737;
	bh=B/oDAGN+zjg91RMbs4nINoQUVzqt8+57JpoK0VRIYFA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Yn7wbUR2hnC9GPDxEZPK0+9HYYdYS6+vsG4e8cyhEP1SWjpRxGca5oUJBWRPfDsJH
	 pOrfGg740VzuKXT2QSmHkhe1baQPFGNjXFMU9hD0z7v4fzBKzwUWOsjdv09YuJcGnO
	 PVnJTgMIj2ZB6OJHF/zfc3ywrb4BCKEMT5ZmwtQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 281F7F805A9; Tue,  2 Apr 2024 16:05:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80993F80571;
	Tue,  2 Apr 2024 16:05:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 136B1F8020D; Tue,  2 Apr 2024 16:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57B44F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 16:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B44F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jOx/y047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712066692; x=1743602692;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=B/oDAGN+zjg91RMbs4nINoQUVzqt8+57JpoK0VRIYFA=;
  b=jOx/y047MFG2D2ZHR+qLENsVCXCTdFT2c1mn93L43YWsRFnZALF3uvbX
   I9yIgL8zprWsouLqdcCQe5rjhAWKwK7g0u5PvxvMiIB6IXRzOK60i31+F
   c7E6I/ndKaQoNbzRhsp9et46VTV75RaDntUtW8HAgJrOKAOfka9DnbpFI
   2ecPuDacxmcqkICzGkWIFqXXDt2a0MMrIuedZEjkc7TjzIs8T20cJuG5n
   LsKyxtDhNsjZo1qLpiGZCoxa7szzG6J4gGE78n8S1X/naeKTUBhYDM3XT
   Gn5WVTzoVIzz5fjlnT1Bcbs7qBjPf5FZxt0zY/Ly82vDqywK5xeI0APAg
   A==;
X-CSE-ConnectionGUID: ZW4EKuUaTWC8t1zlEnP/vg==
X-CSE-MsgGUID: zmLqclR1QmO+khBd2808Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7079719"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="7079719"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:04:46 -0700
X-CSE-ConnectionGUID: j631GgZBSPWk9Tr6MaUbvg==
X-CSE-MsgGUID: RS3FGhSFQRC5DVEGrLhdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="18052994"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:04:38 -0700
Message-ID: <25c75790-3866-4e48-bf66-b5406df6e707@linux.intel.com>
Date: Tue, 2 Apr 2024 16:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] ASoC: Intel: Replace dpcm_playback/capture to
 playback/capture_only
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
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PKAIV6CAHYDUHFDBCWT5CA7HQMKX2SWC
X-Message-ID-Hash: PKAIV6CAHYDUHFDBCWT5CA7HQMKX2SWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKAIV6CAHYDUHFDBCWT5CA7HQMKX2SWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/1/2024 2:31 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

...

> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index b94835448b1b..34a9b2e52451 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1151,8 +1151,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
>   	dai_links->num_cpus = cpus_num;
>   	dai_links->codecs = codecs;
>   	dai_links->num_codecs = codecs_num;
> -	dai_links->dpcm_playback = playback;
> -	dai_links->dpcm_capture = capture;
> +	dai_links->playback_only = !playback;
> +	dai_links->capture_only = !capture;

Above seems weird? Should probably be:

	dai_links->playback_only = playback && !capture;
	dai_links->capture_only = capture && !playback;


and while at it, I still wonder if it is best way to go about this 
change, because it causes problems like one above due to need to do 
boolean logic to know which direction is enabled. I would just modify 
struct snd_soc_dai_link to have fields like:
int playback_enabled;
int capture_enabled;
which would be far more understandable. And if we don't want to have two 
variables then perhaps something like:
#define ASOC_ENDPOINT_DISABLED BIT(0)
#define ASOC_ENDPOINT_PLAYBACK BIT(1)
#define ASOC_ENDPOINT_CAPTURE BIT(2)
#define ASOC_ENDPOINT_BIDIRECTIONAL (ENDPOINT_PLAYBACK | ENDPOINT_CAPTURE)

struct snd_soc_dai_link {
	(...)
	
	int endpoint_type:2; // see ASOC_ENDPOINT

	(...)
};


I like the idea of removing the duplication of variables, but if we are 
trying to simplify things, let's try to not complicate them at the same 
time.

Thanks,
Amadeusz
