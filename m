Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994C898382
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 10:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8912C6C;
	Thu,  4 Apr 2024 10:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8912C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712220778;
	bh=aRrOYrta+1RXuR175jubYLyOAM6aPkS6N48rtWm1kxg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BE5X0pFrpBOEL/XeOCHZUFuS58UiRRK2XPBDHr7hZdwsX7LiF+3R3XbVBs9uKPOhp
	 WbTeQZrxy9qSGsWW+je560neoMM6D3f6jSsAQu02H0matLFFHV0glmhKDbyp4GdnoO
	 Hk9c6F5i82BnkEe00xyB8qhiN3L4kV7TUYtSMUDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39368F805A1; Thu,  4 Apr 2024 10:52:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 829ADF805A9;
	Thu,  4 Apr 2024 10:52:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3DECF80568; Thu,  4 Apr 2024 10:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74DFBF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 10:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74DFBF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TYg9Z/82
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3436fec6a70so529273f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220323;
 x=1712825123; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8fo6r6+GpOmbs58KA8H03fqz5IfKM9XbnGIu84c+CU0=;
        b=TYg9Z/82e2jJoYmjcqowBAzNUXQNTWw8XtB1ZlwzWmOPvg87ZIWeO0AVc6kx+KpH7t
         bhgLRl5jW8WKuMOf4/mYbjpwiLKa8uIFU9UTNjutwr8/WLKxzaPOZVe+0VkCSDLf/Kz6
         WYPVoBLTKI8xFg7pvNtIAsoWx3gsQS9xl+oL0voPRN+qgHWNp8kW7ZeBzHnaNPZUU0AW
         2WOWh73ppQ7rk5TmWdsZp3H9GlWrSZhUpc5oeFwgRG95yMM/+LScHvZwQN5+1wkYYbeo
         utR+753TsXJ52lMFjC7DJTL1PVBDOO541GbceY2H+s24LEkuk9RGhpJZtYdmX8Nb8Gck
         ssiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220323; x=1712825123;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fo6r6+GpOmbs58KA8H03fqz5IfKM9XbnGIu84c+CU0=;
        b=NiPpoT/IQBgoy96c9DIlNgSWEYxnTHafrfkCLZDvJSyIREoYx+qeC36D+ajdHllp+o
         aCFHAMnCvyIqhChmNrUsSwaqIbWF+dJrtHBdQBS1TRIYY5p69/ejpb/4pMOQ81Q1Gfab
         +sruCiKf/bBMSKp838To4iQA94XcdGPy8TJD6NNKDD/wSewcRtlC2BfVM+psTB5UKia9
         5EBBYv0SuYai8fK1DAbsDM/0DgJGTRvmJITu//BhLSyzpPTdE9OCl655JdWYocSg2XFX
         Vt5Y+Z+a+h0GqenWxLUd/zoe9wc582z7yy/6AEoWoljbOz7RkAHIgWAdtqZ4fVyz9wMi
         75SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYo66760WplbTvjVjfgvK6J014XOxl3EXsqzs8uHSF7eB6k6/abU2ixJhEXqi3ji78TaL+y21pvlf7nJDzJKcYO+23zhkz3SlJMuM=
X-Gm-Message-State: AOJu0YzHr0dg7czfYf1g7nZRLl49BQsg4C79KD8r2GJGcs4lfDPFz0fc
	bohBj461eeczqL6pIozAirq/KMi1icOw4f39cKlKhI3/+1XZRsDD5iAHKiCVKd0=
X-Google-Smtp-Source: 
 AGHT+IEAcsOPc4S1DUcCXvM+g9yxoPEXC4apjaO2kFEGisIgkysCQizj9ZAWeb5epN2r4xqgWw8tKA==
X-Received: by 2002:adf:fec4:0:b0:343:61bb:115d with SMTP id
 q4-20020adffec4000000b0034361bb115dmr1666179wrs.26.1712220323243;
        Thu, 04 Apr 2024 01:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
        by smtp.gmail.com with ESMTPSA id
 bs26-20020a056000071a00b003439b45ca08sm3621056wrb.17.2024.04.04.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:45:22 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 00/16] ASoC: Replace dpcm_playback/capture to
 playback/capture_only
Date: Thu, 04 Apr 2024 10:27:11 +0200
In-reply-to: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 6TIVANQ5HBNB24MAU54E5MS5SDLW276G
X-Message-ID-Hash: 6TIVANQ5HBNB24MAU54E5MS5SDLW276G
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TIVANQ5HBNB24MAU54E5MS5SDLW276G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 01 Apr 2024 at 00:27, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark
>
> This is v2 patch-set
>
> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM doesn't need such special flags.
>
> OTOH, it cares playback/capture_only flag. It is needed.
>
> This patch remove DPCM special flag, and replace it playback/capture_only
> flag if needed.

Hi Kuninori-san,

Thanks for taking the time to clean the dpcm flags.
While at it, I wonder if it would be worth taking it a step further.

playback_only and capture_only have implication on each other. If one is
set, the other can/must not be set. This leads to conditions which can
be fairly hard to read and possibly bugs.

I had to re-read the meson patch a few times to make sure it still had the
same meaning, TBH

Wouldn't it be better to replace those 2 flags with a single bitfield ?

something like:

unsigned int directions;
#define PLAYBACK_VALID	BIT(0)
#define CAPTURE_VALID BIT(1)

... or something similar.

