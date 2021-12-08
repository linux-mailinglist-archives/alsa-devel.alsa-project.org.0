Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217A46D381
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:41:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13187273E;
	Wed,  8 Dec 2021 13:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13187273E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638967305;
	bh=spBb8jr+BLxCb+qui3T5y2JFa5dTAYeW8zwvhMGXvro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bW5XUpAjkebv1qR4fzpk8hBGL7fY/n0UmZW2Ts08kghuoDYssdsCA+ovd8UmM8q78
	 gpcbU4haVEhJv6/PMjKkPnhrDVGt6TzlG5MyiOMMuLuoi+YAGq8M2UZc6fKNR/b4Gp
	 hcQaMdsT8dL/BoGmGIeXg77kJLdooFokzcSfq2C8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CBFF80103;
	Wed,  8 Dec 2021 13:40:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3316F804E5; Wed,  8 Dec 2021 13:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6902F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6902F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RFIAPeDp"
Received: by mail-wr1-x42e.google.com with SMTP id q3so3872366wru.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K/DBuZhUDRGHeWyIemGFSVWESfZOsYaKYb9NzvIqeyk=;
 b=RFIAPeDp55STzXxu8uXq/Ygb9Pm15wcypmAq856iXatgWal7I6ZSBtslPfz4AzoT1W
 Xf3tbVwUgSYy0wvnr5sLoOQRebmv3rNS9jvRakRQVkxqtCRgbX+OWmVIaj/EmYswqmau
 FyAd3v1cp3Xf+IK2oi/l4UG6qMu41Tpsue92Gndu7AMwQpVN2XUWrAHXdJbP210CVJow
 sR73MVRofqT1xxi02OJbNIXE6zRvUYk5PF5lq4Scdi3mJQ8aUcH9kxIo/QaBJ9vjNlTC
 X4jgwtA+1kuxyKQa0/B4rncfDAsHoQnSAb1F0RzQYtgxIgQoIRJ9zpS7D4f4WvkZxVHT
 SJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K/DBuZhUDRGHeWyIemGFSVWESfZOsYaKYb9NzvIqeyk=;
 b=C8Cqo+YrkrngaAbDIBMy+UUdYrbr1gfdajf60j7bMAjftBSNYNWYKOrQPp41T2L0yR
 G/B+ORQ34U+3HnuR6S3Xt6lhb4XlvBKLXxvTj3tSYt6lnkr+UQRiaH8vPXutN79jC2JI
 4BLbwa8Qa/Aa0DlJw+g4/LBAXrJ8ZjImbEEoSc/lJAQElgOfRKXRRCjtEgL6FNpqmG2n
 86IaO79kIJnHFuF0LxB7cQDtqqBNLRv68IX9Q2S/Vk9sQ9i42e+9O/6oNKKv+aCZtCML
 kiTi/8BeCOMubYdeeuyUndyO2mABVr8BgbU6PSJh6caSxfXIcJWyrfSmIkxF3QdfrTf4
 gknA==
X-Gm-Message-State: AOAM5321YJJScw3jm6e7iKK6ULiOWX1OzjGsvP4Frm9Pw9iJCEWvjhaF
 LN945CwYYP5DUi4WYnzrUUY=
X-Google-Smtp-Source: ABdhPJwF4fWlhWx6371UkgDlh+QrnNifqBx+j+pVkco+bQ0yns1inYtrGkhnzJftDWC5eC3zbb12SQ==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr58232155wrs.46.1638967222364; 
 Wed, 08 Dec 2021 04:40:22 -0800 (PST)
Received: from hamza-OptiPlex-7040 ([39.48.199.136])
 by smtp.gmail.com with ESMTPSA id n1sm2767877wmq.6.2021.12.08.04.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:40:22 -0800 (PST)
Date: Wed, 8 Dec 2021 17:40:18 +0500
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH] ASoC: test-component: replace of_match_device() to
 of_device_get_match_data()
Message-ID: <20211208124018.GA15923@hamza-OptiPlex-7040>
References: <20211208120526.GA12550@hamza-OptiPlex-7040>
 <20211208123659.15789-1-amhamza.mgc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208123659.15789-1-amhamza.mgc@gmail.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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

On Wed, Dec 08, 2021 at 05:36:59PM +0500, Ameer Hamza wrote:
> Getting device data from of_device_get_match_data() for a cleaner
> implementation.
> 
> Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
> ---
>  sound/soc/generic/test-component.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
> index 8fc97d3ff011..5da4725d9e16 100644
> --- a/sound/soc/generic/test-component.c
> +++ b/sound/soc/generic/test-component.c
> @@ -531,17 +531,13 @@ static int test_driver_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
>  	struct device_node *ep;
> -	const struct of_device_id *of_id = of_match_device(test_of_match, &pdev->dev);
> -	const struct test_adata *adata;
> +	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
>  	struct snd_soc_component_driver *cdriv;
>  	struct snd_soc_dai_driver *ddriv;
>  	struct test_dai_name *dname;
>  	struct test_priv *priv;
>  	int num, ret, i;
>  
> -	if (!of_id)
> -		return -EINVAL;
> -	adata = of_id->data;
>  	num = of_graph_get_endpoint_count(node);
>  	if (!num) {
>  		dev_err(dev, "no port exits\n");
> @@ -552,7 +548,7 @@ static int test_driver_probe(struct platform_device *pdev)
>  	cdriv	= devm_kzalloc(dev, sizeof(*cdriv),		GFP_KERNEL);
>  	ddriv	= devm_kzalloc(dev, sizeof(*ddriv) * num,	GFP_KERNEL);
>  	dname	= devm_kzalloc(dev, sizeof(*dname) * num,	GFP_KERNEL);
> -	if (!priv || !cdriv || !ddriv || !dname)
> +	if (!priv || !cdriv || !ddriv || !dname || !adata)
>  		return -EINVAL;
>  
>  	priv->dev		= dev;
> -- 
Hi Kuninori,
Would be really appreciated if you can review the patch please.

Best Regards,
Ameer Hamza.
