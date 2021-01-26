Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2563303CDF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 13:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E24717AA;
	Tue, 26 Jan 2021 13:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E24717AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611663778;
	bh=CbbIzrizcoPfQ5IG3j31n+bUwb19ahKPr9uM2AMKlxk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLzvmnuetJT/JNzY1qQBlC1hZAKEYLuDn4z+PEnTBQFA1CBJt8drISCaBBe2BcG7x
	 l4+hMjpPN5BONYHfdR/Gad6cavPMBH4ZdNDdkNuZRrI/pirYqYnYcyRp59mxxtlM8k
	 Ep5SIw5DRit/FUQgtZ9gF+oTwj/0pBY3jwLtWUzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C6BF80217;
	Tue, 26 Jan 2021 13:21:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63FA9F80130; Tue, 26 Jan 2021 13:21:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A55F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 13:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A55F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sQxtrAPD"
Received: by mail-wm1-x334.google.com with SMTP id j18so2267145wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT55FABjLyu7dYc21lezhM1CvuGo2h6vplhaEe339cE=;
 b=sQxtrAPDGHx28PS3PrAnLjW3O2df6d9uwXWZIEBDIGzcESNVEOPE1i+zgd7bz7+HFW
 +RJraLD8FsYZxVW3Enf2ePmMMCy+oWrGyz3uKQnWvsflUqX/KHiPbv5VpKXaAWe7qmyr
 RjZOdQiWWyLnLuwvhVN+T15cCq60JjjVz3KDudUNccZR3NF4f8wNcqNJJqGmBKw/4wOM
 zNhgx4fGWVwOZhX5Audny0MNcRjM3Ob4Ehc6G6OGfXki6SoqiVYeSXGYSguoMM2ivPkg
 cyFQxZFonRCYyNL0fxdOExiHNaNS/hQ5lljb4Rrnxj+VbmBAbCuKQlaw1tXuHWYylV61
 iPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cT55FABjLyu7dYc21lezhM1CvuGo2h6vplhaEe339cE=;
 b=DpParpfuyPZgQJoT3WCNit4cV1Nj2mpFTBSNLO/ok8r5jr5QiB8X5G7QDE3Ma42ijd
 N2/E3ZXo0lmwCp1kPo0XLzaiy9CFgQyJ422+DK0G4gxJ5z/3BjjK4qDoqG1nFMeSTXhM
 cbTgoKV5h2Eyj5BJ2fAlI/sR8yRlyBdidWYyPq8drG2SalNMWi0DSG+CxCfSqcUgSpAU
 IMq1noSRsnMPwt5dfDYq/whoDZruw3l7YIJABesdtbCwkKXCmvsNcIW5wcuDaZ4oYtKU
 TjoVCVsitaPLtlb1cti6YxocUffDgwSpqUX2B84jse5dVJ8ad72QeJWt6/pZfRA4qLxE
 2+UA==
X-Gm-Message-State: AOAM533qtSWEQky/E03Q52CWfcX2KWVRFOxt7rgjIqLTd5fjA87J1lhf
 DVB4g/RLxBgeOPuoFOx8j/7EcA==
X-Google-Smtp-Source: ABdhPJz1Yn21nLtfD6Rp/dnNNMIkgoRGpyYiVEm1W+D0VRqMZ+wmEX21ZV0nZrNocfXjZpIHOgjH6g==
X-Received: by 2002:a1c:1b83:: with SMTP id b125mr4528765wmb.8.1611663661202; 
 Tue, 26 Jan 2021 04:21:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o124sm3218908wmb.5.2021.01.26.04.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 04:21:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH 2/2] ASoC: codecs: lpass-wsa-macro: make use of
 snd_soc_component_read_field()
Date: Tue, 26 Jan 2021 12:20:20 +0000
Message-Id: <20210126122020.19735-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
References: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Make use of snd_soc_component_read_field() to make the code more readable!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 43 ++++++++++++++----------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 25f1df214ca5..5ebcd935ba89 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -40,9 +40,11 @@
 #define CDC_WSA_TOP_I2S_CLK			(0x00A4)
 #define CDC_WSA_TOP_I2S_RESET			(0x00A8)
 #define CDC_WSA_RX_INP_MUX_RX_INT0_CFG0		(0x0100)
-#define CDC_WSA_RX_INTX_1_MIX_INP2_SEL_MASK	GENMASK(5, 3)
-#define CDC_WSA_RX_INTX_2_SEL_MASK		GENMASK(2, 0)
+#define CDC_WSA_RX_INTX_1_MIX_INP0_SEL_MASK	GENMASK(2, 0)
+#define CDC_WSA_RX_INTX_1_MIX_INP1_SEL_MASK	GENMASK(5, 3)
 #define CDC_WSA_RX_INP_MUX_RX_INT0_CFG1		(0x0104)
