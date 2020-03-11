Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CC180F75
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 06:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C30825;
	Wed, 11 Mar 2020 06:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C30825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583903379;
	bh=H+JwT5c+9Zjju3eHRYk7v/Q4Y96pkEi1b9xHInywAzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuSlWSpqPlY/U8l8LbMP9WZXpZh/fxCtQ3uFPKIMXvztt6AaLTBWofrKQ/7v1W1LG
	 doQgNWTsJ9ZvVnvEYZZLMLiIuEH1tBlTUYmkwe7BopKWbmv2gJC6sKF3HhsQLFk8c3
	 Z/BCvvfxc5zCzS3mWDE5fHz/y87bgXd65rlWa8Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E40F80141;
	Wed, 11 Mar 2020 06:07:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79BE1F8021D; Wed, 11 Mar 2020 06:07:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0111.hostedemail.com
 [216.40.44.111])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5194F801F7
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 06:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5194F801F7
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 69F6618224519;
 Wed, 11 Mar 2020 05:07:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cream52_212c176dc7e35
X-Filterd-Recvd-Size: 5395
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 05:07:07 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Date: Tue, 10 Mar 2020 21:51:27 -0700
Message-Id: <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Richard Weinberger <richard@nod.at>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org
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

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
 drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
 sound/soc/codecs/jz4770.c                       | 2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7c..8eefe7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -305,7 +305,7 @@ static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
 	switch (finfo->format) {
 	case DRM_FORMAT_XRGB1555:
 		ctrl |= JZ_LCD_CTRL_RGB555;
-		/* fall-through */
+		fallthrough;
 	case DRM_FORMAT_RGB565:
 		ctrl |= JZ_LCD_CTRL_BPP_15_16;
 		break;
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index fbae87..9026af6 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -737,8 +737,7 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *devid)
 			break;
 
 		jz_mmc_prepare_data_transfer(host);
-		/* fall through */
-
+		fallthrough;
 	case JZ4740_MMC_STATE_TRANSFER_DATA:
 		if (host->use_dma) {
 			/* Use DMA if enabled.
@@ -772,8 +771,7 @@ static irqreturn_t jz_mmc_irq_worker(int irq, void *devid)
 			break;
 		}
 		jz4740_mmc_write_irq_reg(host, JZ_MMC_IRQ_DATA_TRAN_DONE);
-		/* fall through */
-
+		fallthrough;
 	case JZ4740_MMC_STATE_SEND_STOP:
 		if (!req->stop)
 			break;
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 49afeb..935c49 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -253,7 +253,7 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.hwctl = ingenic_nand_ecc_hwctl;
 		chip->ecc.calculate = ingenic_nand_ecc_calculate;
 		chip->ecc.correct = ingenic_nand_ecc_correct;
-		/* fall through */
+		fallthrough;
 	case NAND_ECC_SOFT:
 		dev_info(nfc->dev, "using %s (strength %d, size %d, bytes %d)\n",
 			 (nfc->ecc) ? "hardware ECC" : "software ECC",
diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 6c852ea..2d0e0a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -145,10 +145,10 @@ static void jz4725b_bch_read_parity(struct ingenic_ecc *bch, u8 *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
-		/* fall-through */
+		fallthrough;
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
-		/* fall-through */
+		fallthrough;
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 079266a..d67dbf 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -123,10 +123,10 @@ static void jz4780_bch_read_parity(struct ingenic_ecc *bch, void *buf,
 	switch (size8) {
 	case 3:
 		dest8[2] = (val >> 16) & 0xff;
-		/* fall through */
+		fallthrough;
 	case 2:
 		dest8[1] = (val >> 8) & 0xff;
-		/* fall through */
+		fallthrough;
 	case 1:
 		dest8[0] = val & 0xff;
 		break;
diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index e7cf2c..6e2a91 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -202,7 +202,7 @@ static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
 				   REG_CR_VIC_SB_SLEEP, REG_CR_VIC_SB_SLEEP);
 		regmap_update_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
 				   REG_CR_VIC_SB, REG_CR_VIC_SB);
-	/* fall-through */
+		fallthrough;
 	default:
 		break;
 	}
-- 
2.24.0

