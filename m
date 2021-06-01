Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7E397284
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 13:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2376D16CE;
	Tue,  1 Jun 2021 13:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2376D16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622547445;
	bh=sA0XYXMkYYK4sOD2udlRWeO+d7WTe8qkEMth79q+xVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3mvI5kLd5483jVLmI6V7zhmD7/nH5BBHNB7UcLtkvhDFISV0P8isnNJiaXcEV+EC
	 YMJ51gYPl4XO2QOYMMpOFmQxOMA4oa3nht6XhT3awcmtl+gtj9Ll6inXXisArP6GUE
	 QEImJ7718hqPyzWY2REsaZ4pyU8e6VmlCFm5Ai9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FEFF804DA;
	Tue,  1 Jun 2021 13:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A944F804D1; Tue,  1 Jun 2021 13:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44B0FF80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 13:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44B0FF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PNosrBCQ"
Received: by mail-ed1-x52e.google.com with SMTP id t3so16858321edc.7
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D5XYnGgjQLfXAwzBqnvDeEJmpGJf7QdaLcq5EkqtCqY=;
 b=PNosrBCQRLUo6dKn9nGasmaMwqSwbeslJCsM39xm4BNCWB15AIYbT2A7Y5bebL1XeM
 XHRzHrYVmsHJ6ipFZ8WPiYxhPifCc8FECOxKBRrvqQnvQ40HZmaMtwCjCHUNwJABkvtV
 2T9hfZfsgyuO+o1K6cZgPb6sPSkki8EPrA5TK2rDeIanCFhDhXoeBMvPIW7hoh6A2rcY
 GQkih+41BLRMWnPAAenywZVTIXO8rxOdNh7yyA/Vc03+nNl+zn1Jt/qBRKKSNaMow2LE
 qFtZlT8oVffayJN4mpagNvXCox6VFjrZo8GbVPSA8qPVaSe5vIwNXfzgCrE2z69LmR06
 GeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5XYnGgjQLfXAwzBqnvDeEJmpGJf7QdaLcq5EkqtCqY=;
 b=Ta+uOiYiPuhZArIxcUrHTB3xc84JM+XIPY6zmPIqn/xu/+RyNTKWcG9POt4JTaceQ8
 bDk2C2nq3boyxsymTq3bS0L5i7QVRI36zUpKnv7gpyjeJH3Uz7BFAXPzGq83JCh+MA+s
 p5wsZHKYJOcKECC4k9Xq/iypunvnsBaBQWu+HU/01gCyzRAc8mobmvL/9pewfy2HQMgN
 FlLytOpjYOxxassoHnVTspMbWyNLHNxwslINZHlU0ocuUd/IKvX2fyL4J4VKmH7h9Lxa
 Q2NVzDeFxT9B9H1jYEC2UhZwtR0Iudcw/BZV/lIkUL2ItTAt4/enmuXNORH2YjCoDXpM
 ilGw==
X-Gm-Message-State: AOAM531EoWReAnK+55qrWYbrdvcMfimI+DOTjdvaUxbXrx2DneeZaDIZ
 fKmp/OQbDlPqymPZZ9By8JrhwQ==
X-Google-Smtp-Source: ABdhPJwtkXMJnzAXNepSfv3dtKLc0ULE8AhiTr6wkxP02xyZwo/ou96NMRb1j27rCPvuz8DVPJl7OA==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr31271283edd.321.1622547277627; 
 Tue, 01 Jun 2021 04:34:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f10sm4729487edx.60.2021.06.01.04.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:34:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v8 2/9] ASoC: codecs: wcd-clsh: add new version support
Date: Tue,  1 Jun 2021 12:31:51 +0100
Message-Id: <20210601113158.16085-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

