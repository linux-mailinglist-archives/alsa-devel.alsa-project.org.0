Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F01135469
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 09:34:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3928A171D;
	Thu,  9 Jan 2020 09:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3928A171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578558882;
	bh=Ak8tnRUQM+01Q5/ZWLfHZ3N0hZevwUQe6gx5x7VQ6vU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SPrS8Ibq5QwT7BfU74nu5uygmJwVUKbH/Vg6BBEQ1Hk8kuR4Ui+Ps8IXdG5UhuxRw
	 4WObYOTCzafdm/X+R4iKFHfWV3ptigZHv6IqypIUuZeAQUb4ciZKfSpmzUvdEljJ7P
	 YhnU3T5Uq+oZkeqnGFuxBsSqLOEvHxv2nOrPctp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48EF3F801F4;
	Thu,  9 Jan 2020 09:33:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6B0FF801EB; Thu,  9 Jan 2020 09:33:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2BF0F8015B
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 09:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BF0F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="m436o7ru"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0098VZVt016688; Thu, 9 Jan 2020 09:32:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rhy7vNp8Ty6wT0KybEQnE+eoDVq6maxX+YKLR1r1EwA=;
 b=m436o7ru352+BDinN7/j+Fsz9BdF9ZWA1X3+CV4Zm+NXo2miZXWp6MGgJYFq2imhz+lC
 0C2Fvt8DT1wowYJmwyPFFFk0oZxZ3UyUASTnxn4SC/258ComisP1q0UBOgaxFw3SQvtr
 1pxHc8Bt9mnxV4gHQe0nwQTpVxEgyqigzobLJebJ7aER73So/caW8SwNg0hBx0KIxiq/
 tMTdU3uNWUZKV6Lb9O4V2CQgSbe69+UQ69IY3sm63n7O42mwkVwLd4Y6lovB9FWjj3n3
 FcVkl/qAuYsC/vAS8Da7Q88qN703S/4BttngCI/YfG63dLNoNToaJguF5Hq/UDO/3EjB eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xdw8b11tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 09:32:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A52B310002A;
 Thu,  9 Jan 2020 09:32:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FC442211AA;
 Thu,  9 Jan 2020 09:32:56 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Thu, 9 Jan 2020 09:32:55 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Thu, 9 Jan 2020 09:32:54 +0100
Message-ID: <20200109083254.478-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
Subject: [alsa-devel] [PATCH] ASoC: stm32: sai: fix possible circular locking
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In current driver, locks can be taken as follows:
- Register access: take a lock on regmap config and then on clock.
- Master clock provider: take a lock on clock and then on regmap config.
This can lead to the circular locking summarized below.

Remove peripheral clock management through regmap framework, and manage
peripheral clock in driver instead. On register access, lock on clock
is taken first, which allows to avoid possible locking issue.

[ 6696.561513] ======================================================
[ 6696.567670] WARNING: possible circular locking dependency detected
[ 6696.573842] 4.19.49 #866 Not tainted
[ 6696.577397] ------------------------------------------------------
[ 6696.583566] pulseaudio/6439 is trying to acquire lock:
[ 6696.588697] 87b0a25b (enable_lock){..-.}, at: clk_enable_lock+0x64/0x128
[ 6696.595377]
[ 6696.595377] but task is already holding lock:
[ 6696.601197] d858f825 (stm32_sai_sub:1342:(sai->regmap_config)->lock){....}
...
[ 6696.812513]  Possible unsafe locking scenario:
[ 6696.812513]
[ 6696.818418]        CPU0                    CPU1
[ 6696.822935]        ----                    ----
[ 6696.827451]   lock(stm32_sai_sub:1342:(sai->regmap_config)->lock);
[ 6696.833618]                                lock(enable_lock);
[ 6696.839350]                                lock(stm32_sai_sub:1342:
                                              (sai->regmap_config)->lock);
[ 6696.848035]   lock(enable_lock);

