Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176893991D
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 00:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E0F9166C;
	Sat,  8 Jun 2019 00:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E0F9166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559947752;
	bh=W82nOo4452SkRjhOZGPO2TFnkJAmSV31Sue9ekeNf18=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKufB1yccUz8QDnFkrTo9HozHtnkLyowE+CYEFjA0AtRmbgZFXBm/hPITdmQbFs3o
	 cuLM8FkgR4Eut/MlHXpiJvoQxh8IMQdDDPSQFNMgtwrMsaEJ9on9/zPYuJadP1L57q
	 YceqpkgcMTa4MJayvRiaiLxpt4GlPQc4/VdytJIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D91F896DB;
	Sat,  8 Jun 2019 00:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE81CF896DD; Sat,  8 Jun 2019 00:47:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32D9AF8072A
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 00:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D9AF8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZLv6Z5QL"
Received: by mail-pf1-x444.google.com with SMTP id u22so1961350pfm.3
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ICW3GL2Jj3l3TI0uaeVmL4hkLsOez9fNWXiS/c/eQfY=;
 b=ZLv6Z5QLrJ+vdWNUCHtqlqCZG0PHFSaqt+Py5Y89czZ4uyL/hKmWBXnoebJ3oaJi2z
 fNsp68F8q2R9N96Bd9A/jI8d3QiZw8dMUUbqt6I47PD341BnMyAh7g7AHqEGCO2357IC
 CNMz4FlFehqaX9xTiVgvKTM+1QSBUuGtarJE+wv+JrlMPcZulqB+f1XYstR1FktPqjMR
 /lUqqQ+RIogrZ2xOFaoX85DHtBzOfnEWeK8DbD9KKBh2VlKWSEuOVRTez+2Z7ahvASP1
 9yI02X006pLDHxGt7czFz+UL2a2a6OFZ56XtvR2B4GWpYPikdJVhqV2yYSE3I7xSwHso
 8F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ICW3GL2Jj3l3TI0uaeVmL4hkLsOez9fNWXiS/c/eQfY=;
 b=taZjlDz46vTRXdfN0NIZxnKqAjSWqxQZhkgt3wFHn3qa4mR1QuWUxwQ3NjT0xyVKHg
 rjC3+Wm/jsZ9j95J/Y1JJMAmHbLQfqqiHxu3IzTn/NcI5JB1j+mybFne0HHO0rJjIkHM
 lN6FwDIA24BHo70ijrPq7IQvFSfgQBHYB+axsPvdCIWT3aXx9kWgJGg2S1XSvLPBUv8+
 JRmGJqbQQ3jhJziMfieIB16ccJ47UNPW9Xypm4RtvJwOgwS4NBLC7IfFzRHgiZwXmQxk
 4N4X9HYnFTuQ0Qd43+hmaYzGqVOjK2ACbRkVejePrbKOT3WzXSSNfH7pUqRjWaKEm9xM
 TQyw==
X-Gm-Message-State: APjAAAXdvQJ9WVQeaPH/tcg0LvILqziqygZiPCMjv1xQjIhwOfnduQt0
 RkMT6rCD0rttBQn3Rl4vuCY=
X-Google-Smtp-Source: APXvYqx0Kqdu7J8mgnnETb2JJBsOuRoR+vWceEaG9gGl0GEJ6BSdxg5yX5SJDiBQSiluCmXucSjmXQ==
X-Received: by 2002:a62:4d03:: with SMTP id a3mr62510491pfb.2.1559947640754;
 Fri, 07 Jun 2019 15:47:20 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id o70sm3684607pfo.33.2019.06.07.15.47.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 15:47:20 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com,
	broonie@kernel.org
Date: Fri,  7 Jun 2019 15:47:14 -0700
Message-Id: <20190607224714.13933-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and
	TX0~5 registers are non volatile"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are
non volatile") removed TX data registers from the volatile_reg list
and appended default values for them. However, being data registers
of TX, they should not have been removed from the list because they
should not be cached -- see the following reason.

When doing regcache_sync(), this operation might accidentally write
some dirty data to these registers, in case that cached data happen
to be different from the default ones, which might also result in a
channel shift or swap situation, since the number of write-via-sync
operations at ETDR would very unlikely match the channel number.

So this patch reverts the original commit to keep TX data registers
in volatile_reg list in order to prevent them from being written by
regcache_sync().

Note: this revert is not a complete revert as it keeps those macros
of registers remaining in the default value list while the original
commit also changed other entries in the list. And this patch isn't
very necessary to Cc stable tree since there has been always a FIFO
reset operation around the regcache_sync() call, even prior to this
reverted commit.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Hi Mark,
In case there's no objection against the patch, I'd still like to
wait for a Tested-by from NXP folks before submitting it. Thanks!

Changelog
v1->v2
 * Fixed subject by following subsystem format.
 * Revised commit message to emphasize the real issue.

 sound/soc/fsl/fsl_esai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..8f0a86335f73 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -652,16 +652,9 @@ static const struct snd_soc_component_driver fsl_esai_component = {
 };
 
 static const struct reg_default fsl_esai_reg_defaults[] = {
-	{REG_ESAI_ETDR,	 0x00000000},
 	{REG_ESAI_ECR,	 0x00000000},
 	{REG_ESAI_TFCR,	 0x00000000},
 	{REG_ESAI_RFCR,	 0x00000000},
-	{REG_ESAI_TX0,	 0x00000000},
-	{REG_ESAI_TX1,	 0x00000000},
-	{REG_ESAI_TX2,	 0x00000000},
-	{REG_ESAI_TX3,	 0x00000000},
-	{REG_ESAI_TX4,	 0x00000000},
-	{REG_ESAI_TX5,	 0x00000000},
 	{REG_ESAI_TSR,	 0x00000000},
 	{REG_ESAI_SAICR, 0x00000000},
 	{REG_ESAI_TCR,	 0x00000000},
@@ -711,10 +704,17 @@ static bool fsl_esai_readable_reg(struct device *dev, unsigned int reg)
 static bool fsl_esai_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case REG_ESAI_ETDR:
 	case REG_ESAI_ERDR:
 	case REG_ESAI_ESR:
 	case REG_ESAI_TFSR:
 	case REG_ESAI_RFSR:
+	case REG_ESAI_TX0:
+	case REG_ESAI_TX1:
+	case REG_ESAI_TX2:
+	case REG_ESAI_TX3:
+	case REG_ESAI_TX4:
+	case REG_ESAI_TX5:
 	case REG_ESAI_RX0:
 	case REG_ESAI_RX1:
 	case REG_ESAI_RX2:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
