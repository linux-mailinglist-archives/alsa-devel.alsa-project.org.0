Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDE6D261E
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 18:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A74DA210;
	Fri, 31 Mar 2023 18:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A74DA210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680281257;
	bh=VMm9Ee5fiuiG3Pp1jlnOzKyB1LJ/k+gOrUYYgychp20=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhRDIA0ofW/mr9Nvl6qCHtuu4bz1VTkHbZqonw614/HfHK6zfaBgTBVqkak6nMfgu
	 k2tdV0arTN1e91muBlpHSnmKiOdipmpKAZJx8cr8OBr0U1PGQ8W3Kn4D181xmqLz5d
	 SlqMLF1JaDDVbJPUKJ93ZtNIonX1QVQB/KGouK88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5AFDF80549;
	Fri, 31 Mar 2023 18:45:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 758AEF80482; Fri, 31 Mar 2023 18:45:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CF7CF800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 18:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF7CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p85ERDf/
Received: by mail-lf1-x136.google.com with SMTP id g17so29707822lfv.4
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEC86w6mjGLupeK5H+hGWpVXZB98Fs+7rvadaDpP8J4=;
        b=p85ERDf/jMV4ob2/oqgTlrWAK3V19HCBtPsq9MXOplwdSl0R3QzzDYLWADWpnnoYc/
         wxfqzK1fzWD3Uj/hL23h2O3sgy1glBnuA+vPr3ih0/0TtL0ChflFe5EkkUXlg53gxR79
         rsfkfyN9NBftT21Ui+t4HQZ7LiNtFErXpTEBGML1IdkPlw7QgGAsOj5SB5XqEqDM3wBk
         GJgGzwZ/Z1ybCxXG1fa/5drXNQORJcSsmaph67/IGOa7pDpWwT8QMFhGpDg9JJlOCCFv
         0zogtU9iIO/pct0dQtTK4TCToH5XC+to+gNRV8HbBQu6t7Exxi2vYl6LiGT13OqBC5Qn
         qmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEC86w6mjGLupeK5H+hGWpVXZB98Fs+7rvadaDpP8J4=;
        b=v0QN3YWUxgar68b8ubQmRomAHum28KHlvHCODRtJMJenjFG1iH7ABRk20VG5Q/NrTn
         4kg78mX/O7XtKSrZ1uRBSqHIP8Scybfn7+ZbY2J9g+D/z06MN9v2Bmp+cqHJEIE2kkHN
         S96qaYaiB5ORCy3njt+A33tqdcT58r2zmVnsxn/jWUnVb00374aPoME6APveexV7igH6
         M2mLH6gOk+Vp0QI2YHt3b+TCb5OLCc50BUe730TQ9E4605d2/hMap3gzJ8Nd9NFLvFrT
         sJRXKStmokmbsIOiJasg3Ujc5vkxLpaujNCLUNxv4aDSXqQT3tCYLeT91MPrw/4MgWPn
         N+cQ==
X-Gm-Message-State: AAQBX9f8jMQ66NrhtEoVrGeaOeyXzIrJtLOqNlVqjnEBQyUQao4iVeAv
	lS63mjBOco5ebAMkI26fgNVqrA==
X-Google-Smtp-Source: 
 AKy350aKcKEyQ3S6iCH2Xpl5FdJpp5gJCNqjLHpViOd03ipHhs/BsroiJf7eTbN5CTyAQYKhu4V+nw==
X-Received: by 2002:a05:6512:204:b0:4b4:e14a:ec7d with SMTP id
 a4-20020a056512020400b004b4e14aec7dmr8057796lfo.17.1680281138238;
        Fri, 31 Mar 2023 09:45:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 u26-20020ac2519a000000b004e8483bff82sm439872lfi.271.2023.03.31.09.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:45:37 -0700 (PDT)
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
Subject: [PATCH 3/7] soundwire: qcom: allow 16-bit sample interval for ports
Date: Fri, 31 Mar 2023 18:45:26 +0200
Message-Id: <20230331164530.227302-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331164530.227302-1-krzysztof.kozlowski@linaro.org>
References: <20230331164530.227302-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2LXHO2L3PKX5LN5FD4UXQUTFSWYJH27P
X-Message-ID-Hash: 2LXHO2L3PKX5LN5FD4UXQUTFSWYJH27P
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LXHO2L3PKX5LN5FD4UXQUTFSWYJH27P/>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c296e0bf897b..80147fd0294b 100644
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
+	u32 si;
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
+	};
+
 	if (pcfg->lane_control != SWR_INVALID_PARAM) {
 		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
 		value = pcfg->lane_control;
@@ -1185,7 +1194,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	struct device_node *np = ctrl->dev->of_node;
 	u8 off1[QCOM_SDW_MAX_PORTS];
 	u8 off2[QCOM_SDW_MAX_PORTS];
-	u8 si[QCOM_SDW_MAX_PORTS];
+	u32 si[QCOM_SDW_MAX_PORTS];
 	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
 	u8 hstart[QCOM_SDW_MAX_PORTS];
 	u8 hstop[QCOM_SDW_MAX_PORTS];
@@ -1193,6 +1202,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
 	u8 lane_control[QCOM_SDW_MAX_PORTS];
 	int i, ret, nports, val;
+	bool si_32 = false;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
 
@@ -1236,9 +1246,14 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 		return ret;
 
 	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
-					si, nports);
-	if (ret)
-		return ret;
+					(u8 *)si, nports);
+	if (ret) {
+		ret = of_property_read_u32_array(np, "qcom,ports-sinterval",
+						 si, nports);
+		if (ret)
+			return ret;
+		si_32 = true;
+	}
 
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
@@ -1266,7 +1281,10 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 
 	for (i = 0; i < nports; i++) {
 		/* Valid port number range is from 1-14 */
-		ctrl->pconfig[i + 1].si = si[i];
+		if (si_32)
+			ctrl->pconfig[i + 1].si = si[i];
+		else
+			ctrl->pconfig[i + 1].si = ((u8 *)si)[i];
 		ctrl->pconfig[i + 1].off1 = off1[i];
 		ctrl->pconfig[i + 1].off2 = off2[i];
 		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
-- 
2.34.1

