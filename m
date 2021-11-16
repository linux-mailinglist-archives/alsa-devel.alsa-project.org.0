Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D6452F83
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 11:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71CB31697;
	Tue, 16 Nov 2021 11:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71CB31697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637059909;
	bh=SDQpc7H+okpbHxwn7UrqcwSlYBzTEN+7R791MSe7buM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c+F0lRHUsw1QpNz+o/B8IIZujpFAonp81UONxyOXzbzDprIycZsZoc8EiE28ESedQ
	 zEvj/7CP8I71sCjS64mlGCzarUYSuXOz/T4Z3jwMNZ5Zo0zkFSC2n0HH1WT/8UB88i
	 75f/UfpdLs4f80KItAgfpnbewLdBJma6p5wslIQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD0DFF8026D;
	Tue, 16 Nov 2021 11:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE0D9F80272; Tue, 16 Nov 2021 11:50:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7915AF80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 11:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7915AF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dacm7Whq"
Received: by mail-wr1-x42f.google.com with SMTP id d5so36684515wrc.1
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YLjmal7Qhx8zErQnGRhLc7RANFy4u7WCe+8FEMhJTbs=;
 b=dacm7WhqtNBedETvp0LAUUsEyRWrxMZM+SRcyVDnJVZl1AMKFUTH72uWlBByUYPng5
 n1q0cxOE1CDXrGZJQNhGM5wpneARTd3DysnVTsBRzNQ0vG00om+VrE0L6YWsIahvpU3V
 zvD/hw11mbRV0BKntrJ2wuMkiayPuwSSr9QvPma80SYsQ+vUMgYmhVFND6VfUqlh1wHU
 lR31ZqQ9NwDT8mtDsHu/8fva5ydx42rC5+detqmPVB8uPH8Q9lgN3tnVaJMyJh2tg1qY
 JXcdMlYYIA9KaWcyiRbdmXuGOdZ7IbSoCbpFyR89XVFhlZ45vwL1fjaYvBBEtLJ1dgZH
 uLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YLjmal7Qhx8zErQnGRhLc7RANFy4u7WCe+8FEMhJTbs=;
 b=dftCKBWoGrZ9sQuVR1EDrizE6hPp9nkA3QZwu6+5DATdBxvTLwlJK/ZMiEN1eBgqc/
 dzb2RNr5fznVXN2evJvijEU3usk4/FG2FzXsMZZbQQaxiGNa/p2WbvOiiZfI2OvrPSNi
 HFRxnWo23/DP9Ue0iZUyQgyTh9isJuAPgskmRYYRElLuCUfJpIBZXkt6RprFtL4K6ESJ
 ejxqDOycPnGO0QAKrSx0tHyGvR3NxpIL2J8hb8EpdxGDExv656VjybWpC9Wcpt/da8p3
 pTBvozfdUfsx5jLnGdUbmOUa0jTqXnHvMJM9kWnDs/KJiRkqpNJ+9VD85wXpL3IRPLKK
 GInA==
X-Gm-Message-State: AOAM532vw2pHPKT/tPexDITCdSnu1vKtuutEU1c9t93En0mMg6lH4Ena
 msRSRa3tL5b/ZB0uCqVb+m0SGw==
X-Google-Smtp-Source: ABdhPJy+0eTYhJpxKeuQFu6opCFTs1aBuZF6B/EVcetH7tvQySS8Mg/YUeKxHvLw9FUpnF/1RLNzag==
X-Received: by 2002:adf:f947:: with SMTP id q7mr7970820wrr.260.1637059820814; 
 Tue, 16 Nov 2021 02:50:20 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id c6sm2579684wmq.46.2021.11.16.02.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:50:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: remove redundant version number read
Date: Tue, 16 Nov 2021 10:50:17 +0000
Message-Id: <20211116105017.12010-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 yung-chuan.liao@linux.intel.com
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

Controller version is already available in struct qcom_swrm_ctrl, Just make use
of it instead of reading this again.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a317bea2d42d..46995bb382eb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1156,11 +1156,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
 					bp_mode, nports);
 	if (ret) {
-		u32 version;
-
-		ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &version);
-
-		if (version <= 0x01030000)
+		if (ctrl->version <= 0x01030000)
 			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
 		else
 			return ret;
-- 
2.21.0

