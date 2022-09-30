Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B75F082B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC54168D;
	Fri, 30 Sep 2022 12:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC54168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664532096;
	bh=ibC3sk0eCldRdK+RwJnOiXO6QsAax1e7Tm0jbnJ5Oi8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4P+K3Kr+K0Zsg1CFIw9Iqzx9vaGLCDr1iV+1HCGbqW/A91Hv2HAJCBcpyTSaS+dw
	 BWwyuHB2CnB7VrXqIqQRH03xvc9P43U1EdKkakBdjynK3OxUwTMHwU5RbsyRiiSFjY
	 j2G2wSoKwSgmHbPW3LL3HI2xi71SDNzLNXec4A5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A32F804E5;
	Fri, 30 Sep 2022 12:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E1BF801D5; Fri, 30 Sep 2022 12:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F7BF804E5
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F7BF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="voc8TJMG"
Received: by mail-lf1-x133.google.com with SMTP id o2so6088701lfc.10
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9KpEUUalWoRI8TdGgOpsCg4Iu1p4euYEEJL3jAX6IA8=;
 b=voc8TJMGolTORHdohzjvuHAb4UaOqMJCdsBpDglcWWDasx3Bh/t4bB1zHsBgXyB/XH
 gvMWUPtHlADr2zsn56C3/uwUm51/k9+SybvXdpWO2dvuE8rZMFV41uj1L0MFso4CHhjZ
 R30v7heDZtcRI7nUwugKeNDVji1gkKjbvTy6nMAANQwgYRbWmSdRjZayLqTXkLPM6DCv
 CWjp/sJZMawQ5yZ+nfePEF+kuPODV9K0dwrvncOqW3ubk4ExxC+h44618XHTeZ8GMujZ
 el1qaFBGZnKf/m7mp1i1RXcPFh4M4qJhygCH051dou0CqHJpsAxXF9u1xIiIEqeBQiPN
 gX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9KpEUUalWoRI8TdGgOpsCg4Iu1p4euYEEJL3jAX6IA8=;
 b=i3kJ9XMSapWDWxzysi8P/4IYHI/Lvjs6DynP8CSIZoF19G0V8O3H/S0ZUri9MA+VZZ
 Mv9MZMm7lIPmrgmMe5X2M1Ac4Sf5nB/dQ/liv2ZCge9LpwbBEbmpjR/4lpTWh6mN+mEZ
 rKDIeyXD6k9DnQ/3it/aHvs+PI0DnKlS9oHg7lzLWtZK0frL1691bIL+Z/dYjZsPaJgT
 ulTTVo4OmDSs3D0SWa7pmHkYOv2I7ZS6/d94KdVgquDUXnaUv/MBOimETBrh8vP5rwfh
 OtJmKV5AiL7bGCKO/RimBlLFtsRXiOLLmk/V8QSWkAyD7wjpAM2+N+RdrMTaBpjvdQj+
 S9AA==
X-Gm-Message-State: ACrzQf3G4cxEDs7v8VPLmsFlzsnVDTXBFQT3L8FnV3PfXYB+kZniu9yn
 /7xlQqU/C4UhW+D7PALV1TeWtw==
X-Google-Smtp-Source: AMsMyM5HvS85QSAxGq4Faz53kk6h8+znPOxxIkcAMRbZnP3Zfwji5og6cRVKRepMrNrIc8z33OvEow==
X-Received: by 2002:a05:6512:304d:b0:498:9d7b:43f with SMTP id
 b13-20020a056512304d00b004989d7b043fmr2984022lfb.48.1664532017997; 
 Fri, 30 Sep 2022 03:00:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q65-20020a2e2a44000000b0026c3e350682sm113521ljq.14.2022.09.30.03.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 03:00:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] slimbus: qcom-ngd-ctrl: add support for 44.1 Khz
 frequency
Date: Fri, 30 Sep 2022 12:00:15 +0200
Message-Id: <20220930100015.259106-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930100015.259106-1-krzysztof.kozlowski@linaro.org>
References: <20220930100015.259106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
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

Add support for 44.1Khz frequency by dynamically calculating the slimbus
parameters instead of statically defining them.

Co-developed-by: Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
Signed-off-by: Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Rebase (drop development pieces in the context).
---
 drivers/slimbus/qcom-ngd-ctrl.c | 64 ++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ac84fdc2822f..051ac5cba207 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -944,6 +944,54 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	return ret;
 }
 
+static int qcom_slim_calc_coef(struct slim_stream_runtime *rt, int *exp)
+{
+	struct slim_controller *ctrl = rt->dev->ctrl;
+	int coef;
+
+	if (rt->ratem * ctrl->a_framer->superfreq < rt->rate)
+		rt->ratem++;
+
+	coef = rt->ratem;
+	*exp = 0;
+
+	/*
+	 * CRM = Cx(2^E) is the formula we are using.
+	 * Here C is the coffecient and E is the exponent.
+	 * CRM is the Channel Rate Multiplier.
+	 * Coefficeint should be either 1 or 3 and exponenet
+	 * should be an integer between 0 to 9, inclusive.
+	 */
+	while (1) {
+		while ((coef & 0x1) != 0x1) {
+			coef >>= 1;
+			*exp = *exp + 1;
+		}
+
+		if (coef <= 3)
+			break;
+
+		coef++;
+	}
+
+	/*
+	 * we rely on the coef value (1 or 3) to set a bit
+	 * in the slimbus message packet. This bit is
+	 * BIT(5) which is the segment rate coefficient.
+	 */
+	if (coef == 1) {
+		if (*exp > 9)
+			return -EIO;
+		coef = 0;
+	} else {
+		if (*exp > 8)
+			return -EIO;
+		coef = 1;
+	}
+
+	return coef;
+}
+
 static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 {
 	struct slim_device *sdev = rt->dev;
@@ -967,16 +1015,22 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 		struct slim_port *port = &rt->ports[i];
 
 		if (txn.msg->num_bytes == 0) {
-			int seg_interval = SLIM_SLOTS_PER_SUPERFRAME/rt->ratem;
-			int exp;
+			int exp = 0, coef = 0;
 
 			wbuf[txn.msg->num_bytes++] = sdev->laddr;
 			wbuf[txn.msg->num_bytes] = rt->bps >> 2 |
 						   (port->ch.aux_fmt << 6);
 
-			/* Data channel segment interval not multiple of 3 */
-			exp = seg_interval % 3;
-			if (exp)
+			/* calculate coef dynamically */
+			coef = qcom_slim_calc_coef(rt, &exp);
+			if (coef < 0) {
+				dev_err(&sdev->dev,
+				"%s: error calculating coef %d\n", __func__,
+									coef);
+				return -EIO;
+			}
+
+			if (coef)
 				wbuf[txn.msg->num_bytes] |= BIT(5);
 
 			txn.msg->num_bytes++;
-- 
2.34.1

