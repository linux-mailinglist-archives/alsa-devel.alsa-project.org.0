Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D985485A3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 16:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305B31817;
	Mon, 13 Jun 2022 16:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305B31817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655129124;
	bh=uPQEvAOKYrbsHg74xc5wQk3cogZayeWuWDlF5H7r10w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tosu3m/gHniHeblB2ICKqRA5KmJeyihHr5d4mfPW7+D+SLiUpOU9NPqiq7Xxvx6w7
	 hvqRrvz6YBNHGq/pduiUka+68R3DV8ZJKZPjvxJZsBSoWaB7DD2YL9WX4cj3Azxy2y
	 13pXNJiLlAwEPQ7vWFGDzCEQJOS1OZBTbCD3Ca74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D60F804D1;
	Mon, 13 Jun 2022 16:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90BF5F804C1; Mon, 13 Jun 2022 16:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92A8CF800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 16:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A8CF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RLIjLgXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655129023; x=1686665023;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uPQEvAOKYrbsHg74xc5wQk3cogZayeWuWDlF5H7r10w=;
 b=RLIjLgXFVaaEerY5DA70ckgSj2XSN7CO+FBzz25JEJZtEMoaj1Av5UAY
 ekB45tqxfURa/3D+/8mZqEUpuhUTRdCH/Bg4iEr5Pwpo7jJAJM30U69Tp
 3Yyq0XLK3yChUpTTDgHEpo2z3bA64BTGQB6od4KnIYWpsmS0WF2NzTDZZ
 s8NQuN8b5dYjMESQoudvaSc+HKmBeHpxJ6B+PvkgB/YWMdOgWmcpm+CQW
 xKxTOsf+xlbf3PprLHhxwpYezsRgKTndehLekCXobULOMBtN1UKXiYB4l
 QXm8X81T3/SZaEtUcL7swAKiPMoE1AbHg19NqdSttluRixZlGRW8WuoNq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279011477"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="279011477"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:03:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="910399852"
Received: from tchuynh1-mobl1.amr.corp.intel.com (HELO [10.212.112.176])
 ([10.212.112.176])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:03:32 -0700
Message-ID: <7ef2ccca-7c9f-367b-8fd9-2fb38c816bd3@linux.intel.com>
Date: Mon, 13 Jun 2022 08:10:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix GPIO related
 probe-ordering problem
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20220612155652.107310-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220612155652.107310-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 6/12/22 10:56, Hans de Goede wrote:
> The "wlf,spkvdd-ena" GPIO needed by the bytcr_wm5102 driver
> is made available through a gpio-lookup table.
> 
> This gpio-lookup table is registered by drivers/mfd/arizona-spi.c, which
> may get probed after the bytcr_wm5102 driver.
> 
> If the gpio-lookup table has not registered yet then the gpiod_get()
> will return -ENOENT. Treat -ENOENT as -EPROBE_DEFER to still keep
> things working in this case.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bytcr_wm5102.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
> index 00384c6fbcaa..330c0ace1638 100644
> --- a/sound/soc/intel/boards/bytcr_wm5102.c
> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
> @@ -421,8 +421,17 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
>  	priv->spkvdd_en_gpio = gpiod_get(codec_dev, "wlf,spkvdd-ena", GPIOD_OUT_LOW);
>  	put_device(codec_dev);
>  
> -	if (IS_ERR(priv->spkvdd_en_gpio))
> -		return dev_err_probe(dev, PTR_ERR(priv->spkvdd_en_gpio), "getting spkvdd-GPIO\n");
> +	if (IS_ERR(priv->spkvdd_en_gpio)) {
> +		ret = PTR_ERR(priv->spkvdd_en_gpio);
> +		/*
> +		 * The spkvdd gpio-lookup is registered by: drivers/mfd/arizona-spi.c,
> +		 * so -ENOENT means that arizona-spi hasn't probed yet.
> +		 */
> +		if (ret == -ENOENT)
> +			ret = -EPROBE_DEFER;
> +
> +		return dev_err_probe(dev, ret, "getting spkvdd-GPIO\n");
> +	}
>  
>  	/* override platform name, if required */
>  	byt_wm5102_card.dev = dev;
