Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FC504F37
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 13:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70011679;
	Mon, 18 Apr 2022 13:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70011679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650279853;
	bh=fs5SyUJeKwIvMsCHhw9UB0VcQ9OsDFsXcyH/wHwpR3E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gRVszbdV3qE2afb7T2NJV01id7ObkO+0In3bImA2UOydWOpRDx8D+jHRJmObxji55
	 2j5iwfGY573i5bykP5UJ6Wbj/ByOoS7bO/XLr8F5Lm8PANBnbXyAIUY7tshJ7pl0uT
	 5Vbcdp4Sy4CLZjiBDRvt+4L49hDH3/af8+LS1AV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE08F8012A;
	Mon, 18 Apr 2022 13:03:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD93F8014E; Mon, 18 Apr 2022 13:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D2D9F80121
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 13:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2D9F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ML7YQLQY"
Received: by mail-qt1-x831.google.com with SMTP id o18so9768167qtk.7
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uTmuIN0GlNXXY/94zNDu7yDIPOZyDJN9QkEI2mlu4M=;
 b=ML7YQLQYLo1Dj4jfwiljD/Rekx6c5rxBTwLIXSQ1h7gbRcHk1gxsZFi9XqkkN39V7i
 UVSFPbjACp274XdCF9D58o7ZAJmS4fUC91E2sQcZYNzYizNSKAjEsqw19vSrABzPoStF
 BEG0uJOuipXZGI34TgRY8mrJWdYvwTwiYk/a4gCXq64OtbzMAXP+3m0dUpGlkb5A0343
 ovHk0PYf92JZkmaqg8oAdgICygU8OiXaLfkybwvUln+TaIzN/8QUE/k4t3K1zd4d8P5M
 +FVTOI+7Xi1NwWp+FK+/i0ZSZhvPJR9AFN2BciI1v/ih0HM1oY/FQQBysuoJcNPjK2a7
 c60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uTmuIN0GlNXXY/94zNDu7yDIPOZyDJN9QkEI2mlu4M=;
 b=XFLR/Z0lvMfj2km+JtudJd3eoIFcm49RBIP30LK/xAdkpIWhV9PHS6+Xw5260RhIXy
 0TVyySCV55Xs0fFJCAOp6ibQFLonZAwUmhE2cqePKZUTswdjo7or+W58M7eUWxuAZqAP
 JBBGj2Pgbbb7KZp/icrmZCgaieJ/3OaJnbiIh1dUwDFPUrhxtljG/CtBD9TVy8GgZZ04
 7YVxIzgXSBtPdrxeb1bW62pQba3HG2ohOdQEouLDmCL+5/RQxDbsmGOu7TDl6LPqUfY4
 7fMJ9ZfQ7sWq2BVvKFOx7z3NeqVowZ0m/0jBC3G5er0QQeKH/SKyZ38un7awoTwvsejs
 wGTQ==
X-Gm-Message-State: AOAM532UPyef7HCPGloMNHgEW8XmrBjaJJx4x4EYaMZKsNCpwcX8vmKJ
 nZYETBKCMOAUo0ibP70TDxU=
X-Google-Smtp-Source: ABdhPJxKhXQVaAvyNvVCH2UEO9ZuO7fvvlhPS2H/BF6eBn2Ammys6oZGbOC4QM/WYjW10au931GC+Q==
X-Received: by 2002:a05:622a:4ce:b0:2e1:e18f:5b33 with SMTP id
 q14-20020a05622a04ce00b002e1e18f5b33mr6579274qtx.565.1650279784936; 
 Mon, 18 Apr 2022 04:03:04 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a376203000000b0069e9a4568f9sm1588004qkb.125.2022.04.18.04.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:03:04 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: codecs: wm8962: using pm_runtime_resume_and_get instead
 of pm_runtime_get_sync
Date: Mon, 18 Apr 2022 11:02:59 +0000
Message-Id: <20220418110259.2559144-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, broonie@kernel.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/codecs/wm8962.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2c41d31956aa..f679cf0ddbc1 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2896,9 +2896,8 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 
 	reinit_completion(&wm8962->fll_lock);
 
-	ret = pm_runtime_get_sync(component->dev);
+	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(component->dev);
 		dev_err(component->dev, "Failed to resume device: %d\n", ret);
 		return ret;
 	}
@@ -3030,9 +3029,8 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 	unsigned int active;
 	int reg, ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		dev_err(dev, "Failed to resume: %d\n", ret);
 		return IRQ_NONE;
 	}
-- 
2.25.1


