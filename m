Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F731548F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 21:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8B718ED;
	Mon,  6 May 2019 21:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8B718ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557171902;
	bh=l8HDA7Cwzmh+0dAF08mOUidJi/HlgDlmDQmoy6dwqII=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJd/kxjaTTIdsNdPBsqZuxbqIMp62MhU7U4uabGReK6Qk/2dXDZS5Xa2McU0Xh8lB
	 91g/EP8SJoEndfJ2/YjkKq0vr0Zb0cmpJWn/v+36lHSM9YdnMGlPHuDULM2CbUdSFM
	 yl+FkIg5GMWG8WI8bdeermI8VCWXTwI47p+BvAD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEC7F896FF;
	Mon,  6 May 2019 21:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF6B5F896F0; Mon,  6 May 2019 21:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4869F80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 21:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4869F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 12:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,439,1549958400"; d="scan'208";a="168555081"
Received: from lrafterx-mobl.amr.corp.intel.com (HELO [10.251.10.252])
 ([10.251.10.252])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2019 12:43:08 -0700
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <418abbd5-f01c-19ef-c9f2-7de5662f10a2@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <653fcfc0-8285-acbb-8eac-39d0e6f8176e@linux.intel.com>
Date: Mon, 6 May 2019 14:43:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <418abbd5-f01c-19ef-c9f2-7de5662f10a2@infradead.org>
Content-Language: en-US
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sound/soc/sof/: fix kconfig
 dependency warning
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



On 5/6/19 2:01 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kconfig warning for unmet dependency for IOSF_MBI when
> PCI is not set/enabled.  Fixes this warning:
> 
> WARNING: unmet direct dependencies detected for IOSF_MBI
>    Depends on [n]: PCI [=n]
>    Selected by [y]:
>    - SND_SOC_SOF_ACPI [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && X86 [=y]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I completely forgot to mirror the change in sound/soc/intel/Kconfig for 
IOSF support (ASoC: Intel: atom: Make PCI dependency explicit) for the 
same issue that ACPI no longer depends on PCI, thanks Randy for spotting 
this.

> ---
>   sound/soc/sof/Kconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20190506.orig/sound/soc/sof/Kconfig
> +++ linux-next-20190506/sound/soc/sof/Kconfig
> @@ -28,7 +28,7 @@ config SND_SOC_SOF_ACPI
>   	select SND_SOC_ACPI if ACPI
>   	select SND_SOC_SOF_OPTIONS
>   	select SND_SOC_SOF_INTEL_ACPI if SND_SOC_SOF_INTEL_TOPLEVEL
> -	select IOSF_MBI if X86
> +	select IOSF_MBI if X86 && PCI
>   	help
>   	  This adds support for ACPI enumeration. This option is required
>   	  to enable Intel Haswell/Broadwell/Baytrail/Cherrytrail devices
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
