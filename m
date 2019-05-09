Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DB0194A9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCFE193E;
	Thu,  9 May 2019 23:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCFE193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437593;
	bh=hoCeB0/pHSze1slMEaGwjAOg1F8w7Itn+5dL9jI7aT4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JdgQAcMgKUC6+4jMW3vTTF910XCmbaOiljgEJ8mG2a+7Q9108UPLKv5FO+lDqA59P
	 rA+G3zHVjtAbtsbYN6Rga1l1xJ7axtIm5jhCacfrACD36BMfJSIOO7mniDMJnRlVSq
	 IuAihZzJigLuURfKNDNI3m0Q7U7kq4A5u81VqBaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A137BF897C5;
	Thu,  9 May 2019 23:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7807F89678; Thu,  9 May 2019 23:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1FF8F8977E
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1FF8F8977E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RPxSnOua"
Received: by mail-pg1-x542.google.com with SMTP id z3so1829651pgp.8
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+h3ZCcM9MpDCep6vj98M9256/ZFO8iCeubysmTQphKw=;
 b=RPxSnOuaT+7NiAnWU9r2lkLt4O5o81vjUi5euxKDdMKugrsCE2PO3HyjiNWHXWobro
 JAuJTgafQ9RNgrozFxjdwHc1kWQfBcrGPHdytv4WtNPkGLt9GgUZ4PBrBEpEjCclkJcZ
 x5XJBT3pGWQw/ZdcC5V3Ca6RxmcMTyw5XlzZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+h3ZCcM9MpDCep6vj98M9256/ZFO8iCeubysmTQphKw=;
 b=S7DWDSjF5fpOhohjqDVEhIuFQBcGA4HXDHGU8HFW+uGg8iaGGbzz/b23EtwD2rAzvd
 CB2rt1Rf4UJlKqe6Tfyfh3Lvxfr+r2RPyygBwhsH+FQO0beuencFq+PZcKg+XqmkkecS
 ooYadVP0lvbi6N295z1tqgfcorbwBNGcT7S5gSARW9oKyZfMC4277FdOBPxoehtxd+fM
 UxMQgVsbfB3+C70RNBpLHQW11H1hLZfSONS9SrnMflMFD1MWfnwbCHPux7S3u0UMSd/6
 iloO6LuKJY7W/hJ9W2n7aH/o/p0mX4WVhwctpD9KP955MXQiSUrKYbrdl9/vMacwTPcs
 lWSQ==
X-Gm-Message-State: APjAAAWsmAJZ7kHu+fD3X0I+Pgz/kMrwXRAGJN6y2rhJskH0AvvfG3rz
 Bk2VYRxkfEyntQRRCyaT11DcVA==
X-Google-Smtp-Source: APXvYqybvV1SDSpdMntWVGN1RGD3itiZ/UQtphKXBoQYbxE0T7Kq2owXdemONr3wy8wdfEMwbhF3ug==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr8645706pgl.66.1557436481339; 
 Thu, 09 May 2019 14:14:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id y10sm4787693pfm.27.2019.05.09.14.14.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:40 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:48 -0700
Message-Id: <20190509211353.213194-26-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 25/30] mfd: cros_ec: Add API for Touchpad
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add API to control touchpad presented by Embedded Controller.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 52fd9bfafc7f..1d0311df44d3 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -5043,6 +5043,32 @@ struct ec_response_pd_chip_info_v1 {
 	};
 } __ec_align2;
 
+/*****************************************************************************/
+/* Touchpad MCU commands: range 0x0500-0x05FF */
+
+/* Perform touchpad self test */
+#define EC_CMD_TP_SELF_TEST 0x0500
+
+/* Get number of frame types, and the size of each type */
+#define EC_CMD_TP_FRAME_INFO 0x0501
+
+struct ec_response_tp_frame_info {
+	uint32_t n_frames;
+	uint32_t frame_sizes[0];
+} __ec_align4;
+
+/* Create a snapshot of current frame readings */
+#define EC_CMD_TP_FRAME_SNAPSHOT 0x0502
+
+/* Read the frame */
+#define EC_CMD_TP_FRAME_GET 0x0503
+
+struct ec_params_tp_frame_get {
+	uint32_t frame_index;
+	uint32_t offset;
+	uint32_t size;
+} __ec_align4;
+
 /*****************************************************************************/
 /* EC-EC communication commands: range 0x0600-0x06FF */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
