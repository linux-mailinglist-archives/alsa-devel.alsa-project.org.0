Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F855766E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 11:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75AEF1B40;
	Thu, 23 Jun 2022 11:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75AEF1B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655975821;
	bh=wkGRbpHjTf+Pr90iG6yuJKxdhkFoBrAbBCLU7+hUTyI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnleAvHGAUKVooR2WFoXbQtSkhmeT5srv3NojmNoXXPQItgE2R9HGDnbGynq7Dxup
	 VLysp3UOaP/R4HlcCEWamMLQtsn2p9JpUM/VSgdBALk4L6+v4WH7fyqgXvANZK0yK+
	 TyyOkheOii19c7x4NyqP7dCymGEdSY9Ziwtm9jjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C98A6F800CB;
	Thu, 23 Jun 2022 11:16:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A49EBF800CB; Thu, 23 Jun 2022 11:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B4EE6F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 11:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4EE6F800D0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 434D012FC;
 Thu, 23 Jun 2022 02:15:54 -0700 (PDT)
Received: from [10.57.85.4] (unknown [10.57.85.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63DC93F792;
 Thu, 23 Jun 2022 02:15:52 -0700 (PDT)
Message-ID: <4bec03b5-c496-ec0d-b968-d4d0e5d2e782@arm.com>
Date: Thu, 23 Jun 2022 10:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Content-Language: en-GB
To: Judy Hsiao <judyhsiao@chromium.org>, Heiko Stuebner <heiko@sntech.de>
References: <20220623021153.587423-1-judyhsiao@chromium.org>
 <20220623021153.587423-2-judyhsiao@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220623021153.587423-2-judyhsiao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2022-06-23 03:11, Judy Hsiao wrote:
[...]
> @@ -736,6 +799,20 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>   	}
>   
>   	i2s->bclk_ratio = 64;
> +	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(i2s->pinctrl)) {
> +		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");

If we're still reworking this, it might be good to set i2s->pinctrl to 
NULL here, and similarly free and clear if we fail to get the states in 
the other path, so that everywhere else could consistently have just a 
simple "if (i2s->pinctrl)" check rather than the "IS_ERR() || 
IS_ERR_OR_NULL()" mess.

> +	} else { > +		i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
> +		if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
> +			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
> +			if (IS_ERR_OR_NULL(i2s->bclk_off)) {
> +				dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
> +				goto err_clk;
> +			}
> +		}
> +		i2s_pinctrl_select_bclk_off(i2s);

FWIW it seems a bit odd to call this in the case where we didn't even 
get "bclk_on".

Robin.

> +	}
>   
>   	dev_set_drvdata(&pdev->dev, i2s);
>   
