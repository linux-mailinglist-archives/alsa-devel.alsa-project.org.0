Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC87D86A0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8EE868;
	Thu, 26 Oct 2023 18:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8EE868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698337333;
	bh=+Si/CyTN/xSyWonXsNSbqEhocZV5OFh8GKcyX8YCavk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=marVFmnyc/OBUyGVnHoIHhD4y5oqxnITKpwiU38rgh6jaCgmUPxWHNi31OUG/FUCW
	 nA6T3lPIxdsaZ5hTPoMnPcfKYP3ZSgFIY9e2GJV9ud1uQTcIRv19j8/5XkEmpVcdq8
	 C7f4RSXvV/q5JDIKFRiOuQWL0K7q/Df64vWjsiyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD47CF80224; Thu, 26 Oct 2023 18:20:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DED3DF80224;
	Thu, 26 Oct 2023 18:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE52AF80165; Thu, 26 Oct 2023 07:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89DDBF8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 07:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89DDBF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gklcwgDd
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so4052555e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 22:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698297437; x=1698902237;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUQ+Vpna2x7DpdtAUScMRJOjws7VHwu7u1XHQ/05Dz4=;
        b=gklcwgDd3AKdpXEfdGYEJcIyU3vKkc6+Z4l00FCe+MmDAuGRwChoF2xN4DcFaq3XeN
         p3IJeIRTpqW0agRb48opJzh9zJgPWn05ZS79SlGmFnZAWcxyp7wSuTK0poFAnBb9Pght
         9fu79+47MepOdzNGsEgVFD+pw8kepqFBxrCFpHli0gGm82RmYxGIlLpJoG4pwCr0wE8C
         HvWE51Zmhf+CTJfD/FeUn3xIU1UPF/TGxOj72f80jX4ZRt8tnw90O9izhmXyT4TzIEHp
         JRtowgq6I2VAD92ousKqA2h3+1VCGRo5hgfa8sNJ/o1cFw5kSUMOCMWXOainPqiq+gNG
         Yh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698297437; x=1698902237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUQ+Vpna2x7DpdtAUScMRJOjws7VHwu7u1XHQ/05Dz4=;
        b=FIM4GMAS/GMHEGCoS9IZ6Jnn2JO11Pr3v52jf2GhNu1wdLoN8wABj/GUZf9n3cHIiw
         cTzxnYnQI4oDIxA1VfdtjlKTE7k6GITkPuTdwd6rKxDrczeTlsKlr/SaZelHx2jw5GmQ
         bWi5U7xDF7bzi1BfHEmtTfygOtVtXIVOtBi6mPxhHzx86nws8YO4c1Hp8zwW12p0M4R3
         4Yxb8xD6s3mKn4xHmNMB0EIFyXLoVYYwCnNDcqGl4yF7HnRU70H9HqshjJZ6I4PStw5G
         a0nk/tT94GijMshZu9aIx3zpIIjMTy9qPZvNugWPcGbWrBldkIciOpB+A0FDhbPejYGx
         Z5kg==
X-Gm-Message-State: AOJu0Yw1hcIc3JNK6UsQ4BnJK1e/QUNzneSsqZOL3v5D2MfEBcPHK9Xp
	iXy2DujQcxtD+/o4pe73iqWduA==
X-Google-Smtp-Source: 
 AGHT+IERqiX4xYl1Bkkzvu0acBzraatyda2+o48d0ur8eaxHldjVWx82dILfnQyP4fkISSy3SttH8g==
X-Received: by 2002:a05:600c:1907:b0:408:6fae:1aae with SMTP id
 j7-20020a05600c190700b004086fae1aaemr10904585wmq.31.1698297436887;
        Wed, 25 Oct 2023 22:17:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y1-20020a05600c20c100b0040648217f4fsm1458924wmm.39.2023.10.25.22.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:17:16 -0700 (PDT)
Date: Thu, 26 Oct 2023 08:17:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: s.nawrocki@samsung.com
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: samsung: i2s: Fix multiple "IIS multi" devices
 initialization
Message-ID: <9c6183d5-83b6-4ff8-8bc6-ab3a3e31a922@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W4YVZJNTOCKQOOEBU5W4B34M7A5IEGCA
X-Message-ID-Hash: W4YVZJNTOCKQOOEBU5W4B34M7A5IEGCA
X-Mailman-Approved-At: Thu, 26 Oct 2023 16:20:50 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4YVZJNTOCKQOOEBU5W4B34M7A5IEGCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Sylwester Nawrocki,

The patch c6bebefa2f06: "ASoC: samsung: i2s: Fix multiple "IIS multi"
devices initialization" from Feb 19, 2019 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/samsung/i2s.c:1381 i2s_create_secondary_device()
	info: return a literal instead of 'ret'

sound/soc/samsung/i2s.c
    1350 static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
    1351 {
    1352         struct platform_device *pdev_sec;
    1353         const char *devname;
    1354         int ret;
    1355 
    1356         devname = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL, "%s-sec",
    1357                                  dev_name(&priv->pdev->dev));
    1358         if (!devname)
    1359                 return -ENOMEM;
    1360 
    1361         pdev_sec = platform_device_alloc(devname, -1);
    1362         if (!pdev_sec)
    1363                 return -ENOMEM;
    1364 
    1365         pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
    1366         if (!pdev_sec->driver_override) {
    1367                 platform_device_put(pdev_sec);
    1368                 return -ENOMEM;
    1369         }
    1370 
    1371         ret = platform_device_add(pdev_sec);
    1372         if (ret < 0) {
    1373                 platform_device_put(pdev_sec);
    1374                 return ret;
    1375         }
    1376 
    1377         ret = device_attach(&pdev_sec->dev);
    1378         if (ret <= 0) {

Huh.  I'm not sure how device_attach() is supposed to be handled.
Here are the return values.

 * Returns 1 if the device was bound to a driver;
 * 0 if no matching driver was found;
 * -ENODEV if the device is not registered.


    1379                 platform_device_unregister(priv->pdev_sec);
    1380                 dev_info(&pdev_sec->dev, "device_attach() failed\n");
--> 1381                 return ret;

So in this case we printing that "device_attach() failed\n" but we're
returning success to the caller.  It might be correct, but if so then
it should have a comment.

    1382         }
    1383 
    1384         priv->pdev_sec = pdev_sec;
    1385 
    1386         return 0;
    1387 }

regards,
dan carpenter
