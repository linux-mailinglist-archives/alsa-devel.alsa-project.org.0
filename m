Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0946E5E10
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C89FE87;
	Tue, 18 Apr 2023 11:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C89FE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811826;
	bh=4BH4eVwxV61SKo8rHzOWsqz657vT6caIQ/AuO3Y0bTA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eUvW5RCl9qaaiEIDmGpATXx9/saALWoxXdkaiM5+rDJBFPzvKLws1xql0l911JET5
	 /BxVKyVvyT0Gj9/ZEoxmQ9oX8STkFWP0Oapp4h1jTQGCTEkqbnuEADFzWwJPzNVW4K
	 7o+o/X50iApbtdmOJh3y5zoD29gNG4H2jqL/nLjU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D518AF8053B;
	Tue, 18 Apr 2023 11:55:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 916D1F800AC; Tue, 18 Apr 2023 11:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B848F80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B848F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YNvhtNpX
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50674656309so3252567a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811695; x=1684403695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfWAoZVQpBV3Gs9h8tDUDYuiSFd4SRFgH0q6cAVKEJI=;
        b=YNvhtNpXqQkZcemTPd/COHdvCZyYbK+zFCNn8oTJJXRYm5bCxwn3U5IhmFsaGYd1B0
         dO0nlkGuejs45aVRQt0qbkoQFXVrRUI6FKuBoumoCWQyQbMoW+wGvuGvdvJNzVrL/tEH
         nE/2bkaI0vjCfDVTP3NDh5raXsVnTbFBTkk7D2N19JRFfvcBgyL14H+zKszWv9Xg4dXi
         gutzCSkUNAVBC28HH6/JqPnya9vdY7PFpRHmoc8ZYSqkKSSOL13sD1IaM8Za7z6DuVSd
         28FRG600y9/ovlcuzj3gfRd7q4i7r0/RIgoBU05UZOg3YKpIka07dHZZG6JT/2gpmYeg
         BEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811695; x=1684403695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfWAoZVQpBV3Gs9h8tDUDYuiSFd4SRFgH0q6cAVKEJI=;
        b=Yp4aBI15T+XKjDNdSMzArL6qcCD3UUE7QfGgR0n5PCKmXlxfeTdUIVcxqXEaflNQRP
         8XwWJ8tC62LuTJyuAL/vqMFON0D/6WLPxr1EaJzFUdX6OHrRrLIDRAP2ezK7ZVHTg3DX
         o9kcvqYYdsBVFTt75ZdWTVYA0N1MAyiw/HoLAEji9N93d2VMo237+6AhnBPkQSTyZi3j
         z54aB97DsHBaEfbp0Wfd/imEmDZQzS85e2NESUMV3G2ilgeOz239Ljqlz5OYPyKPoHs+
         ZZKYMzUa24T3DGKwrMTt3xLaAnY/81iAZCTSshVpdcv52hWbE7AQlreH/Oa+TduB//BN
         2D9Q==
X-Gm-Message-State: AAQBX9eAk5Md30xlAXMqOCfDPg782J+gKPbDEi9Mz/LK03FxwZMCkyql
	j/m2LNPM8fuamM+MqUwgtLc9lg==
X-Google-Smtp-Source: 
 AKy350aZ4LDO4RZEyTrHTwlvzkSTENrz5Ws/13ACngYxLItJ6NOLjqayqpUrqLaP16zxdw54lHhZsw==
X-Received: by 2002:a05:6402:12d4:b0:505:745:a271 with SMTP id
 k20-20020a05640212d400b005050745a271mr1783992edx.23.1681811694858;
        Tue, 18 Apr 2023 02:54:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 3/7] soundwire: qcom: allow 16-bit sample interval for
 ports
Date: Tue, 18 Apr 2023 11:54:43 +0200
Message-Id: <20230418095447.577001-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G5PF6H5TT3EMW27JMGEJZPYMYUMIZAMD
X-Message-ID-Hash: G5PF6H5TT3EMW27JMGEJZPYMYUMIZAMD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5PF6H5TT3EMW27JMGEJZPYMYUMIZAMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The port sample interval was always 16-bit, split into low and high
bytes.  This split was unnecessary, although harmless for older devices
because all of them used only lower byte (so values < 0xff).  With
support for Soundwire controller on Qualcomm SM8550 and its devices,
both bytes will be used, thus add a new 'qcom,ports-sinterval' property
to allow 16-bit sample intervals.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Use uint16 for qcom,ports-sinterval.
2. Add tags.

Changes since v1:
1. Drop unneeded semicolon.
---
 drivers/soundwire/qcom.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c296e0bf897b..d051dc408532 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -95,6 +95,7 @@
 #define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
 #define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
 #define SWR_MSTR_MAX_REG_ADDR		(0x1740)
 
@@ -131,7 +132,7 @@ enum {
 };
 
 struct qcom_swrm_port_config {
-	u8 si;
+	u16 si;
 	u8 off1;
 	u8 off2;
 	u8 bp_mode;
@@ -806,12 +807,20 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
 	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
-	value |= pcfg->si;
+	value |= pcfg->si & 0xff;
 
 	ret = ctrl->reg_write(ctrl, reg, value);
 	if (ret)
 		goto err;
 
+	if (pcfg->si > 0xff) {
+		value = (pcfg->si >> 8) & 0xff;
+		reg = SWRM_DP_SAMPLECTRL2_BANK(params->port_num, bank);
+		ret = ctrl->reg_write(ctrl, reg, value);
+		if (ret)
+			goto err;
+	}
+
 	if (pcfg->lane_control != SWR_INVALID_PARAM) {
 		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
 		value = pcfg->lane_control;
@@ -1185,7 +1194,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	struct device_node *np = ctrl->dev->of_node;
 	u8 off1[QCOM_SDW_MAX_PORTS];
 	u8 off2[QCOM_SDW_MAX_PORTS];
-	u8 si[QCOM_SDW_MAX_PORTS];
+	u16 si[QCOM_SDW_MAX_PORTS];
 	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
 	u8 hstart[QCOM_SDW_MAX_PORTS];
 	u8 hstop[QCOM_SDW_MAX_PORTS];
@@ -1193,6 +1202,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
 	u8 lane_control[QCOM_SDW_MAX_PORTS];
 	int i, ret, nports, val;
+	bool si_16 = false;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
@@ -1236,9 +1246,14 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 		return ret;
 
 	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
-					si, nports);
-	if (ret)
-		return ret;
+					(u8 *)si, nports);
+	if (ret) {
+		ret = of_property_read_u16_array(np, "qcom,ports-sinterval",
+						 si, nports);
+		if (ret)
+			return ret;
+		si_16 = true;
+	}
 
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
@@ -1266,7 +1281,10 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 
 	for (i = 0; i < nports; i++) {
 		/* Valid port number range is from 1-14 */
-		ctrl->pconfig[i + 1].si = si[i];
+		if (si_16)
+			ctrl->pconfig[i + 1].si = si[i];
+		else
+			ctrl->pconfig[i + 1].si = ((u8 *)si)[i];
 		ctrl->pconfig[i + 1].off1 = off1[i];
 		ctrl->pconfig[i + 1].off2 = off2[i];
 		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
-- 
2.34.1

