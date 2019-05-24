Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648CB290D5
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 08:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0AE01698;
	Fri, 24 May 2019 08:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0AE01698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558678545;
	bh=GWs3k7fuxtIDlZNcJ0fbsamhNN04qjOqzv85iTZOcuA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hssDDQQmrNhhMtXcf92NmxesZ6ZlwrH7VtZMBBOrhZz+D90k00d4n+DEQwbf+G7ZC
	 fgEpBOt8XHutqk3U2lC0P9Ueuq9ek7PJF4vhS667AfDuDphprtbcVS4UicfYJKiDAR
	 CSAAHx75FPXjScCrDuX6VUtF9aotYApsI1Wo5vH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59416F80C0F;
	Fri, 24 May 2019 08:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCF2F89674; Fri, 24 May 2019 02:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE170F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 02:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE170F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WIkbsY/T"
Received: by mail-pl1-x641.google.com with SMTP id g21so3445435plq.0
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=vq5OscFiBg+c2cP1NzGhhjMT3RLQCBEIhZHhvje2x5I=;
 b=WIkbsY/TDaVPI5z60Tn4ATxrtlgyarhuhzGl7tFy847LWwZlvijIngLI0XMBE9qCDb
 pSWLCeQqhHiem7oNeT9m0DChmWEfd5DeLjg5K/Sj6NBAxypME8zGxfHGd4UfxoojMpye
 qcRyjJropK5H1rp1yTvykFcrd2dxylvmLkk3ga1NZXe8PFOmdpzBxJTZeDuIvktKhwsR
 6uOraw9mlBinMu3w9myx+pjNB1C0+JcmVS2XOdmhNikr0cZOXnvrF/B+GOMmw8o3INqg
 YB27G/Znkl3oBugcnN0yqr4hwZnSnvZ5NjN0ExmeabwWdmNXKpfyKgHRsGJCZagUh9M8
 s4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=vq5OscFiBg+c2cP1NzGhhjMT3RLQCBEIhZHhvje2x5I=;
 b=cm21RNBKGmJ6KFAWmsgLzjtytpAMqWlr0VnI+VYlySl6hw2+VjGdgJKqL7ICVFFBN4
 GhkwdUB/nYfjp8GdfPNagTn6h0x0OGMzCIapcDu3sR9G7GKYI0BOn3e++l679r8ouVAV
 YXn/RgrHXvKZLF8V8d5UapVyPVtWcfE79rLC6PSmsEaNTYupD+yCXRcQqBIl6NIg0eso
 9ObeoCLHKm6APoWTxtXlKkc9vu24U/njCHzYPIEqsuoxwbrQ40PUHCbNWti0Bf1m7tjl
 00tcasJWmnIqB9+EoR0hybR1CPEvvS8W2t3CIhTN2L4ikOU0R7RvjLK5sMtOYD18OPPi
 DctQ==
X-Gm-Message-State: APjAAAWyFiXc3n3UokkZrLiuAovScnuCnV0BgjikhwGkuXfnPYOgOUXT
 PYbo9Md3Bb2bkFiS4uSirNc=
X-Google-Smtp-Source: APXvYqyF047YsIZEkBz6n7WubO3vjZO5g0ZmOj56HpzuyWWN8qDAIdjpPPReYmER77uDaRH+jsnurw==
X-Received: by 2002:a17:902:59c3:: with SMTP id
 d3mr30818966plj.273.1558659033669; 
 Thu, 23 May 2019 17:50:33 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id d4sm468985pju.19.2019.05.23.17.50.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 17:50:33 -0700 (PDT)
Date: Fri, 24 May 2019 08:50:14 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: lgirdwood@gmail.com, perex@perex.cz
Message-ID: <20190524005014.GA2289@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 24 May 2019 08:13:59 +0200
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
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

In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
platform_device_alloc(). When it is NULL, function returns ENOMEM.
However, 'machine' is allocated by devm_kzalloc() before this site.
Thus we should free 'machine' before function ends to prevent memory
leaking.

Further, we should free 'machine->util_data', 'machine->codec' and
'machine' before this function normally ends to prevent memory leaking.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 864a334..295c41d 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -86,7 +86,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 	machine->codec = platform_device_alloc("wm9712-codec", -1);
 	if (!machine->codec) {
 		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto codec_free;
 	}
 
 	ret = platform_device_add(machine->codec);
@@ -127,6 +128,10 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 		goto asoc_utils_fini;
 	}
 
+	tegra_asoc_utils_fini(&machine->util_data);
+	platform_device_del(machine->codec);
+	platform_device_put(machine->codec);
+	devm_kfree(&pdev->dev, machine);
 	return 0;
 
 asoc_utils_fini:
@@ -135,6 +140,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 	platform_device_del(machine->codec);
 codec_put:
 	platform_device_put(machine->codec);
+codec_free:
+	devm_kfree(&pdev->dev, machine);
 	return ret;
 }
 
---
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
