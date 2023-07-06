Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14117749D4A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 15:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 022A2112;
	Thu,  6 Jul 2023 15:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 022A2112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688649588;
	bh=mQNylNTtc3u/sbhjgJ0z0KlXOY+EAUfQebELIkfJjxg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ct8Nd3C1GqPatvexdtINzCa00CGH6pVtv+3xAgj4Q7ovEXGjnsGvj6oC3Ls4n0dhG
	 SydUsbIXSFHKLaG5mieynVVtYZXFVQXm0fxCEhlizgvCJrGInAi3TZUkkAO7GyHOlQ
	 N11OjQ3xJ85hdoQJeblC3SqXc1HgNu9/jrJ95LYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D06F80272; Thu,  6 Jul 2023 15:18:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1173F80124;
	Thu,  6 Jul 2023 15:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54DDFF80125; Thu,  6 Jul 2023 15:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2114F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 15:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2114F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CtyIBLUA
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-563393b63dbso66952eaf.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688649521; x=1691241521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oztzAnq0XU8stwUp4Cmqa3cHImrakQG0eV1fQtLsXyY=;
        b=CtyIBLUAn4I7j+ESn2s0Bchx90aSFGsGPOWKuwzhTTMfCMNxfC/r90SD7TUqCzaCO8
         FsMs8q0mAL1oOhLwmFGEWIg13aabi8niF4/PwEojvwXHGo5uLHud07aGf7gG2QaK28ds
         vtjSjJ1ZNOkZINULHn6OhxIv5V0+8N8BnOiknkn4gPMKo3EtAcdFSyubF450cg/tnpN7
         ypBdSVhQIralwV2XP5Q1saA0Zzur5M0vi3YBPAZiWHBec+abKuy8wekBUFV//mZewStS
         PhsQRWvpO7KaWIRFl7FrvAJnjYOFyTxbv+2GqsxkmWM73NJ5Rs8H7e4cCdbQyXhPzDMU
         cO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688649521; x=1691241521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oztzAnq0XU8stwUp4Cmqa3cHImrakQG0eV1fQtLsXyY=;
        b=cvKVFPBkIs6dUte2JVcFPuJNgrbgF+RH3r65c0X92pf0orIXvcrHVFKa6c6eV5cuO4
         xuDkZwMGyflZ+LXPq77rYfhLhqxS7tShH/CpFZCNrTDFZ6o9NE7Gd4uazjivYb//QDwU
         A7debM+oOgOMVOxBPNeTt1wzIJ+8ebs+jcD92TIAryEon2WE6MKHGsMLjCGL4Gh2+t/E
         VbhyPIzoB9TXinMINTFdaNMfo8BQaYIwoUagYGZQOSuILZOsURXabNFsSCKLr16vYreZ
         gWAVGG8rA7QEg6NYRgSQmBUafH3ldv78+gzFsIqdMEm8aD5Y/aFs3vOrpFDIKxqdxn8U
         34vQ==
X-Gm-Message-State: ABy/qLb1RHVROv7MbRakvfmdA8tdEIZwfCPUN1XO6lamTiq4ZF0zmW2A
	bSInT9ARgN5QPP+fMKxebCc=
X-Google-Smtp-Source: 
 APBJJlEpFxr2Tef7ycVd/xItQKf5394k/4uoVQVoLsyFtH83bDxrxmdVzpffs7vxUMeD+gGtucBDlw==
X-Received: by 2002:a4a:d541:0:b0:562:e437:3b41 with SMTP id
 q1-20020a4ad541000000b00562e4373b41mr1265062oos.0.1688649521060;
        Thu, 06 Jul 2023 06:18:41 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:da08:7cc0:c10e:810f])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a4ac446000000b005660ed0becesm577155ooq.39.2023.07.06.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:18:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	andreas@fatal.se,
	hans.soderlund@realbit.se,
	Fabio Estevam <festevam@denx.de>
Subject: [RFC] ASoC: fsl_sai: Do not set MCTL_MCLK_EN based on the number of
 registers
