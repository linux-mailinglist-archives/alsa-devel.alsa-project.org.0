Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A8426506
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 09:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C99B166D;
	Fri,  8 Oct 2021 09:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C99B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633676768;
	bh=RpJ9aoccYB5gAnftZqhfvxc5UlJWv6qq0g3ZUI6jU3Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AzwhxvEIoGQnlRPI5OMZbDXbENX9fKDFhjfQ5/wdhJSubNkQXOwTaFEWe8QcX26D2
	 374qhIuAAW9J7UqAVOgYFzSbdpsgpUG5huahIRqTtg2kEM4BNnCdf2ZKyNXKkcEK/O
	 bwRxE6Ig9NsN/LLRpLxenqJ18WjKE6eqGiUq1lnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE02F80240;
	Fri,  8 Oct 2021 09:04:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11445F80246; Fri,  8 Oct 2021 09:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 526B8F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 09:04:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 526B8F80229
X-UUID: 35e8212a111746229f88443a7cd511f9-20211008
X-UUID: 35e8212a111746229f88443a7cd511f9-20211008
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471568908; Fri, 08 Oct 2021 15:04:27 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 15:04:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Oct 2021 15:04:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Oct 2021 15:04:26 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: update audsys clock parent name
Date: Fri, 8 Oct 2021 15:04:24 +0800
Message-ID: <20211008070424.14347-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, chun-jie.chen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Because clock names are modified in mediatek CCF driver, sync the updated
clock names to audsys driver.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
The clock patch is accepted in clk-next branch.

clk: mediatek: Add MT8195 topckgen clock support
https://patchwork.kernel.org/project/linux-mediatek/patch/20210914021633.26377-8-chun-jie.chen@mediatek.com/
---
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c | 152 +++++++++---------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
index 740aa6ddda0e..e0670e0dbd5b 100644
--- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
@@ -59,93 +59,93 @@ struct afe_gate {
 
 static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	/* AUD0 */
-	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "a1sys_hp_sel", 2),
-	GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "a1sys_hp_sel", 4),
-	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL, "aud_spdifin_tuner_apll", "apll4_sel", 10),
-	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG, "aud_spdifin_tuner_dbg", "apll4_sel", 11),
-	GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "a1sys_hp_sel", 18),
-	GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner", "apll1_sel", 19),
-	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "apll2_sel", 20),
-	GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf", "aud_iec_sel", 21),
-	GATE_AUD0(CLK_AUD_APLL, "aud_apll", "apll1_sel", 23),
-	GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "apll2_sel", 24),
-	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "a1sys_hp_sel", 25),
-	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "a1sys_hp_sel", 26),
-	GATE_AUD0(CLK_AUD_TML, "aud_tml", "a1sys_hp_sel", 27),
-	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "a1sys_hp_sel", 28),
-	GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 31),
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "top_a1sys_hp", 2),
+	GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "top_a1sys_hp", 4),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL, "aud_spdifin_tuner_apll", "top_apll4", 10),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG, "aud_spdifin_tuner_dbg", "top_apll4", 11),
+	GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "top_a1sys_hp", 18),
+	GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner", "top_apll1", 19),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "top_apll2", 20),
+	GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf", "top_aud_iec_clk", 21),
+	GATE_AUD0(CLK_AUD_APLL, "aud_apll", "top_apll1", 23),
+	GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "top_apll2", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "top_a1sys_hp", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "top_a1sys_hp", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "top_a1sys_hp", 27),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "top_a1sys_hp", 28),
+	GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires", "top_audio_h", 31),
 
 	/* AUD1 */
-	GATE_AUD1(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "a1sys_hp_sel", 2),
-	GATE_AUD1(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1", "a1sys_hp_sel", 10),
-	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "a1sys_hp_sel", 11),
-	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "a1sys_hp_sel", 12),
-	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "a1sys_hp_sel", 13),
-	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "a1sys_hp_sel", 14),
-	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "audio_h_sel", 16),
-	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 17),
-	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "a1sys_hp_sel", 18),
-	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 19),
+	GATE_AUD1(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "top_a1sys_hp", 2),
+	GATE_AUD1(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1", "top_a1sys_hp", 10),
+	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "top_a1sys_hp", 11),
+	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "top_a1sys_hp", 12),
+	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "top_a1sys_hp", 13),
+	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
+	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "top_a1sys_hp", 18),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "top_audio_h", 19),
 
 	/* AUD3 */
