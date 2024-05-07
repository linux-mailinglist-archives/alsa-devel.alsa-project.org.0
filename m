Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF58BEABE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 19:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BD2823;
	Tue,  7 May 2024 19:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BD2823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715103918;
	bh=gM77PrnIE+tWgxK77qHUPHGZKhSXRMQdDd0Y9OD2sQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LHaBlUVHz3s37zUmDl3/c3sKCmHbHwbkZEjJL7dvYqK38GRgYVCj6w7DvIUu7SliT
	 KQaYUwIjrEbtyXqIrd4zAxfxwYqYyCXv1teJFkUp/Co654TrVOZe3kKA0+ChJlsBEz
	 WzMqoHbUvoMIcSfMw/Dyx0By6dDM5TmMGBO7Lr6w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FEEFF805EB; Tue,  7 May 2024 19:44:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1A7F805F2;
	Tue,  7 May 2024 19:44:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F21ABF8024C; Tue,  7 May 2024 19:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C7B8F8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 19:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7B8F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DCa4lxYn
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ed72194f0aso1550115ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715103477; x=1715708277;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ6PYhE4RdXOr8XQe8+MBCrlkpMDO7uc3LEU5QHaRzU=;
        b=DCa4lxYnV+UgL91cFDumXFRzzeoS/Ps36+oKB3C9X2+SeZP76pw5m2NzfvaxDJBUE5
         BhnjUE5vFf/g+7RkCiirzseYJmEEJCVe/p1iACvpGq7bnHNzS7N8lTGYAeI8dMLuQLrg
         6oJh+PfDNBG+CilLauCLKDIgayS8b1VNs6v03A5qyoDDiPt7qpCHgkVpJdnWBa8Ugk11
         uCZDJ1xtN5MPOuuCj24ezjmNTwHbC9+oZuOQ1ISSZ6DloatPyWVSOldC1KKfGFvn18/C
         CZ2g2S53+zPW75ablVNru8Jw02pfjj6Map8UN4cXRs2Srp1YXKZJQEiKYIthC1a/2A0g
         Ntgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715103477; x=1715708277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ6PYhE4RdXOr8XQe8+MBCrlkpMDO7uc3LEU5QHaRzU=;
        b=VPuFBWXLHjpxe5tzo1HjQCguKM7q5AecEnRAMbTUKoBCXSxwJ81AHYls+ZTlk186JI
         NrJug5NCuMJgLvklj2upUmrEf3Vr2AZEbb4nQhLVMktfvkXF5sMAC/6eyr+zLPka0k7t
         ik2s2kdpNI/r/PM8qt6oUA8BHn2KTwRPLWkLsrfUcXA1ChKJQya9BHfACOBQvjZdAEEv
         jQEdKwJ+lJtIA/JTRA4PbqEQtqHrN8nKIAebecqceUQA+YW+MZYyuHLOm/v2z0CPn+bQ
         BrmGO1jR4+C/LiQ1Hx8Yx5jPvGgBHzheA66Lk6sc6KoIzXMgMiTOQiGUsOjdzZuNoERz
         aNsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY4+JvOkv/KZT6AN4WWm5HhSFswwWnsAFMzGboK9U4B35tFMdVvA/N9djQxiXJ/fR3f/IS3/Bmak++Ghodej4ZnYGbb2SQN7MUtqg=
X-Gm-Message-State: AOJu0Yxi8qZAidWiCGGHMy88qYYhesFCdFrhsxgkwUKyaWnZyYixs2M6
	2xEjWOHGeWDH6cKuLySK4HmDX7NTOKZ/xVi9JzuweQdKlEb2UmHv
X-Google-Smtp-Source: 
 AGHT+IFoH6HoK8dhhATNs9QMChQweq3A0Vm8hOb9PSzRAZKagiOHCPybsvfc9nA2GjB8eIRUtTNU7w==
X-Received: by 2002:a05:6a21:7882:b0:1af:96e7:2be6 with SMTP id
 adf61e73a8af0-1afc8b14766mr563817637.0.1715103477119;
        Tue, 07 May 2024 10:37:57 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:1054:2c2f:fb76:3191])
        by smtp.gmail.com with ESMTPSA id
 bm6-20020a056a00320600b006ed0c9751d0sm9997970pfb.98.2024.05.07.10.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 10:37:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ASoC: fsl: fsl_easrc: Switch to RUNTIME_PM_OPS()
Date: Tue,  7 May 2024 14:37:34 -0300
Message-Id: <20240507173735.3456334-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507173735.3456334-1-festevam@gmail.com>
References: <20240507173735.3456334-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7KJNELUGKQIHI46TF4VLNF4VD2RPC5SS
X-Message-ID-Hash: 7KJNELUGKQIHI46TF4VLNF4VD2RPC5SS
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KJNELUGKQIHI46TF4VLNF4VD2RPC5SS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions are used
at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_easrc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ec53bda46a46..962f30912091 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1988,7 +1988,7 @@ static void fsl_easrc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
+static int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2005,7 +2005,7 @@ static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
+static int fsl_easrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
@@ -2086,9 +2086,7 @@ static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
-			   fsl_easrc_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -2098,7 +2096,7 @@ static struct platform_driver fsl_easrc_driver = {
 	.remove_new = fsl_easrc_remove,
 	.driver = {
 		.name = "fsl-easrc",
-		.pm = &fsl_easrc_pm_ops,
+		.pm = pm_ptr(&fsl_easrc_pm_ops),
 		.of_match_table = fsl_easrc_dt_ids,
 	},
 };
-- 
2.34.1

