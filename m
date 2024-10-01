Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51752995159
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840B4852;
	Tue,  8 Oct 2024 16:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840B4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397274;
	bh=j9nKdkXSYWiIqZC/EjeMLZoVdFKq933DP4Fk2mYbuDc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e9qG8nKiwol5BlPgzP05sYglEh8QIlY5ZuMtl3zGDRUIb+UgnJUoFeBs+uxeIzbbm
	 UVjNigb9W1+WunlY8JIrxhfN5jZDWzHwsE/qw4rly17ud/6Arh0DJaw711OuSh6SIj
	 0XuQv3IOWajTCrGsCRpEnY0tsbe1l00yJfBMQk9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D2FDF805BB; Tue,  8 Oct 2024 16:20:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A7E0F805AC;
	Tue,  8 Oct 2024 16:20:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E61F9F80517; Tue,  1 Oct 2024 23:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DBA4F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 23:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBA4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GDKWRQlo
Received: by mail-qk1-x743.google.com with SMTP id
 af79cd13be357-7acdd65fbceso493604785a.3
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Oct 2024 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727816562; x=1728421362;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jYH5NvXI+E7Di+eslBeYdYxG/YksuIt7qvi8S1X1cA=;
        b=GDKWRQloiRjAd4RLW6mqLgUqQq2Av7j8s0DXSbMoR8WYvxsO82Q7kCuhayBLUtYUZj
         jEPOmR6roIORmJDEp3VrxHVsGIhd2PJ6h7Viju+rmo1zPyFPvE0qlbEYZOID06ki7qwb
         x6NGp/hX6E4wzUpTt2+dwAIf5ipIiaXO8rrF3V+N8MZlXMf7pTkddRvFf9+zbLQEuJqa
         7ayOyX2FXR/Xltmt0oMoaNrPHDOzkR3+lJwgQG4LQHRFRD9yJ7Cvc+JQNwKRJxGsDsJY
         aHRxn5NN1iR9oWVzmqEDbgHO8+QFTFdHKSxrfcaBnvHyxk4mZIrPBTweSHVt9LSiuUP/
         4JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727816562; x=1728421362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jYH5NvXI+E7Di+eslBeYdYxG/YksuIt7qvi8S1X1cA=;
        b=gg3jfBQXmv+BvoPnHMiFQvgCN7+BENOIlaU+9NXK0xGCQAAMQsPZBdHvhZxZ6APR7J
         Dmqm+OuzoSwTxeR8wGOJ2pPgX2ssx4zd31KRT8spVcMfTVVzrJJJhLdasu9mjcpzdswA
         MCYfDGEqoqYIHrt3BH6aJANEumBUKLRqfuniNUMB82IEmi9GW62FFI+h40QMUkC4ENvq
         LpJSWxpI2ZwCW1Kg4Bm5rwVFn1D2WiSCwAQNIxtulu1VWpEXgvKvebUFsuyp9bOL/aY/
         SCXNE/75G95nxCVT3bcndqO5QDwvgAvWk6gkEug8m248LEDlNlcwEn+J5l66nHdq2ZpE
         +oqA==
X-Gm-Message-State: AOJu0YwBn/fbwq2ucBsbOy7Zx2kOj9fSIYpJffGTx0HeQbZcA1jiYOMt
	PdkHQokVd25/m1xUc/zwUTz5pAtGr/Q20A77LthvLczTLA/fqe9/
X-Google-Smtp-Source: 
 AGHT+IH8uerN1xuIll5+jKNYSNyQKKRV3hWcMZLGc4+dVp70EfVbpJdn2EImWBYE6QoIIu3JG79n3g==
X-Received: by 2002:a05:620a:46a4:b0:7a4:dff8:35e6 with SMTP id
 af79cd13be357-7ae6274f7e5mr123077585a.62.1727816562236;
        Tue, 01 Oct 2024 14:02:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae3783d269sm540615685a.116.2024.10.01.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:02:41 -0700 (PDT)
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
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Gax-c <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Date: Tue,  1 Oct 2024 16:02:10 -0500
Message-Id: <20241001210209.2554-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OQVNA5XBY4U754D4CWIKDY6AX6J5CFNF
X-Message-ID-Hash: OQVNA5XBY4U754D4CWIKDY6AX6J5CFNF
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:20:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQVNA5XBY4U754D4CWIKDY6AX6J5CFNF/>
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
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
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

