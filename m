Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E034A21D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A137911C;
	Fri, 26 Mar 2021 07:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A137911C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616741094;
	bh=g4IZTUMhwSimVZ2maGJk3FKSvLNCupsvKyFnRTnDhPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eBGoLM22LPy5M/iL7K0foocYre7ohzppqvOYH9aSohEzkEnhgguDqq5qWs+gMD6UT
	 8SpsxiKOM+OPSZhKQrOthhf5AN3a7REwCh+RxI3CpYHjVXrKWvm+Veip5fvE/BuQJG
	 kn8vQ6hkLaH84eCOu+L8kFeASURpPwPDnu4O4XM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D988BF804AF;
	Fri, 26 Mar 2021 07:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8134AF804A9; Fri, 26 Mar 2021 07:41:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD2BF802DB
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD2BF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xvmNm1nf"
Received: by mail-ed1-x530.google.com with SMTP id o19so5078405edc.3
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9w26BSmosHoWqHb4DQ0FR/rFMhDz7pjkPie7BkwBXHY=;
 b=xvmNm1nflRIeRx4LkKSGcrElPaSbjF1kN6QdiXw9op+BvHN1V7Jsui3LT/t16Kksh/
 RUKvfI4eDhhoJ7iFtaSpqk5mNYgh/mQMq+14xsE7KfK7Q5E1StGvvuuTh63rEXc8O2up
 xr2yn98r4/w8XonH/U89vhJmJjUYwbBTtcVjWPO5CGb84EBxwRcwz6IM0ikFDD6eSa4A
 aHS69DHtyqniONA1PeBfIi+aWSvUGlgndvZdtXEW2C7fbQE9p1jXoCogP1n/nfiYQu15
 I6cN5/AFcIC4KJsLnQkdf6iGTeWj6aU//HBeFGmilGb0K8y8jLPEYwM780wVxR5wDltp
 Xh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9w26BSmosHoWqHb4DQ0FR/rFMhDz7pjkPie7BkwBXHY=;
 b=aau6mkVjW1w2mh/T45OQehaZcHl4KNiUteTdOinfThcDKE1Sb87dc54P4BTxs98zPO
 udDptRPEl3H6FFzMy19kxVtD9sFKlSu6Ub0ZkVee0do1WE3suS3XqLWV7/OFFrVOcfuz
 aZPgDoZhgzjbyZRsNG1znBzA9EnaG7jAiRoSPNyCxYkrj0Kdabw71V6x3IoI/jdz9XR0
 S//mNOa9+77CC89twFCMb55xyJZLJmdqWbnupIzciIg3as7nq0NDdOF6hleilWBXTsfU
 nEmNE0CKJyuSNmhtSaOJmnP/qGET9BCPGizCFot+rCabbp3LL8Yz9c3sNeFL1wssO2uG
 ZICw==
X-Gm-Message-State: AOAM530qydJr5k49VrCwR6U36oiHQYSDjBmqlIcAj8yHCioRsEHjK4aw
 OSMfC/8ERjBUoED7pvZFycQYcQ==
X-Google-Smtp-Source: ABdhPJyD6ZXOo0uH2byplvxKFOGNhtYjssgC3vW/C5IOn2jogunBIlScXNTSvyOG9QEfJsqJvAUPCA==
X-Received: by 2002:a05:6402:104c:: with SMTP id
 e12mr12739081edu.108.1616740880178; 
 Thu, 25 Mar 2021 23:41:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id ci22sm125325ejc.54.2021.03.25.23.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:41:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v5 4/9] soundwire: qcom: start the clock during initialization
Date: Fri, 26 Mar 2021 06:39:39 +0000
Message-Id: <20210326063944.31683-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
References: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
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

Start the clock during initialization, doing this explicitly
will add more clarity when we are adding clock stop feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 43ec22a5e332..2bcb4362f0e0 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -47,6 +47,8 @@
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_BUS_CTRL					0x1044
+#define SWRM_MCP_BUS_CLK_START					BIT(1)
 #define SWRM_MCP_CFG_ADDR					0x1048
 #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
 #define SWRM_DEF_CMD_NO_PINGS					0x1f
@@ -343,6 +345,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 	/* Configure number of retries of a read/write cmd */
 	if (ctrl->version > 0x01050001) {
 		/* Only for versions >= 1.5.1 */
-- 
2.21.0