From WCD937X Class H controller has changed significantly, so add support
to this new version for WCD937X and WCD938X Codecs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-clsh-v2.c | 348 ++++++++++++++++++++++++++++++++-
 sound/soc/codecs/wcd-clsh-v2.h |  16 ++
 2 files changed, 354 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index 817d8259758c..485d1932391a 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -88,6 +88,19 @@ struct wcd_clsh_ctrl {
 #define WCD9XXX_CLASSH_CTRL_CCL_1_DELTA_IPEAK_50MA	0x50
 #define WCD9XXX_CLASSH_CTRL_CCL_1_DELTA_IPEAK_30MA	0x30
 
+#define WCD9XXX_BASE_ADDRESS				0x3000
+#define WCD9XXX_ANA_RX_SUPPLIES				(WCD9XXX_BASE_ADDRESS+0x008)
+#define WCD9XXX_ANA_HPH					(WCD9XXX_BASE_ADDRESS+0x009)
+#define WCD9XXX_CLASSH_MODE_2				(WCD9XXX_BASE_ADDRESS+0x098)
+#define WCD9XXX_CLASSH_MODE_3				(WCD9XXX_BASE_ADDRESS+0x099)
+#define WCD9XXX_FLYBACK_VNEG_CTRL_1			(WCD9XXX_BASE_ADDRESS+0x0A5)
+#define WCD9XXX_FLYBACK_VNEG_CTRL_4			(WCD9XXX_BASE_ADDRESS+0x0A8)
+#define WCD9XXX_FLYBACK_VNEGDAC_CTRL_2			(WCD9XXX_BASE_ADDRESS+0x0AF)
+#define WCD9XXX_RX_BIAS_HPH_LOWPOWER			(WCD9XXX_BASE_ADDRESS+0x0BF)
+#define WCD9XXX_V3_RX_BIAS_FLYB_BUFF			(WCD9XXX_BASE_ADDRESS+0x0C7)
+#define WCD9XXX_HPH_PA_CTL1				(WCD9XXX_BASE_ADDRESS+0x0D1)
+#define WCD9XXX_HPH_NEW_INT_PA_MISC2			(WCD9XXX_BASE_ADDRESS+0x138)
+
 #define CLSH_REQ_ENABLE		true
 #define CLSH_REQ_DISABLE	false
 #define WCD_USLEEP_RANGE	50
@@ -137,6 +150,20 @@ static inline void wcd_clsh_set_buck_mode(struct snd_soc_component *comp,
 					WCD9XXX_A_ANA_RX_VPOS_PWR_LVL_DEFAULT);
 }
 
+static void wcd_clsh_v3_set_buck_mode(struct snd_soc_component *component,
+					  int mode)
+{
+	if (mode == CLS_H_HIFI || mode == CLS_H_LOHIFI ||
+	    mode == CLS_AB_HIFI || mode == CLS_AB_LOHIFI)
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				0x08, 0x08); /* set to HIFI */
+	else
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				0x08, 0x00); /* set to default */
+}
+
 static inline void wcd_clsh_set_flyback_mode(struct snd_soc_component *comp,
 					     int mode)
 {
@@ -170,6 +197,36 @@ static void wcd_clsh_buck_ctrl(struct wcd_clsh_ctrl *ctrl,
 	usleep_range(500, 500 + WCD_USLEEP_RANGE);
 }
 
+static void wcd_clsh_v3_buck_ctrl(struct snd_soc_component *component,
+			       struct wcd_clsh_ctrl *ctrl,
+			       int mode,
+			       bool enable)
+{
+	/* enable/disable buck */
+	if ((enable && (++ctrl->buck_users == 1)) ||
+	   (!enable && (--ctrl->buck_users == 0))) {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				(1 << 7), (enable << 7));
+		/*
+		 * 500us sleep is required after buck enable/disable
+		 * as per HW requirement
+		 */
+		usleep_range(500, 510);
+		if (mode == CLS_H_LOHIFI || mode == CLS_H_ULP ||
+			mode == CLS_H_HIFI || mode == CLS_H_LP)
+			snd_soc_component_update_bits(component,
+					WCD9XXX_CLASSH_MODE_3,
+					0x02, 0x00);
+
+		snd_soc_component_update_bits(component,
+					WCD9XXX_CLASSH_MODE_2,
+					0xFF, 0x3A);
+		/* 500usec delay is needed as per HW requirement */
+		usleep_range(500, 500 + WCD_USLEEP_RANGE);
+	}
+}
+
 static void wcd_clsh_flyback_ctrl(struct wcd_clsh_ctrl *ctrl,
 				  int mode,
 				  bool enable)
@@ -219,8 +276,7 @@ static void wcd_clsh_set_gain_path(struct wcd_clsh_ctrl *ctrl, int mode)
 					val);
 }
 
-static void wcd_clsh_set_hph_mode(struct snd_soc_component *comp,
-				  int mode)
+static void wcd_clsh_v2_set_hph_mode(struct snd_soc_component *comp, int mode)
 {
 	int val = 0, gain = 0, res_val;
 	int ipeak = WCD9XXX_CLASSH_CTRL_CCL_1_DELTA_IPEAK_50MA;
@@ -264,6 +320,48 @@ static void wcd_clsh_set_hph_mode(struct snd_soc_component *comp,
 				ipeak);
 }
 
