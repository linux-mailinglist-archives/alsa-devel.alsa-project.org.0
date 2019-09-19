Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE643B7514
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA781679;
	Thu, 19 Sep 2019 10:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA781679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568881643;
	bh=pWDQZrPUWrrtDdIQFPyj5BzPrfUvU9nUV9QBPq57b2M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cO6T/wa7H22Iz0M2sLSADQ36rC5CnklSwFQ2egvflWDL8VHvkc/wloIfQkfMzwkjI
	 PXXL2z2ZWDE+M5Mj/UIkHGtsJQtS+NNiM0gOPZiODWr045fnOnTM7A8D6unlzET3WG
	 c5P9vKECxhkb55OBTb3mHQ57sBOOYaUXE94kJc28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC92AF80292;
	Thu, 19 Sep 2019 10:25:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6961BF80090; Thu, 19 Sep 2019 10:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E29CF80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 10:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E29CF80090
Received: by mail-wr1-f65.google.com with SMTP id l3so2069190wru.7
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 01:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LeVWiP96skI5eB7uqPIrDv7wt1djjgh1Br2ODaNGKJs=;
 b=M/qddlBYNkmpcXa96ZVjj9BACYPj36JlS1+iyGEjKwVaZ2XGjRZk5oBXgQtlETMjh3
 5TqyhcfMNm+TmkO3bZozMETWSTQ5Ljs2ZrTWJsA7G6a25R3/uQD1X/39u02eDdZl8zK3
 tQwrGeyi94PUUB4PmENijrA6RJsPde9RNsb+NXfaGNzjeKZTWa+dtXpgqjfnVTP4z0tR
 g2UkUK+OFWsIMpH2lAmiqYr3BLoZ+jSFOQ5GVZgCHLL3WYPKRmJNxzVz5vN40eQzm0vC
 p/+B+w2IQeAlNQNFdwJpTUtMw3RbbZtis4iAIesO22vP7Q5Z/OFQhyMVEiVCO0HTBiOy
 DcHQ==
X-Gm-Message-State: APjAAAW0cIM+xEdsOU2juBDegg3jxd+uiHnktpFnV1lf5jdHdsrteggy
 SgOAlyH9mhPTHHL6hSWsk4A=
X-Google-Smtp-Source: APXvYqxd+SvRD+xij34ds5Wefq2QoMUwnmH1O7Cuz+Oifi4mcJExLaFEH9KvWL95Bj1jErdjdGqxaQ==
X-Received: by 2002:adf:fd10:: with SMTP id e16mr6455268wrr.17.1568881334522; 
 Thu, 19 Sep 2019 01:22:14 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id s1sm11877105wrg.80.2019.09.19.01.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:22:13 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:22:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919082211.GF13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-9-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 8/9] ASoC: samsung: arndale: Add missing
 OF node dereferencing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Sep 18, 2019 at 12:46:33PM +0200, Sylwester Nawrocki wrote:
> Ensure there is no OF node references kept when the driver is removed/unbound.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale_rt5631.c | 31 ++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Wasn't this issue introduced in 5/9? It looks weird to fix it here...

Best regards,
Krzysztof

> 
> diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
> index 3744c47742b8..d8da313e898a 100644
> --- a/sound/soc/samsung/arndale_rt5631.c
> +++ b/sound/soc/samsung/arndale_rt5631.c
> @@ -132,6 +132,17 @@ static struct snd_soc_card arndale_wm1811 = {
>  	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
>  };
>  
> +static void arndale_put_of_nodes(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		of_node_put(dai_link->cpus->of_node);
> +		of_node_put(dai_link->codecs->of_node);
> +	}
> +}
> +
>  static int arndale_audio_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -156,16 +167,31 @@ static int arndale_audio_probe(struct platform_device *pdev)
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(&pdev->dev,
>  			"Property 'samsung,audio-codec' missing or invalid\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_put_of_nodes;
>  	}
>  
>  	ret = devm_snd_soc_register_card(card->dev, card);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> +		goto err_put_of_nodes;
> +	}
>  
> +	return 0;
> +
> +err_put_of_nodes:
> +	arndale_put_of_nodes(card);
>  	return ret;
>  }
>  
> +static int arndale_audio_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +
> +	arndale_put_of_nodes(card);
> +	return 0;
> +}
> +
>  static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {
>  	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
>  	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> @@ -181,6 +207,7 @@ static struct platform_driver arndale_audio_driver = {
>  		.of_match_table = arndale_audio_of_match,
>  	},
>  	.probe = arndale_audio_probe,
> +	.remove = arndale_audio_remove,
>  };
>  
>  module_platform_driver(arndale_audio_driver);
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
