Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29E29E912
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 11:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CD515E0;
	Thu, 29 Oct 2020 11:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CD515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603967738;
	bh=k/984BgyhB1Upv0lR7Ig9+gDbBKUq1H89YLUyevXRDQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZQmkh+5TTB076nAXMUJ/i8P43eye7ehKamkEQ9f0A9GSA1Q6tfdFnbjv/gUFa9jj
	 5Y2Z8K/G4uoFl5052R/Svkpw8dXIXhmScOMy1kRBmkinDMgNk3TaF7GuNQ/bJE8Y+s
	 7tB5PRot4fgZf+Vswpdu9F203LXAUwUv8KnMR3eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8A3F800D8;
	Thu, 29 Oct 2020 11:34:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0862F8020D; Thu, 29 Oct 2020 11:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1EF8DF800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 11:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF8DF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4080C139F;
 Thu, 29 Oct 2020 03:33:55 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C00453F66E;
 Thu, 29 Oct 2020 03:33:53 -0700 (PDT)
Subject: Re: [PATCH 04/25] ASoC: rockchip: remove unnecessary CONFIG_PM_SLEEP
To: Coiby Xu <coiby.xu@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
 <20201029074301.226644-4-coiby.xu@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8589f68f-fa6b-d75e-d7be-fbb354adbde0@arm.com>
Date: Thu, 29 Oct 2020 10:33:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029074301.226644-4-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On 2020-10-29 07:42, Coiby Xu wrote:
> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

I don't see anything in the !CONFIG_PM_CONFIG side of 
SET_SYSTEM_SLEEP_PM_OPS() that prevents unused function warnings for the 
callbacks - does this change depend on some other patch or is it just wrong?

Robin.

> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>   sound/soc/rockchip/rockchip_pdm.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
> index 5adb293d0435..f3c19310aeeb 100644
> --- a/sound/soc/rockchip/rockchip_pdm.c
> +++ b/sound/soc/rockchip/rockchip_pdm.c
> @@ -574,7 +574,6 @@ static int rockchip_pdm_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static int rockchip_pdm_suspend(struct device *dev)
>   {
>   	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
> @@ -601,7 +600,6 @@ static int rockchip_pdm_resume(struct device *dev)
>   
>   	return ret;
>   }
> -#endif
>   
>   static const struct dev_pm_ops rockchip_pdm_pm_ops = {
>   	SET_RUNTIME_PM_OPS(rockchip_pdm_runtime_suspend,
> 