+static void wcd_clsh_v3_set_hph_mode(struct snd_soc_component *component,
+				  int mode)
+{
+	u8 val;
+
+	switch (mode) {
+	case CLS_H_NORMAL:
+		val = 0x00;
+		break;
+	case CLS_AB:
+	case CLS_H_ULP:
+		val = 0x0C;
+		break;
+	case CLS_AB_HIFI:
+	case CLS_H_HIFI:
+		val = 0x08;
+		break;
+	case CLS_H_LP:
+	case CLS_H_LOHIFI:
+	case CLS_AB_LP:
+	case CLS_AB_LOHIFI:
+		val = 0x04;
+		break;
+	default:
+		dev_err(component->dev, "%s:Invalid mode %d\n", __func__, mode);
+		return;
+	};
+
+	snd_soc_component_update_bits(component, WCD9XXX_ANA_HPH, 0x0C, val);
+}
+
+void wcd_clsh_set_hph_mode(struct wcd_clsh_ctrl *ctrl, int mode)
+{
+	struct snd_soc_component *comp = ctrl->comp;
+
+	if (ctrl->codec_version >= WCD937X)
+		wcd_clsh_v3_set_hph_mode(comp, mode);
+	else
+		wcd_clsh_v2_set_hph_mode(comp, mode);
+
+}
+
 static void wcd_clsh_set_flyback_current(struct snd_soc_component *comp,
 					 int mode)
 {
@@ -289,6 +387,130 @@ static void wcd_clsh_set_buck_regulator_mode(struct snd_soc_component *comp,
 					WCD9XXX_A_ANA_RX_REGULATOR_MODE_CLS_H);
 }
 
+static void wcd_clsh_v3_set_buck_regulator_mode(struct snd_soc_component *component,
+						int mode)
+{
+	snd_soc_component_update_bits(component, WCD9XXX_ANA_RX_SUPPLIES,
+			    0x02, 0x00);
+}
+
+static void wcd_clsh_v3_set_flyback_mode(struct snd_soc_component *component,
+						int mode)
+{
+	if (mode == CLS_H_HIFI || mode == CLS_H_LOHIFI ||
+	    mode == CLS_AB_HIFI || mode == CLS_AB_LOHIFI) {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				0x04, 0x04);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_FLYBACK_VNEG_CTRL_4,
+				0xF0, 0x80);
+	} else {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				0x04, 0x00); /* set to Default */
+		snd_soc_component_update_bits(component,
+				WCD9XXX_FLYBACK_VNEG_CTRL_4,
+				0xF0, 0x70);
+	}
+}
+
+static void wcd_clsh_v3_force_iq_ctl(struct snd_soc_component *component,
+					 int mode, bool enable)
+{
+	if (enable) {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_FLYBACK_VNEGDAC_CTRL_2,
+				0xE0, 0xA0);
+		/* 100usec delay is needed as per HW requirement */
+		usleep_range(100, 110);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_CLASSH_MODE_3,
+				0x02, 0x02);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_CLASSH_MODE_2,
+				0xFF, 0x1C);
+		if (mode == CLS_H_LOHIFI || mode == CLS_AB_LOHIFI) {
+			snd_soc_component_update_bits(component,
+					WCD9XXX_HPH_NEW_INT_PA_MISC2,
+					0x20, 0x20);
+			snd_soc_component_update_bits(component,
+					WCD9XXX_RX_BIAS_HPH_LOWPOWER,
+					0xF0, 0xC0);
+			snd_soc_component_update_bits(component,
+					WCD9XXX_HPH_PA_CTL1,
+					0x0E, 0x02);
+		}
+	} else {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_HPH_NEW_INT_PA_MISC2,
+				0x20, 0x00);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_RX_BIAS_HPH_LOWPOWER,
+				0xF0, 0x80);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_HPH_PA_CTL1,
+				0x0E, 0x06);
+	}
+}
+
+static void wcd_clsh_v3_flyback_ctrl(struct snd_soc_component *component,
+				  struct wcd_clsh_ctrl *ctrl,
+				  int mode,
+				  bool enable)
+{
+	/* enable/disable flyback */
+	if ((enable && (++ctrl->flyback_users == 1)) ||
+	   (!enable && (--ctrl->flyback_users == 0))) {
+		snd_soc_component_update_bits(component,
+				WCD9XXX_FLYBACK_VNEG_CTRL_1,
+				0xE0, 0xE0);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_ANA_RX_SUPPLIES,
+				(1 << 6), (enable << 6));
+		/*
+		 * 100us sleep is required after flyback enable/disable
+		 * as per HW requirement
+		 */
+		usleep_range(100, 110);
+		snd_soc_component_update_bits(component,
+				WCD9XXX_FLYBACK_VNEGDAC_CTRL_2,
+				0xE0, 0xE0);
+		/* 500usec delay is needed as per HW requirement */
+		usleep_range(500, 500 + WCD_USLEEP_RANGE);
+	}
+}
+
+static void wcd_clsh_v3_set_flyback_current(struct snd_soc_component *component,
+				int mode)
+{
+	snd_soc_component_update_bits(component, WCD9XXX_V3_RX_BIAS_FLYB_BUFF,
+				0x0F, 0x0A);
+	snd_soc_component_update_bits(component, WCD9XXX_V3_RX_BIAS_FLYB_BUFF,
+				0xF0, 0xA0);
+	/* Sleep needed to avoid click and pop as per HW requirement */
+	usleep_range(100, 110);
+}
+
+static void wcd_clsh_v3_state_aux(struct wcd_clsh_ctrl *ctrl, int req_state,
+			      bool is_enable, int mode)
+{
+	struct snd_soc_component *component = ctrl->comp;
+
+	if (is_enable) {
+		wcd_clsh_v3_set_buck_mode(component, mode);
+		wcd_clsh_v3_set_flyback_mode(component, mode);
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_flyback_current(component, mode);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, mode, true);
+	} else {
+		wcd_clsh_v3_buck_ctrl(component, ctrl, mode, false);
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, mode, false);
+		wcd_clsh_v3_set_flyback_mode(component, CLS_H_NORMAL);
+		wcd_clsh_v3_set_buck_mode(component, CLS_H_NORMAL);
+	}
+}
+
 static void wcd_clsh_state_lo(struct wcd_clsh_ctrl *ctrl, int req_state,
 			      bool is_enable, int mode)
 {
@@ -316,6 +538,38 @@ static void wcd_clsh_state_lo(struct wcd_clsh_ctrl *ctrl, int req_state,
 	}
 }
 