+#define CDC_WSA_RX_INTX_2_SEL_MASK		GENMASK(2, 0)
+#define CDC_WSA_RX_INTX_1_MIX_INP2_SEL_MASK	GENMASK(5, 3)
 #define CDC_WSA_RX_INP_MUX_RX_INT1_CFG0		(0x0108)
 #define CDC_WSA_RX_INP_MUX_RX_INT1_CFG1		(0x010C)
 #define CDC_WSA_RX_INP_MUX_RX_MIX_CFG0		(0x0110)
@@ -229,8 +231,6 @@
 #define NUM_INTERPOLATORS 2
 #define WSA_NUM_CLKS_MAX	5
 #define WSA_MACRO_MCLK_FREQ 19200000
-#define WSA_MACRO_MUX_INP_SHFT 0x3
-#define WSA_MACRO_MUX_INP_MASK1 0x07
 #define WSA_MACRO_MUX_INP_MASK2 0x38
 #define WSA_MACRO_MUX_CFG_OFFSET 0x8
 #define WSA_MACRO_MUX_CFG1_OFFSET 0x4
@@ -843,7 +843,6 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 	u32 j, port;
 	u16 int_mux_cfg0, int_mux_cfg1;
 	u16 int_fs_reg;
-	u8 int_mux_cfg0_val, int_mux_cfg1_val;
 	u8 inp0_sel, inp1_sel, inp2_sel;
 	struct snd_soc_component *component = dai->component;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -865,15 +864,13 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 		 */
 		for (j = 0; j < NUM_INTERPOLATORS; j++) {
 			int_mux_cfg1 = int_mux_cfg0 + WSA_MACRO_MUX_CFG1_OFFSET;
-			int_mux_cfg0_val = snd_soc_component_read(component,
-								  int_mux_cfg0);
-			int_mux_cfg1_val = snd_soc_component_read(component,
-								  int_mux_cfg1);
-			inp0_sel = int_mux_cfg0_val & WSA_MACRO_MUX_INP_MASK1;
-			inp1_sel = (int_mux_cfg0_val >> WSA_MACRO_MUX_INP_SHFT) &
-						WSA_MACRO_MUX_INP_MASK1;
-			inp2_sel = (int_mux_cfg1_val >> WSA_MACRO_MUX_INP_SHFT) &
-						WSA_MACRO_MUX_INP_MASK1;
+			inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0, 
+								CDC_WSA_RX_INTX_1_MIX_INP0_SEL_MASK);
+			inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0, 
+								CDC_WSA_RX_INTX_1_MIX_INP1_SEL_MASK);
+			inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+								CDC_WSA_RX_INTX_1_MIX_INP2_SEL_MASK);
+
 			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
@@ -912,9 +909,9 @@ static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 
 		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
 		for (j = 0; j < NUM_INTERPOLATORS; j++) {
-			int_mux_cfg1_val = snd_soc_component_read(component,
-							int_mux_cfg1) &
-							WSA_MACRO_MUX_INP_MASK1;
+			int_mux_cfg1_val = snd_soc_component_read_field(component, int_mux_cfg1,
+									CDC_WSA_RX_INTX_2_SEL_MASK);
+
 			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
 				int_fs_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL +
 					WSA_MACRO_RX_PATH_OFFSET * j;
@@ -1410,25 +1407,25 @@ static bool wsa_macro_adie_lb(struct snd_soc_component *component,
 			      int interp_idx)
 {
 	u16 int_mux_cfg0,  int_mux_cfg1;
-	u8 int_mux_cfg0_val, int_mux_cfg1_val;
 	u8 int_n_inp0, int_n_inp1, int_n_inp2;
 
 	int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
 	int_mux_cfg1 = int_mux_cfg0 + 4;
-	int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
-	int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
 
-	int_n_inp0 = int_mux_cfg0_val & 0x0F;
+	int_n_inp0 = snd_soc_component_read_field(component, int_mux_cfg0,
+						  CDC_WSA_RX_INTX_1_MIX_INP0_SEL_MASK);
 	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
 		int_n_inp0 == INTn_1_INP_SEL_DEC1)
 		return true;
 
-	int_n_inp1 = int_mux_cfg0_val >> 4;
+	int_n_inp1 = snd_soc_component_read_field(component, int_mux_cfg0,
+						  CDC_WSA_RX_INTX_1_MIX_INP1_SEL_MASK);
 	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
 		int_n_inp1 == INTn_1_INP_SEL_DEC1)
 		return true;
 
-	int_n_inp2 = int_mux_cfg1_val >> 4;
+	int_n_inp2 = snd_soc_component_read_field(component, int_mux_cfg1,
+						  CDC_WSA_RX_INTX_1_MIX_INP2_SEL_MASK);
 	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
 		int_n_inp2 == INTn_1_INP_SEL_DEC1)
 		return true;
-- 
2.21.0

