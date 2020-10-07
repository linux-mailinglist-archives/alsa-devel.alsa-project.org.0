Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AB2863E7
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3AFC1684;
	Wed,  7 Oct 2020 18:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3AFC1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602088122;
	bh=1LkF3AbEmJI3I9VdONrMGsd8kpi6RVekL7wD2VtgrRU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZMw5qvv/SQsto55hCMVi+LgOxDNpW81Z4FkvNx4IIzcgAx5Za4tyF/POfuz8eVeT
	 ySUmDTTWASa/se4mAiGev/T01yjR/OkcmdSInBo/4+3l7sIBu4XwLFz0camWNmFErK
	 9z4e+dqFQwq/vWc6e+R3osxN6SevgI3w9GURo7GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F7BEF8016B;
	Wed,  7 Oct 2020 18:26:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9F00F8016D; Wed,  7 Oct 2020 18:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB032F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 18:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB032F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="F85PDsuR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=S1IzXJve09U5v3Ej/+Wguw504XJnsVxtpNDdlAQiZXs=; b=F85PDsuR3eMVhlr3M6UofHJSA6
 2NYVM8VA+vD241tdKlbWUBv9S33xARc+a+uTfw9dza5ORDi8EIOEfb7WFImii1CsTQri0eP42dbc2
 ZnFB5IHAWCO62dtVATGhGYvhAFD2eWKZ+CZbzIwN0iH/nFL3g9mud5FqnRNlDp5iwawdtHPZbHkb/
 qc9md4ySbGY9N7hN1IBzkrmLgqdd8YMFROXQd93pOpNRngEsGi4WQ6UFsmuE2ehsN3AHeflTPX4YB
 BHVx2igeYIEHgl5ay2YopA/5M9jLc9aUvIxVo67DJrgI4KXMpUE5F8CDIUclHj5qwmgc5PfC/j+1p
 uIT19HRg==;
Received: from [2601:1c0:6280:3f0::2c9a]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQCGT-0002fi-SM; Wed, 07 Oct 2020 16:26:06 +0000
Subject: Re: [PATCH 1/2] ASoC: Intel: catpt: Fix compilation when
 CONFIG_MODULES is disabled
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20201007135701.20372-1-cezary.rojewski@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <536bf0c9-5ee1-f0f4-8322-1bff4f715255@infradead.org>
Date: Wed, 7 Oct 2020 09:26:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007135701.20372-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On 10/7/20 6:57 AM, Cezary Rojewski wrote:
> module_is_live() is available only when CONFIG_MODULES is enabled.
> Replace its usage with try_module_get() which is present regardless of
> said config's status.
> 
> Fixes: 7a10b66a5df9 ("ASoC: Intel: catpt: Device driver lifecycle")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  sound/soc/intel/catpt/device.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> index 390ffb203de0..a70179959795 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -81,10 +81,11 @@ static int __maybe_unused catpt_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	if (!module_is_live(dev->driver->owner)) {
> +	if (!try_module_get(dev->driver->owner)) {
>  		dev_info(dev, "module unloading, skipping fw boot\n");
>  		return 0;
>  	}
> +	module_put(dev->driver->owner);
>  
>  	ret = catpt_boot_firmware(cdev, true);
>  	if (ret) {
> @@ -107,10 +108,12 @@ static int __maybe_unused catpt_resume(struct device *dev)
>  
>  static int __maybe_unused catpt_runtime_suspend(struct device *dev)
>  {
> -	if (!module_is_live(dev->driver->owner)) {
> +	if (!try_module_get(dev->driver->owner)) {
>  		dev_info(dev, "module unloading, skipping suspend\n");
>  		return 0;
>  	}
> +	module_put(dev->driver->owner);
> +
>  	return catpt_suspend(dev);
>  }
>  
> 


-- 
~Randy
