Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BA693B1B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 00:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AF1208;
	Mon, 13 Feb 2023 00:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AF1208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676244218;
	bh=kGeLRXiDa7knz098hWBa2d+OHQJhxhdOFcYAKDs1eXo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uWyHwtP7O98UUF5opC472CKR/+gKI5R6bP0t/RTgUXTD9yGcc60nBo1IQkrqh1Wxd
	 qZ2PLqljV4rkE8V+fWZpW34ExQLZVQTcOnb48NIssTRo8n5eIOSburZayosCVIBy+7
	 tR2nrc9MoALoJHCwLSdj+vNK+qTLHhwkNrl17kfw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C7D4F804DA;
	Mon, 13 Feb 2023 00:22:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CCF6F804B0; Mon, 13 Feb 2023 00:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BFCFF8012A
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 00:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFCFF8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d2gSMSWK
Received: by mail-wr1-x42a.google.com with SMTP id r2so10465802wrv.7
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Feb 2023 15:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/zdHwH2kmbWZySL0e/UmcJFCdqPH/8nI1Dh4bwAor4=;
        b=d2gSMSWKgND/nrlDKUGFXD0dubydZVkf3ZciHrhn1inExzjHq4ytLJ/jhLykgwq/nf
         xV+794A4YFe39C52lK/zWOMcAF0qh4mLg14ppqKQjl1f26zI5w9kkjQszSsJLwPxiGZ7
         peM4ihF2n3y1tJPuQq5ZGi/Piy4av/2vvvZZGjkPdUpT6F1c+23rsspc88Zk/PXgKp+5
         3JDQe23qsd16cQtKCoUlSqOxOKoGzWeax1qK0PXTMxgdZQQBRGvOG9sJVXaaX1cmemPg
         3E2dkoPAZE6OlDx4CbnEYMD6Ht92G+imln8ekpBKGYOIvo1yOUXx1sFVK93tCm5D3ytU
         f1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/zdHwH2kmbWZySL0e/UmcJFCdqPH/8nI1Dh4bwAor4=;
        b=xHejbr6bniixS5CpqFQOfMV6ifZmjf1MiYaa3+Gwpbo48p8SbSS+DTlf8uhPdPlybb
         /yZo0/n2mFk4knl0EBLxrAcqsSmZ1nKtMdxR1Gf9DOEX5+8NLxYTG7rAe2C+0Fol2LQl
         BZpKNzkJdseK/w/Q7XK9yeMAJJ8YdnkjYP6LGQ8W1+oY75uiHE51vZwShltnrC+cGA4g
         6ReIbWmb+1Of5ZheNl58RK80SQ6izTjkiZjzvIuH42noNemfZFwaJEShpOCR9vzfgQdG
         TXheKcErqqJ8d9CIVWP/LP+qT+C5onCFVDkV0ztyaoJ0+eMtlVn4Yn8EuBj2vB84IgnQ
         sIdg==
X-Gm-Message-State: AO0yUKXUwxHkdDctrrsycqxZZDaEh42M6q1xXHuTWUQLGwegb5WyPise
	pScei5gXpKrm3WyX2zCRjQo=
X-Google-Smtp-Source: 
 AK7set8OJKW9fiAW/UVEhR5z3lBBDIr+kE+QjnSfBHt2UipMTB4J6+ZDbyhynEQBj6z2qsLEAxvdVw==
X-Received: by 2002:a5d:4bc7:0:b0:2c3:ee83:5195 with SMTP id
 l7-20020a5d4bc7000000b002c3ee835195mr22327804wrt.29.1676244102139;
        Sun, 12 Feb 2023 15:21:42 -0800 (PST)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 m9-20020adfe0c9000000b002c3d29d83d2sm9210624wri.63.2023.02.12.15.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 15:21:41 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: ep93xx: Add OF support
Date: Mon, 13 Feb 2023 00:21:37 +0100
Message-Id: <20230212232137.299005-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J3H4PZBAI453QI3HDIXRHHUXADVBKEU7
X-Message-ID-Hash: J3H4PZBAI453QI3HDIXRHHUXADVBKEU7
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3H4PZBAI453QI3HDIXRHHUXADVBKEU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the new cirrus,ep9301-ac97 and cirrus,ep9301-i2s compatibles.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/ep93xx-ac97.c | 8 ++++++++
 sound/soc/cirrus/ep93xx-i2s.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 37593abe6053..fd7f6b3a5317 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -430,11 +431,18 @@ static int ep93xx_ac97_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_ac97_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-ac97" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ep93xx_ac97_of_ids);
+
 static struct platform_driver ep93xx_ac97_driver = {
 	.probe	= ep93xx_ac97_probe,
 	.remove	= ep93xx_ac97_remove,
 	.driver = {
 		.name = "ep93xx-ac97",
+		.of_match_table = ep93xx_ac97_of_ids,
 	},
 };
 
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index f41712df7994..3c6fa8e23c52 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
@@ -505,11 +506,18 @@ static int ep93xx_i2s_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_i2s_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-i2s" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ep93xx_i2s_of_ids);
+
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
 	.remove	= ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
+		.of_match_table = ep93xx_i2s_of_ids,
 	},
 };
 
-- 
2.39.1