-	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "apll5_sel", 5),
-	GATE_AUD3(CLK_AUD_EARC_TUNER, "aud_earc_tuner", "apll3_sel", 7),
+	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "top_apll5", 5),
+	GATE_AUD3(CLK_AUD_EARC_TUNER, "aud_earc_tuner", "top_apll3", 7),
 
 	/* AUD4 */
-	GATE_AUD4(CLK_AUD_I2SIN, "aud_i2sin", "a1sys_hp_sel", 0),
-	GATE_AUD4(CLK_AUD_TDM_IN, "aud_tdm_in", "a1sys_hp_sel", 1),
-	GATE_AUD4(CLK_AUD_I2S_OUT, "aud_i2s_out", "a1sys_hp_sel", 6),
-	GATE_AUD4(CLK_AUD_TDM_OUT, "aud_tdm_out", "a1sys_hp_sel", 7),
-	GATE_AUD4(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "a1sys_hp_sel", 8),
-	GATE_AUD4(CLK_AUD_ASRC11, "aud_asrc11", "a1sys_hp_sel", 16),
-	GATE_AUD4(CLK_AUD_ASRC12, "aud_asrc12", "a1sys_hp_sel", 17),
+	GATE_AUD4(CLK_AUD_I2SIN, "aud_i2sin", "top_a1sys_hp", 0),
+	GATE_AUD4(CLK_AUD_TDM_IN, "aud_tdm_in", "top_a1sys_hp", 1),
+	GATE_AUD4(CLK_AUD_I2S_OUT, "aud_i2s_out", "top_a1sys_hp", 6),
+	GATE_AUD4(CLK_AUD_TDM_OUT, "aud_tdm_out", "top_a1sys_hp", 7),
+	GATE_AUD4(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "top_a1sys_hp", 8),
+	GATE_AUD4(CLK_AUD_ASRC11, "aud_asrc11", "top_a1sys_hp", 16),
+	GATE_AUD4(CLK_AUD_ASRC12, "aud_asrc12", "top_a1sys_hp", 17),
 	GATE_AUD4(CLK_AUD_MULTI_IN, "aud_multi_in", "mphone_slave_b", 19),
-	GATE_AUD4(CLK_AUD_INTDIR, "aud_intdir", "intdir_sel", 20),
-	GATE_AUD4(CLK_AUD_A1SYS, "aud_a1sys", "a1sys_hp_sel", 21),
-	GATE_AUD4(CLK_AUD_A2SYS, "aud_a2sys", "a2sys_sel", 22),
-	GATE_AUD4(CLK_AUD_PCMIF, "aud_pcmif", "a1sys_hp_sel", 24),
-	GATE_AUD4(CLK_AUD_A3SYS, "aud_a3sys", "a3sys_sel", 30),
-	GATE_AUD4(CLK_AUD_A4SYS, "aud_a4sys", "a4sys_sel", 31),
+	GATE_AUD4(CLK_AUD_INTDIR, "aud_intdir", "top_intdir", 20),
+	GATE_AUD4(CLK_AUD_A1SYS, "aud_a1sys", "top_a1sys_hp", 21),
+	GATE_AUD4(CLK_AUD_A2SYS, "aud_a2sys", "top_a2sys_hf", 22),
+	GATE_AUD4(CLK_AUD_PCMIF, "aud_pcmif", "top_a1sys_hp", 24),
+	GATE_AUD4(CLK_AUD_A3SYS, "aud_a3sys", "top_a3sys_hf", 30),
+	GATE_AUD4(CLK_AUD_A4SYS, "aud_a4sys", "top_a4sys_hf", 31),
 
 	/* AUD5 */
