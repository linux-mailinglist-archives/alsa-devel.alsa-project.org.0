Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6A27BC4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 13:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9911683;
	Thu, 23 May 2019 13:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9911683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558611020;
	bh=et814ZCTGZ9aRQk6+8HiOjn+YTThgaq3vBDa0kgurFA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEYgw9zK2oJA2zQVV27sgUWylqaFzNce4tPVfVD0s2AbJTrSwZs03e9J5NyU8Zbt3
	 pQulGhlExdbNjS+U7BQng12HRl+f9/kMU/5d8f9SYUcZpaiZkOkOuYidixlf4qP5Qu
	 HJVOvQ0GpjGxZiOgAyqvYhPplTRBkoOvwXN66NJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BABF89707;
	Thu, 23 May 2019 13:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82106F89674; Thu, 23 May 2019 13:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A3D7F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 13:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A3D7F80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 04:28:27 -0700
X-ExtLoop1: 1
Received: from jlrosema-mobl.amr.corp.intel.com (HELO [10.252.131.22])
 ([10.252.131.22])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2019 04:28:26 -0700
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <9019c87f-cf1a-b59f-d87e-8169b247cf88@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6b89e370-90e3-6962-c71a-80919b7c6154@linux.intel.com>
Date: Thu, 23 May 2019 06:28:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9019c87f-cf1a-b59f-d87e-8169b247cf88@infradead.org>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoc: fix
 sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/22/19 10:58 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> skl-ssp-clk.c does not build on IA64 because the driver
> uses the common clock interface, so make the driver depend
> on COMMON_CLK.
> 
> Fixes this build error:
> ../sound/soc/intel/skylake/skl-ssp-clk.c:26:16: error: field 'hw' has incomplete type
>    struct clk_hw hw;
>                  ^~
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Jie Yang <yang.jie@linux.intel.com>
> Cc: alsa-devel@alsa-project.org
> ---
>   sound/soc/intel/Kconfig        |    3 ++-
>   sound/soc/intel/boards/Kconfig |    2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> --- lnx-52-rc1.orig/sound/soc/intel/Kconfig
> +++ lnx-52-rc1/sound/soc/intel/Kconfig
> @@ -104,7 +104,7 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
>   config SND_SOC_INTEL_SKYLAKE
>   	tristate "All Skylake/SST Platforms"
>   	depends on PCI && ACPI
> -	select SND_SOC_INTEL_SKL
> +	select SND_SOC_INTEL_SKL if COMMON_CLK

Is this really necessary? The COMMON_CLK is only needed for the 
SND_SOC_INTEL_SKYLAKE_SSP_CLK option, isn't it?

>   	select SND_SOC_INTEL_APL
>   	select SND_SOC_INTEL_KBL
>   	select SND_SOC_INTEL_GLK
> @@ -120,6 +120,7 @@ config SND_SOC_INTEL_SKYLAKE
>   config SND_SOC_INTEL_SKL
>   	tristate "Skylake Platforms"
>   	depends on PCI && ACPI
> +	depends on COMMON_CLK
>   	select SND_SOC_INTEL_SKYLAKE_FAMILY
>   	help
>   	  If you have a Intel Skylake platform with the DSP enabled
> --- lnx-52-rc1.orig/sound/soc/intel/boards/Kconfig
> +++ lnx-52-rc1/sound/soc/intel/boards/Kconfig
> @@ -286,7 +286,7 @@ config SND_SOC_INTEL_KBL_RT5663_MAX98927
>   	select SND_SOC_MAX98927
>   	select SND_SOC_DMIC
>   	select SND_SOC_HDAC_HDMI
> -	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
> +	select SND_SOC_INTEL_SKYLAKE_SSP_CLK if COMMON_CLK

and here I would make it a depend. I guess your solution solves the 
compilation but doesn't fully represent the fact that this machine 
driver is not functional without COMMON_CLK+SKYLAKE_SSP_CLK.


>   	help
>   	  This adds support for ASoC Onboard Codec I2S machine driver. This will
>   	  create an alsa sound card for RT5663 + MAX98927.
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
