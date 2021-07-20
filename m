Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C517F3D0280
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 22:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58857168A;
	Tue, 20 Jul 2021 22:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58857168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626811539;
	bh=nmmHkAAPJAq0w/Cw9w9W9NqCmOHD3URATr/YuD6km8s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sclH21XoZ6Degvt0lpTVBXfT3gwqhN2RQdRleNaltIF6hL6YW6cBWQa0WBaXPne/L
	 D/Er1J/a7vKqsAVaSPtLHetkLudjL/TbTJdhVAOvGd0CZrDq8MF9R8ngegGR9JosW7
	 30Nb7ueLC3P7XtaMehNeD7/2creht4tBqby8mO2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA47BF80227;
	Tue, 20 Jul 2021 22:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B25F80218; Tue, 20 Jul 2021 22:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB9B4F80169
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 22:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB9B4F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="zE4i696T"
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C26E82C6B;
 Tue, 20 Jul 2021 22:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626811438;
 bh=TXvCgR3WcJgrqxmjdVeKttB4TfipicUrL+sxCwc0BRo=;
 h=From:To:Cc:Subject:Date:From;
 b=zE4i696TI4/Ie5W0hQbVrm8bEeXjOVkG+GdrgKTSILImQG4wyG0//oUODF4wzp476
 JT/jDt5CCwV1kyoxMKBrboz4cxgxiz9zlimsiFPiwwsM87KIeQW8TPNdiNigd+JGrU
 LL+60eHI+Q/mvmdBPE3dUF5xMZ4mKANrn49+3KHwKP7MjO6gKRWSp7XEBo/8So11X8
 k0aTwDY4qbhyTm/By1lJ0QPSq05klvbLLEfKxOBhr9TVhl0hE54wRAyIfOWQNF9DsQ
 1fJmwf/oYns8Fj4vdSJ4VRgje/im3ZNhgrKeE72Nw2HA9iyd+MIjIhvgRaUU5oxutC
 gMNd3kb8Diftw==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320aic32x4: Fix TAS2505/TAS2521 processing block
 selection
Date: Tue, 20 Jul 2021 22:03:48 +0200
Message-Id: <20210720200348.182139-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>, ch@denx.de
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

The TAS2505/TAS2521 does support only three processing block options, unlike
TLV320AIC32x4 which supports 25. This is documented in TI slau472 2.5.1.2
Processing Blocks and Page 0 / Register 60: DAC Instruction Set - 0x00 / 0x3C.

Limit the Processing Blocks maximum value to 3 on TAS2505/TAS2521 and select
processing block PRB_P1 always, because for the configuration of teh codec
implemented in this driver, this is the best quality option.

Fixes: b4525b6196cd7 ("ASoC: tlv320aic32x4: add support for TAS2505")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Claudius Heine <ch@denx.de>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 33 +++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index c51267ce67cf..4d80879dd144 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -682,11 +682,20 @@ static int aic32x4_set_dosr(struct snd_soc_component *component, u16 dosr)
 static int aic32x4_set_processing_blocks(struct snd_soc_component *component,
 						u8 r_block, u8 p_block)
 {
-	if (r_block > 18 || p_block > 25)
-		return -EINVAL;
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
+
+	if (aic32x4->type == AIC32X4_TYPE_TAS2505) {
+		if (r_block || p_block > 3)
+			return -EINVAL;
 
-	snd_soc_component_write(component, AIC32X4_ADCSPB, r_block);
-	snd_soc_component_write(component, AIC32X4_DACSPB, p_block);
+		snd_soc_component_write(component, AIC32X4_DACSPB, p_block);
+	} else { /* AIC32x4 */
+		if (r_block > 18 || p_block > 25)
+			return -EINVAL;
+
+		snd_soc_component_write(component, AIC32X4_ADCSPB, r_block);
+		snd_soc_component_write(component, AIC32X4_DACSPB, p_block);
+	}
 
 	return 0;
 }
@@ -695,6 +704,7 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 				unsigned int sample_rate, unsigned int channels,
 				unsigned int bit_depth)
 {
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	u8 aosr;
 	u16 dosr;
 	u8 adc_resource_class, dac_resource_class;
@@ -721,19 +731,28 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 		adc_resource_class = 6;
 		dac_resource_class = 8;
 		dosr_increment = 8;
-		aic32x4_set_processing_blocks(component, 1, 1);
+		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
+			aic32x4_set_processing_blocks(component, 0, 1);
+		else
+			aic32x4_set_processing_blocks(component, 1, 1);
 	} else if (sample_rate <= 96000) {
 		aosr = 64;
 		adc_resource_class = 6;
 		dac_resource_class = 8;
 		dosr_increment = 4;
-		aic32x4_set_processing_blocks(component, 1, 9);
+		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
+			aic32x4_set_processing_blocks(component, 0, 1);
+		else
+			aic32x4_set_processing_blocks(component, 1, 9);
 	} else if (sample_rate == 192000) {
 		aosr = 32;
 		adc_resource_class = 3;
 		dac_resource_class = 4;
 		dosr_increment = 2;
-		aic32x4_set_processing_blocks(component, 13, 19);
+		if (aic32x4->type == AIC32X4_TYPE_TAS2505)
+			aic32x4_set_processing_blocks(component, 0, 1);
+		else
+			aic32x4_set_processing_blocks(component, 13, 19);
 	} else {
 		dev_err(component->dev, "Sampling rate not supported\n");
 		return -EINVAL;
-- 
2.30.2

