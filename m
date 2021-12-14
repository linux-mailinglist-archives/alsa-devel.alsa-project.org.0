Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294D473AA4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:14:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF651B07;
	Tue, 14 Dec 2021 03:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF651B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448059;
	bh=cWMKclLetnQ4nEG8blJfRtuedkCCneiW+He8XtSRpKI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWMGxSqdvA0c8l1FSRB34Xzf4UN6wxfF8dpF5wJuQy+kWDySI2O//XCEl5AqZTRlA
	 rNKS+kNf9wyFVhq7r83kMOO61ejxqUr63stcEW6cePhz2RYj6VsU4YckFeLFSHD3ZY
	 2ABC/XWgN0e2OcOcZv8H+vOnH4dV9TbLHu8GU7Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E60F80571;
	Tue, 14 Dec 2021 03:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C2FF8053A; Tue, 14 Dec 2021 03:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24879F80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24879F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="caIKRaMo"
Received: by mail-pl1-x633.google.com with SMTP id y8so12526754plg.1
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y3U6EO3Kv52WedIYXbB5QoypP7cCOcmuUvXM3OH97mE=;
 b=caIKRaMogK783EiMlj8wRs4QX+IxjpfpU5FqAdWXGTyGafzOroPc07UkzVirDl4WgX
 JFZP0odbPNe10zfrEEe7DatJ/0yHnRAd56rPuUWAY736ka5H7yq/qgROb1A+6ZVA3gp0
 tfRdlLpxX21v8kI6jAxiNlLnqQwZ3GEgYK4LPHuIh5Fl9UVCHWxjj185UHiBJLJLMWYP
 QyV4uUL1UfugmTOHEoeDL8OA3nzkvdIzEUnQRORE08mRlNAN6DmC5Fyd+Uit568dufXL
 8iImH4dk0cCjtDiuj5NwYJVtwqLBDRZGN7ndF1LYrWgUPJbN9TLwJkFqoYLPLscGxEDN
 ZFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y3U6EO3Kv52WedIYXbB5QoypP7cCOcmuUvXM3OH97mE=;
 b=3Lur3wJ6PvWRPi92W7cLJbY9+1z61ghg5TswdH9AJiU6x2wvEAbOvBBlTkXrEmTuio
 SJvCOyOe4JxutNO+A1ft6rNyj5GmeVgV/1forTgIA96r03avkFFuXbH65ujeNTH8vuKx
 HdeqQJ2wifhV17s0BkRssD2d1tjy+wEZkW5UqapNrCvuL+f5uA3HzzXlCLr6Zf7C6zHp
 eY4xwi/cT1lwMZlzZ2/V8meuIDQyYwukyCCqwEdKNl0MpzyDpp51gDnI0UdONDa7Fjzq
 UmvT6E3nnlBnipbs7Yc7/zuIWJQMWWptU7nFECdXH5meN6vY7uAiYdTMZdiZITQiq3iJ
 PmLw==
X-Gm-Message-State: AOAM533ET80OOJ/taWxlL2B2msK5q5KDfQZxiepZByY6oErElZmwzjy1
 aMxoDv8jpOaYeSadJrb9ym0=
X-Google-Smtp-Source: ABdhPJwCl6y0cXRiZTZ1G7j0aKerKTbWYPVbwKbPLSEcNBooIYJhID2PohPfnlAbOx8m086d1AwqRg==
X-Received: by 2002:a17:902:b94b:b0:143:d3bc:9d83 with SMTP id
 h11-20020a170902b94b00b00143d3bc9d83mr2682072pls.6.1639447778197; 
 Mon, 13 Dec 2021 18:09:38 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:37 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/22] ASoC: ateml: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:32 +0900
Message-Id: <20211214020843.2225831-12-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/mikroe-proto.c   |  6 +++---
 sound/soc/atmel/tse850-pcm5142.c | 32 ++++++++++++--------------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index f9331f7e80fe..627564c18c27 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -144,9 +144,9 @@ static int snd_proto_probe(struct platform_device *pdev)
 	of_node_put(cpu_np);
 
 	ret = snd_soc_register_card(&snd_proto);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev,
-			"snd_soc_register_card() failed: %d\n", ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret,
+			"snd_soc_register_card() failed\n");
 
 	return ret;
 }
diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 1b3a31296c9b..ef537de7719c 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -371,35 +371,27 @@ static int tse850_probe(struct platform_device *pdev)
 	}
 
 	tse850->add = devm_gpiod_get(dev, "axentia,add", GPIOD_OUT_HIGH);
-	if (IS_ERR(tse850->add)) {
-		if (PTR_ERR(tse850->add) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get 'add' gpio\n");
-		return PTR_ERR(tse850->add);
-	}
+	if (IS_ERR(tse850->add))
+		return dev_err_probe(dev, PTR_ERR(tse850->add),
+				     "failed to get 'add' gpio\n");
 	tse850->add_cache = 1;
 
 	tse850->loop1 = devm_gpiod_get(dev, "axentia,loop1", GPIOD_OUT_HIGH);
-	if (IS_ERR(tse850->loop1)) {
-		if (PTR_ERR(tse850->loop1) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get 'loop1' gpio\n");
-		return PTR_ERR(tse850->loop1);
-	}
+	if (IS_ERR(tse850->loop1))
+		return dev_err_probe(dev, PTR_ERR(tse850->loop1),
+				     "failed to get 'loop1' gpio\n");
 	tse850->loop1_cache = 1;
 
 	tse850->loop2 = devm_gpiod_get(dev, "axentia,loop2", GPIOD_OUT_HIGH);
-	if (IS_ERR(tse850->loop2)) {
-		if (PTR_ERR(tse850->loop2) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get 'loop2' gpio\n");
-		return PTR_ERR(tse850->loop2);
-	}
+	if (IS_ERR(tse850->loop2))
+		return dev_err_probe(dev, PTR_ERR(tse850->loop2),
+				     "failed to get 'loop2' gpio\n");
 	tse850->loop2_cache = 1;
 
 	tse850->ana = devm_regulator_get(dev, "axentia,ana");
-	if (IS_ERR(tse850->ana)) {
-		if (PTR_ERR(tse850->ana) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get 'ana' regulator\n");
-		return PTR_ERR(tse850->ana);
-	}
+	if (IS_ERR(tse850->ana))
+		return dev_err_probe(dev, PTR_ERR(tse850->ana),
+				     "failed to get 'ana' regulator\n");
 
 	ret = regulator_enable(tse850->ana);
 	if (ret < 0) {
-- 
2.25.1

