Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A1999517B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEDFAAE8;
	Tue,  8 Oct 2024 16:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEDFAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397456;
	bh=qsa9Tr36UghnCP9lXSpaAMsZJLGVmYl72voh9q9E3tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QkdecOytuROt91pv7PcU6YtfU9OCLHbTh7V8OS7FHZnX6QHMSGltulj+Uo6kAD/6F
	 mGF8s3StC/qm2xv0ofDPxUz2xfGzGaSwrtJNpUVF7qQEbcwEfSETu/9Ui619P+VHa2
	 EieNouRf7euC05BFLJ8xXAu6L0UxGtbFDtw+18u8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE7BAF8075A; Tue,  8 Oct 2024 16:21:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D136F805E0;
	Tue,  8 Oct 2024 16:21:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D925F80517; Thu,  3 Oct 2024 17:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90DBAF8001E
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 17:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DBAF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GNwaOOg4
Received: by mail-qk1-x742.google.com with SMTP id
 af79cd13be357-7a9aa913442so95278985a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Oct 2024 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727969263; x=1728574063;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/dGEqQC57GQUROEFrRin+HCPiuYX6M1Xji3KrbNk7A=;
        b=GNwaOOg4yyZX4aXK1F12iHiaFL0MIw7J3QNHix4d9gT19S0t7E8qoUZ/F9H4eFYPqH
         ZUEi9DInC4pYlAPzB2qdRw9cZ7gcbETlNKsM8Ayh0fI8lsEJuN5LE3Qqk3xjfPnozyen
         Sd1IdmLy25CuwsvB791E5XVPI200vpuYzACeoaQfapQZi1Oj/cdT8ysHd+ro0mM8OQ+4
         /NBfZIy2GFCvFXbEG6TaqPbHctPqB/XmWiMI5+M+hK/HailjU2Y+QSyPZIr3eN1BS6bi
         c9i28N5ARbrVnK4QtQifaOrUmUhKcnJxmmJujAuNlK3X4GOwPXsQV588ys1gfe7aJPoc
         I+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969263; x=1728574063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/dGEqQC57GQUROEFrRin+HCPiuYX6M1Xji3KrbNk7A=;
        b=nB1fOyoKhNH7lF1/IR3O5FF2O5iJ+aTUfy5+ElMUh7agd/npxYQ3zz28nbusY3aGl6
         RGD8BdbhNHgRhDqVU6GUrJY13/2EMvX5W0K97qXkWeJFiRYKEBAPG0UQUvMcO5t/E+8p
         /Wo6O8xUfVyDBdkmoo3/EC2toKcbWKA06VQ12cvCLswrnF8yG3mNG/pgz9n7dL9viWw6
         398042a3f3h6XnxHOpbZ5EFmp3O68omMDV7vX17cBDoxMQ7am+bxR3Qm67sxCofWyBH1
         NDqA3QUoAZlvVypCrTziVCHTKdrqw0bTo8EAHkh3W9ncuYC9P9P8CYRdml0icd4DlBcb
         aoIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX+d0GBwH3o6eHzMZoIm0zNMVGcdBz2DYCSznJngM9zKrUf0y4CIPHHKxIkXEK7MQC/6wxb/erceGx@alsa-project.org
X-Gm-Message-State: AOJu0YxtRVhQWVlnOrQHaEFt4P9L6mAwWlUf6bw8VcTmeHoOa5gZC0Eh
	6rGjifVadg65WM7lwJG18OeINpUyFGrC2zI6rwNnaavUtREhFg+L
X-Google-Smtp-Source: 
 AGHT+IHusAAhgTINbI8Xq6hjYClvjuFgNYxmnMzHJ2IBsHBLKRXVnOAN8u7Rvx6/ufQVetfS4EI0/w==
X-Received: by 2002:a05:620a:1926:b0:7a9:bf31:dbc9 with SMTP id
 af79cd13be357-7ae626ad92bmr1144156485a.4.1727969262543;
        Thu, 03 Oct 2024 08:27:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae6b39b674sm59232685a.34.2024.10.03.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:27:41 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: gregkh@linuxfoundation.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rohitkr@codeaurora.org,
	srinivas.kandagatla@linaro.org
Cc: stable@vger.kernel.org,
	alsa-devel@alsa-project.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Date: Thu,  3 Oct 2024 10:27:39 -0500
Message-Id: <20241003152739.9650-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2024100358-crewmate-headwear-164e@gregkh>
References: <2024100358-crewmate-headwear-164e@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HD4MWCV27BUOOVZZR6R4BSBD5O45OCLO
X-Message-ID-Hash: HD4MWCV27BUOOVZZR6R4BSBD5O45OCLO
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:21:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HD4MWCV27BUOOVZZR6R4BSBD5O45OCLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Zichen Xie <zichenxie0106@gmail.com>

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

