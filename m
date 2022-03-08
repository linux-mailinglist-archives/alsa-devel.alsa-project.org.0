Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E44D230A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 22:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19644172D;
	Tue,  8 Mar 2022 22:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19644172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646773593;
	bh=QMWQCWV1q0cVyGexlV6EMwL7zWzglGPEwxigZVHILVM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItMgZ7NaA1pcDntpJF1OnHmr0OBwKXulzha4tSJTcrGohdoaR2Ms6K4qFTr3ihdyk
	 yqlWWoEPcR0OacZsXucZeNsVB/cLo5CexftGiFAv8SMbppRDGyfW56s5C6GQbw/9Qf
	 5RIGXoi20ympJqKHodfxlO9H1PGH9S4oiqC10p6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7EFF8026D;
	Tue,  8 Mar 2022 22:05:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B5AAF8026A; Tue,  8 Mar 2022 22:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B6E7F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 22:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6E7F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="PqLvd2pJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=aghJjQ/TxIEM63SbYMSSg0+NF0Cmq0zVo1nfIfNkssw=; b=PqLvd2pJRv+fY3NhcB9E77MjSu
 fRb1FyfGUbCWaTR/Ow7MiMidTcEy+patfqvEeKffSuAYwIYS3D5ksh7CUzumX0uyJZvQNZ4sjMiEL
 g5byy1fY2oU5UjcODjMuMbP5sFF1H4ZsFH+jxGuCD4Wcwz+R6zGvyAJpWxHa/qvMENuMLxd+MQiv8
 AledxCWnMP0Q/trAIMb8roOHaigeicCSM7BjFi/YXQh77CBU8dP0yXiGAxoBlI2AU0O9U6131ugHQ
 GUXrvelwkUcdKk6VQwOo+HfO0OSN0PS13Yi7DvXumd+WPdmc5whHPopFG3HuhceJ4jigxjRK61Z+F
 jfNp3a7Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRh18-00GXKC-Hl; Tue, 08 Mar 2022 21:05:14 +0000
Message-ID: <27360976-8820-cdbb-cc17-52ea0ccb3b55@infradead.org>
Date: Tue, 8 Mar 2022 13:05:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] ASoC: Intel: boards: fix randconfig issue
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220308202318.401358-1-pierre-louis.bossart@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220308202318.401358-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 3/8/22 12:23, Pierre-Louis Bossart wrote:
> on x86_64:
> 
> ERROR: modpost: "sof_dai_get_bclk"
> [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
> 
> ERROR: modpost: "sof_dai_get_mclk"
> [sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko]
> undefined!
> 
> This comes from a missing dependency on at least ONE SOF platform
> being selected. This dependency exists for all other machine drivers,
> this was missed in the earlier reviews.
> 
> Fixes: 2fe14ff61bd6 ("ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  sound/soc/intel/boards/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index a62785893bec..f3873b5bea87 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -616,6 +616,8 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
>  
>  endif ## SND_SOC_SOF_JASPERLAKE
>  
> +if SND_SOC_SOF_HDA_LINK
> +
>  config SND_SOC_INTEL_SOF_SSP_AMP_MACH
>  	tristate "SOF with amplifiers in I2S Mode"
>  	depends on I2C && ACPI
> @@ -632,6 +634,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
>  	   with RT1308/CS35L41 I2S audio codec.
>  	   Say Y if you have such a device.
>  	   If unsure select "N".
> +endif ## SND_SOC_SOF_HDA_LINK
>  
>  if SND_SOC_SOF_ELKHARTLAKE
>  

-- 
~Randy
