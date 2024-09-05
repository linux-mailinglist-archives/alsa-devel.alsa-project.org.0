Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FF96DC60
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6360FB60;
	Thu,  5 Sep 2024 16:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6360FB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725547860;
	bh=v+YLUxqSFxm+ib/oj+ESGH40/CNmBAMNdcwsjIGjz6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b9JjkHmDjbacZVExlu0Bkr+ubdAeBhKDBZ0e2rfImnb08OmdUQFoQ7OjFWj+p9AfM
	 YoMHdI6HHCpMxw49bJAnXs4krqN7nMQHLsr9MmWU590xlNqUYMPEZMDMCycrtqHoMq
	 Zet/jzLEhc5WIX0KjyoIbeXmNdoZCHsxMQunKC6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C62F805BE; Thu,  5 Sep 2024 16:50:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05ABAF805B2;
	Thu,  5 Sep 2024 16:50:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C31F8016C; Thu,  5 Sep 2024 16:50:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA099F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:50:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 463063DD1;
	Thu,  5 Sep 2024 16:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 463063DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1725547822; bh=Ye4UIgaGYG9sddgPGETiBoCD7uB2XyXKCKHqUtRsfCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDTI48gyNg/5KFcapBmSQlcApsyukN+aDB37PVExNCUnWRKcSTrNzxfMVOlmzbltI
	 useZBXrXSWe1Cp767YmD4alOKMZMynx0IAF9RVAYDtWYxDz16Zrqkqd9gdA2ptpVnA
	 2ufYMxl+Lixzk+pFcTX21PSLJb1mR/NyHyfgKUZA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  5 Sep 2024 16:49:58 +0200 (CEST)
Message-ID: <2858578e-cdf9-4a85-a751-0fd64c2d5d39@perex.cz>
Date: Thu, 5 Sep 2024 16:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
To: Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5TV5QMEO6WWGA5ZAX7YX7NE6VIZK4DTO
X-Message-ID-Hash: 5TV5QMEO6WWGA5ZAX7YX7NE6VIZK4DTO
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TV5QMEO6WWGA5ZAX7YX7NE6VIZK4DTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 09. 24 16:12, Jerome Brunet wrote:
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
> 
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.
> 
> Identifying these drivers is not straight forward, I tried my best but I
> may have missed some. Those will continue to work anyway so it is not
> critical. Some drivers using these rates have not been changed on
> purpose. The reason for this may be:
> * The driver used other uncommon rates that still don't have a definition
>    so a custom rule is still required.
> * The constraint structure is used in some other way by the driver and
>    removing it would not help the readability or maintainability. This is
>    the case the freescale asrc drivers for example.
> 
> There is one change per driver so, if there is a problem later on, it will
> easier to properly add Fixes tag.
> 
> The series has been tested with
> * ARM64 defconfig - spdif 128kHz at runtime.
> * x86_64 allmodconfig - compile test only
> 
> Last, the change adding IEC958 definitions has been dropped for this
> patchset and will be resent separately
> 
> [0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/
> 
> ---
> Jerome Brunet (13):
>        ALSA: pcm: add more sample rate definitions
>        ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
>        ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
>        ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
>        ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
>        ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
>        ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
>        ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
>        ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
>        ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
>        ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
>        ASoC: cs35l34: drop useless rate contraint
>        ASoC: spdif: extend supported rates to 768kHz
> 
>   include/sound/pcm.h                  | 31 +++++++++++++++++--------------
>   sound/core/pcm_native.c              |  6 +++---
>   sound/pci/cmipci.c                   | 32 +++++++++-----------------------
>   sound/pci/emu10k1/emupcm.c           | 31 +++++--------------------------
>   sound/pci/rme9652/hdsp.c             | 18 ++++++------------
>   sound/pci/rme9652/hdspm.c            | 16 +---------------
>   sound/soc/codecs/cs35l34.c           | 21 ---------------------
>   sound/soc/codecs/cs35l36.c           | 34 ++++++++++++----------------------
>   sound/soc/codecs/cs35l41.c           | 34 +++++++++++-----------------------
>   sound/soc/codecs/cs53l30.c           | 24 +++---------------------
>   sound/soc/codecs/spdif_receiver.c    |  3 ++-
>   sound/soc/codecs/spdif_transmitter.c |  3 ++-
>   sound/soc/intel/avs/pcm.c            | 22 ++++++----------------
>   sound/soc/qcom/qdsp6/q6asm-dai.c     | 31 ++++++++++---------------------
>   sound/soc/sunxi/sun4i-codec.c        | 28 +++++++++-------------------
>   15 files changed, 96 insertions(+), 238 deletions(-)
> ---
> base-commit: 785f4052380684dbcc156203c537c799e2f4be09
> change-id: 20240905-alsa-12-24-128-8edab4c08dd4
> 
> Best regards,

Thanks,

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

