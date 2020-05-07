Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F027F1C7FE3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 03:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED9B17D1;
	Thu,  7 May 2020 03:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED9B17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588816597;
	bh=v3GG3YuhIyohjVcuOUVEaioceBvClJrwJwY7pB6Nn6g=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=go5ypyZmcFUjv3jdZFu+LW01cARgfdCfEeJ2Fb3ttvq/v9urKfLV7335G3KCX5CVX
	 R4DwVL392DUzUCbAIJLFfgIfxHLNW1vgvLAAdi2NrFNrI6hmva4+S5J3Ye1qGmjbYG
	 RBuKN2dj5HwNAQ/0qU7D0ngyqUTTnARLlOPl0VmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC39F8011C;
	Thu,  7 May 2020 03:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4144AF8015F; Thu,  7 May 2020 03:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45CD5F8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 03:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45CD5F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GddPAs5R"
Received: by mail-qk1-x749.google.com with SMTP id v6so3966461qkd.9
 for <alsa-devel@alsa-project.org>; Wed, 06 May 2020 18:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=F/lSPE3NrKREJmm3hkKtJKfj/SqYHam4UI4XHV89DEY=;
 b=GddPAs5RamrKiqpbQ9KLhBYPKyzq2HBqjyGn9Bc1MO4Osm3/dRKYcOFJM2TLCg7W5l
 oG1WtFQUd5p8xYX3K/nPJe9jXcmz79cNTbXUTXV4eN92uHaAX22RbeWAQfpQV4FMPVZN
 OSSoZLoL/vuuiG0d2w3Z6L/dyAk5JqTrMkfMlMsHp7KY3CIiz3WzbednBo3AYQZdzno6
 HbwuNcyDR06EWricBd9Drt2piOKAIdhO+eReHih7Rm4/QjADyka9B76VOaJjsK8xRNjh
 2DIcNj+pZaKIi6rnFLL6VebI9fHkKVbpjl86b266evig59otT0KxQNvLy51935nViHQd
 JHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=F/lSPE3NrKREJmm3hkKtJKfj/SqYHam4UI4XHV89DEY=;
 b=rZq9aaQK4iLU+X55Gpq5FAx4Lq0qpfmE84tJ/Cr24Ck6rfaOgMna/g246hQ0gLbK9X
 +rLDMXlJ/5QWvo2sr+7xXs2muWhCE/1iZD00klvT3AqZLc4dKAPmbAzax26oRJJrbB8b
 hyhOsCSRbK6vbGemOo2UX4bSwSMdAO3z1bofl1Z3XGCT8sdnTpFO14ZeLlrhS93ZWpD3
 YWb3vt2g/Keov4A/Z948SRmP9JxiVscNlL6JZBvxtFiEOGyl4Q6WYFUeBcfkU5NH8xQC
 kGlD/QI3jBVUKLx4sJSWEEPFK7rXOSv4H+QSxHe+g4ZqgeDzYEKco+XloCtNmlh/XhAU
 6GJQ==
X-Gm-Message-State: AGi0Pub6f7STIZsFyQSVP9d/PPdLCCbWGl08Fa5FAYn+c/akw5uSR/0b
 QhpNyfLd+FBRLkFiN65W35H/AggVMejv
X-Google-Smtp-Source: APiQypIZLbiw1dWfQxou/mXT6CiU0Qo3a4lVmj1dDRdtXsan19vliuHQCtoUD+4ZnYC4M4Ia4zMBaj1oLlAB
X-Received: by 2002:a0c:eb0e:: with SMTP id j14mr10579578qvp.230.1588816486763; 
 Wed, 06 May 2020 18:54:46 -0700 (PDT)
Date: Thu,  7 May 2020 09:54:42 +0800
Message-Id: <20200507015442.191336-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH] ASoC: mediatek: mt8183: fix error handling of
 platform_get_irq()
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

platform_get_irq() returns negative value on error instead of 0.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

The patch is inspired by https://patchwork.kernel.org/patch/11531297/

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index c8ded53bde1d..e0c4714da92c 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1186,10 +1186,9 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (!irq_id) {
-		dev_err(dev, "%pOFn no irq found\n", dev->of_node);
-		return -ENXIO;
-	}
+	if (irq_id < 0)
+		return irq_id;
+
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret) {
-- 
2.26.2.526.g744177e7f7-goog

