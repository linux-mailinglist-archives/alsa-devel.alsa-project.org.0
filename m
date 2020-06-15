Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271501F8D84
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF90F1615;
	Mon, 15 Jun 2020 08:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF90F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592201351;
	bh=ooQheLCSX2agzBB0u78icbP3a64Owo2EEWnMzt55guE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nOm5tfG5wOrjpc8tPVtEyFK0MXF00HiCuuNxq5lqRufCqjhupUTkuLJtTqDZD/uVN
	 zEk3qNRaMgMQGcQpiSBrt1jNJpqywhcnNSEV7ocaMmWu9mRk8PLMvHyK77VDBtUOAi
	 lW5rXd46l6riUZCStXRb7trfo6HMp/iHQ2OXBSpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8C7F800CD;
	Mon, 15 Jun 2020 08:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26B6F80171; Mon, 15 Jun 2020 08:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E398BF800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 08:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E398BF800EF
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E10F520133E;
 Mon, 15 Jun 2020 08:07:20 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B8DBA201343;
 Mon, 15 Jun 2020 08:07:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 370E64030D;
 Mon, 15 Jun 2020 14:07:11 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Date: Mon, 15 Jun 2020 13:56:18 +0800
Message-Id: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

For mono channel, SSI will switch to Normal mode.

In Normal mode and Network mode, the Word Length Control bits
control the word length divider in clock generator, which is
different with I2S Master mode (the word length is fixed to
32bit), it should be the value of params_width(hw_params).

The condition "slots == 2" is not good for I2S Master mode,
because for Network mode and Normal mode, the slots can also
be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
to check if it is I2S Master mode.

So we refine the famula for mono channel, otherwise there
will be sound issue for S24_LE.

Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- refine patch for Network mode and Normal mode.

 sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index bad89b0d129e..cbf67d132fda 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	struct regmap *regs = ssi->regs;
 	u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
 	unsigned long clkrate, baudrate, tmprate;
-	unsigned int slots = params_channels(hw_params);
+	unsigned int channels = params_channels(hw_params);
+	unsigned int slots;
 	unsigned int slot_width = 32;
 	u64 sub, savesub = 100000;
 	unsigned int freq;
@@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	/* Override slots and slot_width if being specifically set... */
 	if (ssi->slots)
 		slots = ssi->slots;
-	/* ...but keep 32 bits if slots is 2 -- I2S Master mode */
-	if (ssi->slot_width && slots != 2)
-		slot_width = ssi->slot_width;
+	else
+		/* Apply two slots for mono channel, because DC = 2 */
+		slots = (channels == 1) ? 2 : channels;
+
+	/* ...but keep 32 bits if I2S Master mode */
+	if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
+	    channels == 1)
+		slot_width = ssi->slot_width ? ssi->slot_width :
+			     params_width(hw_params);
 
 	/* Generate bit clock based on the slot number and slot width */
 	freq = slots * slot_width * params_rate(hw_params);
-- 
2.21.0

