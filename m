Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671F22B7DC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2125168F;
	Thu, 23 Jul 2020 22:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2125168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595536517;
	bh=ZAyttG+yS8v/hntG9gkuMcD5lBa4CebmAlqF//cCrKU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdKI+escDOwVXSsSRXnI/onCMrLQ76OZEMJZmPh9jjttFAhXWWR/wV8RpGHbKsySQ
	 vPurVZiT/um0aTWX/2QhAFkW/AiuRinEyalWU5OHiVRaLrmCeLB8EvNX3YzgaPh6jK
	 GLcNW5nMl/M5c0bovl4/naE/TPOHtvLR9MJ7av2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4CEF80090;
	Thu, 23 Jul 2020 22:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BEBCF80212; Thu, 23 Jul 2020 22:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3DCF8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3DCF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="JgzoCfL2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=1ZUj6zO5sTd4n4tA7q1C5S6zXUszTaQPDC8S97euy/U=; b=JgzoCfL2jGsTn8kMwYIkWwcXlK
 mRPdEM1uzW57Adq3DnpueVvSYSf080Bz0vGrDPEBk2EKk6vRHbg7sADY1ZJDNZCbnCv7SR0SXdVk8
 c7+8itVbfrSZWwYIYyJzj4GpuU2JTIISmkb8g+Aid+HPMReA+IEC2ybjPks/8jQNUhEEgSII/jZVS
 lqZ1/cr15xqVajLQOaw5nUFiaQxCeAa09CcrQbgBzWNwQ5hJn8kTQ+GRMV/qF0kK1awmw6YPIuhwL
 sFJYxwd9qVI61mG3nad2Bp/qq38/fK47/MBWxm1htn2lj7DioDd5+2l6M33DEAsPSgP9vF4x5aTlv
 TBmOBmGg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhu5-0002mD-33; Thu, 23 Jul 2020 20:33:21 +0000
Subject: Re: [PATCH] ASoC: tegra: Fix build error due to 64-by-32 division
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, geert@linux-m68k.org
References: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <18d56fcb-29b1-fbc9-f9cd-7706f65c678d@infradead.org>
Date: Thu, 23 Jul 2020 13:33:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On 7/23/20 1:13 AM, Sameer Pujar wrote:
> Build errors are seen on 32-bit platforms because of a plain 64-by-32
> division. For example, following build erros were reported.
> 
> "ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
>  undefined!"
> "ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
>  undefined!"
> 
> This can be fixed by using div_u64() helper from 'math64.h' header.
> 
> Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/tegra210_dmic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
> index ff6fd65..d682414 100644
> --- a/sound/soc/tegra/tegra210_dmic.c
> +++ b/sound/soc/tegra/tegra210_dmic.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/device.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -129,7 +130,7 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
>  	 * Boost Gain Volume control has 100x factor.
>  	 */
>  	if (dmic->boost_gain)
> -		gain_q23 = (gain_q23 * dmic->boost_gain) / 100;
> +		gain_q23 = div_u64(gain_q23 * dmic->boost_gain, 100);
>  
>  	regmap_write(dmic->regmap, TEGRA210_DMIC_LP_FILTER_GAIN,
>  		     (unsigned int)gain_q23);
> 

Yes, that fixes the division problem. Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>


Now I get these warnings:

  CC [M]  sound/soc/tegra/tegra210_dmic.o
../sound/soc/tegra/tegra210_dmic.c:55:12: warning: ‘tegra210_dmic_runtime_resume’ defined but not used [-Wunused-function]
 static int tegra210_dmic_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../sound/soc/tegra/tegra210_dmic.c:43:12: warning: ‘tegra210_dmic_runtime_suspend’ defined but not used [-Wunused-function]
 static int tegra210_dmic_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
