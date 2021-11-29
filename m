Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA4A461BD3
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:35:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFD11B14;
	Mon, 29 Nov 2021 17:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFD11B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203753;
	bh=w2z+L0n0rkuXbaenXTV5La4oX5UBGh9hllt0Xk+FxL0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=is0wqq/0P3oC6oTD6A5SNrPNL+HkgqrOneW9mtk5+HYKEeVKVYdzLb3Ku/YN/ir7u
	 MzAnAC3EPjMXLjj0rQjP/Mr+VvKeRR1VUcgzcxZkMtRQFn3njNA/uSmN84jTK5JcTb
	 TAnPcj6XvvB9TP++OvABgAQKifH0cpSGWnS3d6rQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3EDF80515;
	Mon, 29 Nov 2021 17:33:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE66AF80246; Mon, 29 Nov 2021 17:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94111F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94111F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241130"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241130"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418536"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:10 -0800
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify the
 code
To: Tang Bin <tangbin@cmss.chinamobile.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 yang.jie@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
Date: Mon, 29 Nov 2021 10:22:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 11/25/21 1:50 AM, Tang Bin wrote:
> In the function sst_platform_get_resources(), if platform_get_irq()
> failed, the return should not be zero, as the example in
> platform.c is
>   * int irq = platform_get_irq(pdev, 0)
>   * if (irq < 0)
>   * return irq;
> So remove the redundant check to simplify the code.

Humm, it's a bit of a gray area.

the comments for platform_get_irq and platform_get_irq_optional say:

* Return: non-zero IRQ number on success, negative error number on failure.

but if you look at platform_get_irq_optional, there are two references
to zero being a possible return value:

	if (num == 0 && has_acpi_companion(&dev->dev)) {
		ret = acpi_dev_gpio_irq_get(ACPI_COMPANION(&dev->dev), num);
		/* Our callers expect -ENXIO for missing IRQs. */
		if (ret >= 0 || ret == -EPROBE_DEFER)
			goto out;

out_not_found:
	ret = -ENXIO;
out:
	WARN(ret == 0, "0 is an invalid IRQ number\n");
	return ret;

https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L234

I am not sure if there's any merit in removing the test for the zero
return value. It may be on the paranoid side but it's aligned with a
possible code path in the platform code.

Or it could be that the platform code is wrong, and the label used
should have been

/* Our callers expect -ENXIO for missing IRQs. */
if (ret >= 0 || ret == -EPROBE_DEFER)
	goto out_not_found;

Adding Andy Shevchenko for advice.

> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/intel/atom/sst/sst_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
> index 3be64430c..696d547c5 100644
> --- a/sound/soc/intel/atom/sst/sst_acpi.c
> +++ b/sound/soc/intel/atom/sst/sst_acpi.c
> @@ -226,8 +226,8 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>  	/* Find the IRQ */
>  	ctx->irq_num = platform_get_irq(pdev,
>  				ctx->pdata->res_info->acpi_ipc_irq_index);
> -	if (ctx->irq_num <= 0)
> -		return ctx->irq_num < 0 ? ctx->irq_num : -EIO;
> +	if (ctx->irq_num < 0)
> +		return ctx->irq_num;
>  
>  	return 0;
>  }
> 
