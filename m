Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238E9077F2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55615211A;
	Thu, 13 Jun 2024 18:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55615211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295133;
	bh=wANBFxOgFvyM0ZgAx1+SEc/dmWYrOZ6bKnKPNBdyDto=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kGUAkzHoqLWSz8ScOtGyDpI2xhVE1KBLjZhTtoLF4pPgpAYIh/QEsOTDe55h3p+5/
	 XuBPITdlEVOfvvE+wZq5EE3RO0+eFsRm++DX01sAJTH74pHPyjzajny/niDCOZySrc
	 9/TDDU7E9KBEeW+wziSqlVvQzlLiUFF8ZwPPQmQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61F2AF89888; Thu, 13 Jun 2024 18:04:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E909CF89875;
	Thu, 13 Jun 2024 18:04:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF503F804D6; Sat,  8 Jun 2024 16:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBECDF8010C
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 16:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBECDF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tNqVTQ8a
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eacd7e7b38so31409891fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717856754; x=1718461554;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+gj0SmC1PoTcli5BQbTODDKqk+ID3Z3diSDATwSgKs=;
        b=tNqVTQ8a0Wu8EtzAFlgKcJd/6hayWX6povPir8/3DKQOPj538RxE6UfNKPVbDAJdJR
         vJ2hx9jD5hcBcT6ajJKCih9sQLfrwalVZSxncX6ZVT2IZVZDtqo1D+bErlNRL8qDP6XP
         7tLYkdZHGZlaTUt/WTpKChAvOFLSE1o/3lzCRsrpOJYb4wSTnKcQtXdtgGFYJgsL2T4C
         idBy5WNQEL4IA+bYh7vzYWnDvovCu04IwOgUrMAcIJ5n7xUEpOhJHGGEIyo9b8GINlrl
         Pw3T753VxGJ2rnf2Jc7CF9BQ2DhSDG78vYlVf9SOhCaBugn3wyBgFjiXkUOvA1Ljqq/l
         Oopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717856754; x=1718461554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+gj0SmC1PoTcli5BQbTODDKqk+ID3Z3diSDATwSgKs=;
        b=ULl+3ZwrVzo3UdH/dBmTNx4C/89MLwSfghKYYehIyFMrcTHgUD6djzRetyEEiqVcph
         LNSJDh1z7d9eFemlRG8yuos1IDsbjHJiHVkJ7JIV8TwUwjsXpCSHAnurJOiU44zi58Zo
         SVSkeywzAmUN7FOQTKlyxZELo8ND5FPuxb8wVb7BePirZltl2wRkaqfMQPFOj8YFpdk/
         eqI/56f93SeLspNzB27vz3kh1ZKLtoAXa2pLr+J09+O9o7vDFZcZbaKPmqGTdyhpvWjo
         HDqXxQnrLlTnju447dtZaT8Cw2lbARiIB3miVzKbfp+o1O8vqpsWmMcKtiNvFlmHsrHB
         nr/g==
X-Gm-Message-State: AOJu0YzU66FrcnLjiSgYBn6cG+3SSidwXLhUjummOwm56ppmzzcur1H3
	5lOOBDvCQzgC6P/jALf5+j0K9AUsSmD4fqguVQGv7Qz37zEJXogcNraxFmfnZ8Y=
X-Google-Smtp-Source: 
 AGHT+IEEwkNKsyRLFY7Bip67TCu6Dc41IjXfDjVU8V3MsUNv8v0Q1ufikfHCULXN9bq+QCDigERDxA==
X-Received: by 2002:a2e:998f:0:b0:2eb:cdb4:e83e with SMTP id
 38308e7fff4ca-2ebcdb51977mr13270131fa.24.1717856754001;
        Sat, 08 Jun 2024 07:25:54 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158102af1sm119628895e9.16.2024.06.08.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 07:25:53 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:25:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: fsl-asoc-card: Add MQS support
