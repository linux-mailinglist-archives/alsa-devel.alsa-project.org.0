Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BCE7C9937
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Oct 2023 15:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812A0AEA;
	Sun, 15 Oct 2023 15:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812A0AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697377637;
	bh=X5fflmeN7u+e+b54FwITiS8qez2MICF1NpV7PsPk1QY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VcoB0f/bRczuPlwgpzeU0SehEEz7Q7A9fU75FO7J46wAzddlGGNzGM4GzhXmG29eF
	 kwaYMMtCRfYttN/D6ce6PWTvqRUiLU+HXNd8Vqvc6MP5ALUzRA3FTb5KGayBHjAdB5
	 gq49sUeYvUWZ9aQ5+AE+/UdZ/wO4TjyOvOD/m1kk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 383DDF8027B; Sun, 15 Oct 2023 15:45:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90399F80558;
	Sun, 15 Oct 2023 15:45:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D61EFF8027B; Sat, 14 Oct 2023 19:29:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15AACF802BE
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 19:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15AACF802BE
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id EEDF61C072A;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
Received: from fluffy-mammal.fritz.box
 (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
	by srv01.abscue.de (Postfix) with ESMTPSA id 935741C072B;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting clocks
Date: Sat, 14 Oct 2023 19:26:23 +0200
Message-Id: <20231014172624.75301-3-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231014172624.75301-1-otto.pflueger@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VIUQMVJWRDOA7TYL2OICZAMBNCBCYST5
X-Message-ID-Hash: VIUQMVJWRDOA7TYL2OICZAMBNCBCYST5
X-Mailman-Approved-At: Sun, 15 Oct 2023 13:43:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIUQMVJWRDOA7TYL2OICZAMBNCBCYST5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two APIs for setting clocks: the old one that uses
AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG and AFE_PARAM_ID_LPAIF_CLK_CONFIG,
and the new one which uses AFE_PARAM_ID_CLOCK_SET.

ADSP firmware version 2.6 only provides the old API, while newer
firmware versions only provide the new API.

Implement LPAIF_BIT_CLK and LPAIF_DIG_CLK for both APIs so that users
don't have to care about the firmware version. Also fall back to
setting AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG in q6afe_set_lpass_clock
when setting the new Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
clock is requested to allow specifying it in the device tree on older
platforms too.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 91d39f6ad0bd..87bdf741e5f6 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
 	struct q6afe *afe = dev_get_drvdata(dev->parent);
 	struct afe_clk_set cset = {0,};
 
+	/*
+	 * v2 clocks specified in the device tree may not be supported by the
+	 * firmware. If this is the digital codec core clock, fall back to the
+	 * old method for setting it.
+	 */
+	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
+		struct q6afe_port *port;
+		struct afe_digital_clk_cfg dcfg = {0,};
+		int ret;
+
+		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
+			return -EINVAL;
+
+		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
+		if (IS_ERR(port))
+			return PTR_ERR(port);
+
+		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
+		dcfg.clk_val = freq;
+		dcfg.clk_root = 5;
+		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
+
+		q6afe_port_put(port);
+		return ret;
+	}
+
 	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
 	cset.clk_id = clk_id;
 	cset.clk_freq_in_hz = freq;
@@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
 }
 EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
 
+static int q6afe_get_v2_bit_clk_id(struct q6afe_port *port)
+{
+	switch (port->id) {
+	case AFE_PORT_ID_PRIMARY_MI2S_RX:
+	case AFE_PORT_ID_PRIMARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+	case AFE_PORT_ID_SECONDARY_MI2S_RX:
+	case AFE_PORT_ID_SECONDARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+	case AFE_PORT_ID_TERTIARY_MI2S_RX:
+	case AFE_PORT_ID_TERTIARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case AFE_PORT_ID_QUATERNARY_MI2S_RX:
+	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case AFE_PORT_ID_QUINARY_MI2S_RX:
+	case AFE_PORT_ID_QUINARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+
+	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_PRIMARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT;
+	case AFE_PORT_ID_SECONDARY_TDM_RX ... AFE_PORT_ID_SECONDARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT;
+	case AFE_PORT_ID_TERTIARY_TDM_RX ... AFE_PORT_ID_TERTIARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT;
+	case AFE_PORT_ID_QUATERNARY_TDM_RX ... AFE_PORT_ID_QUATERNARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT;
+	case AFE_PORT_ID_QUINARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir)
@@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 	struct afe_digital_clk_cfg dcfg = {0,};
 	int ret;
 
+	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
+		/* Always use the new clock API on newer platforms. */
+		switch (clk_id) {
+		case LPAIF_DIG_CLK:
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
+			break;
+		case LPAIF_BIT_CLK:
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			clk_id = q6afe_get_v2_bit_clk_id(port);
+			if (clk_id < 0)
+				return clk_id;
+			break;
+		default:
+			break;
+		}
+	}
+
 	switch (clk_id) {
 	case LPAIF_DIG_CLK:
 		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
-- 
2.39.2
