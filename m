Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D34469259
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:26:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED6E200A;
	Mon,  6 Dec 2021 10:25:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED6E200A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782802;
	bh=8ZkHxX6KHjpqWmZqqUITtS5Ml11doxfzvaXPwvQmryY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FJux6yTF5/m2e8muRo+e0hzyj6+YpcNOkgVR6Yj6xiGb/1j8bm/hPUYOwLKcNSZCi
	 mVEOVXVcFjeEESGWV9lYgEjXZOD8SGgo9yJoPPOJRJet4OcEEB9YxgAqg1ZIMesVzm
	 zMs76mcQOc9B0sYa2KBba04QDecAm8jZ1mMFgWuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F758F804F2;
	Mon,  6 Dec 2021 10:24:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F1FF80118; Sun,  5 Dec 2021 21:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA606F80118
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 21:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA606F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aZPRWWj6"
Received: by mail-wr1-x434.google.com with SMTP id i5so18204174wrb.2
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 12:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhy8UiEQpnUYiYMsnqfzPU8AwFzNfD4+zpkpcL/Vs9I=;
 b=aZPRWWj68yw79Cj6AOj9CaoYBPvlgQJPPH/C8gXeP/WAWH3zqVmVyaBhuT3csJBtAI
 WEAwpnic0rMwbcgVmOGjON7bs+jvmfiN8e7EcineJXv90Mj23NyPIPaYfw+oD2v5TloL
 YcZLMPey/nkMmaCPBWPrVOMosegfQokW6m7gQ+B+0ge2/djVkOzGy98YeNdwBwJxwCQi
 AvBfNbyjkDoqgN6dQc2bwkbxvfcNinzibuUJMvmt7Nutwrn/8Z2YqSmM/YBSY48Fwipm
 vKZvlQTkcch9RXNAGHz61FYy+wxf/3scrxf8SC+9jFzfWhCQd9UYDydUb20TcfxU3jwE
 HdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhy8UiEQpnUYiYMsnqfzPU8AwFzNfD4+zpkpcL/Vs9I=;
 b=r0dsOvHPZLUwoEU2xzU9LemeeVT9nNe1vXY7amen6+KjFH9Br2eoPv/qX1SpRCn30A
 cKWaNJ0ONP8CcvoF962qETn8WxGc3TwnEhgnBCmF7L/exR/37QK5r5tXttuz7ixORct8
 fciz0wytoakTrDOziHTDT0VbpepFb9/clby/i5YR/yLayB4kELuCucMKPxVcVKkpliGQ
 WNo0yC2dHFxGFJN69GzPLS2F/F9oCQN9vG7+khG586tr5EdcGyEaabKfR8xotsf7VqOP
 QaYnTEmta2hqrXxSr3gu8lM3B8ul5iLmqemHyvseBjWYlbbpx8mkw6+L8oLuHDySx1Es
 /5jg==
X-Gm-Message-State: AOAM531gIXy+sWEN9NKG0qUAM5ChLRg5oDNU3ms7/fKym39nsMTQrKiI
 3/bq9frMToe+Ko2f4Sm2f+U=
X-Google-Smtp-Source: ABdhPJxXJvtbk0zbEsczc3eNieyvgsO9yrjJJLB3RdcmFJI5MHdqtIcSMAi81+Wdt+7+Gwmr16iTTQ==
X-Received: by 2002:adf:f489:: with SMTP id l9mr39249389wro.268.1638736926668; 
 Sun, 05 Dec 2021 12:42:06 -0800 (PST)
Received: from localhost.localdomain ([39.48.147.147])
 by smtp.gmail.com with ESMTPSA id t11sm9530345wrz.97.2021.12.05.12.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 12:42:06 -0800 (PST)
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: test-component: fix null pointer dereference.
Date: Mon,  6 Dec 2021 01:42:00 +0500
Message-Id: <20211205204200.7852-1-amhamza.mgc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
Cc: amhamza.mgc@gmail.com, linux-kernel@vger.kernel.org
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

Dereferncing of_id pointer will result in exception in current
implementation since of_match_device() will assign it to NULL.
Adding NULL check for protection.

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
---
 sound/soc/generic/test-component.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 85385a771d80..8fc97d3ff011 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -532,13 +532,16 @@ static int test_driver_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct device_node *ep;
 	const struct of_device_id *of_id = of_match_device(test_of_match, &pdev->dev);
-	const struct test_adata *adata = of_id->data;
+	const struct test_adata *adata;
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
 	struct test_dai_name *dname;
 	struct test_priv *priv;
 	int num, ret, i;
 
+	if (!of_id)
+		return -EINVAL;
+	adata = of_id->data;
 	num = of_graph_get_endpoint_count(node);
 	if (!num) {
 		dev_err(dev, "no port exits\n");
-- 
2.25.1

