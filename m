Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68541506970
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22C4175F;
	Tue, 19 Apr 2022 13:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22C4175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650366515;
	bh=ZdlyD6k0aSaECv0t2ZYkjFT3oaNEB8K4/hDKD5k6JZ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EB1LKRdrYIfl9IdsqrJ5OFZQZIQqPRvbWcyCS4KoD8eiv77TxoHUuX2v+VksYy6x8
	 yucwDYYNQVhlJjsGI6lun8QuW3HSk4f6ymcXkawdlYxAQWcrpF0daav8KU1uFk7VzI
	 bJaoXtWWRYXN86H7I8hqbzh3IMl1QhEqHGjtCFuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 792BDF80269;
	Tue, 19 Apr 2022 13:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475CDF8025D; Tue, 19 Apr 2022 13:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7662F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7662F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PSQBQufQ"
Received: by mail-qk1-x734.google.com with SMTP id j6so13112905qkp.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLm0olCcsH1PqiLNhih1I6coZ5sjLUN64Q3yF02wEzs=;
 b=PSQBQufQk2Bz8JcA9FwJJnEAxb0jhkWZncWJxOvMU/8os0VWmKxPVpu7ekk2yCbmig
 F8M0n76lyKXF4vaRwovvTsh9F7MT8ixs5vnBQEbvkFHBC6ih0QDhFvOXbk4w3IVjGrkW
 f4GO2voFORmG59CzaPPIPg3+1oyaqulK6LXqRiPORAwkJ/XMJKh5VHnDkFQE+M6W7l2W
 39BnRaXCpqrJbXHJRpjr8gmDCvFtqGlG3uth4+KSzOPCI5rGJr+OASWbaFRSWF/afkEk
 cJhQqrhYYL/bF5g0pv7zEFmJvlLM/BflWFWj8Wjdiy9nSWBbCxi6RK7KjUCdVjfTdWAL
 t8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLm0olCcsH1PqiLNhih1I6coZ5sjLUN64Q3yF02wEzs=;
 b=l+3oWhg8TIHkDPTuFioVYi5WICLxTPvyvAZb5LzmDaYJcnHzcXToh+ShKjDZIvSY+b
 s8c7HEjcos9XBBfp0UD0CPtKQdXriUbJR8GfA3aEYS1Kqp1/w3drffXBvPzTJWjRWxyu
 jw5GMLFzfV8DOab1qVg5pENC4/Kpj6X+ZqrJz5BnktsX3lbWBgcg+p6io0Jy65BUrz/E
 ZTlfXMU8fMD4zW+Ar11ATghpnPinduLArvaqAK8jA9iQBAkQgV1fp2Qv9Fcx/5NtV8AE
 JhAJR5P2dcdW1kZdUIGhoGhzJodDrmDRtC+Gdg4vK/e2tTwpTaWK95c0LQ7UnJrPGjfR
 NEVA==
X-Gm-Message-State: AOAM530m0NRxsSv3zydTxstqu8xZ295l1bSWgVjRbyBV8CJSJFQhZK/q
 f11gE+ifGP/OE4rAU6grw4o=
X-Google-Smtp-Source: ABdhPJxsgEYEL6TpaTURvRKsl8jgBFGSvrzsRlM0QgUA2u1c/3EhXptk4RALE0ivrn6GfVzU89SpZw==
X-Received: by 2002:a05:620a:2681:b0:67e:933e:54b6 with SMTP id
 c1-20020a05620a268100b0067e933e54b6mr9348878qkp.428.1650366444421; 
 Tue, 19 Apr 2022 04:07:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b2-20020ac87fc2000000b002f11f6dd5cdsm9316456qtk.23.2022.04.19.04.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:07:24 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: img-spdif-in: using pm_runtime_resume_and_get instead
 of pm_runtime_get_sync
Date: Tue, 19 Apr 2022 11:07:18 +0000
Message-Id: <20220419110718.2574674-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
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

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/img/img-spdif-in.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 95914d0612fe..a79d1ccaeec0 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -749,11 +749,9 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 		if (ret)
 			goto err_pm_disable;
 	}
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_suspend;
-	}
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, "rst");
 	if (IS_ERR(rst)) {
-- 
2.25.1


