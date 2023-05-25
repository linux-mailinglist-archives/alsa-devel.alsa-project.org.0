Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46913711ADA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 01:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C09C71FE;
	Fri, 26 May 2023 01:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C09C71FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685058513;
	bh=Je3VQIkcVqaoqJDB+28vejUrevQo9uw4zJFtGE8mEJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tuaRLthOhM2xpeV5H7UV4NIvrXdwQXdS3dk5mHbuunUBFwljRIXKGepIG4VHd/8ON
	 C/apZolyCxan97VycTTjnumU082Qan81CL447Y8z/HNGJXsscrTNxSE8oNz/9Nad4B
	 DSh/yVRQTdkFIr/6txnM0CfUB8GBEVJ2GbOeKxGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D2EAF80425; Fri, 26 May 2023 01:47:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8F8FF8016A;
	Fri, 26 May 2023 01:47:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C147FF80249; Fri, 26 May 2023 01:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52221F80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 01:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52221F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EaqaJFpt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685058443; x=1716594443;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Je3VQIkcVqaoqJDB+28vejUrevQo9uw4zJFtGE8mEJU=;
  b=EaqaJFptf6p3j0Z9SQKnn9+zCjHD3dNA15PK/wvY+saf5UMv5HBmnYsp
   ZEflqcXxIjz/f7pVbt5RJOrNNdZBDSn3EmNgr6ZbP9UUwc/2FSkMAKhtW
   vwQZeHZPXYCTqyilbMPDAx+105xmke9z24iZY3emFAA4htgJS7jueSi7F
   tbQ5ahQIJV4LlG8GVGVcLYiT3mSqdjmEKlfzxsGkdctaRk1cCiJtCnOdt
   pjOzl3IHk1iWGppsRUGsRCeuWr0XkmKBxL2VD2J3hBC5afTcbR3TYViao
   HpaxRFz9ZZIgZixK/gRoCRBuv6MkpTw3YCCPIfBVWDDve81DGShdBYc/k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334407960"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400";
   d="scan'208";a="334407960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770133566"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400";
   d="scan'208";a="770133566"
Received: from cweiler-mobl.amr.corp.intel.com (HELO [10.209.50.210])
 ([10.209.50.210])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:47:13 -0700
Message-ID: <ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
Date: Thu, 25 May 2023 18:47:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?B?QW1hZGV1c3ogU8OF77+9YXdpw4Xvv71za2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?B?TsODIGNvbGFzIEYuIFIuIEEuIFByYWRv?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=83=c2=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "chunxu.li" <chunxu.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Wang Yufen <wangyufen@huawei.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AFMS24UVQQRFQDKXMSPH2DYTZ6BYIQ3K
X-Message-ID-Hash: AFMS24UVQQRFQDKXMSPH2DYTZ6BYIQ3K
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFMS24UVQQRFQDKXMSPH2DYTZ6BYIQ3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> This is v2 patch-set of dpcm_playback/capture flag cleanup.
> 
> Current ASoC DPCM need dpcm_playback/capture flags to use it.
> But we are using playback/capture_only flag on Normal/Codec2Codec case.
> I think these are duplicated, we can share same flags for all cases.
> 
> On v1 patch-set, we noticed that some DPCM BE Codec valid check
> breaks compatibility.
> 
> 	static int soc_get_playback_capture(...)
> 	{
> 		...
> (A)		if (dai_link->dynamic || dai_link->no_pcm) {
> 			...
> 			if (dai_link->dpcm_playback) {
> 				...
> (B)				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> (C)					if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> 						has_playback = 1;
> 						break;
> 				}
> 			}
> 		...
> 	}
> 
> (A) is for DPCM case, and "dai_link->no_pcm" means BE,
> (B)/(C) means CPU validation check.
> In many case, DPCM is like this.
> 
> 	FE (dynamic)		BE (no_pcm)
> 	[CPU/dummy-Codec] - [dummy-CPU/Codec]
> 
> DPCM FE (dynamic) Codec no check is no problem, because it is dummy DAI.
> DPCM BE (no_pcm)  Codec no check is not good,
> but checking it might breaks compatibility, because some Codec doesn't have
> necessary settings (= channels_min). Solving this issue seems not easy,
> because it is using very complex setting timing.
> 
> v2 ignores DPCM BE Codec check, same as before, but added comment for it.
> I hope we can valid check for all cases in some day.

