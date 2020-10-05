Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF42834CD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43F9017E0;
	Mon,  5 Oct 2020 13:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43F9017E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601896759;
	bh=1kAP65U1FDM2iHmzG2LJ0awbT2gRhDaa/hQDA2oJHDg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r6zbol70fJ8gqEW3oEWNPJqQaXwIBJH8J+Edfli4C+2roCKvlHs09DQiF6y34ZhrO
	 dlowrutraic3hapO5n4H/yA8B6gA5hU7y6sn9tma4A2s/BOYVEzVyExwWgx1wxYaPf
	 u+ba7atGPa9YKL6HU3I17VKv65S/THolWCE6q1Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 443DEF80245;
	Mon,  5 Oct 2020 13:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3E01F8027B; Mon,  5 Oct 2020 13:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out-2.mail.amis.net (out-2.mail.amis.net [212.18.32.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7767EF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7767EF80121
Received: from in-3.mail.amis.net (in-3.mail.amis.net [212.18.32.22])
 by out-2.mail.amis.net (Postfix) with ESMTP id F086B81354;
 Mon,  5 Oct 2020 13:16:45 +0200 (CEST)
Received: from in-3.mail.amis.net (localhost [127.0.0.1])
 by in-3.mail.amis.net (Postfix) with ESMTP id EB6EBC943C;
 Mon,  5 Oct 2020 13:16:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amis.net
X-Amavis-OS-Fingerprint: MYNETWORKS, [2001:15c0:ffff:f::41]:46263
Received: from in-3.mail.amis.net ([127.0.0.1])
 by in-3.mail.amis.net (in-3.mail.amis.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 4cAIiDtffvPC; Mon,  5 Oct 2020 13:16:45 +0200 (CEST)
Received: from smtp1.amis.net (smtp1.amis.net [IPv6:2001:15c0:ffff:f::41])
 by in-3.mail.amis.net (Postfix) with ESMTP id 8083FC9434;
 Mon,  5 Oct 2020 13:16:45 +0200 (CEST)
Received: from localhost.localdomain (89-212-21-243.static.t-2.net
 [89.212.21.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp1.amis.net (Postfix) with ESMTPSA id E7E94C2DD1;
 Mon,  5 Oct 2020 13:16:44 +0200 (CEST)
From: Primoz Fiser <primoz.fiser@norik.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: fsl: fsl_ssi: add ac97 fixed mode support
Date: Mon,  5 Oct 2020 13:16:43 +0200
Message-Id: <20201005111644.3131604-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

SSI supports "variable" and "fixed" mode of operation in AC'97 mode. Up
to now, driver always configured SSI port to operate in "variable" AC'97
mode which is known to be unreliable with some CODECs, see:
commit 01ca485171e3 ("ASoC: fsl_ssi: only enable proper channel slots in
AC'97 mode") for more information on issues related to spurious SLOTREQ
bits. But in summary, when SSI operates in AC'97 variable mode of
operation, CODECs can sometimes send SLOTREQ bits for non-existent audio
slots which then "stick" in SSI and completely break audio output.
Contrary when operating SSI in AC'97 fixed mode, described issues were
completely gone!

Thus add support for operating SSI in AC'97 Fixed Mode of operation
which provides better audio reliability when compared to AC'97 Variable
Mode with some CODECs.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 sound/soc/fsl/fsl_ssi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 404be27c15fe..3b89785f6de8 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -243,6 +243,7 @@ struct fsl_ssi_soc_data {
  * @dma_maxburst: Max number of words to transfer in one go. So far,
  *                this is always the same as fifo_watermark.
  * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
+ * @ac97_fixed_mode: SSI in AC97 fixed mode of operation
  */
 struct fsl_ssi {
 	struct regmap *regs;
@@ -287,6 +288,7 @@ struct fsl_ssi {
 	u32 dma_maxburst;
 
 	struct mutex ac97_reg_lock;
+	bool ac97_fixed_mode;
 };
 
 /*
@@ -616,7 +618,12 @@ static void fsl_ssi_setup_ac97(struct fsl_ssi *ssi)
 	regmap_write(regs, REG_SSI_SRCCR, SSI_SxCCR_WL(17) | SSI_SxCCR_DC(13));
 
 	/* Enable AC97 mode and startup the SSI */
-	regmap_write(regs, REG_SSI_SACNT, SSI_SACNT_AC97EN | SSI_SACNT_FV);
+	if (ssi->ac97_fixed_mode) {
+		regmap_write(regs, REG_SSI_SACNT, SSI_SACNT_AC97EN);
+		regmap_write(regs, REG_SSI_SATAG, 0x9800);
+	} else
+		regmap_write(regs, REG_SSI_SACNT,
+				SSI_SACNT_AC97EN | SSI_SACNT_FV);
 
 	/* AC97 has to communicate with codec before starting a stream */
 	regmap_update_bits(regs, REG_SSI_SCR,
@@ -1092,8 +1099,10 @@ static int fsl_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
 		 * send valid data to slots other than normal playback slots.
 		 *
 		 * To be safe, configure SACCST right before TX starts.
+		 *
+		 * Above applies only when SSI operates in AC97 Variable Mode.
 		 */
-		if (tx && fsl_ssi_is_ac97(ssi))
+		if (tx && fsl_ssi_is_ac97(ssi) && !ssi->ac97_fixed_mode)
 			fsl_ssi_tx_ac97_saccst_setup(ssi);
 		fsl_ssi_config_enable(ssi, tx);
 		break;
@@ -1437,6 +1446,11 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
 		ssi->synchronous = true;
 	}
 
+	/* Check AC97 mode of operation */
+	sprop = of_get_property(np, "fsl,ac97-mode", NULL);
+	if (sprop && !strcmp(sprop, "fixed"))
+		ssi->ac97_fixed_mode = true;
+
 	/* Select DMA or FIQ */
 	ssi->use_dma = !of_property_read_bool(np, "fsl,fiq-stream-filter");
 
-- 
2.25.1