Fixes: 03e78a242a15 ("ASoC: stm32: sai: add h7 support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 194 ++++++++++++++++++++++++----------
 1 file changed, 140 insertions(+), 54 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 48e629ac2d88..30bcd5d3a32a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -184,6 +184,56 @@ static bool stm32_sai_sub_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static int stm32_sai_sub_reg_up(struct stm32_sai_sub_data *sai,
+				unsigned int reg, unsigned int mask,
+				unsigned int val)
+{
+	int ret;
+
+	ret = clk_enable(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(sai->regmap, reg, mask, val);
+
+	clk_disable(sai->pdata->pclk);
+
+	return ret;
+}
+
+static int stm32_sai_sub_reg_wr(struct stm32_sai_sub_data *sai,
+				unsigned int reg, unsigned int mask,
+				unsigned int val)
+{
+	int ret;
+
+	ret = clk_enable(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write_bits(sai->regmap, reg, mask, val);
+
+	clk_disable(sai->pdata->pclk);
+
+	return ret;
+}
+
+static int stm32_sai_sub_reg_rd(struct stm32_sai_sub_data *sai,
+				unsigned int reg, unsigned int *val)
+{
+	int ret;
+
+	ret = clk_enable(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(sai->regmap, reg, val);
+
+	clk_disable(sai->pdata->pclk);
+
+	return ret;
+}
+
 static const struct regmap_config stm32_sai_sub_regmap_config_f4 = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -295,7 +345,7 @@ static int stm32_sai_set_clk_div(struct stm32_sai_sub_data *sai,
 
 	mask = SAI_XCR1_MCKDIV_MASK(SAI_XCR1_MCKDIV_WIDTH(version));
 	cr1 = SAI_XCR1_MCKDIV_SET(div);
-	ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, mask, cr1);
+	ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, mask, cr1);
 	if (ret < 0)
 		dev_err(&sai->pdev->dev, "Failed to update CR1 register\n");
 
@@ -372,8 +422,8 @@ static int stm32_sai_mclk_enable(struct clk_hw *hw)
 
 	dev_dbg(&sai->pdev->dev, "Enable master clock\n");
 
-	return regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-				  SAI_XCR1_MCKEN, SAI_XCR1_MCKEN);
+	return stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+				    SAI_XCR1_MCKEN, SAI_XCR1_MCKEN);
 }
 
 static void stm32_sai_mclk_disable(struct clk_hw *hw)
@@ -383,7 +433,7 @@ static void stm32_sai_mclk_disable(struct clk_hw *hw)
 
 	dev_dbg(&sai->pdev->dev, "Disable master clock\n");
 
-	regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, SAI_XCR1_MCKEN, 0);
+	stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, SAI_XCR1_MCKEN, 0);
 }
 
 static const struct clk_ops mclk_ops = {
@@ -446,15 +496,15 @@ static irqreturn_t stm32_sai_isr(int irq, void *devid)
 	unsigned int sr, imr, flags;
 	snd_pcm_state_t status = SNDRV_PCM_STATE_RUNNING;
 
-	regmap_read(sai->regmap, STM_SAI_IMR_REGX, &imr);
-	regmap_read(sai->regmap, STM_SAI_SR_REGX, &sr);
+	stm32_sai_sub_reg_rd(sai, STM_SAI_IMR_REGX, &imr);
+	stm32_sai_sub_reg_rd(sai, STM_SAI_SR_REGX, &sr);
 
 	flags = sr & imr;
 	if (!flags)
 		return IRQ_NONE;
 
-	regmap_write_bits(sai->regmap, STM_SAI_CLRFR_REGX, SAI_XCLRFR_MASK,
-			  SAI_XCLRFR_MASK);
+	stm32_sai_sub_reg_wr(sai, STM_SAI_CLRFR_REGX, SAI_XCLRFR_MASK,
+			     SAI_XCLRFR_MASK);
 
 	if (!sai->substream) {
 		dev_err(&pdev->dev, "Device stopped. Spurious IRQ 0x%x\n", sr);
@@ -503,8 +553,8 @@ static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
 	int ret;
 
 	if (dir == SND_SOC_CLOCK_OUT && sai->sai_mclk) {
-		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-					 SAI_XCR1_NODIV,
+		ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+					   SAI_XCR1_NODIV,
 					 freq ? 0 : SAI_XCR1_NODIV);
 		if (ret < 0)
 			return ret;
@@ -583,7 +633,7 @@ static int stm32_sai_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 
 	slotr_mask |= SAI_XSLOTR_SLOTEN_MASK;
 
-	regmap_update_bits(sai->regmap, STM_SAI_SLOTR_REGX, slotr_mask, slotr);
+	stm32_sai_sub_reg_up(sai, STM_SAI_SLOTR_REGX, slotr_mask, slotr);
 
 	sai->slot_width = slot_width;
 	sai->slots = slots;
@@ -665,7 +715,7 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	cr1_mask |= SAI_XCR1_CKSTR;
 	frcr_mask |= SAI_XFRCR_FSPOL;
 
-	regmap_update_bits(sai->regmap, STM_SAI_FRCR_REGX, frcr_mask, frcr);
+	stm32_sai_sub_reg_up(sai, STM_SAI_FRCR_REGX, frcr_mask, frcr);
 
 	/* DAI clock master masks */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -693,7 +743,7 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	cr1_mask |= SAI_XCR1_SLAVE;
 
 conf_update:
-	ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, cr1_mask, cr1);
+	ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, cr1_mask, cr1);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "Failed to update CR1 register\n");
 		return ret;