+static void wcd_clsh_v3_state_hph_r(struct wcd_clsh_ctrl *ctrl, int req_state,
+				 bool is_enable, int mode)
+{
+	struct snd_soc_component *component = ctrl->comp;
+
+	if (mode == CLS_H_NORMAL) {
+		dev_dbg(component->dev, "%s: Normal mode not applicable for hph_r\n",
+			__func__);
+		return;
+	}
+
+	if (is_enable) {
+		wcd_clsh_v3_set_buck_regulator_mode(component, mode);
+		wcd_clsh_v3_set_flyback_mode(component, mode);
+		wcd_clsh_v3_force_iq_ctl(component, mode, true);
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_flyback_current(component, mode);
+		wcd_clsh_v3_set_buck_mode(component, mode);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_hph_mode(component, mode);
+	} else {
+		wcd_clsh_v3_set_hph_mode(component, CLS_H_NORMAL);
+
+		/* buck and flyback set to default mode and disable */
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_force_iq_ctl(component, CLS_H_NORMAL, false);
+		wcd_clsh_v3_set_flyback_mode(component, CLS_H_NORMAL);
+		wcd_clsh_v3_set_buck_mode(component, CLS_H_NORMAL);
+	}
+}
+
 static void wcd_clsh_state_hph_r(struct wcd_clsh_ctrl *ctrl, int req_state,
 				 bool is_enable, int mode)
 {
@@ -353,10 +607,10 @@ static void wcd_clsh_state_hph_r(struct wcd_clsh_ctrl *ctrl, int req_state,
 		wcd_clsh_set_flyback_current(comp, mode);
 		wcd_clsh_set_buck_mode(comp, mode);
 		wcd_clsh_buck_ctrl(ctrl, mode, true);
-		wcd_clsh_set_hph_mode(comp, mode);
+		wcd_clsh_v2_set_hph_mode(comp, mode);
 		wcd_clsh_set_gain_path(ctrl, mode);
 	} else {
-		wcd_clsh_set_hph_mode(comp, CLS_H_NORMAL);
+		wcd_clsh_v2_set_hph_mode(comp, CLS_H_NORMAL);
 
 		if (mode != CLS_AB) {
 			snd_soc_component_update_bits(comp,
@@ -374,6 +628,38 @@ static void wcd_clsh_state_hph_r(struct wcd_clsh_ctrl *ctrl, int req_state,
 	}
 }
 
+static void wcd_clsh_v3_state_hph_l(struct wcd_clsh_ctrl *ctrl, int req_state,
+				 bool is_enable, int mode)
+{
+	struct snd_soc_component *component = ctrl->comp;
+
+	if (mode == CLS_H_NORMAL) {
+		dev_dbg(component->dev, "%s: Normal mode not applicable for hph_l\n",
+			__func__);
+		return;
+	}
+
+	if (is_enable) {
+		wcd_clsh_v3_set_buck_regulator_mode(component, mode);
+		wcd_clsh_v3_set_flyback_mode(component, mode);
+		wcd_clsh_v3_force_iq_ctl(component, mode, true);
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_flyback_current(component, mode);
+		wcd_clsh_v3_set_buck_mode(component, mode);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_hph_mode(component, mode);
+	} else {
+		wcd_clsh_v3_set_hph_mode(component, CLS_H_NORMAL);
+
+		/* set buck and flyback to Default Mode */
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_force_iq_ctl(component, CLS_H_NORMAL, false);
+		wcd_clsh_v3_set_flyback_mode(component, CLS_H_NORMAL);
+		wcd_clsh_v3_set_buck_mode(component, CLS_H_NORMAL);
+	}
+}
+
 static void wcd_clsh_state_hph_l(struct wcd_clsh_ctrl *ctrl, int req_state,
 				 bool is_enable, int mode)
 {
@@ -411,10 +697,10 @@ static void wcd_clsh_state_hph_l(struct wcd_clsh_ctrl *ctrl, int req_state,
 		wcd_clsh_set_flyback_current(comp, mode);
 		wcd_clsh_set_buck_mode(comp, mode);
 		wcd_clsh_buck_ctrl(ctrl, mode, true);
-		wcd_clsh_set_hph_mode(comp, mode);
+		wcd_clsh_v2_set_hph_mode(comp, mode);
 		wcd_clsh_set_gain_path(ctrl, mode);
 	} else {
-		wcd_clsh_set_hph_mode(comp, CLS_H_NORMAL);
+		wcd_clsh_v2_set_hph_mode(comp, CLS_H_NORMAL);
 
 		if (mode != CLS_AB) {
 			snd_soc_component_update_bits(comp,
@@ -432,6 +718,32 @@ static void wcd_clsh_state_hph_l(struct wcd_clsh_ctrl *ctrl, int req_state,
 	}
 }
 
+static void wcd_clsh_v3_state_ear(struct wcd_clsh_ctrl *ctrl, int req_state,
+			       bool is_enable, int mode)
+{
+	struct snd_soc_component *component = ctrl->comp;
+
+	if (is_enable) {
+		wcd_clsh_v3_set_buck_regulator_mode(component, mode);
+		wcd_clsh_v3_set_flyback_mode(component, mode);
+		wcd_clsh_v3_force_iq_ctl(component, mode, true);
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_flyback_current(component, mode);
+		wcd_clsh_v3_set_buck_mode(component, mode);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, mode, true);
+		wcd_clsh_v3_set_hph_mode(component, mode);
+	} else {
+		wcd_clsh_v3_set_hph_mode(component, CLS_H_NORMAL);
+
+		/* set buck and flyback to Default Mode */
+		wcd_clsh_v3_flyback_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_buck_ctrl(component, ctrl, CLS_H_NORMAL, false);
+		wcd_clsh_v3_force_iq_ctl(component, CLS_H_NORMAL, false);
+		wcd_clsh_v3_set_flyback_mode(component, CLS_H_NORMAL);
+		wcd_clsh_v3_set_buck_mode(component, CLS_H_NORMAL);
+	}
+}
+
 static void wcd_clsh_state_ear(struct wcd_clsh_ctrl *ctrl, int req_state,
 			       bool is_enable, int mode)
 {
@@ -472,16 +784,30 @@ static int _wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl, int req_state,
 {
 	switch (req_state) {
 	case WCD_CLSH_STATE_EAR:
-		wcd_clsh_state_ear(ctrl, req_state, is_enable, mode);
+		if (ctrl->codec_version >= WCD937X)
+			wcd_clsh_v3_state_ear(ctrl, req_state, is_enable, mode);
+		else
+			wcd_clsh_state_ear(ctrl, req_state, is_enable, mode);
 		break;
 	case WCD_CLSH_STATE_HPHL:
-		wcd_clsh_state_hph_l(ctrl, req_state, is_enable, mode);
+		if (ctrl->codec_version >= WCD937X)
+			wcd_clsh_v3_state_hph_l(ctrl, req_state, is_enable, mode);
+		else
+			wcd_clsh_state_hph_l(ctrl, req_state, is_enable, mode);
 		break;
 	case WCD_CLSH_STATE_HPHR:
-		wcd_clsh_state_hph_r(ctrl, req_state, is_enable, mode);
+		if (ctrl->codec_version >= WCD937X)
+			wcd_clsh_v3_state_hph_r(ctrl, req_state, is_enable, mode);
+		else
+			wcd_clsh_state_hph_r(ctrl, req_state, is_enable, mode);
 		break;
 	case WCD_CLSH_STATE_LO:
-		wcd_clsh_state_lo(ctrl, req_state, is_enable, mode);
+		if (ctrl->codec_version < WCD937X)
+			wcd_clsh_state_lo(ctrl, req_state, is_enable, mode);
+		break;
+	case WCD_CLSH_STATE_AUX:
+		if (ctrl->codec_version >= WCD937X)
+			wcd_clsh_v3_state_aux(ctrl, req_state, is_enable, mode);
 		break;
 	default:
 		break;
@@ -504,6 +830,7 @@ static bool wcd_clsh_is_state_valid(int state)
 	case WCD_CLSH_STATE_HPHL:
 	case WCD_CLSH_STATE_HPHR:
 	case WCD_CLSH_STATE_LO:
+	case WCD_CLSH_STATE_AUX:
 		return true;
 	default:
 		return false;
@@ -565,6 +892,7 @@ struct wcd_clsh_ctrl *wcd_clsh_ctrl_alloc(struct snd_soc_component *comp,
 
 	ctrl->state = WCD_CLSH_STATE_IDLE;
 	ctrl->comp = comp;
+	ctrl->codec_version = version;
 
 	return ctrl;
 }
diff --git a/sound/soc/codecs/wcd-clsh-v2.h b/sound/soc/codecs/wcd-clsh-v2.h
index a6d0f2d0e9e3..4e3653058275 100644
--- a/sound/soc/codecs/wcd-clsh-v2.h
+++ b/sound/soc/codecs/wcd-clsh-v2.h
@@ -22,8 +22,11 @@ enum wcd_clsh_event {
 #define	WCD_CLSH_STATE_HPHL	BIT(1)
 #define	WCD_CLSH_STATE_HPHR	BIT(2)
 #define	WCD_CLSH_STATE_LO	BIT(3)
+#define	WCD_CLSH_STATE_AUX	BIT(4)
 #define WCD_CLSH_STATE_MAX	4
+#define WCD_CLSH_V3_STATE_MAX	5
 #define NUM_CLSH_STATES_V2	BIT(WCD_CLSH_STATE_MAX)
+#define NUM_CLSH_STATES_V3	BIT(WCD_CLSH_V3_STATE_MAX)
 
 enum wcd_clsh_mode {
 	CLS_H_NORMAL = 0, /* Class-H Default */
@@ -31,9 +34,20 @@ enum wcd_clsh_mode {
 	CLS_H_LP, /* Class-H Low Power */
 	CLS_AB, /* Class-AB */
 	CLS_H_LOHIFI, /* LoHIFI */
+	CLS_H_ULP, /* Ultra Low power */
+	CLS_AB_HIFI, /* Class-AB */
+	CLS_AB_LP, /* Class-AB Low Power */
+	CLS_AB_LOHIFI, /* Class-AB Low HIFI */
 	CLS_NONE, /* None of the above modes */
 };
 
+enum wcd_codec_version {
+	WCD9335  = 0,
+	WCD934X  = 1,
+	/* New CLSH after this */
+	WCD937X  = 2,
+	WCD938X  = 3,
+};
 struct wcd_clsh_ctrl;
 
 extern struct wcd_clsh_ctrl *wcd_clsh_ctrl_alloc(
@@ -45,5 +59,7 @@ extern int wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl,
 				   enum wcd_clsh_event clsh_event,
 				   int nstate,
 				   enum wcd_clsh_mode mode);
+extern void wcd_clsh_set_hph_mode(struct wcd_clsh_ctrl *ctrl,
+				  int mode);
 
 #endif /* _WCD_CLSH_V2_H_ */
-- 
2.21.0