Date: Thu,  6 Jul 2023 10:18:29 -0300
Message-Id: <20230706131829.1862750-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2DXS55OWDNMY6NTBN7DIISPJY4RGCDLE
X-Message-ID-Hash: 2DXS55OWDNMY6NTBN7DIISPJY4RGCDLE
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DXS55OWDNMY6NTBN7DIISPJY4RGCDLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Since commit ff87d619ac18 ("ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for
master mode") Andreas reports that on an i.MX8MP-based system where
MCLK needs to be an input, the MCLK pin is actually an output, despite
not having the 'fsl,sai-mclk-direction-output' property present in the
devicetree.

This commit explains the following:

"On i.MX8MM, the MCTL_MCLK_EN bit it is not only the gate
for MCLK output to PAD, but also the gate bit between
root clock and SAI module, So it is need to be enabled
for master mode, otherwise there is no bclk generated."

Currently, the decision of using MCTL_MCLK_EN as a clock gate is based
on the number of SAI registers present on a platform.

This is fragile as it causes issues on i.MX8MP, for example.

Fix the problem by introducing a new boolean mclk_en_gates_clock member in
the fsl_sai_soc_data structure that indicates that the MCTL_MCLK_EN bit
also acts as a gate between the root clock and the SAI block.

This allows i.MX8MM to turn on FSL_SAI_MCTL_MCLK_EN as intended and other
SoCs such as i.MX8MP can still use MCLK as input.

Fixes: ff87d619ac18 ("ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode")
Reported-by: Andreas Henriksson <andreas@fatal.se>
Signed-off-by: Fabio Estevam <festevam@denx.de>

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Hi Shengjiu,

Is imx8mm the only SoC that needs mclk_en_gates_clock = true?

What about imx8mn and imx93?

 sound/soc/fsl/fsl_sai.c | 12 +++++++++++-
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e09f634c61b..e4dc6964f011 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -507,7 +507,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 				   savediv / 2 - 1);
 	}
 
-	if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
+	if (sai->soc_data->mclk_en_gates_clock) {
 		/* SAI is in master mode at this point, so enable MCLK */
 		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
@@ -1513,6 +1513,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RMR,
 };
 
@@ -1524,6 +1525,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = true,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RMR,
 };
 
@@ -1535,6 +1537,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = PMQOS_CPU_LATENCY,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RMR,
 };
 
@@ -1546,6 +1549,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RMR,
 };
 
@@ -1557,6 +1561,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RMR,
 };
 
@@ -1568,6 +1573,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mm_data = {
 	.mclk0_is_mclk1 = false,
 	.pins = 8,
 	.flags = 0,
+	.mclk_en_gates_clock = true,
 	.max_register = FSL_SAI_MCTL,
 };
 
@@ -1579,6 +1585,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mn_data = {
 	.mclk0_is_mclk1 = false,
 	.pins = 8,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_MDIV,
 };
 
@@ -1590,6 +1597,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mp_data = {
 	.mclk0_is_mclk1 = false,
 	.pins = 8,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_MDIV,
 	.mclk_with_tere = true,
 };
@@ -1602,6 +1610,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8ulp_data = {
 	.mclk0_is_mclk1 = false,
 	.pins = 4,
 	.flags = PMQOS_CPU_LATENCY,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_RTCAP,
 };
 
@@ -1613,6 +1622,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
 	.mclk0_is_mclk1 = false,
 	.pins = 4,
 	.flags = 0,
+	.mclk_en_gates_clock = false,
 	.max_register = FSL_SAI_MCTL,
 	.max_burst = {8, 8},
 };
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 8254c3547b87..473260b0fbea 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -232,6 +232,7 @@ struct fsl_sai_soc_data {
 	bool use_edma;
 	bool mclk0_is_mclk1;
 	bool mclk_with_tere;
+	bool mclk_en_gates_clock;
 	unsigned int fifo_depth;
 	unsigned int pins;
 	unsigned int reg_offset;
-- 
2.34.1