@@ -730,12 +780,12 @@ static int stm32_sai_startup(struct snd_pcm_substream *substream,
 	}
 
 	/* Enable ITs */
-	regmap_write_bits(sai->regmap, STM_SAI_CLRFR_REGX,
-			  SAI_XCLRFR_MASK, SAI_XCLRFR_MASK);
+	stm32_sai_sub_reg_wr(sai, STM_SAI_CLRFR_REGX,
+			     SAI_XCLRFR_MASK, SAI_XCLRFR_MASK);
 
 	imr = SAI_XIMR_OVRUDRIE;
 	if (STM_SAI_IS_CAPTURE(sai)) {
-		regmap_read(sai->regmap, STM_SAI_CR2_REGX, &cr2);
+		stm32_sai_sub_reg_rd(sai, STM_SAI_CR2_REGX, &cr2);
 		if (cr2 & SAI_XCR2_MUTECNT_MASK)
 			imr |= SAI_XIMR_MUTEDETIE;
 	}
@@ -745,8 +795,8 @@ static int stm32_sai_startup(struct snd_pcm_substream *substream,
 	else
 		imr |= SAI_XIMR_AFSDETIE | SAI_XIMR_LFSDETIE;
 
-	regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX,
-			   SAI_XIMR_MASK, imr);
+	stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX,
+			     SAI_XIMR_MASK, imr);
 
 	return 0;
 }
@@ -763,10 +813,10 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 	 * SAI fifo threshold is set to half fifo, to keep enough space
 	 * for DMA incoming bursts.
 	 */
-	regmap_write_bits(sai->regmap, STM_SAI_CR2_REGX,
-			  SAI_XCR2_FFLUSH | SAI_XCR2_FTH_MASK,
-			  SAI_XCR2_FFLUSH |
-			  SAI_XCR2_FTH_SET(STM_SAI_FIFO_TH_HALF));
+	stm32_sai_sub_reg_wr(sai, STM_SAI_CR2_REGX,
+			     SAI_XCR2_FFLUSH | SAI_XCR2_FTH_MASK,
+			     SAI_XCR2_FFLUSH |
+			     SAI_XCR2_FTH_SET(STM_SAI_FIFO_TH_HALF));
 
 	/* DS bits in CR1 not set for SPDIF (size forced to 24 bits).*/
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai)) {
@@ -795,7 +845,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 	if ((sai->slots == 2) && (params_channels(params) == 1))
 		cr1 |= SAI_XCR1_MONO;
 
-	ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, cr1_mask, cr1);
+	ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, cr1_mask, cr1);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "Failed to update CR1 register\n");
 		return ret;
