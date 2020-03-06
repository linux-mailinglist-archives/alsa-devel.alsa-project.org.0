Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8717C1BF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A21115F9;
	Fri,  6 Mar 2020 16:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A21115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583508507;
	bh=e0zjWYDI5F+YuW2E6vQo2BEzhgZkuZ/FSJZfpPQx6HY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A6xEf/cvr+78srw/amnzrVDOtl6LHF02yEnQNzy7zI/ohnvtMDEysnIWGxeRoaUu7
	 3t+70gvZTR59G41kVBICu5aCuRvTEX9Q9+0t924dWidLt+2XZD2vzXIgID8GNNskRS
	 IkLEA8WiWBc52Ge0SHhgP+bPj24AtdTIYM8b/Lu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B5FBF80125;
	Fri,  6 Mar 2020 16:26:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B926EF801ED; Fri,  6 Mar 2020 16:26:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26AEFF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AEFF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EtBwOWCB"
Received: by mail-wr1-x444.google.com with SMTP id z15so2859271wrl.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 07:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONRnUi9jCMqmOjWyWhiAOr6JoGLpum+q//SeY+50q00=;
 b=EtBwOWCB8Ya/o0z2Yco05wvblUtQI2zyqVRqZpCasqMRRE4gDV0h7u2++BIVbdj+Mn
 DKBCtp5W397rvpQ8Qdy3ZioawfGcJRWi3SdTdgY2QXHLdR0YnPv1imeM/i+MO6jYw/n3
 dlrIbUH43oAWu0uNMi4LgUn7ncSRN9eCtnWeMivh+k63vtvd+XveKjqU+46wxfATiQGq
 CDb/fdJSdcLW7DGOTToq4sILmAbrOA76IzusUbKITanbGVXJOr7dWUQMupaAU/6gcwHV
 uqF8/hC9iNSZ+WYW3i1fx4UFgu6XzEUtVcUKYLx2JYumzdteBFq8tPUPlt3PpFPFn8+E
 fZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ONRnUi9jCMqmOjWyWhiAOr6JoGLpum+q//SeY+50q00=;
 b=p0l8mmARnj2+ocJES4XgvgDr+tuIOYHbG9bxUPqWpC9aEB9G/IRC6tGz+Y/ahNtcHu
 KMIjQg296tScoW4KBhXc+AoUt/k5f4yYiuQxQaexq2WhK8/2dFjG+ftDf3JWL7KCnXVV
 XWWtJEZ6pEdazHZ/JikgeOGNSP3RZUhKGVnINt7h40iASnsZ3GUAlROxcEJr8DKpiJl5
 u00fNraOkpDdZHvKj33zr9j7uXwHlrSrtRTKASEd+nIQxwCTYWhXVE54IuP+ZlDjY7yp
 wv9WL8WCAurCgRR4geQKQHaqfCTOaWSyl7j9QT3821lOg4qD0atzcl3WH/Gu3mSZlQ3e
 AmWw==
X-Gm-Message-State: ANhLgQ2oidn4PPcFQR2WjDLcGYw9FUcVfGt1mk0tr3b6Rwjz3Ao8bEM4
 FH12/U/2pCKEuIch+2+0nfNHyA==
X-Google-Smtp-Source: ADFU+vvm+PP7qjGjgcl5L4VdutX0/oiHXqeGOVQ/NtI7UQPw+oZlGMEa5zIUH/oKXKZzohqiAUPqSg==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr4488258wrr.244.1583508398849; 
 Fri, 06 Mar 2020 07:26:38 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i14sm1902968wmb.25.2020.03.06.07.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 07:26:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: wcd9335: fix address map representation
Date: Fri,  6 Mar 2020 15:26:33 +0000
Message-Id: <20200306152633.25836-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

slimbus addresses are 16 bit wide, masking page numbers
to wcd register at offset of 12 will limit the number for pages.
So it becomes impossible to write to page 0x10 registers.
Remove masking 0x800 (slimbus address range) from register address
and making use of window parameters in regmap config should fix it
and also will represent the registers exactly inline with Datasheet.

Remove this unnessary masking and make the registers be inline
with datasheet.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 18 +++++++++---------
 sound/soc/codecs/wcd9335.h |  7 ++++---
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index f11ffa28683b..700cc1212770 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4926,11 +4926,11 @@ static const struct regmap_range_cfg wcd9335_ranges[] = {
 		.name = "WCD9335",
 		.range_min =  0x0,
 		.range_max =  WCD9335_MAX_REGISTER,
-		.selector_reg = WCD9335_REG(0x0, 0),
+		.selector_reg = WCD9335_SEL_REGISTER,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
-		.window_start = 0x0,
-		.window_len = 0x1000,
+		.window_start = 0x800,
+		.window_len = 0x100,
 	},
 };
 
@@ -4968,12 +4968,12 @@ static const struct regmap_range_cfg wcd9335_ifc_ranges[] = {
 	{
 		.name = "WCD9335-IFC-DEV",
 		.range_min =  0x0,
-		.range_max = WCD9335_REG(0, 0x7ff),
-		.selector_reg = WCD9335_REG(0, 0x0),
-		.selector_mask = 0xff,
+		.range_max = WCD9335_MAX_REGISTER,
+		.selector_reg = WCD9335_SEL_REGISTER,
+		.selector_mask = 0xfff,
 		.selector_shift = 0,
-		.window_start = 0x0,
-		.window_len = 0x1000,
+		.window_start = 0x800,
+		.window_len = 0x400,
 	},
 };
 
@@ -4981,7 +4981,7 @@ static struct regmap_config wcd9335_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.can_multi_write = true,
-	.max_register = WCD9335_REG(0, 0x7FF),
+	.max_register = WCD9335_MAX_REGISTER,
 	.ranges = wcd9335_ifc_ranges,
 	.num_ranges = ARRAY_SIZE(wcd9335_ifc_ranges),
 };
diff --git a/sound/soc/codecs/wcd9335.h b/sound/soc/codecs/wcd9335.h
index 4d9be2496c30..72060824c743 100644
--- a/sound/soc/codecs/wcd9335.h
+++ b/sound/soc/codecs/wcd9335.h
@@ -8,9 +8,9 @@
  * in slimbus mode the reg base starts from 0x800
  * in i2s/i2c mode the reg base is 0x0
  */
-#define WCD9335_REG(pg, r)	((pg << 12) | (r) | 0x800)
+#define WCD9335_REG(pg, r)	((pg << 8) | (r))
 #define WCD9335_REG_OFFSET(r)	(r & 0xFF)
-#define WCD9335_PAGE_OFFSET(r)	((r >> 12) & 0xFF)
+#define WCD9335_PAGE_OFFSET(r)	((r >> 8) & 0xFF)
 
 /* Page-0 Registers */
 #define WCD9335_PAGE0_PAGE_REGISTER		WCD9335_REG(0x00, 0x000)
@@ -600,7 +600,8 @@
 #define WCD9335_CDC_CLK_RST_CTRL_FS_CNT_ENABLE	BIT(0)
 #define WCD9335_CDC_CLK_RST_CTRL_FS_CNT_DISABLE	0
 #define WCD9335_CDC_TOP_TOP_CFG1	WCD9335_REG(0x0d, 0x082)
-#define WCD9335_MAX_REGISTER	WCD9335_REG(0x80, 0x0FF)
+#define WCD9335_MAX_REGISTER	0xffff
+#define WCD9335_SEL_REGISTER	0x800
 
 /* SLIMBUS Slave Registers */
 #define WCD9335_SLIM_PGD_PORT_INT_EN0	WCD9335_REG(0, 0x30)
-- 
2.21.0

