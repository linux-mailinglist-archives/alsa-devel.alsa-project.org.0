Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32ED6E5E12
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2707E93;
	Tue, 18 Apr 2023 11:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2707E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811858;
	bh=Hr0oqtquOz2ToHxv0Fl8xScVsWjSuSpNNl19kiHZSeA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kyimLHL14us5Yi0BqmbcxNOGxk9VIVSi5YmPZXmi12zHj55Oior8rcnkC+K+woZBl
	 q+/Po6QmCmSQw7ysOIBZ+seYmYBBpo4Gp9Q/uV9LTok2GqioJ57UHULY+Bo6j37KZ9
	 ROaLRB/ues77reNcwNOVd3AGFx2oyi9GCjOohKLI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5739F8055C;
	Tue, 18 Apr 2023 11:55:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19477F80552; Tue, 18 Apr 2023 11:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44F23F8052D
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F23F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B/zuyYIG
Received: by mail-ej1-x62f.google.com with SMTP id u3so19643137ejj.12
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811699; x=1684403699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm5Clkhi7OKyfk2gyaI7Jz7GWaSKwLEnRxea7jsImnE=;
        b=B/zuyYIGHjFHmCaELOHZqzcpXx1oeztJyGgpjhVFTT04tNSu+qVh7QsJ5voRLZCtJX
         KMyJbWjMMswC9N7QP9G/Wj9Ah7Yyzv4XpEmnUM8Fdd32ANk27C0pnTwcP3Q1O9x0QrzT
         AFfD5LIiFqk+CbE2Z17q3vwdPUJJ/FVzbPUPycvm3HPqMEUSVqkrBMmrmfbCv/fORT+V
         37FcsPsQ4+vHLvFQa/1PxzdmuaTib3C1vu3WhLI4pcoXYuW4U5JYQWKdbYnm4VCar8nv
         81RPjL377XhYn6mFlWUVyS7SyfHzro9GqbwzoSvmL5vLqE26OrxHcjkL+OTtpXxvm/7W
         hJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811699; x=1684403699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm5Clkhi7OKyfk2gyaI7Jz7GWaSKwLEnRxea7jsImnE=;
        b=OaWzafAF7fGWpV55a6F2IP68mD0C2TV5nrYw7uEdHRB6qFaKsKaOJ/DlpcJHocoML/
         0PIRj6ijHa3Sg6P4pxsa2d6edwlN82/No+pIwRJkKiyPIMfvIryTKjkSQBczuUBRTI1j
         xfEyQIs4mQ/saLr9LesMNuPWY4sKbYKFufYr9mXVSO3CQbiZph6lNesGy8ChOCHPSODG
         MtD0DPAQQ3sAZ4YUNiNJRxsM5NaSL6yvMUiw6wlM/v5lFbwM9yVs5WZ2oRySqmbJe1Sl
         NudWy8YV1LD2G1RXhbgl/EvMwrtRm17jC8fuISmMHa2CpdDEV6UXBqDsL73flyoPOLNZ
         wHhA==
X-Gm-Message-State: AAQBX9f1xjQugQtx9ZL7vbSn0H7pYK44OX0pEu2G9hMndHHU3j021g0E
	L5v7QF3itCZco+igD4prJ67qVw==
X-Google-Smtp-Source: 
 AKy350Y4civICNM8zr7hd+GNeg3iFkCFRk5nboyltEkmFIyKL8bL8WfrBh55oP9yhCB2QT/73VnYjg==
X-Received: by 2002:a17:907:16a8:b0:94f:2d38:896b with SMTP id
 hc40-20020a17090716a800b0094f2d38896bmr9767703ejc.53.1681811699278;
        Tue, 18 Apr 2023 02:54:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:58 -0700 (PDT)
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
Subject: [PATCH v3 7/7] soundwire: qcom: use tabs for indentation in defines
Date: Tue, 18 Apr 2023 11:54:47 +0200
Message-Id: <20230418095447.577001-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JDU2QEZZJQLBKBC465FULC5645CVP57G
X-Message-ID-Hash: JDU2QEZZJQLBKBC465FULC5645CVP57G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDU2QEZZJQLBKBC465FULC5645CVP57G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use consistently only tabs to indent the value in defines.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Add tags.
---
 drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 90afc8f15b82..aad5942e5980 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -58,9 +58,9 @@
 #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
 #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
 #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
-#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
-#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
-#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
+#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
+#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
+#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
 #define SWRM_INTERRUPT_MAX					17
 #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
@@ -125,20 +125,20 @@
 #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
 			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
 
-#define MAX_FREQ_NUM		1
-#define TIMEOUT_MS		100
-#define QCOM_SWRM_MAX_RD_LEN	0x1
-#define QCOM_SDW_MAX_PORTS	14
-#define DEFAULT_CLK_FREQ	9600000
-#define SWRM_MAX_DAIS		0xF
-#define SWR_INVALID_PARAM 0xFF
-#define SWR_HSTOP_MAX_VAL 0xF
-#define SWR_HSTART_MIN_VAL 0x0
-#define SWR_BROADCAST_CMD_ID    0x0F
-#define SWR_MAX_CMD_ID	14
-#define MAX_FIFO_RD_RETRY 3
-#define SWR_OVERFLOW_RETRY_COUNT 30
-#define SWRM_LINK_STATUS_RETRY_CNT 100
+#define MAX_FREQ_NUM						1
+#define TIMEOUT_MS						100
+#define QCOM_SWRM_MAX_RD_LEN					0x1
+#define QCOM_SDW_MAX_PORTS					14
+#define DEFAULT_CLK_FREQ					9600000
+#define SWRM_MAX_DAIS						0xF
+#define SWR_INVALID_PARAM					0xFF
+#define SWR_HSTOP_MAX_VAL					0xF
+#define SWR_HSTART_MIN_VAL					0x0
+#define SWR_BROADCAST_CMD_ID					0x0F
+#define SWR_MAX_CMD_ID						14
+#define MAX_FIFO_RD_RETRY					3
+#define SWR_OVERFLOW_RETRY_COUNT				30
+#define SWRM_LINK_STATUS_RETRY_CNT				100
 
 enum {
 	MASTER_ID_WSA = 1,
-- 
2.34.1

