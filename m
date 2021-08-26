Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73AD3F8176
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49B26167C;
	Thu, 26 Aug 2021 06:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49B26167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950741;
	bh=XU+bK5UNKOn4N8VPnD1ha8yon1/GmpGdKLgtkalt39U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SRJzysLow0Hv1iyYK7DaFznQ+MIMyqi+/HG6bPF2VHwgbq80POzgW0f2VR/F6S3dz
	 CbuFhIxTxPbJLNb+UetrU3MOlnwo6xxTS2KRvN+JBOowgb3eYZZhzopG3NOEKRi90S
	 sL10/xkgf7E8hHtgwqs/Q/mvZaHruSgBcLUk0fqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD575F804E7;
	Thu, 26 Aug 2021 06:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDDFF804E7; Thu, 26 Aug 2021 06:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50261F804B4
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50261F804B4
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id C182CD6435;
 Thu, 26 Aug 2021 12:03:17 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32763T139760853055232S1629950596113927_; 
 Thu, 26 Aug 2021 12:03:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f7412056e7e87b09dbc6f70dea49ccc0>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3 12/14] ASoC: rockchip: i2s: Add support for frame inversion
Date: Thu, 26 Aug 2021 12:03:12 +0800
Message-Id: <1629950594-14345-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

This patch adds support for frame inversion.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 20 +++++++++++++++++---
 sound/soc/rockchip/rockchip_i2s.h | 10 ++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index ab060fc..801fc60 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -236,13 +236,27 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 
 	regmap_update_bits(i2s->regmap, I2S_CKR, mask, val);
 
-	mask = I2S_CKR_CKP_MASK;
+	mask = I2S_CKR_CKP_MASK | I2S_CKR_TLP_MASK | I2S_CKR_RLP_MASK;
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
-		val = I2S_CKR_CKP_NEG;
+		val = I2S_CKR_CKP_NORMAL |
+		      I2S_CKR_TLP_NORMAL |
+		      I2S_CKR_RLP_NORMAL;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		val = I2S_CKR_CKP_NORMAL |
+		      I2S_CKR_TLP_INVERTED |
+		      I2S_CKR_RLP_INVERTED;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		val = I2S_CKR_CKP_POS;
+		val = I2S_CKR_CKP_INVERTED |
+		      I2S_CKR_TLP_NORMAL |
+		      I2S_CKR_RLP_NORMAL;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		val = I2S_CKR_CKP_INVERTED |
+		      I2S_CKR_TLP_INVERTED |
+		      I2S_CKR_RLP_INVERTED;
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/sound/soc/rockchip/rockchip_i2s.h b/sound/soc/rockchip/rockchip_i2s.h
index fcaae24..251851b 100644
--- a/sound/soc/rockchip/rockchip_i2s.h
+++ b/sound/soc/rockchip/rockchip_i2s.h
@@ -88,15 +88,17 @@
 #define I2S_CKR_MSS_SLAVE	(1 << I2S_CKR_MSS_SHIFT)
 #define I2S_CKR_MSS_MASK	(1 << I2S_CKR_MSS_SHIFT)
 #define I2S_CKR_CKP_SHIFT	26
-#define I2S_CKR_CKP_NEG		(0 << I2S_CKR_CKP_SHIFT)
-#define I2S_CKR_CKP_POS		(1 << I2S_CKR_CKP_SHIFT)
+#define I2S_CKR_CKP_NORMAL	(0 << I2S_CKR_CKP_SHIFT)
+#define I2S_CKR_CKP_INVERTED	(1 << I2S_CKR_CKP_SHIFT)
 #define I2S_CKR_CKP_MASK	(1 << I2S_CKR_CKP_SHIFT)
 #define I2S_CKR_RLP_SHIFT	25
 #define I2S_CKR_RLP_NORMAL	(0 << I2S_CKR_RLP_SHIFT)
-#define I2S_CKR_RLP_OPPSITE	(1 << I2S_CKR_RLP_SHIFT)
+#define I2S_CKR_RLP_INVERTED	(1 << I2S_CKR_RLP_SHIFT)
+#define I2S_CKR_RLP_MASK	(1 << I2S_CKR_RLP_SHIFT)
 #define I2S_CKR_TLP_SHIFT	24
 #define I2S_CKR_TLP_NORMAL	(0 << I2S_CKR_TLP_SHIFT)
-#define I2S_CKR_TLP_OPPSITE	(1 << I2S_CKR_TLP_SHIFT)
+#define I2S_CKR_TLP_INVERTED	(1 << I2S_CKR_TLP_SHIFT)
+#define I2S_CKR_TLP_MASK	(1 << I2S_CKR_TLP_SHIFT)
 #define I2S_CKR_MDIV_SHIFT	16
 #define I2S_CKR_MDIV(x)		((x - 1) << I2S_CKR_MDIV_SHIFT)
 #define I2S_CKR_MDIV_MASK	(0xff << I2S_CKR_MDIV_SHIFT)
-- 
2.7.4



