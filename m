Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0EC3C26CA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 17:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59661607;
	Fri,  9 Jul 2021 17:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59661607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625844362;
	bh=9zvVpDi8teU64QlIdNa7XJOtsbSJlzmmL47X5NqjJMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BlOL3ELjxkR6iF2C4b7MXRTS/CZSvPqYPP6x56IwqpE0Ocx0MbDv2DAfCVtgBW07e
	 MDrsB+vQZ1guC4BD93cg27fgRW98LBQ7ML0UBm9TOHYAm5YcbeDkkP/pJTOZKYebp2
	 JaIsDzEiD8alwIAKt8cJNf0obpHMRzr4QHwxdPSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0114DF8025C;
	Fri,  9 Jul 2021 17:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9327BF80059; Fri,  9 Jul 2021 17:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 200CFF80059
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 17:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 200CFF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ePrbXVj2"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E142B404A0; 
 Fri,  9 Jul 2021 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1625844265;
 bh=JWX8SivwH7nNO5NjJ1Y3vDYXQvqvNAJL4GkZFF3gAA4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=ePrbXVj2d8tzWtAZ72kOZKJnJnFlv8oFGJ8pLEqAujdtH/MVyeDdOIW24eJQzHqVx
 NCj4baz7sedv+K8XwH+yuUhLnZJkbGbgvet30xNO78qDL98u23kHbOpcUxMS9DpbXY
 ovm9gwL1yCTDV9r6T76ktqqHTrnSYiMOcwX1a1muEcqSF7PNtaX/rPBTk+XccNOKuF
 A7Vqy2ZlYV7bQEBn0dTLNJc22vc4fDDPdGEab/XGVxWJ2y51em27e+xgc4Rqwa4uw6
 sQocDG/xdakcBM0RoLO880rIWftu5WVfE4OHeTWnNJJmLohqayDxkg2VR0x4yZOkhw
 I50Ch2StUcfjA==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: clean up for-loop indentation
 in switch statement
Date: Fri,  9 Jul 2021 16:24:24 +0100
Message-Id: <20210709152424.460446-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The for-loop is not indented enough and needs one more level
of indentation. Add in the indentation across the block of code.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 65 ++++++++++++++++---------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3622961f7c2c..196b06898eeb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1722,42 +1722,43 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	case RX_MACRO_AIF2_PB:
 	case RX_MACRO_AIF3_PB:
 	case RX_MACRO_AIF4_PB:
-	for (j = 0; j < INTERP_MAX; j++) {
-		reg = CDC_RX_RXn_RX_PATH_CTL(j);
-		mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
-		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(j);
-
-		if (mute) {
-			snd_soc_component_update_bits(component, reg,
-						      CDC_RX_PATH_PGA_MUTE_MASK,
-						      CDC_RX_PATH_PGA_MUTE_ENABLE);
-			snd_soc_component_update_bits(component, mix_reg,
-						      CDC_RX_PATH_PGA_MUTE_MASK,
-						      CDC_RX_PATH_PGA_MUTE_ENABLE);
-		} else {
-			snd_soc_component_update_bits(component, reg,
-						      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
-			snd_soc_component_update_bits(component, mix_reg,
-						      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
-		}
-
-		if (j == INTERP_AUX)
-			dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+		for (j = 0; j < INTERP_MAX; j++) {
+			reg = CDC_RX_RXn_RX_PATH_CTL(j);
+			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(j);
+
+			if (mute) {
+				snd_soc_component_update_bits(component, reg,
+							      CDC_RX_PATH_PGA_MUTE_MASK,
+							      CDC_RX_PATH_PGA_MUTE_ENABLE);
+				snd_soc_component_update_bits(component, mix_reg,
+							      CDC_RX_PATH_PGA_MUTE_MASK,
+							      CDC_RX_PATH_PGA_MUTE_ENABLE);
+			} else {
+				snd_soc_component_update_bits(component, reg,
+							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
+				snd_soc_component_update_bits(component, mix_reg,
+							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
+			}
 
-		int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
-		int_mux_cfg1 = int_mux_cfg0 + 4;
-		int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
-		int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
+			if (j == INTERP_AUX)
+				dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
 
-		if (snd_soc_component_read(component, dsm_reg) & 0x01) {
-			if (int_mux_cfg0_val || (int_mux_cfg1_val & 0xF0))
-				snd_soc_component_update_bits(component, reg, 0x20, 0x20);
-			if (int_mux_cfg1_val & 0x0F) {
-				snd_soc_component_update_bits(component, reg, 0x20, 0x20);
-				snd_soc_component_update_bits(component, mix_reg, 0x20, 0x20);
+			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
+			int_mux_cfg1 = int_mux_cfg0 + 4;
+			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
+			int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
+
+			if (snd_soc_component_read(component, dsm_reg) & 0x01) {
+				if (int_mux_cfg0_val || (int_mux_cfg1_val & 0xF0))
+					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
+				if (int_mux_cfg1_val & 0x0F) {
+					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
+					snd_soc_component_update_bits(component, mix_reg, 0x20,
+								      0x20);
+				}
 			}
 		}
-	}
 		break;
 	default:
 		break;
-- 
2.31.1