I think conditions on the enabled stream would become much clearer like
this. The only invalid configuation would be '!directions', which again
is easier to read, instead of checking if both flags are set.

It would be easy to keep playback_only/capture_only tests, where
necessary, with an helper function.

What do you think ?

Sorry if it is a bit late to discuss this.

>
> v1 -> v2
> 	- based on latest ASoC branch
> 	- keep comment on Intel
> 	- tidyup patch title
> 	- tidyup DPCM BE warning output condition
> 	- Add new patch for Document
>
> Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com
>
> Kuninori Morimoto (16):
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
>   ASoC: amd: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: fsl: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: sof: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: meson: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: Intel: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: samsung: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: mediatek: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-core: Replace dpcm_playback/capture to playback/capture_only
>   ASoC: soc-topology: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: soc-compress: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: Intel: avs: boards: Replace dpcm_playback/capture to
>     playback/capture_only
>   ASoC: remove snd_soc_dai_link_set_capabilities()
>   ASoC: soc-pcm: remove dpcm_playback/capture
>   ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings
>   ASoC: doc: remove .dpcm_playback/capture flags
>
>  Documentation/sound/soc/dpcm.rst              | 14 ++-
>  include/sound/soc-dai.h                       |  1 -
>  include/sound/soc.h                           |  4 -
>  sound/soc/amd/acp-da7219-max98357a.c          | 20 ++---
>  sound/soc/amd/acp-es8336.c                    |  2 -
>  sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
>  sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
>  sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
>  sound/soc/fsl/fsl-asoc-card.c                 | 16 ++--
>  sound/soc/fsl/imx-audmix.c                    |  6 +-
>  sound/soc/fsl/imx-card.c                      |  7 +-
>  sound/soc/generic/audio-graph-card.c          |  2 -
>  sound/soc/generic/audio-graph-card2.c         |  2 -
>  sound/soc/generic/simple-card.c               |  2 -
>  sound/soc/intel/avs/boards/da7219.c           |  2 -
>  sound/soc/intel/avs/boards/dmic.c             |  4 +-
>  sound/soc/intel/avs/boards/es8336.c           |  2 -
>  sound/soc/intel/avs/boards/hdaudio.c          |  4 -
>  sound/soc/intel/avs/boards/i2s_test.c         |  2 -
>  sound/soc/intel/avs/boards/max98357a.c        |  2 +-
>  sound/soc/intel/avs/boards/max98373.c         |  2 -
>  sound/soc/intel/avs/boards/max98927.c         |  2 -
>  sound/soc/intel/avs/boards/nau8825.c          |  2 -
>  sound/soc/intel/avs/boards/rt274.c            |  2 -
>  sound/soc/intel/avs/boards/rt286.c            |  2 -
>  sound/soc/intel/avs/boards/rt298.c            |  2 -
>  sound/soc/intel/avs/boards/rt5514.c           |  2 +-
>  sound/soc/intel/avs/boards/rt5663.c           |  2 -
>  sound/soc/intel/avs/boards/rt5682.c           |  2 -
>  sound/soc/intel/avs/boards/ssm4567.c          |  2 -
>  sound/soc/intel/boards/bdw-rt5650.c           |  4 -
>  sound/soc/intel/boards/bdw-rt5677.c           |  4 -
>  sound/soc/intel/boards/bdw_rt286.c            | 10 +--
>  sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++---
>  sound/soc/intel/boards/bxt_rt298.c            | 26 +++---
>  sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
>  sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
>  sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
>  sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
>  sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
>  sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
>  sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
>  sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
>  sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
>  sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
>  sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
>  sound/soc/intel/boards/cml_rt1011_rt5682.c    | 15 ++--
>  sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
>  sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++----
>  sound/soc/intel/boards/hsw_rt5640.c           | 10 +--
>  sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++---
>  sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++-------
>  sound/soc/intel/boards/kbl_rt5660.c           | 18 ++--
>  sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++-----
>  .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++---
>  sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++-
>  .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++---
>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 +++---
>  sound/soc/intel/boards/skl_rt286.c            | 26 +++---
>  sound/soc/intel/boards/sof_board_helpers.c    | 13 +--
>  sound/soc/intel/boards/sof_es8336.c           |  8 +-
>  sound/soc/intel/boards/sof_pcm512x.c          |  8 +-
>  sound/soc/intel/boards/sof_sdw.c              |  4 +-
>  sound/soc/intel/boards/sof_wm8804.c           |  2 -
>  sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
>  sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
>  sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
>  sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
>  sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
>  .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
>  sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
>  .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
>  .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
>  .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++-----------
>  .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++-----------
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++-------
>  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
>  sound/soc/meson/axg-card.c                    |  9 +-
>  sound/soc/meson/gx-card.c                     |  1 -
>  sound/soc/meson/meson-card-utils.c            |  4 +-
>  sound/soc/qcom/common.c                       |  1 -
>  sound/soc/samsung/odroid.c                    | 11 ++-
>  sound/soc/soc-compress.c                      | 10 ++-
>  sound/soc/soc-core.c                          | 20 +----
>  sound/soc/soc-dai.c                           | 38 --------
>  sound/soc/soc-pcm.c                           | 87 ++++++++-----------
>  sound/soc/soc-topology-test.c                 |  2 -
>  sound/soc/soc-topology.c                      |  4 +-
>  sound/soc/sof/nocodec.c                       |  4 -
>  91 files changed, 502 insertions(+), 863 deletions(-)


-- 
Jerome