Message-ID: <70bcb8bd-e1c4-4680-9309-476b4a9cb181@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OLTWBJ3NKDO35ZAX23YJPMYLEUPL3T5A
X-Message-ID-Hash: OLTWBJ3NKDO35ZAX23YJPMYLEUPL3T5A
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLTWBJ3NKDO35ZAX23YJPMYLEUPL3T5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Shengjiu Wang,

Commit 039652a5b965 ("ASoC: fsl-asoc-card: Add MQS support") from Jun
17, 2020 (linux-next), leads to the following Smatch static checker
warning:

	sound/soc/fsl/fsl-asoc-card.c:796 fsl_asoc_card_probe()
	error: uninitialized symbol 'codec_dev_name'.

sound/soc/fsl/fsl-asoc-card.c
    542 static int fsl_asoc_card_probe(struct platform_device *pdev)
    543 {
    544         struct device_node *cpu_np, *codec_np, *asrc_np;
    545         struct device_node *np = pdev->dev.of_node;
    546         struct platform_device *asrc_pdev = NULL;
    547         struct device_node *bitclkprovider = NULL;
    548         struct device_node *frameprovider = NULL;
    549         struct platform_device *cpu_pdev;
    550         struct fsl_asoc_card_priv *priv;
    551         struct device *codec_dev = NULL;
    552         const char *codec_dai_name;
    553         const char *codec_dev_name;
    554         u32 asrc_fmt = 0;
    555         u32 width;
    556         int ret;
    557 
    558         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
    559         if (!priv)
    560                 return -ENOMEM;
    561 
    562         cpu_np = of_parse_phandle(np, "audio-cpu", 0);
    563         /* Give a chance to old DT binding */
    564         if (!cpu_np)
    565                 cpu_np = of_parse_phandle(np, "ssi-controller", 0);
    566         if (!cpu_np) {
    567                 dev_err(&pdev->dev, "CPU phandle missing or invalid\n");
    568                 ret = -EINVAL;
    569                 goto fail;
    570         }
    571 
    572         cpu_pdev = of_find_device_by_node(cpu_np);
    573         if (!cpu_pdev) {
    574                 dev_err(&pdev->dev, "failed to find CPU DAI device\n");
    575                 ret = -EINVAL;
    576                 goto fail;
    577         }
    578 
    579         codec_np = of_parse_phandle(np, "audio-codec", 0);
    580         if (codec_np) {
    581                 struct platform_device *codec_pdev;
    582                 struct i2c_client *codec_i2c;
    583 
    584                 codec_i2c = of_find_i2c_device_by_node(codec_np);
    585                 if (codec_i2c) {
    586                         codec_dev = &codec_i2c->dev;
    587                         codec_dev_name = codec_i2c->name;
    588                 }
    589                 if (!codec_dev) {
    590                         codec_pdev = of_find_device_by_node(codec_np);
    591                         if (codec_pdev) {
    592                                 codec_dev = &codec_pdev->dev;
    593                                 codec_dev_name = codec_pdev->name;
    594                         }
    595                 }

There are a bunch of ways that codec_dev_name can end up uninitialized.

    596         }
    597 
    598         asrc_np = of_parse_phandle(np, "audio-asrc", 0);
    599         if (asrc_np)
    600                 asrc_pdev = of_find_device_by_node(asrc_np);
    601 
    602         /* Get the MCLK rate only, and leave it controlled by CODEC drivers */
    603         if (codec_dev) {
    604                 struct clk *codec_clk = clk_get(codec_dev, NULL);
    605 

[ Snip ]

    789         /* Initialize sound card */
    790         priv->pdev = pdev;
    791         priv->card.dev = &pdev->dev;
    792         priv->card.owner = THIS_MODULE;
    793         ret = snd_soc_of_parse_card_name(&priv->card, "model");
    794         if (ret) {
    795                 snprintf(priv->name, sizeof(priv->name), "%s-audio",
--> 796                          fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name);

Used in error handling only.

    797                 priv->card.name = priv->name;
    798         }
    799         priv->card.dai_link = priv->dai_link;
    800         priv->card.late_probe = fsl_asoc_card_late_probe;
 
regards,
dan carpenter
