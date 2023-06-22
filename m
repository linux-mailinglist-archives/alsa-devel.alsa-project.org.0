Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE5873DD1B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6CB83E;
	Mon, 26 Jun 2023 13:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6CB83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778242;
	bh=2rT8kLRbFAZ53z/xuHc/r7vMzcnuNTjzcmIsA4Dp3h4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A9lC0m2VxFLZU1nB7ozAQpeXLpnmf4F52dSLSqUDoacIhQc5zepuB8rXO3daorcg0
	 GbHe/TpBZ5gt9TLN87BquWzGSaxycrC9hTrLq67jyjLPFpGthJx/VHPJ9hbKxj4uYF
	 F7R0V8hRPEGZ3A0nYtEyDXJXOnIwUQRKUD85lS14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6CAAF800E3; Mon, 26 Jun 2023 13:16:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81012F800E3;
	Mon, 26 Jun 2023 13:16:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74026F80141; Thu, 22 Jun 2023 17:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F4ABF80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 17:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F4ABF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BiWlZL2W
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fa71db4208so8841105e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 22 Jun 2023 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687446451; x=1690038451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmPKoAkPkH2OG308+PMwW0FpK5flWUMphUg8wo9BFIc=;
        b=BiWlZL2WfEVqtefAm74gDhLj0Qt7lo3leLjFR9tEqljSr2NmqwKiM8kCl0bgghk1fo
         QtAvRp4K/81aqnkm9LxXYcf3xaXsm7xA49sQObtE8SC+gt9a6rzyb00xvBsuvl4PdNWS
         l8/kvktN+R8xXg44912qYJzycoPcCB5OY5WCviNlN0kegGpdqpWRy8U6tWthVbzk6rYk
         LBq+Sgc3hccHM0NjngQcLCzbkZbI1d4dRZNO7uObSrhGwc1ddSh0XHQ9xHPBP0OJAtz6
         x0MPE9uceVmGdh8TXRh03h32l01OKnakmMJQ+VRtjK9YAUJGSi6uw85lnnhGRvKGmCJ3
         m93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446451; x=1690038451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmPKoAkPkH2OG308+PMwW0FpK5flWUMphUg8wo9BFIc=;
        b=Q/rpdMdhzLg/2e6VERAOOqtuCY1NduU1+BCErlBSJOJ0zkLybdbK9WQB3xZ1R1PkMt
         HBhHxp2tphnHhSM8Wjha0fjV98PUPDycJvh4vZSvGNCM4tpSfu8+h79XSIbegSkhT+X5
         JrHeQ5z5LhajevOtaHro1GrMLA2ZIqhp5Z5qW3WJMgzLekFFcJNRo6cVWQas6HNfhEFk
         7Nl1w9CJpjcRW/C9GMTeOnOdo/RL9krP6XVqis7Rr7TyJDEXnytUAZ2nzwULa9ty5M68
         VLRk99p7oBpTuKimCL9Co1F8nvHIlJ0vN0gKatGdPd6yFB21Od9pHL/duhCCtopVJsSU
         9BjA==
X-Gm-Message-State: AC+VfDyXNjP5z0foXG0GBSGlPdpb1FiXtFkb64Ng7zQd8FNmIKtuXHV3
	SqC+3vIHVcsu4IfDvXXDsZKZtIFUVyuVxIowYIM=
X-Google-Smtp-Source: 
 ACHHUZ44diC0v2c/90W56UO2anGXMm2EScSZjf8rYClomzBLATcaqoSoswtdUz05FLaYwIjfhf0NPw==
X-Received: by 2002:a05:600c:2046:b0:3f9:b3c9:feed with SMTP id
 p6-20020a05600c204600b003f9b3c9feedmr2139349wmg.13.1687446451514;
        Thu, 22 Jun 2023 08:07:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 q20-20020a1cf314000000b003f8f8fc3c32sm8100276wmq.31.2023.06.22.08.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:07:29 -0700 (PDT)
Date: Thu, 22 Jun 2023 18:07:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 13916275206@139.com
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: tas2781: Add tas2781 driver
Message-ID: <5e37bcfa-50d9-45e8-8a68-52438a5a8dc6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A4ADJPL5WAPZGZFNIX3GUZVFHQXYOMRV
X-Message-ID-Hash: A4ADJPL5WAPZGZFNIX3GUZVFHQXYOMRV
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:16:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4ADJPL5WAPZGZFNIX3GUZVFHQXYOMRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Shenghao Ding,

The patch ef3bcde75d06: "ASoC: tas2781: Add tas2781 driver" from Jun
18, 2023, leads to the following Smatch static checker warning:

	sound/soc/codecs/tas2781-i2c.c:651 tasdevice_parse_dt()
	warn: assigning signed to unsigned: 'tas_priv->ndev = ndev' 's32min-s32max'

sound/soc/codecs/tas2781-i2c.c
    602 static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
    603 {
    604         struct i2c_client *client = (struct i2c_client *)tas_priv->client;
    605         unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
    606         int rc, i, ndev = 0;
    607 
    608         if (tas_priv->isacpi) {
    609                 ndev = device_property_read_u32_array(&client->dev,
    610                         "ti,audio-slots", NULL, 0);

When we pass NULL to device_property_read_u32_array() then it returns
then number of items.

    611                 if (ndev <= 0) {
    612                         ndev = 1;
    613                         dev_addrs[0] = client->addr;
    614                 } else {
    615                         ndev = (ndev < ARRAY_SIZE(dev_addrs))
    616                                 ? ndev : ARRAY_SIZE(dev_addrs);
    617                         ndev = device_property_read_u32_array(&client->dev,
                                ^^^^^^^
Smatch is concerned that this value can be negative.  But actually this
sets it to zero, doesn't it?  Is that intentional?  It feels like we
should leave ndev as the number of items.  Or if we want ndev to be zero
do "ndev = 0;" on the next line.

    618                                 "ti,audio-slots", dev_addrs, ndev);
    619                 }
    620 
    621                 tas_priv->irq_info.irq_gpio =
    622                         acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
    623         } else {
    624                 struct device_node *np = tas_priv->dev->of_node;
    625 #ifdef CONFIG_OF
    626                 const __be32 *reg, *reg_end;
    627                 int len, sw, aw;
    628 
    629                 aw = of_n_addr_cells(np);
    630                 sw = of_n_size_cells(np);
    631                 if (sw == 0) {
    632                         reg = (const __be32 *)of_get_property(np,
    633                                 "reg", &len);
    634                         reg_end = reg + len/sizeof(*reg);
    635                         ndev = 0;
    636                         do {
    637                                 dev_addrs[ndev] = of_read_number(reg, aw);
    638                                 reg += aw;
    639                                 ndev++;
    640                         } while (reg < reg_end);
    641                 } else {
    642                         ndev = 1;
    643                         dev_addrs[0] = client->addr;
    644                 }
    645 #else
    646                 ndev = 1;
    647                 dev_addrs[0] = client->addr;
    648 #endif
    649                 tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
    650         }
--> 651         tas_priv->ndev = ndev;
                ^^^^^^^^^^^^^^^^^^^^^
Warning

    652         for (i = 0; i < ndev; i++)
    653                 tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
    654 
    655         tas_priv->reset = devm_gpiod_get_optional(&client->dev,
    656                         "reset-gpios", GPIOD_OUT_HIGH);

regards,
dan carpenter
