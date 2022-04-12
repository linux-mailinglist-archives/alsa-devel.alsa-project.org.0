Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B554FD303
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 10:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A629170E;
	Tue, 12 Apr 2022 10:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A629170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649752282;
	bh=/xGiKTO6H/xrDnz+jtROM4Myk/PdLCjm9kKA6yGQQRI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TfaX6M7wuU7GBRRqERN4YC+RtMaAmFuwN5+kdi7ebWaaMqdGaIFGygQnXVrLk776s
	 f4UmDo+tXkr92mmXfco/e7UO6NLZFQp8ZZTDmYTD7RttC52mrxdP23UfC4Bw4bIc38
	 o29kXMpywshrvNIywjgNfa1al9A8CrwgjbtBmUyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E175EF80245;
	Tue, 12 Apr 2022 10:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CFEF80154; Tue, 12 Apr 2022 10:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56727F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56727F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bguj7Cwr"
Received: by mail-pl1-x62c.google.com with SMTP id c12so869860plr.6
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+EBqN3UPFUGLYVFLyAS2kc4ocqBW5MswCAjPd97TUw=;
 b=Bguj7CwrjTc+mzk+TmB7JVFoPyy0Zskev01NAMeOClCzjpw2E1k0tA1zrwPWhRhZYh
 8MxY/6opBxkk5Cb81qAM+dgfsdS/yu/xmJntl8ipYL+X6CYZL5nZYM4ob0ElVhk/spAo
 w0KsetW8iDqNEbwwyi3/I/y+s+75Vel4sYcox7oKIuFBWC7xIB72GjJ2KVsMY9joDV74
 e5HGMB3Thh/AHmZmAeBUntojUpjX9wxCLnru9Wa56l1wzN7avN+EAlLlCCMfhA/kCzb1
 GAO4g8VZO+eFrbmYO4t/SMgdj1KfOVEThMrxSUjoR1GlAFTkOYlFrQkW8vHAO4qXlpct
 jdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+EBqN3UPFUGLYVFLyAS2kc4ocqBW5MswCAjPd97TUw=;
 b=F10YoXTBdZdmNZluc8MAZURTdmmjOGIpjqZUZXAfA7UThnwpYF35rzBLd3dxxH7Bi/
 UtNLh0fxca7nuhfGY8vIA65vJQLKdrEf7iVGmhc64/yVD53/Sb9f67H3zkwdXOircpTf
 cQJd4nlgrpiXAmX+HIlYKv+fQN+K021lOwrarcLAb0pjmxpj5PGaLTXTdoI3dlvJzFix
 1T0leQFM81tmElYllp4Dw+2RUQ62868yx/aspf1GvL3hRLztNefH3r0ls2woz/Xi/+24
 DNK9sZiwser57pfQplcNfqZsx/Cs8DHl4fpoxjDxI9N6cuQpcppTdHIGH3xTNvJxnmMz
 P1mA==
X-Gm-Message-State: AOAM531h6fkhouhvkz8KBk8kUmkMDtM+pRB0gmHv2pova7YZiJzd/nxB
 5domHfElJrxddJjfj0WGvnA=
X-Google-Smtp-Source: ABdhPJwJPW0ts18fTByd2sl+p9939cGGiOvxLr5m0ZbLLv7Y4tadnT8ZE6+LYBT85nwWVa/BpG9kkg==
X-Received: by 2002:a17:90b:3e8c:b0:1c7:3001:f359 with SMTP id
 rj12-20020a17090b3e8c00b001c73001f359mr3699846pjb.179.1649752208998; 
 Tue, 12 Apr 2022 01:30:08 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7900d000000b00505fa4c7ba6sm1654089pfo.35.2022.04.12.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 01:30:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Tue, 12 Apr 2022 08:30:00 +0000
Message-Id: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com
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
 sound/soc/fsl/fsl_esai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index ed444e8f1d6b..1a2bdf8e76f0 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
-- 
2.25.1

