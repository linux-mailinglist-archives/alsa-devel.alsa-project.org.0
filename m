Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F60328692
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6644C169F;
	Mon,  1 Mar 2021 18:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6644C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618833;
	bh=vdkgfYTBy9vYleTA6P3avwZb1bE3XbCFs6C48vOkcUc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bN+MEW0+gIqYYt/amGZyuLQEKgbgNwHrltMnCqLoTVxPbXoT4Pth5XI6Yvx0WAK88
	 2L3AGFG4kGFgzsV2fvKMako9j2C2TheJ1BsIE/h8dD3A4SxP0xZx7qHdAGe9VjyIXv
	 neHOydVlbyfB+oVdSt1mTDLtle3H1aqA007qEhUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1339F804C1;
	Mon,  1 Mar 2021 18:10:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F652F804C1; Mon,  1 Mar 2021 18:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6F63F804B1
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F63F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="jUpIfmsG"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614618606; x=1646154606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdkgfYTBy9vYleTA6P3avwZb1bE3XbCFs6C48vOkcUc=;
 b=jUpIfmsGkYJwBFPyQd7azIr3BsSQhdFCK6p0KbtVN56LaUUk2zOU7XDG
 pqxLZsqOBmW7D55Qvu5s/SbGHdm1vedR5wnTkn3ewdXANXtiYYXyqRmSx
 QYeOYURTlrxRyB+Q6dElmWARU5vPY8IyI2DmlC8ieiSIjbh6d1eMOI0a5
 KeSqoxL3LtV0hBBxAEMXBXV5ONyCUOUoGVSMOLE9X5BmPi6mizhs2XFhZ
 skq7RZvWVWwtyISoEISUbwLl40yh/gFxQfynGZJxsXl50bhamOfeEzHgV
 zly2ks4hp7UCDtC8wIXqRUDdUqrv6+W0Z8fmaDhBvh94S8rC1wXClEC6I g==;
IronPort-SDR: Ec1Yoapdx78FvltJ6RUWlVv5975kPSvNmlwSbX/Ove+CBHMc88rLCBqUTMMfaIEnhtIa8zXAUK
 hg0quGcg6fF2joKvaqdNCCXxgpOu579UITj3xK816gPP8OQlF6QjGsNAcBb/N6mHAPbcYReB94
 +RHsZW756UNHMarZLyAkMkzGEgbrDAtTMy1Ftc0OLrWJYDvgXJgEH1mRncvdWYIx3y27fKk2+G
 8dMrQBS7U/j1VzTBR9dGf8c924Wh7FYUG8T+f6lcrtTgR7O/orDDZeroKoKFdFueI78gr0l9QQ
 aog=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="111511781"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 10:10:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 10:09:57 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 1 Mar 2021 10:09:53 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 6/7] ASoC: mchp-i2s-mcc: Add FIFOs support
Date: Mon, 1 Mar 2021 19:09:04 +0200
Message-ID: <20210301170905.835091-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
References: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

I2S-MCC found on SAMA7G5 includes 2 FIFOs (capture and playback). When
FIFOs are enabled, bits I2SMCC_ISRA.TXLRDYx and I2SMCC_ISRA.TXRRDYx must
not be used. Bits I2SMCC_ISRB.TXFFRDY and I2SMCC_ISRB.RXFFRDY must be used
instead.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
- none

 sound/soc/atmel/mchp-i2s-mcc.c | 76 +++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 515ba3634fdd..673bc16cb46a 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -176,7 +176,7 @@
  */
 #define MCHP_I2SMCC_MRB_CRAMODE_REGULAR		(1 << 0)
 
-#define MCHP_I2SMCC_MRB_FIFOEN			BIT(1)
+#define MCHP_I2SMCC_MRB_FIFOEN			BIT(4)
 
 #define MCHP_I2SMCC_MRB_DMACHUNK_MASK		GENMASK(9, 8)
 #define MCHP_I2SMCC_MRB_DMACHUNK(no_words) \
@@ -230,6 +230,7 @@ static const struct regmap_config mchp_i2s_mcc_regmap_config = {
 
 struct mchp_i2s_mcc_soc_data {
 	unsigned int	data_pin_pair_num;
+	bool		has_fifo;
 };
 
 struct mchp_i2s_mcc_dev {
@@ -257,7 +258,7 @@ struct mchp_i2s_mcc_dev {
 static irqreturn_t mchp_i2s_mcc_interrupt(int irq, void *dev_id)
 {
 	struct mchp_i2s_mcc_dev *dev = dev_id;
-	u32 sra, imra, srb, imrb, pendinga, pendingb, idra = 0;
+	u32 sra, imra, srb, imrb, pendinga, pendingb, idra = 0, idrb = 0;
 	irqreturn_t ret = IRQ_NONE;
 
 	regmap_read(dev->regmap, MCHP_I2SMCC_IMRA, &imra);
@@ -275,24 +276,36 @@ static irqreturn_t mchp_i2s_mcc_interrupt(int irq, void *dev_id)
 	 * Tx/Rx ready interrupts are enabled when stopping only, to assure
 	 * availability and to disable clocks if necessary
 	 */
-	idra |= pendinga & (MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels) |
-			    MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels));
-	if (idra)
+	if (dev->soc->has_fifo) {
+		idrb |= pendingb & (MCHP_I2SMCC_INT_TXFFRDY |
+				    MCHP_I2SMCC_INT_RXFFRDY);
+	} else {
+		idra |= pendinga & (MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels) |
+				    MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels));
+	}
+	if (idra || idrb)
 		ret = IRQ_HANDLED;
 
