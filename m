Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F7566885
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 12:50:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8904C16E0;
	Tue,  5 Jul 2022 12:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8904C16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657018215;
	bh=QnsS4su8H/mLvQ9+z8N/c0onNmc9ZJSNjEmEX8UUb4g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQZ+thirWs1nstbRx0HgEcBwrT6Jddvozq1rvHE6kyFEudEs0yMTCWSbhqFRWLwgY
	 8WTidqqjA7wYTFCLhUIBgaMweJgq710R5sPZ4A0EpKCkXFwK2RLLAmYR7rYdHx5Iz1
	 2is3H+4jXWhjZEx/94WnwcfV1XThyb5Pip1uSqQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 049F2F80212;
	Tue,  5 Jul 2022 12:49:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44345F80104; Tue,  5 Jul 2022 12:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3C5DF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C5DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A4Jd4YZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657018147; x=1688554147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QnsS4su8H/mLvQ9+z8N/c0onNmc9ZJSNjEmEX8UUb4g=;
 b=A4Jd4YZb5yNYlwvU6z+X/uoAQRaNBZ54GdhEQSzDWtna2OCCUAUM8QvM
 G8gI31xNUlgn2uricjEEx+yXo2HMYWGs7i/9GD4v9sA/NJVP5MmCgfQpe
 /DcpueBqhuYgDxg2p2/4/iOYiUWVBdwjG6shvJMeMqs5RQBuOL0VYf3GS
 N3DdB7R9aNpPrMaIxgJqO8ydf8gEXFwUFG6V7UXNQpQ/IU2RmAx46uP4I
 iilsbhBXvmXIuS91ySd5ncSkQbskIL38R5OCih2DEAKBCCuZe8Kp3ZE6O
 f6fu8ZNEwscugQkIjshfaIlp9srIzVifa52k0SmN4rjc/Qj469JTa8rh9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="345000726"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="345000726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 03:49:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="919669342"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.103])
 ([10.99.241.103])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 03:48:58 -0700
Message-ID: <6727e426-7135-3ecc-955f-e60487bfd963@linux.intel.com>
Date: Tue, 5 Jul 2022 12:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: Intel: avs: correct config reference for I2S test
 board
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20220705103238.7484-1-lukas.bulwahn@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220705103238.7484-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/5/2022 12:32 PM, Lukas Bulwahn wrote:
> Commit e39acc4cfd92 ("ASoC: Intel: avs: Add I2S-test machine board") adds
> the config "SND_SOC_INTEL_AVS_MACH_I2S_TEST", but in the Makefile refers
> to  config "SND_SOC_INTEL_AVS_MACH_i2s_TEST" (notice the uppercase and
> lowercase difference).
> 
> Adjust the Makefile to refer to the actual existing config.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Amadeusz, Cezary, please ack.
> 
> Mark, please pick this minor build config fix.
> 
>   sound/soc/intel/avs/boards/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
> index 25e8c4bb07db..bc75376d58c2 100644
> --- a/sound/soc/intel/avs/boards/Makefile
> +++ b/sound/soc/intel/avs/boards/Makefile
> @@ -16,7 +16,7 @@ snd-soc-avs-ssm4567-objs := ssm4567.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
> -obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_i2s_TEST) += snd-soc-avs-i2s-test.o
> +obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_I2S_TEST) += snd-soc-avs-i2s-test.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
