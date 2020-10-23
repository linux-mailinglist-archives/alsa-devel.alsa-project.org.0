Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C8297165
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 16:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFA9172D;
	Fri, 23 Oct 2020 16:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFA9172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603463785;
	bh=7JndE12dqndPYsuGgE6G/sbFBsuPkzGUlz+PLYDLJMc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ksb3J7vJ6+VmfxhdoNwTGgR4LiDPXf7hpbZoVAVWOOemCXTTWqTidUa+w8N+q5raU
	 kiFa50uAubYUouBKAsi6VPtOsgm3sil97RYj8nUsnUq3E96zHyP17pwk/EMr3YHpfV
	 5KlRRbPv8Y37iYUFFp2rH6zwG04ev3NA0ycFwS4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6EE5F800BD;
	Fri, 23 Oct 2020 16:34:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6A5DF8025A; Fri, 23 Oct 2020 16:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CD2BF80247;
 Fri, 23 Oct 2020 16:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD2BF80247
IronPort-SDR: 4SDkMJw+YLnW7YtkcWn2PAOSyw8H7fK5RKvKuL+NGlDuRsdxiaAfEGFoe1m6kt8gFHtY8LqGrf
 O2tgNSLCkk+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="166898713"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="166898713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 07:34:33 -0700
IronPort-SDR: 7NRNd9XWr8JQaYlc8uXJVIPHN/hjDky97EM1W37q9ubM4h0tX+Vrv8Hu743rgxIVTgE+d/K3xk
 WZZJ2TOt26Xg==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="317108006"
Received: from srussjr-mobl.amr.corp.intel.com (HELO [10.212.52.219])
 ([10.212.52.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 07:34:31 -0700
Subject: Re: [PATCH] ASoC: Intel: Enable coredump in kconfig
To: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20201023105727.21008-1-gustaw.lewandowski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5b10b9da-2a8f-bd13-795d-f7efb47a06fa@linux.intel.com>
Date: Fri, 23 Oct 2020 09:33:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023105727.21008-1-gustaw.lewandowski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 broonie@kernel.org
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



On 10/23/20 5:57 AM, Gustaw Lewandowski wrote:
> From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> 
> WANT_DEV_COREDUMP flag is needed here if this driver is only one
> using dev_coredump feature.
> 
> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
> ---
>   sound/soc/intel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index a5b446d5af19..c215156e2e18 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -4,6 +4,7 @@ config SND_SOC_INTEL_SST_TOPLEVEL
>   	default y
>   	depends on X86 || COMPILE_TEST
>   	select SND_SOC_INTEL_MACH
> +	select WANT_DEV_COREDUMP
>   	help
>   	  Intel ASoC SST Platform Drivers. If you have a Intel machine that
>   	  has an audio controller with a DSP and I2S or DMIC port, then


to the best of my knowledge the only user of device coredump is:

intel/catpt/dsp.c:      dev_coredumpv(cdev->dev, dump, dump_size, 
GFP_KERNEL);

so shouldn't this change be added to catpt only?