@@ -809,7 +859,7 @@ static int stm32_sai_set_slots(struct snd_soc_dai *cpu_dai)
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int slotr, slot_sz;
 
-	regmap_read(sai->regmap, STM_SAI_SLOTR_REGX, &slotr);
+	stm32_sai_sub_reg_rd(sai, STM_SAI_SLOTR_REGX, &slotr);
 
 	/*
 	 * If SLOTSZ is set to auto in SLOTR, align slot width on data size
@@ -831,16 +881,16 @@ static int stm32_sai_set_slots(struct snd_soc_dai *cpu_dai)
 		sai->slots = 2;
 
 	/* The number of slots in the audio frame is equal to NBSLOT[3:0] + 1*/
-	regmap_update_bits(sai->regmap, STM_SAI_SLOTR_REGX,
-			   SAI_XSLOTR_NBSLOT_MASK,
-			   SAI_XSLOTR_NBSLOT_SET((sai->slots - 1)));
+	stm32_sai_sub_reg_up(sai, STM_SAI_SLOTR_REGX,
+			     SAI_XSLOTR_NBSLOT_MASK,
+			     SAI_XSLOTR_NBSLOT_SET((sai->slots - 1)));
 
 	/* Set default slots mask if not already set from DT */
 	if (!(slotr & SAI_XSLOTR_SLOTEN_MASK)) {
 		sai->slot_mask = (1 << sai->slots) - 1;
-		regmap_update_bits(sai->regmap,
-				   STM_SAI_SLOTR_REGX, SAI_XSLOTR_SLOTEN_MASK,
-				   SAI_XSLOTR_SLOTEN_SET(sai->slot_mask));
+		stm32_sai_sub_reg_up(sai,
+				     STM_SAI_SLOTR_REGX, SAI_XSLOTR_SLOTEN_MASK,
+				     SAI_XSLOTR_SLOTEN_SET(sai->slot_mask));
 	}
 
 	dev_dbg(cpu_dai->dev, "Slots %d, slot width %d\n",
@@ -870,14 +920,14 @@ static void stm32_sai_set_frame(struct snd_soc_dai *cpu_dai)
 	dev_dbg(cpu_dai->dev, "Frame length %d, frame active %d\n",
 		sai->fs_length, fs_active);
 
-	regmap_update_bits(sai->regmap, STM_SAI_FRCR_REGX, frcr_mask, frcr);
+	stm32_sai_sub_reg_up(sai, STM_SAI_FRCR_REGX, frcr_mask, frcr);
 
 	if ((sai->fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_LSB) {
 		offset = sai->slot_width - sai->data_size;
 
-		regmap_update_bits(sai->regmap, STM_SAI_SLOTR_REGX,
-				   SAI_XSLOTR_FBOFF_MASK,
-				   SAI_XSLOTR_FBOFF_SET(offset));
+		stm32_sai_sub_reg_up(sai, STM_SAI_SLOTR_REGX,
+				     SAI_XSLOTR_FBOFF_MASK,
+				     SAI_XSLOTR_FBOFF_SET(offset));
 	}
 }
 
@@ -994,9 +1044,9 @@ static int stm32_sai_configure_clock(struct snd_soc_dai *cpu_dai,
 					return -EINVAL;
 				}
 
-				regmap_update_bits(sai->regmap,
-						   STM_SAI_CR1_REGX,
-						   SAI_XCR1_OSR, cr1);
+				stm32_sai_sub_reg_up(sai,
+						     STM_SAI_CR1_REGX,
+						     SAI_XCR1_OSR, cr1);
 
 				div = stm32_sai_get_clk_div(sai, sai_clk_rate,
 							    sai->mclk_rate);
@@ -1058,12 +1108,12 @@ static int stm32_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		dev_dbg(cpu_dai->dev, "Enable DMA and SAI\n");
 
-		regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-				   SAI_XCR1_DMAEN, SAI_XCR1_DMAEN);
+		stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+				     SAI_XCR1_DMAEN, SAI_XCR1_DMAEN);
 
 		/* Enable SAI */
