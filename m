Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705298BC60
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8AF51605;
	Tue,  1 Oct 2024 14:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8AF51605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786448;
	bh=RR4YJEuiCB+s4fOTHaO2fk03o/BIx9b2dGauH/q9zfI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jD675/1dm69Srlc+P2OP/yz4E96GRQubC+H01ayJyq8CiKQidQ5BCvPD6b7vCigr1
	 NG2EuGhStKDUlKwobf8NPFzE37MCmDzM3ZrCa5MC10gTFaSGwUPwE/e94oijwE1JfU
	 DJWSOrYGkhS1g2NWUtSOgkBZYTzAbEw/HT+SErQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77977F80699; Tue,  1 Oct 2024 14:37:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB0CF80C17;
	Tue,  1 Oct 2024 14:37:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76CAAF80517; Tue,  1 Oct 2024 02:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06B71F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 02:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B71F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mucbDSgo
Received: by mail-qv1-xf43.google.com with SMTP id
 6a1803df08f44-6c582ca168fso35002736d6.2
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Sep 2024 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727742272; x=1728347072;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXJNocpNHIaneGGPh7u0gkYrjLLyA3SxEfbfZIWZAYE=;
        b=mucbDSgoAxLwj8ktd8gntaLJaUqr98xBXBbS+9fWfy9Gukf1c8fAB70lCxjYeq8GBh
         bbhzWQhJo6eT2fVrNNGe5Quj5mRP67eCddEOmQ0oFBFSrtxQHbWXkdiYTSo+CShtlNOc
         ct+Dw1MhBuh2in0L6Bgad8ck62A7KbiQ0Z5HyokHfIFQ97wfTeWOJq1DYM29tG5QyGWD
         ZWDpbwjV6d2YfyX2VsKrQC/m1jtPldyHxOpN4cedNMovoU6l6qH2Trz3ttYZ7ESwk+Du
         H/msqXMf18OziE5lrzpLiFJC6Z1cQnLmrm3mLZ1F34XmXpVArD1KZGeFDlIWE8eivCpr
         tgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727742272; x=1728347072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXJNocpNHIaneGGPh7u0gkYrjLLyA3SxEfbfZIWZAYE=;
        b=lWmaVHfKJXKDFa0HVWgOnjA5c+lAlKEJjjcEkYIlGmDb4Qd48kinChWEFrpUvJQInx
         8pm9qeuUiMrw0RoXbhDpJfuwq9SCQ5VynXRTpF5qNIENVQ0u0dOEq8NCHywazMkkog7n
         vfq02XWd33KS+/DOO7go38SLRMJ4I8UroA8kIBohpF3ZmGJb56pV6ulqnj35J8rXvTb5
         iDNFAV3IWOnGoUDnnRpKbOOS7atcWAMl3EWVZn3bmoJP/JxaB6u7LJ7G0e7dSLA7KkT3
         AHyn0ziVvouOQlduhwZqbeJTtHDcAe7dT2UAJyiI0BDBrX0OdgS534OMNhK/VKnKKEqK
         EG+Q==
X-Gm-Message-State: AOJu0YyuWSRhv5BCaMSL68c6/4pR/KPiFtbAlzcYTX84VN+ZzdnwSAW1
	UAVKR7pZxjOMH73oFJCqef+aGrQewyGPy5g1y7m+J1avK5Myx+c0
X-Google-Smtp-Source: 
 AGHT+IFqcL3S9UyEKrwwWrFna24JxfP1Qfwil+sI6wQESX1DtQgsUOKRCkTwCI1uJWo3OmH6tjkBtA==
X-Received: by 2002:a05:6214:4206:b0:6cb:3ba9:b834 with SMTP id
 6a1803df08f44-6cb3ba9b883mr186213266d6.24.1727742271738;
        Mon, 30 Sep 2024 17:24:31 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b66b5a8sm44361256d6.79.2024.09.30.17.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 17:24:30 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Date: Mon, 30 Sep 2024 19:24:09 -0500
Message-Id: <20241001002409.11989-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EB4SQUBBMWNITDPTQJMAXDCVDULAKZUW
X-Message-ID-Hash: EB4SQUBBMWNITDPTQJMAXDCVDULAKZUW
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:36:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EB4SQUBBMWNITDPTQJMAXDCVDULAKZUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could possibly return NULL pointer.
NULL Pointer Dereference may be triggerred without addtional check.
Add a NULL check for the returned pointer.

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