-	GATE_AUD5(CLK_AUD_MEMIF_UL1, "aud_memif_ul1", "a1sys_hp_sel", 0),
-	GATE_AUD5(CLK_AUD_MEMIF_UL2, "aud_memif_ul2", "a1sys_hp_sel", 1),
-	GATE_AUD5(CLK_AUD_MEMIF_UL3, "aud_memif_ul3", "a1sys_hp_sel", 2),
-	GATE_AUD5(CLK_AUD_MEMIF_UL4, "aud_memif_ul4", "a1sys_hp_sel", 3),
-	GATE_AUD5(CLK_AUD_MEMIF_UL5, "aud_memif_ul5", "a1sys_hp_sel", 4),
-	GATE_AUD5(CLK_AUD_MEMIF_UL6, "aud_memif_ul6", "a1sys_hp_sel", 5),
-	GATE_AUD5(CLK_AUD_MEMIF_UL8, "aud_memif_ul8", "a1sys_hp_sel", 7),
-	GATE_AUD5(CLK_AUD_MEMIF_UL9, "aud_memif_ul9", "a1sys_hp_sel", 8),
-	GATE_AUD5(CLK_AUD_MEMIF_UL10, "aud_memif_ul10", "a1sys_hp_sel", 9),
-	GATE_AUD5(CLK_AUD_MEMIF_DL2, "aud_memif_dl2", "a1sys_hp_sel", 18),
-	GATE_AUD5(CLK_AUD_MEMIF_DL3, "aud_memif_dl3", "a1sys_hp_sel", 19),
-	GATE_AUD5(CLK_AUD_MEMIF_DL6, "aud_memif_dl6", "a1sys_hp_sel", 22),
-	GATE_AUD5(CLK_AUD_MEMIF_DL7, "aud_memif_dl7", "a1sys_hp_sel", 23),
-	GATE_AUD5(CLK_AUD_MEMIF_DL8, "aud_memif_dl8", "a1sys_hp_sel", 24),
-	GATE_AUD5(CLK_AUD_MEMIF_DL10, "aud_memif_dl10", "a1sys_hp_sel", 26),
-	GATE_AUD5(CLK_AUD_MEMIF_DL11, "aud_memif_dl11", "a1sys_hp_sel", 27),
+	GATE_AUD5(CLK_AUD_MEMIF_UL1, "aud_memif_ul1", "top_a1sys_hp", 0),
+	GATE_AUD5(CLK_AUD_MEMIF_UL2, "aud_memif_ul2", "top_a1sys_hp", 1),
+	GATE_AUD5(CLK_AUD_MEMIF_UL3, "aud_memif_ul3", "top_a1sys_hp", 2),
+	GATE_AUD5(CLK_AUD_MEMIF_UL4, "aud_memif_ul4", "top_a1sys_hp", 3),
+	GATE_AUD5(CLK_AUD_MEMIF_UL5, "aud_memif_ul5", "top_a1sys_hp", 4),
+	GATE_AUD5(CLK_AUD_MEMIF_UL6, "aud_memif_ul6", "top_a1sys_hp", 5),
+	GATE_AUD5(CLK_AUD_MEMIF_UL8, "aud_memif_ul8", "top_a1sys_hp", 7),
+	GATE_AUD5(CLK_AUD_MEMIF_UL9, "aud_memif_ul9", "top_a1sys_hp", 8),
+	GATE_AUD5(CLK_AUD_MEMIF_UL10, "aud_memif_ul10", "top_a1sys_hp", 9),
+	GATE_AUD5(CLK_AUD_MEMIF_DL2, "aud_memif_dl2", "top_a1sys_hp", 18),
+	GATE_AUD5(CLK_AUD_MEMIF_DL3, "aud_memif_dl3", "top_a1sys_hp", 19),
+	GATE_AUD5(CLK_AUD_MEMIF_DL6, "aud_memif_dl6", "top_a1sys_hp", 22),
+	GATE_AUD5(CLK_AUD_MEMIF_DL7, "aud_memif_dl7", "top_a1sys_hp", 23),
+	GATE_AUD5(CLK_AUD_MEMIF_DL8, "aud_memif_dl8", "top_a1sys_hp", 24),
+	GATE_AUD5(CLK_AUD_MEMIF_DL10, "aud_memif_dl10", "top_a1sys_hp", 26),
+	GATE_AUD5(CLK_AUD_MEMIF_DL11, "aud_memif_dl11", "top_a1sys_hp", 27),
 
 	/* AUD6 */
