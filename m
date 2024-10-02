Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C32995178
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4798E950;
	Tue,  8 Oct 2024 16:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4798E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397437;
	bh=PFhe5qkwffgB5AUaRLfTYJBjKYBOL3NW5GVEq2FjsS4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Hp2ngnBG+bxKQaX+mNtcIdsbzyGYbTKbfDqanbzL85OQRkKsHpu+hJ0lQ3t6pRGE9
	 MIk/WsrqLhOdDuKB/1/4ndsDd9cImRu2Z5XWnN2xeZyL3qd5a1F2oVtR9AT8vM31Ab
	 YfRn5tzJGIkYrPwulqHYFL+72Mnx4rxMSL/jk0J0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D419F80714; Tue,  8 Oct 2024 16:21:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 903A7F8071C;
	Tue,  8 Oct 2024 16:21:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F7E7F80517; Wed,  2 Oct 2024 18:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77253F80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 18:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77253F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m3SZR+5v
Received: by mail-qv1-xf43.google.com with SMTP id
 6a1803df08f44-6cb4c013b78so164596d6.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Oct 2024 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727885595; x=1728490395;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaAqXYOrs+Q0T3ILVjOtUUUJDGq2kyVBWsgDISQYgtE=;
        b=m3SZR+5vWd3/51FxmxhliCC7G2WvFpM7p8u0ufYiGyE6CzfYyc7YAkEOiNNxIzijuG
         KPoYu8YRRY/JBhkPd/p6VvgdTykDw3xI0QSFe0aiv1gVV7B8slFKLGpaZeCKFaqLPCrJ
         QqnRGKkT0MRJf36HrcxNUQ/hU2S5qMEyZQszGrzv0Pzr1IEbDCm0hn/FWNldCUsHYOT6
         4zozKPXfdIBATN489cNVGAKEZgTbIHAlgBuMC4Cbgb+emG0RD90d99VTaPhpzp+Ogu9f
         0M1kcHUL08ZnGlXhkFmyxU0x1jkni3qsvMY4mjeuMjsiU5d3RXpJOsiP0yej7wpz2oJs
         BGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727885595; x=1728490395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaAqXYOrs+Q0T3ILVjOtUUUJDGq2kyVBWsgDISQYgtE=;
        b=lJF07tjtXpiQi9tKbEsvH/ujWQlb0kSOCuFL1K3eA7C2UKwcQzaFXaNlYUYm7kh+iW
         HKXWNUJgPWozde+FGpbBeCPctCuXKVKok272FZ7poK68vRV+/Kxk/GwhNnAL/mG2DWZ5
         AvfP2G/r1hh97YYYwTdhC5RqciZQx0oEXFnzF/rGKIl2WlqgdU3CSSRTJkPIRsfylq4K
         TR4+AAvIa/OEg2jAb5+b3bfSoDCaPp64hJKJxaTynM+TUMNTKun3d5S4wwe2DDfkWcJf
         BDi1n89UT2naLrpvsrPqztWKhk1UrL1QVtlaL1UhTk16Tlu71NY6GwV97s+y3GWw8Ht2
         sLWA==
X-Gm-Message-State: AOJu0YyDa45+dqScUsLhzmXvNuDvhO3j/nXoWP4deyjUppvJBRHhYUBE
	QGTUBo0psHhMuuODup1TRM4dEdJuXDKj/VxfFdvBOrNuG0uO8Rjd
X-Google-Smtp-Source: 
 AGHT+IEY7+7GGtRvAHmNqZOUe6gPQT/dKtSnV0a8RIReYrDmnLzNoqQ2D0+zzl9Wn9F5tfQBERjB9g==
X-Received: by 2002:a05:6214:2c08:b0:6cb:3da9:f3b3 with SMTP id
 6a1803df08f44-6cb81a852a5mr60575526d6.38.1727885595011;
        Wed, 02 Oct 2024 09:13:15 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb8811233bsm7339106d6.41.2024.10.02.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 09:13:14 -0700 (PDT)
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
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Gax-c <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Date: Wed,  2 Oct 2024 11:12:33 -0500
Message-Id: <20241002161233.9172-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QUYC4RX53ILOTFRIB5QBJL3XBACODCIR
X-Message-ID-Hash: QUYC4RX53ILOTFRIB5QBJL3XBACODCIR
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:21:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUYC4RX53ILOTFRIB5QBJL3XBACODCIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
possibly return NULL pointer. NULL Pointer Dereference may be
triggerred without addtional check.
Add a NULL check for the returned pointer.

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
---
 sound/soc/qcom/lpass-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5a47f661e0c6..242bc16da36d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1242,6 +1242,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	/* Allocation for i2sctl regmap fields */
 	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
 					GFP_KERNEL);
+	if (!drvdata->i2sctl)
+		return -ENOMEM;
 
 	/* Initialize bitfields for dai I2SCTL register */
 	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
-- 
2.25.1