-		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-					 SAI_XCR1_SAIEN, SAI_XCR1_SAIEN);
+		ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+					   SAI_XCR1_SAIEN, SAI_XCR1_SAIEN);
 		if (ret < 0)
 			dev_err(cpu_dai->dev, "Failed to update CR1 register\n");
 		break;
@@ -1072,16 +1122,16 @@ static int stm32_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 		dev_dbg(cpu_dai->dev, "Disable DMA and SAI\n");
 
-		regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX,
-				   SAI_XIMR_MASK, 0);
+		stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX,
+				     SAI_XIMR_MASK, 0);
 
-		regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-				   SAI_XCR1_SAIEN,
-				   (unsigned int)~SAI_XCR1_SAIEN);
+		stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+				     SAI_XCR1_SAIEN,
+				     (unsigned int)~SAI_XCR1_SAIEN);
 
-		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
-					 SAI_XCR1_DMAEN,
-					 (unsigned int)~SAI_XCR1_DMAEN);
+		ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
+					   SAI_XCR1_DMAEN,
+					   (unsigned int)~SAI_XCR1_DMAEN);
 		if (ret < 0)
 			dev_err(cpu_dai->dev, "Failed to update CR1 register\n");
 
@@ -1101,7 +1151,7 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned long flags;
 
-	regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
+	stm32_sai_sub_reg_up(sai, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
 	clk_disable_unprepare(sai->sai_ck);
 
@@ -1169,7 +1219,7 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	cr1_mask |= SAI_XCR1_SYNCEN_MASK;
 	cr1 |= SAI_XCR1_SYNCEN_SET(sai->sync);
 
-	return regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, cr1_mask, cr1);
+	return stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, cr1_mask, cr1);
 }
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
@@ -1322,8 +1372,13 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	if (STM_SAI_HAS_PDM(sai) && STM_SAI_IS_SUB_A(sai))
 		sai->regmap_config = &stm32_sai_sub_regmap_config_h7;
 
-	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "sai_ck",
-						base, sai->regmap_config);
+	/*
+	 * Do not manage peripheral clock through regmap framework as this
+	 * can lead to circular locking issue with sai master clock provider.
+	 * Manage peripheral clock directly in driver instead.
+	 */
+	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					    sai->regmap_config);
 	if (IS_ERR(sai->regmap)) {
 		dev_err(&pdev->dev, "Failed to initialize MMIO\n");
 		return PTR_ERR(sai->regmap);
@@ -1420,6 +1475,10 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 		return PTR_ERR(sai->sai_ck);
 	}
 
+	ret = clk_prepare(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
+
 	if (STM_SAI_IS_F4(sai->pdata))
 		return 0;
 
@@ -1501,22 +1560,48 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int stm32_sai_sub_remove(struct platform_device *pdev)
+{
+	struct stm32_sai_sub_data *sai = dev_get_drvdata(&pdev->dev);
+
+	clk_unprepare(sai->pdata->pclk);
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int stm32_sai_sub_suspend(struct device *dev)
 {
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
 
 	regcache_cache_only(sai->regmap, true);
 	regcache_mark_dirty(sai->regmap);
+
+	clk_disable(sai->pdata->pclk);
+
 	return 0;
 }
 
 static int stm32_sai_sub_resume(struct device *dev)
 {
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(sai->pdata->pclk);
+	if (ret < 0)
+		return ret;
 
 	regcache_cache_only(sai->regmap, false);
-	return regcache_sync(sai->regmap);
+	ret = regcache_sync(sai->regmap);
+
+	clk_disable(sai->pdata->pclk);
+
+	return ret;
 }
 #endif /* CONFIG_PM_SLEEP */
 
@@ -1531,6 +1616,7 @@ static struct platform_driver stm32_sai_sub_driver = {
 		.pm = &stm32_sai_sub_pm_ops,
 	},
 	.probe = stm32_sai_sub_probe,
+	.remove = stm32_sai_sub_remove,
 };
 
 module_platform_driver(stm32_sai_sub_driver);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
