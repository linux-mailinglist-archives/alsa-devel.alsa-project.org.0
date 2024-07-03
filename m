Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C639258C9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4768F162D;
	Wed,  3 Jul 2024 12:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4768F162D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720002973;
	bh=Ya6oXVz+9PSgSZgNYuY4CHXoSmhTuQFovgLfaTWUMXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LGeoOCS7vjKsbFwHloZTG3WlgTHqPcNt25K+lgFPNJk91Dvy5Qf2Ny3vrvkh+83VI
	 R9PEkgJ8Wfz8vMwC1k9FiJzxkNeor4N+fQfRQyIwk1CAVX6ve5KJdeSv8SUCJYEOPT
	 nLGl4t+2sJSeLkzUJeoFtidZLnyEpOx6cBuhDkSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF04F805A8; Wed,  3 Jul 2024 12:35:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70663F8013D;
	Wed,  3 Jul 2024 12:35:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A24F8F80272; Wed,  3 Jul 2024 12:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 914D4F8025E
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914D4F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Nco+27zy
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a75131ce948so493572566b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001783; x=1720606583;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWGT3G4dbfhnZE1xyRO5OpmfX9c0autS1uaNaBcB/Mc=;
        b=Nco+27zyPUlE61z2tHSteIM2GKrySj5o+zQ5nW8cXedmesWxhVaHzt1kOlOCZVfckC
         xGhHXFp6ePPFtSfF1TRYqke8xwELHDka7ySi40CrT6HhVHyubpYcDtanOy5VjCNUTAK7
         CZaoqtNQWkPMqPHjcU3UMNXZ6lQKM6I8z/wbGkOSyEWeXcVrP8kvp6OkbGbep0KtY2Vb
         1ybFaEJiUT2ia7EhFfUeanvL2ZMLNxi2iXpo84wmhv+XXKLWJ5SEQpt2axaJm7bcdHYr
         eoII3VvgTfm4jO2AMIKgBhKEn5U6+jkb5q8jZH7NuMA/7ia/Qxb1H8+YC347KDqi7tYV
         +PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001783; x=1720606583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWGT3G4dbfhnZE1xyRO5OpmfX9c0autS1uaNaBcB/Mc=;
        b=QJUSDlmximX1pHsd9XkdV6Ann4yJ1sG3oN+LK2eBX+m3tl/ONmpA8+/Edzc+jmaWv2
         u7D+x1gRezDNZXDjZWWL6Q2Zq7Ow5c2mjCWqw96xzzLl4HjoU+tTSWoHQIJd7AtdvXv1
         nCL7Xl+20Ga1NFurxauyBFK3I/g2Lmtno1ZjFYhSctvyovq1bWREVz/QoT5sL4Nl0eYV
         R2EnQLi7UBD6abwMNDbphWriXfBchxVkBJEndogYEXTQVSw1GfV7GIyy8IWBLA1/r16q
         V8MtgQKFd+RwzUy7+65GC8cbk7g9W59ZSfFr3s86kXIcfUb6kNQWrPthAV2ZY7ChFFfh
         5KZQ==
X-Gm-Message-State: AOJu0YwnlGAnK9ydtWiaFa9hfYURgDlHS7MZhRmbpYjYxltABQCyYOIk
	eYqrViUB2po54O5EQ96UhO0KWIukN0sc4Eow+pNSgk5N2bGc3X76rTt3nsmUa14=
X-Google-Smtp-Source: 
 AGHT+IHeLDjC6kF6SJTtMZmIDChVrcMjHv7cKLOslnjJZSeDu4JK3THQHeWo35I65yYU6QzYBGe/2g==
X-Received: by 2002:a17:906:d78a:b0:a72:797f:cf6b with SMTP id
 a640c23a62f3a-a751441a667mr684555566b.14.1720001783179;
        Wed, 03 Jul 2024 03:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:16:01 +0200
Subject: [PATCH 9/9] soundwire: debugfs: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-9-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ya6oXVz+9PSgSZgNYuY4CHXoSmhTuQFovgLfaTWUMXo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTppdI1vWEUj6KaRTVA6Zs6vstWpcqLtIv+K
 waN3oowU8eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk6QAKCRDBN2bmhouD
 1zl7D/wMjbC9AmoPa2axlSVFNvUY7r8vuhRS+DbdDe8mpxB8IgQ0rJLwE79UYI6y2V+XB1M/OUr
 pnpEjT8oO1ReWJZ7Vsjj4afpKFwsE7rVsA1vaY5u2WQ/BH6ffgbqTLnywnI21WzG3sYV+/2WUoR
 uqOFoBoKwJqpP/J/lHojAT3lzh3sYmONwr566zGBEwdZ1C2YFYdxFOShtYoMPMNuURyykRGZqBo
 AMof/wpz5ye4HhCObCYiLgWzf8WpN20aEWB3Uu7UOBSkZEh9Ulv2uSmI7Mpz1QUvZbJi7g8jclU
 NChJjptEkFASqpAR9Yn+tB5jTjLVI3/WGRwjQz7kpdzjZgLpGRillyKU2tW22cowqWjJa3m2Ms0
 Ko7JZSxhpB4nM1uToQq4mAA1wBLeekdT++gZHXbysR1hhlo/RlvMaIyA0NuC6sSVXI2alJRACCZ
 4PablAUl2DVblPVLf87ps+coOxUZxvTwnOys1tGN2SpR2ezfB8U7AdZZw/OPFeoTH0Er8tsSne/
 qvPYHgo3Ik/5cHU4OPozojj08uYxsh/xLgB8p4zPNqjgxt6GemeS95mJalFykAgOI6Ln+Xn2VYH
 M+Nt0CLbW5HwF3zwMFn7TP6+lGun/GtytwDffA6VKIpcsqdfQXle0rWej35Jbv+t/TRV4vPP49Z
 cyYnyniEZZzVm0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: O766S4ZXBFXBJBHPG7TFUOJC27I6JPLW
X-Message-ID-Hash: O766S4ZXBFXBJBHPG7TFUOJC27I6JPLW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O766S4ZXBFXBJBHPG7TFUOJC27I6JPLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/debugfs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 6d253d69871d..c30f571934ee 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2019 Intel Corporation.
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
 #include <linux/firmware.h>
@@ -49,18 +50,16 @@ static ssize_t sdw_sprintf(struct sdw_slave *slave,
 static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 {
 	struct sdw_slave *slave = s_file->private;
-	char *buf;
 	ssize_t ret;
 	int i, j;
 
-	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	char *buf __free(kfree) = kzalloc(RD_BUF, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		pm_runtime_put_noidle(&slave->dev);
-		kfree(buf);
 		return ret;
 	}
 
@@ -132,8 +131,6 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
 
-	kfree(buf);
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(sdw_slave_reg);

-- 
2.43.0

