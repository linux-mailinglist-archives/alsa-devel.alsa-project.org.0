Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CC989A8A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 08:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2855114FD;
	Mon, 30 Sep 2024 08:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2855114FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727677913;
	bh=jo5nkncGfQC7UR7fO34SEjU4NRlphNGjYg2ywBpWx4c=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gXIeXd39HlApTm7TuRs38hC+HfkjdkCdb2Q4uk7qzUwjrDE/UubUNSz+rLEUXuURH
	 rEmYC/QNg3FztvBo6a//vxF/P4BTcYNjU5Ciq+jaO1dFJjdgLIyPvuspLzXfz9ZR7X
	 9ZodsyqIYx0QwrJKNlbc2TB20RdXWC874Bg8aioo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B02C6F805A9; Mon, 30 Sep 2024 08:31:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E15E6F805AE;
	Mon, 30 Sep 2024 08:31:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A88A6F80517; Mon, 30 Sep 2024 08:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8861EF800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 08:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8861EF800FA
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9616B1A016A;
	Mon, 30 Sep 2024 08:31:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E53A1A1780;
	Mon, 30 Sep 2024 08:31:11 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C0556183DC04;
	Mon, 30 Sep 2024 14:31:09 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
Date: Mon, 30 Sep 2024 14:08:28 +0800
Message-Id: <1727676508-22830-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: EBVQAZVD2BIOHXNL3OV2OVQNBJLA7OV3
X-Message-ID-Hash: EBVQAZVD2BIOHXNL3OV2OVQNBJLA7OV3
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBVQAZVD2BIOHXNL3OV2OVQNBJLA7OV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

FCONT=1 means On FIFO error, the SAI will continue from the
same word that caused the FIFO error to set after the FIFO
warning flag has been cleared.

Set FCONT bit in control register to avoid the channel swap
issue after SAI xrun.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 5 ++++-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ab58a4461073..634168d2bb6e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -613,6 +613,9 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/* Set to avoid channel swap */
+	val_cr4 |= FSL_SAI_CR4_FCONT;
+
 	/* Set to output mode to avoid tri-stated data pins */
 	if (tx)
 		val_cr4 |= FSL_SAI_CR4_CHMOD;
@@ -699,7 +702,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
-			   FSL_SAI_CR4_CHMOD_MASK,
+			   FSL_SAI_CR4_CHMOD_MASK | FSL_SAI_CR4_FCONT_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index dadbd16ee394..9c4d19fe22c6 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -137,6 +137,7 @@
 
 /* SAI Transmit and Receive Configuration 4 Register */
 
+#define FSL_SAI_CR4_FCONT_MASK	BIT(28)
 #define FSL_SAI_CR4_FCONT	BIT(28)
 #define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
 #define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
-- 
2.34.1

