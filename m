Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748F2F20CD
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:30:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28A91744;
	Mon, 11 Jan 2021 21:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28A91744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397034;
	bh=/UPbUNU8WPdgjrPsMWuYGzfIMgl/Zq6kyj/wFYULlTY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fp8EtVHm81Uo5UWKMFyfqTWQQWNFPyymy+T2AyobfYCglf/VC1ai9C8ag3bqz42KN
	 chuR8unm4co3mxCpS54xG4WXE9JHc7aR7rvkqFV9/DlOoTekuCf3oUv+x461XWmBF4
	 d99QiosU3kmdwDX8cowR/9ACbOJz4NwfA5unI3Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8600FF8016C;
	Mon, 11 Jan 2021 21:29:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F270F80290; Mon, 11 Jan 2021 21:28:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44106F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44106F80113
IronPort-SDR: G5X+o3/Cm1v2rDaHjrnjuBA2fXx9BCJax0qdsdhQ1p7v0jh07TT3NXp3vQH3f7NuhItL0yiZD7
 nnbj2rejFazA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262712508"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="262712508"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:37 -0800
IronPort-SDR: 7Lmv4jpP+QuEafbuouAL4jOSz3kIZVScDA8uz+WZCQOjEsYkHs4kPTvy+63kmXbu6sGVUjS2+o
 Nw+oosBYKUFg==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995375"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:33 -0800
Subject: Re: [PATCH 12/14] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
To: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-13-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <92934cb4-0b68-bdcc-d63b-d20628bc3c94@linux.intel.com>
Date: Mon, 11 Jan 2021 11:52:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201227211232.117801-13-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 12/27/20 3:12 PM, Hans de Goede wrote:
> Some Bay Trail systems:
> 1. Use a non CR version of the Bay Trail SoC
> 2. Contain at least 6 interrupt resources so that the
>     platform_get_resource(pdev, IORESOURCE_IRQ, 5) check to workaround
>     non CR systems which list their IPC IRQ at index 0 despite being
>     non CR does not work
> 3. Despite 1. and 2. still have their IPC IRQ at index 0 rather then 5
> 
> Add a DMI quirk table to check for the few known models with this issue,
> so that the right IPC IRQ index is used on these systems.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>   sound/soc/intel/common/soc-intel-quirks.h | 25 +++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
> index b07df3059926..a93987ab7f4d 100644
> --- a/sound/soc/intel/common/soc-intel-quirks.h
> +++ b/sound/soc/intel/common/soc-intel-quirks.h
> @@ -11,6 +11,7 @@
>   
>   #if IS_ENABLED(CONFIG_X86)
>   
> +#include <linux/dmi.h>
>   #include <asm/cpu_device_id.h>
>   #include <asm/intel-family.h>
>   #include <asm/iosf_mbi.h>
> @@ -38,12 +39,36 @@ SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
>   
>   static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
>   {
> +	/*
> +	 * List of systems which:
> +	 * 1. Use a non CR version of the Bay Trail SoC
> +	 * 2. Contain at least 6 interrupt resources so that the
> +	 *    platform_get_resource(pdev, IORESOURCE_IRQ, 5) check below
> +	 *    succeeds
> +	 * 3. Despite 1. and 2. still have their IPC IRQ at index 0 rather then 5
> +	 *
> +	 * This needs to be here so that it can be shared between the SST and
> +	 * SOF drivers. We rely on the compiler to optimize this out in files
> +	 * where soc_intel_is_byt_cr is not used.
> +	 */
> +	static const struct dmi_system_id force_bytcr_table[] = {
> +		{	/* Lenovo Yoga Tablet 2 series */
> +			.matches = {
> +				DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +				DMI_MATCH(DMI_PRODUCT_FAMILY, "YOGATablet2"),
> +			},
> +		},
> +		{}
> +	};
>   	struct device *dev = &pdev->dev;
>   	int status = 0;
>   
>   	if (!soc_intel_is_byt())
>   		return false;
>   
> +	if (dmi_check_system(force_bytcr_table))
> +		return true;
> +
>   	if (iosf_mbi_available()) {
>   		u32 bios_status;
>   
> 
