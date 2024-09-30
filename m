Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603598BC58
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93A2E0D;
	Tue,  1 Oct 2024 14:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93A2E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786399;
	bh=pZBBO8OTpmOP+7nbPeLuWP7ms/KMEjDy++NOOuPuwLk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ft6gUgH50Kh5Bk8Ke3KjfR+rhztJqRy17Gd6iGJ0o6d58+ERuxKpaVojN0EBOJ7aM
	 d/d4/XPGV7XhZFpp6ylaHcEzzOmz8eCdSpPdD0MUE1a4WHbwvoFC+BKdUueJU/C2Qa
	 TK6F0W45mBx0uYdMLudGrQUKUMYgsIP5tcHxMVVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC02CF8065E; Tue,  1 Oct 2024 14:36:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D088EF80689;
	Tue,  1 Oct 2024 14:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A54B6F80517; Mon, 30 Sep 2024 03:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADED1F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 03:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADED1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Eb2hK5hZ
Received: by mail-qv1-xf43.google.com with SMTP id
 6a1803df08f44-6c3603292abso40528236d6.1
        for <alsa-devel@alsa-project.org>;
 Sun, 29 Sep 2024 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727658959; x=1728263759;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeEoQG+Pvg6ci51SvJDb0G+G8SkJPaDXclm5RHYYhP8=;
        b=Eb2hK5hZzkRFu5397NnVS9kM0qvmuunSZkFUS02UohTDzWFtZvUpfqMm6kp4mypxLd
         zeBgEDad9yyO0ZVhiv1I5krGInIRQh/EClKSx7WzMepUd3zlEmnQO2vE0u1EWN6KVL32
         SswtYn9Z3C6WQLF8L3NXUfFtxCtu5hk7tzZGGsq5iuvLTky8nRE2sZlNp/yie8a0unUR
         YdnqN64eUYfI1KNebBF8QIhsQTRZSM6F7puTRgAiqvb5aFgKwYQ1SocgJWfhtYn6x7y1
         rW7JRLGj+eZxiBHnzompQI0LOYkfKSPEnoMd4/eBUHyqZl9+/PEO/Z3ZC3ZmjELrfDSN
         xVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727658959; x=1728263759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeEoQG+Pvg6ci51SvJDb0G+G8SkJPaDXclm5RHYYhP8=;
        b=U0G9ZwEHfspXI44oSZHEZgP0huz5eyowJqRCWhUSARNzT8FoTOkIiaXSKa7ioT8bxm
         UFReTcBQBeTEuigpxgPgCkga1DjMTJPt74FWCodzKZzMH7+be8X6HkoymY0N3ThfyFYP
         UtQJKZAKOjzMDdiC92TIhl9d6zKBRj2puOuubrCveYfVCwDy9XM0BPPHSgBCD3pKBa8W
         zLAY9o80o1gB1xos/SXEiQCZDChJOBNmZkBvNoRThtuq0rot4cfc3+FwuiwBt6RIoYDH
         aCszNO1J5qAMyCGdOAd3WdbVevZzHSJwe2wha2IWmKlRrMfjPKIOv5AJXlen9ZhySbv0
         rnOA==
X-Gm-Message-State: AOJu0YxqqmgIuJqT2bwJFaHtQM4czMfaUOI96Q3zQBRd4bM6YBLRad84
	9nTgxyqSxUXVS3D6zTuUrQmjMiYoDiIq8iDmi1hnLjZua1jrfPzm
X-Google-Smtp-Source: 
 AGHT+IE1dpA3piB+ipRduIUb/gj93dPastsENChqKZq6mad780d2qFEIKkFKLh/ZJY7o2T7Z/ot/fA==
X-Received: by 2002:a05:6214:4b11:b0:6c5:ab33:5244 with SMTP id
 6a1803df08f44-6cb3b630fb0mr160430726d6.31.1727658959474;
        Sun, 29 Sep 2024 18:15:59 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b62c057sm35251886d6.60.2024.09.29.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:15:58 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rohitkr@codeaurora.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Date: Sun, 29 Sep 2024 20:15:22 -0500
Message-Id: <20240930011521.26283-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E4FZ7ZB6FU5TM545YGX6K465XJ25PO6H
X-Message-ID-Hash: E4FZ7ZB6FU5TM545YGX6K465XJ25PO6H
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:36:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4FZ7ZB6FU5TM545YGX6K465XJ25PO6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibly return NULL pointer.
NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_platform_probe' without addtional check.
Add a null check for the returned pointer.

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zijie Zhao <zzjas98@gmail.com>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/qcom/lpass-cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5a47f661e0c6..a8e56f47f237 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1243,6 +1243,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
 					GFP_KERNEL);
 
+	if (!drvdata->i2sctl)
+		return -ENOMEM;
+
 	/* Initialize bitfields for dai I2SCTL register */
 	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
 						drvdata->lpaif_map);
-- 
2.25.1

