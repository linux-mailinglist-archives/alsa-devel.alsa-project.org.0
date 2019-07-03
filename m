Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321465E0AA
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 11:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14BFA16A5;
	Wed,  3 Jul 2019 11:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14BFA16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562145169;
	bh=M7/y6DGlesAJGhHdjoO8uBfCC8O7oZKs9pY8kttIf04=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ArjzO/j79f397HA+VTEqXHJjNA1O5iMxlF51H8fPLp85SJw3KzSdp8n91PWo8vNqp
	 seUL/w7VJvpS8PJAT5BE7B2JeU/qdCYKyEr2KMbQNO0PHxG2iMJJA5nQTGSu5dbNrw
	 lAYAsQ62M4kQsVoNRc7a+HGgZPyWYqETmlAPQz+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A58F800F2;
	Wed,  3 Jul 2019 11:11:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F5C1F800E9; Wed,  3 Jul 2019 11:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B70DCF80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 11:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B70DCF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ObWcSxFy"
Received: by mail-pf1-x444.google.com with SMTP id m30so928266pff.8
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=As2upjpnu0eNfhcHUKlBkgyy1u4yzbeYFixzSKqaDY4=;
 b=ObWcSxFyx81NI2OD5AYV1+2zf6+ZncHg9EmE7AwksRacdzCfdlIP0d9ckHlCSk+hAE
 lkIF1fwAfUwolfL8XdbQ0DqaD6bt2B1+RCqafwyRLeiMOQNEtmTnoR/6nVgXwKXbm9sU
 uxSk7sytU9XzbuoPWfaw76VZJQcVDVWHZ8tWKtLZL28YnSLgT0hSP9zD11bnACe+24F7
 GnFTEl6L7+NzdthUoBXS60y3CmnZ9N3bq1xqzwdpXzMQwLoKEITiT6AmxobFJbRpkujk
 3m+ymw+NthAjrjGNfrbA2ry19Ag6AnfdneyhwF0MwTOfOC5UVUgYLyt69JILg9kL5Zva
 DKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=As2upjpnu0eNfhcHUKlBkgyy1u4yzbeYFixzSKqaDY4=;
 b=U7x23+bnPCEi7KKZqTGbk5B73KRRAwfYVcQrNu0Lm71p0DXBxNZDQkToT2my0IC9gj
 +FT3e+e3smoQFZHLsg0gsRJMp3z+MdsUI3cnIIVz7pfQma8XifIYy0oKx/1w38Jn6ULK
 3hgztHk2Cs6ZxNOvslvkvHcs59rt1Db/dvB1UYVKaytMt4K02QnMIWmW13v6LXXDgVep
 Ednfp+i6HLBdZX18D8LbrSUm/kxzOQWWlNCKWTbJz5E7z/Azwbw4cepEMOmx25hzzV2O
 V1qjdhGiQbcDYZqSYc318NCKYzN0G89bGuKPHZOnkGeWBFYdx9l4Za8WY3pw1cW0B8Bl
 bOjg==
X-Gm-Message-State: APjAAAWnh7wxVSUUgUNGxN4S31zy63+MCqVr78R/qE0H6HM8N1ADFd/S
 s2WaA5mwzYbBCzDFaAxPSjk=
X-Google-Smtp-Source: APXvYqzFCXmdRw6ALVWTUgHPfy1hOiev9xTr20YFwbNlADqhKzfB6/Es/73il0GfRP7q2dFFqSPcKA==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr11615624pjq.114.1562145057087; 
 Wed, 03 Jul 2019 02:10:57 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 x1sm1350046pjo.4.2019.07.03.02.10.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 02:10:56 -0700 (PDT)
Date: Wed, 3 Jul 2019 02:10:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Message-ID: <20190703091046.GA8764@Asurada>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
 <f57c5a045c6e5491b1bc9831388eab2c88773176.1562136119.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f57c5a045c6e5491b1bc9831388eab2c88773176.1562136119.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: fsl_esai: Wrap some
 operations to be functions
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

Looks good to me, yet two small comments inline.

Please add this to this patch in the next version:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

On Wed, Jul 03, 2019 at 02:42:04PM +0800, shengjiu.wang@nxp.com wrote:
> +static int fsl_esai_register_restore(struct fsl_esai *esai_priv)
> +{
> +	int ret;
> +	/* FIFO reset for safety */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,

Checkpatch script would probably warn this. Usually we add a blank
line after variable declarations.

> @@ -866,22 +935,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&pdev->dev, esai_priv);
>  
> -	/* Reset ESAI unit */
> -	ret = regmap_write(esai_priv->regmap, REG_ESAI_ECR, ESAI_ECR_ERST);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to reset ESAI: %d\n", ret);
> +	ret = fsl_esai_init(esai_priv);

Could we rename this function to fsl_easi_hw_init() or something
clear like fsl_esai_register_init? fsl_easi_init() feels like a
driver init() function to me.

Thank you
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