Our CI tests show a rather large regression on a CometLake ChromeBook,
see
https://sof-ci.01.org/linuxpr/PR4379/build5131/devicetest/index.html?model=CML_HEL_RT5682&testcase=verify-kernel-boot-log

[   12.883662] kernel:  SSP1-Codec: SSP1-Codec: 1 cpus to 4 codecs link
is not supported yet
[   12.883674] kernel: cml_rt1011_rt5682 cml_rt1011_rt5682: ASoC: can't
create pcm SSP1-Codec :-22

This is problematic, 1:4 connections have been handled for a very long
time, this is basic TDM.

git blame tells me this was added by
"
ASoC: soc-pcm.c: cleanup normal connection loop at
soc_get_playback_capture() part1
"

below...
> 
> v1 -> v2
> 	- Add Reviewed-by
> 	- Separate Intel patch
> 	- tidyup playback/capture_only flags conversion
> 
> Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com
> 
> Kuninori Morimoto (21):
>   ASoC: soc-pcm.c: indicate error if stream has no playback no capture
>   ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
>   ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
>   ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
>   ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part1

...here...

>   ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part2
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
>   ASoC: amd: replace dpcm_playback/capture to playback/capture_only
>   ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
>   ASoC: sof: replace dpcm_playback/capture to playback/capture_only
>   ASoC: meson: replace dpcm_playback/capture to playback/capture_only
>   ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
>   ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
>   ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-dai.c: replace dpcm_playback/capture to playback/capture_only
>   ASoC: Intel/avs: replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-pcm.c: remove dpcm_playback/capture
> 
>  include/sound/soc.h                           |   4 -
>  sound/soc/amd/acp-da7219-max98357a.c          |  20 +--
>  sound/soc/amd/acp-es8336.c                    |   2 -
>  sound/soc/amd/acp/acp-mach-common.c           |  20 +--
>  sound/soc/amd/acp3x-rt5682-max9836.c          |   6 +-
>  sound/soc/amd/vangogh/acp5x-mach.c            |   3 -
>  sound/soc/fsl/fsl-asoc-card.c                 |  16 +--
>  sound/soc/fsl/imx-audmix.c                    |   6 +-
>  sound/soc/fsl/imx-card.c                      |   4 +-
>  sound/soc/intel/avs/boards/da7219.c           |   2 -
>  sound/soc/intel/avs/boards/dmic.c             |   4 +-
>  sound/soc/intel/avs/boards/hdaudio.c          |   4 -
>  sound/soc/intel/avs/boards/i2s_test.c         |   2 -
>  sound/soc/intel/avs/boards/max98357a.c        |   2 +-
>  sound/soc/intel/avs/boards/max98373.c         |   2 -
>  sound/soc/intel/avs/boards/max98927.c         |   2 -
>  sound/soc/intel/avs/boards/nau8825.c          |   2 -
>  sound/soc/intel/avs/boards/rt274.c            |   2 -
>  sound/soc/intel/avs/boards/rt286.c            |   2 -
>  sound/soc/intel/avs/boards/rt298.c            |   2 -
>  sound/soc/intel/avs/boards/rt5682.c           |   2 -
>  sound/soc/intel/avs/boards/ssm4567.c          |   2 -
>  sound/soc/intel/boards/bdw-rt5650.c           |   4 -
>  sound/soc/intel/boards/bdw-rt5677.c           |   4 -
>  sound/soc/intel/boards/bdw_rt286.c            |  10 +-
>  sound/soc/intel/boards/bxt_da7219_max98357a.c |  32 +++--
>  sound/soc/intel/boards/bxt_rt298.c            |  26 ++--
>  sound/soc/intel/boards/bytcht_cx2072x.c       |   6 +-
>  sound/soc/intel/boards/bytcht_da7213.c        |   6 +-
>  sound/soc/intel/boards/bytcht_es8316.c        |   6 +-
>  sound/soc/intel/boards/bytcht_nocodec.c       |   6 +-
>  sound/soc/intel/boards/bytcr_rt5640.c         |   6 +-
>  sound/soc/intel/boards/bytcr_rt5651.c         |   6 +-
>  sound/soc/intel/boards/bytcr_wm5102.c         |   6 +-
>  sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   6 +-
>  sound/soc/intel/boards/cht_bsw_nau8824.c      |   6 +-
>  sound/soc/intel/boards/cht_bsw_rt5645.c       |   6 +-
>  sound/soc/intel/boards/cht_bsw_rt5672.c       |   6 +-
>  sound/soc/intel/boards/cml_rt1011_rt5682.c    |  14 +--
>  sound/soc/intel/boards/ehl_rt5660.c           |  14 +--
>  sound/soc/intel/boards/glk_rt5682_max98357a.c |  30 +++--
>  sound/soc/intel/boards/hsw_rt5640.c           |  10 +-
>  sound/soc/intel/boards/kbl_da7219_max98357a.c |  26 ++--
>  sound/soc/intel/boards/kbl_da7219_max98927.c  |  54 ++++-----
>  sound/soc/intel/boards/kbl_rt5660.c           |  18 ++-
>  sound/soc/intel/boards/kbl_rt5663_max98927.c  |  44 +++----
>  .../intel/boards/kbl_rt5663_rt5514_max98927.c |  22 ++--
>  sound/soc/intel/boards/skl_hda_dsp_common.c   |  14 +--
>  .../soc/intel/boards/skl_nau88l25_max98357a.c |  26 ++--
>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  26 ++--
>  sound/soc/intel/boards/skl_rt286.c            |  26 ++--
>  sound/soc/intel/boards/sof_cs42l42.c          |  12 +-
>  sound/soc/intel/boards/sof_da7219_max98373.c  |  16 +--
>  sound/soc/intel/boards/sof_es8336.c           |   8 +-
>  sound/soc/intel/boards/sof_nau8825.c          |  12 +-
>  sound/soc/intel/boards/sof_pcm512x.c          |   8 +-
>  sound/soc/intel/boards/sof_rt5682.c           |  12 +-
>  sound/soc/intel/boards/sof_sdw.c              |   4 +-
>  sound/soc/intel/boards/sof_ssp_amp.c          |  11 +-
>  sound/soc/intel/boards/sof_wm8804.c           |   2 -
>  sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  20 +--
>  sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   6 +-
>  sound/soc/mediatek/mt6797/mt6797-mt6351.c     |  24 ++--
>  sound/soc/mediatek/mt8173/mt8173-max98090.c   |   6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  10 +-
>  sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  10 +-
>  .../mediatek/mt8183/mt8183-da7219-max98357.c  |  34 +++---
>  .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  34 +++---
>  .../mt8186/mt8186-mt6366-da7219-max98357.c    |  86 +++++--------
>  .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  86 +++++--------
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  48 ++++----
>  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  78 ++++++------
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  60 +++++----
>  sound/soc/meson/axg-card.c                    |   8 +-
>  sound/soc/meson/meson-card-utils.c            |   4 +-
>  sound/soc/samsung/odroid.c                    |  10 +-
>  sound/soc/soc-compress.c                      |  11 +-
>  sound/soc/soc-core.c                          |  20 +--
>  sound/soc/soc-dai.c                           |   6 +-
>  sound/soc/soc-pcm.c                           | 114 +++++++-----------
>  sound/soc/soc-topology-test.c                 |   2 -
>  sound/soc/soc-topology.c                      |   4 +-
>  sound/soc/sof/nocodec.c                       |   4 -
>  84 files changed, 511 insertions(+), 842 deletions(-)
> 