-	GATE_AUD6(CLK_AUD_GASRC0, "aud_gasrc0", "asm_h_sel", 0),
-	GATE_AUD6(CLK_AUD_GASRC1, "aud_gasrc1", "asm_h_sel", 1),
-	GATE_AUD6(CLK_AUD_GASRC2, "aud_gasrc2", "asm_h_sel", 2),
-	GATE_AUD6(CLK_AUD_GASRC3, "aud_gasrc3", "asm_h_sel", 3),
-	GATE_AUD6(CLK_AUD_GASRC4, "aud_gasrc4", "asm_h_sel", 4),
-	GATE_AUD6(CLK_AUD_GASRC5, "aud_gasrc5", "asm_h_sel", 5),
-	GATE_AUD6(CLK_AUD_GASRC6, "aud_gasrc6", "asm_h_sel", 6),
-	GATE_AUD6(CLK_AUD_GASRC7, "aud_gasrc7", "asm_h_sel", 7),
-	GATE_AUD6(CLK_AUD_GASRC8, "aud_gasrc8", "asm_h_sel", 8),
-	GATE_AUD6(CLK_AUD_GASRC9, "aud_gasrc9", "asm_h_sel", 9),
-	GATE_AUD6(CLK_AUD_GASRC10, "aud_gasrc10", "asm_h_sel", 10),
-	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "asm_h_sel", 11),
-	GATE_AUD6(CLK_AUD_GASRC12, "aud_gasrc12", "asm_h_sel", 12),
-	GATE_AUD6(CLK_AUD_GASRC13, "aud_gasrc13", "asm_h_sel", 13),
-	GATE_AUD6(CLK_AUD_GASRC14, "aud_gasrc14", "asm_h_sel", 14),
-	GATE_AUD6(CLK_AUD_GASRC15, "aud_gasrc15", "asm_h_sel", 15),
-	GATE_AUD6(CLK_AUD_GASRC16, "aud_gasrc16", "asm_h_sel", 16),
-	GATE_AUD6(CLK_AUD_GASRC17, "aud_gasrc17", "asm_h_sel", 17),
-	GATE_AUD6(CLK_AUD_GASRC18, "aud_gasrc18", "asm_h_sel", 18),
-	GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "asm_h_sel", 19),
+	GATE_AUD6(CLK_AUD_GASRC0, "aud_gasrc0", "top_asm_h", 0),
+	GATE_AUD6(CLK_AUD_GASRC1, "aud_gasrc1", "top_asm_h", 1),
+	GATE_AUD6(CLK_AUD_GASRC2, "aud_gasrc2", "top_asm_h", 2),
+	GATE_AUD6(CLK_AUD_GASRC3, "aud_gasrc3", "top_asm_h", 3),
+	GATE_AUD6(CLK_AUD_GASRC4, "aud_gasrc4", "top_asm_h", 4),
+	GATE_AUD6(CLK_AUD_GASRC5, "aud_gasrc5", "top_asm_h", 5),
+	GATE_AUD6(CLK_AUD_GASRC6, "aud_gasrc6", "top_asm_h", 6),
+	GATE_AUD6(CLK_AUD_GASRC7, "aud_gasrc7", "top_asm_h", 7),
+	GATE_AUD6(CLK_AUD_GASRC8, "aud_gasrc8", "top_asm_h", 8),
+	GATE_AUD6(CLK_AUD_GASRC9, "aud_gasrc9", "top_asm_h", 9),
+	GATE_AUD6(CLK_AUD_GASRC10, "aud_gasrc10", "top_asm_h", 10),
+	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
+	GATE_AUD6(CLK_AUD_GASRC12, "aud_gasrc12", "top_asm_h", 12),
+	GATE_AUD6(CLK_AUD_GASRC13, "aud_gasrc13", "top_asm_h", 13),
+	GATE_AUD6(CLK_AUD_GASRC14, "aud_gasrc14", "top_asm_h", 14),
+	GATE_AUD6(CLK_AUD_GASRC15, "aud_gasrc15", "top_asm_h", 15),
+	GATE_AUD6(CLK_AUD_GASRC16, "aud_gasrc16", "top_asm_h", 16),
+	GATE_AUD6(CLK_AUD_GASRC17, "aud_gasrc17", "top_asm_h", 17),
+	GATE_AUD6(CLK_AUD_GASRC18, "aud_gasrc18", "top_asm_h", 18),
+	GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "top_asm_h", 19),
 };
 
 int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
-- 
2.18.0

