Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42236083B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 13:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAC4165D;
	Thu, 15 Apr 2021 13:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAC4165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618486039;
	bh=RWlqDPuaG6c/WP5/9CHpR7u9elvDcAp6jlhPmP1tldg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QI4w8oR2z+gdcc3gxA5qMgm2zcPl3WV6RnGTsOBMcB7F0VpWFw4MyHhZxcF9hmzSl
	 FjUf3ZUQvg+o58ech+1xyYMhIO8em8Yrv7bOemyKUDMW3t+riM3ms4PfLDmVz9ppDk
	 Gb9oBcW2NkU1LfqaFu0CsSvcSQjVXvcLUsxk/3Cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56461F8021D;
	Thu, 15 Apr 2021 13:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21276F8022B; Thu, 15 Apr 2021 13:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10639F800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 13:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10639F800ED
IronPort-SDR: JdPadvtPcJAj66uJb0MrjdLzkPKiAh/LwIrT1jnS0kjyZDCha8MyYAaj9lLQvrhy9mnb/aKB33
 OUutbtOllyNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="280148397"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="280148397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 04:25:33 -0700
IronPort-SDR: FWQ/HWGxDmtC0mZm5cmiaJUDLC92J2wKT0EBMoHz557zVUdpY81ZB8Sa+VcZVhoqnoJ/izIeUx
 JwcYa1wzATxw==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="452875487"
Received: from allanagx-mobl.amr.corp.intel.com (HELO [10.213.172.37])
 ([10.213.172.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 04:25:32 -0700
Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch controls
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20210415091609.13695-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
Date: Thu, 15 Apr 2021 06:25:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415091609.13695-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, libin.yang@intel.com, derek.fang@realtek.com,
 flove@realtek.com
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



On 4/15/21 4:16 AM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The settings of the switch control already set by DAPM event.
> These switch controls might the user confused why it can't disable the capture.

Sorry, not following. This control is used in the alsa-ucm-conf that was 
just merged

https://github.com/alsa-project/alsa-ucm-conf/commit/197025656ec456331d1a34357b113913ec3b187f#diff-0e1c627ea89ee148fdb41aa6b3ba7851ba9c20eb43c1b87b9e0ce92164273dc3R7

Is this saying this commit needs to be fixed with a follow-up PR? Libin, 
are you working on this?


> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>   sound/soc/codecs/rt711-sdca.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
> index bfb7f1c8ec8f..2a09c305f4e4 100644
> --- a/sound/soc/codecs/rt711-sdca.c
> +++ b/sound/soc/codecs/rt711-sdca.c
> @@ -652,14 +652,6 @@ static const struct snd_kcontrol_new rt711_sdca_snd_controls[] = {
>   		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU05, RT711_SDCA_CTL_FU_VOLUME, CH_R),
>   		0x57, 0x57, 0,
>   		rt711_sdca_set_gain_get, rt711_sdca_set_gain_put, out_vol_tlv),
> -	SOC_DOUBLE_R("FU1E Capture Switch",
> -		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_MUTE, CH_L),
> -		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_MUTE, CH_R),
> -		0, 1, 1),
> -	SOC_DOUBLE_R("FU0F Capture Switch",
> -		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_MUTE, CH_L),
> -		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_MUTE, CH_R),
> -		0, 1, 1),
>   	SOC_DOUBLE_R_EXT_TLV("FU1E Capture Volume",
>   		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_L),
>   		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_R),
> 
