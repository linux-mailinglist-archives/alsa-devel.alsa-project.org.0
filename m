Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA562C0AA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:15:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A76A169C;
	Wed, 16 Nov 2022 15:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A76A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668608155;
	bh=SBj6c6B7hYQscC9yfHly/uyDWdURyzJMJc/p+yqiLMg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqo/rkC+ejdWf/gqNjJbd6lFQpgs3a/yXJwij/pesnXzSZWlTGw9oFNXzTmTTWFEb
	 hhZpNP8/99idAqcHxcZh6OtvPpbJ2A8jFVDm/r8QvpOWp7xLkW9JE3/HJT3vkAGSkK
	 bYiBHcS054x+QEjnTOnCBmfWZ/Z9njkJ1Kqo048M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A51F80238;
	Wed, 16 Nov 2022 15:15:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633E4F80169; Wed, 16 Nov 2022 15:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B6CF80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B6CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MABGvxUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668608094; x=1700144094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SBj6c6B7hYQscC9yfHly/uyDWdURyzJMJc/p+yqiLMg=;
 b=MABGvxUz5WBaM4nuufYRZ3/qJzxuiIoHcb99O4ugZuuLPOF6w14EUNLM
 mo51JLycstVJ1BZcgmVa9qm6rd+l4ZPEpb0N5bSn/6QHMGsRBPn3D/76z
 LpQJVRCBr3V6Qn+0oif3BP9x0r24/NcR7b7BTJRufXlIZYb6XyUZmcV2F
 3Md9pyr1oV91rHTQA7qdpsBPp6VVeWuoECcEhItDH+lJjD90RCiwFhAgd
 FIujj7XFSNpvSY2Ayo5S4C/tFqo5mHBNCLS4vYF8BumC31scU/aQpQk73
 wW6vNQ8th79snMeOduFe90jC16TSIst4XsxBcMF+u9Ox3nakRZF4XoVG6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312558458"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="312558458"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:14:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="639371770"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="639371770"
Received: from msureshb-mobl3.amr.corp.intel.com (HELO [10.212.45.114])
 ([10.212.45.114])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:14:49 -0800
Message-ID: <52a87839-d94d-7ace-50b7-04fec82427be@linux.intel.com>
Date: Wed, 16 Nov 2022 08:14:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: rt711-sdca: fix the latency time of clock stop
 prepare state machine transitions
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20221116090318.5017-1-shumingf@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221116090318.5017-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Vijendar.Mukunda@amd.com,
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



On 11/16/22 03:03, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Due to the hardware behavior, it takes some time for CBJ detection/impedance sensing/de-bounce.
> The ClockStop_NotFinished flag will be raised until these functions are completed.

That's fine.

> In ClockStopMode0 mode case, the SdW controller might check this flag from D3 to D0 when the
> jack detection interrupt happened.

That's more confusing. The clock stop sequence is only used in
transitions from D0 to D3. The timeout is only meant to signal how long
the controller driver needs to check the device is ready before stopping
the clock. The resume operation does not require any interaction between
controller and device drivers.

Is this an inversion in the wording, or a requirement for the controller
driver to do something during the resume sequence from D3 to D0?


> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/codecs/rt711-sdca-sdw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
> index 4120842fe699..88a8392a58ed 100644
> --- a/sound/soc/codecs/rt711-sdca-sdw.c
> +++ b/sound/soc/codecs/rt711-sdca-sdw.c
> @@ -230,7 +230,7 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
>  	}
>  
>  	/* set the timeout values */
> -	prop->clk_stop_timeout = 20;
> +	prop->clk_stop_timeout = 700;
>  
>  	/* wake-up event */
>  	prop->wake_capable = 1;