-	if ((imra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels)) &&
-	    (imra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels)) ==
-	    (idra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels))) {
+	if ((!dev->soc->has_fifo &&
+	     (imra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels)) &&
+	     (imra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels)) ==
+	     (idra & MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels))) ||
+	    (dev->soc->has_fifo && imrb & MCHP_I2SMCC_INT_TXFFRDY)) {
 		dev->tx_rdy = 1;
 		wake_up_interruptible(&dev->wq_txrdy);
 	}
-	if ((imra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels)) &&
-	    (imra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels)) ==
-	    (idra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels))) {
+	if ((!dev->soc->has_fifo &&
+	     (imra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels)) &&
+	     (imra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels)) ==
+	     (idra & MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels))) ||
+	    (dev->soc->has_fifo && imrb & MCHP_I2SMCC_INT_RXFFRDY)) {
 		dev->rx_rdy = 1;
 		wake_up_interruptible(&dev->wq_rxrdy);
 	}
-	regmap_write(dev->regmap, MCHP_I2SMCC_IDRA, idra);
+	if (dev->soc->has_fifo)
+		regmap_write(dev->regmap, MCHP_I2SMCC_IDRB, idrb);
+	else
+		regmap_write(dev->regmap, MCHP_I2SMCC_IDRA, idra);
 
 	return ret;
 }
@@ -664,6 +677,10 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
+	/* enable FIFO if available */
+	if (dev->soc->has_fifo)
+		mrb |= MCHP_I2SMCC_MRB_FIFOEN;
+
 	/*
 	 * If we are already running, the wanted setup must be
 	 * the same with the one that's currently ongoing
@@ -726,8 +743,13 @@ static int mchp_i2s_mcc_hw_free(struct snd_pcm_substream *substream,
 		if (err == 0) {
 			dev_warn_once(dev->dev,
 				      "Timeout waiting for Tx ready\n");
-			regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
-				     MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels));
+			if (dev->soc->has_fifo)
+				regmap_write(dev->regmap, MCHP_I2SMCC_IDRB,
+					     MCHP_I2SMCC_INT_TXFFRDY);
+			else
+				regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
+					     MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels));
+
 			dev->tx_rdy = 1;
 		}
 	} else {
@@ -737,8 +759,12 @@ static int mchp_i2s_mcc_hw_free(struct snd_pcm_substream *substream,
 		if (err == 0) {
 			dev_warn_once(dev->dev,
 				      "Timeout waiting for Rx ready\n");
-			regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
-				     MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels));
+			if (dev->soc->has_fifo)
+				regmap_write(dev->regmap, MCHP_I2SMCC_IDRB,
+					     MCHP_I2SMCC_INT_RXFFRDY);
+			else
+				regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
+					     MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels));
 			dev->rx_rdy = 1;
 		}
 	}
@@ -765,7 +791,7 @@ static int mchp_i2s_mcc_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
 	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 	u32 cr = 0;
-	u32 iera = 0;
+	u32 iera = 0, ierb = 0;
 	u32 sr;
 	int err;
 
@@ -789,7 +815,10 @@ static int mchp_i2s_mcc_trigger(struct snd_pcm_substream *substream, int cmd,
 			 * Enable Tx Ready interrupts on all channels
 			 * to assure all data is sent
 			 */
-			iera = MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels);
+			if (dev->soc->has_fifo)
+				ierb = MCHP_I2SMCC_INT_TXFFRDY;
+			else
+				iera = MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels);
 		} else if (!is_playback && (sr & MCHP_I2SMCC_SR_RXEN)) {
 			cr = MCHP_I2SMCC_CR_RXDIS;
 			dev->rx_rdy = 0;
@@ -797,7 +826,10 @@ static int mchp_i2s_mcc_trigger(struct snd_pcm_substream *substream, int cmd,
 			 * Enable Rx Ready interrupts on all channels
 			 * to assure all data is received
 			 */
-			iera = MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels);
+			if (dev->soc->has_fifo)
+				ierb = MCHP_I2SMCC_INT_RXFFRDY;
+			else
+				iera = MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels);
 		}
 		break;
 	default:
@@ -815,7 +847,10 @@ static int mchp_i2s_mcc_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 	}
 
-	regmap_write(dev->regmap, MCHP_I2SMCC_IERA, iera);
+	if (dev->soc->has_fifo)
+		regmap_write(dev->regmap, MCHP_I2SMCC_IERB, ierb);
+	else
+		regmap_write(dev->regmap, MCHP_I2SMCC_IERA, iera);
 	regmap_write(dev->regmap, MCHP_I2SMCC_CR, cr);
 
 	return 0;
@@ -903,6 +938,7 @@ static struct mchp_i2s_mcc_soc_data mchp_i2s_mcc_sam9x60 = {
 
 static struct mchp_i2s_mcc_soc_data mchp_i2s_mcc_sama7g5 = {
 	.data_pin_pair_num = 4,
+	.has_fifo = true,
 };
 
 static const struct of_device_id mchp_i2s_mcc_dt_ids[] = {
-- 
2.27.0

