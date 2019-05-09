Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEDE1949E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E39D1904;
	Thu,  9 May 2019 23:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E39D1904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437386;
	bh=0jjn6wREjJt/hdj4eAC/rkQg/FwXD+I8/oOKr+/xnA4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpzdDBlF4ol5EuSmGUAsaqIni4j+z/Sq3m2qznPjD2uzCD/kaPvKQ8ySNaJ6eDbXb
	 pRnnY2VNT/P/HkCOVW5ZduCyL1ZcP66lYewQ+1QgVaTA5C4AM2dKZTRgc7FnHP7nVY
	 eM3fBhjVJxbt+dtYxP00slEP3Hyui864Q/MTHbGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A63F1F897A7;
	Thu,  9 May 2019 23:14:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B32AF89775; Thu,  9 May 2019 23:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A7A9F89768
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7A9F89768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JpW4Ryw8"
Received: by mail-pg1-x542.google.com with SMTP id 145so1827734pgg.9
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWvAY4K5cYu5xkAR+mJg2cVJek8r16jFV7NVls6qS9c=;
 b=JpW4Ryw8tqmPFPFAchXp1X9VT4fU2cbiQ0yBmM7ndRPotHYeBOZKfsSPNorkN5JNj/
 0KOUSxFVFO9NUTZwpAc+eWHb8oeSW2rxjUaX84f4sJrZLr4cf3xKCyVnTY72YV6/ZKoZ
 aJSIj+srJzho+5meGrzG3KMT73SBpeJy3StIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWvAY4K5cYu5xkAR+mJg2cVJek8r16jFV7NVls6qS9c=;
 b=iMI1hIsu+cyC0l+SaRQxjHLD7wDyNuuXMdmZxzetrKOSfdQ03kCEEjdxGf+gSinr3j
 PxZPYbx8O++Bk2bd8R3/FEKtHhhpnjzjem5Mmcdo0OVG+MUYB4bkHXKJhzRmBZJdZ1sf
 a2bQqdBpTuhuajIn7XFgWo8TwJC9gBdCsiCN0B/+1bNIFRY2Zs2KsS3MwQJKKe9vLD0C
 nhZPCx4umoQ5HzRpi2/41h75fkVQkwJrNpAxuAkttX6dC14+7294GT9ooclENoo//AWE
 OIWK0tVUs28cZKMXG8yCu7PHGK1vH9R8p59u1Xbz1maOSm1l2RyiSX2Awd2k1GhbFBiU
 rfxA==
X-Gm-Message-State: APjAAAUehUFX+OvfB2z03bdYxZYM8yBNOlivQrtIc6zBoTrqoqkEpxgo
 4clYfdqFs+mU7t2yTQe8XMJVXg==
X-Google-Smtp-Source: APXvYqx1Iq1e/sNoyrlAeNXcTzecx8lWKa66VICbey3qV9o32uy+N6ac81klOjDvLhAs0TAsGCsmhA==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr8570279pff.94.1557436473285; 
 Thu, 09 May 2019 14:14:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id n15sm6777740pfb.111.2019.05.09.14.14.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:32 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:43 -0700
Message-Id: <20190509211353.213194-21-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 20/30] mfd: cros_ec: Add API for keyboard
	testing
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

Add command to allow keyboard testing in factory.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index e05cdcb12481..cc054a0a4c4c 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -3142,6 +3142,17 @@ struct ec_params_mkbp_simulate_key {
 	uint8_t pressed;
 } __ec_align1;
 
+#define EC_CMD_GET_KEYBOARD_ID 0x0063
+
+struct ec_response_keyboard_id {
+	uint32_t keyboard_id;
+} __ec_align4;
+
+enum keyboard_id {
+	KEYBOARD_ID_UNSUPPORTED = 0,
+	KEYBOARD_ID_UNREADABLE = 0xffffffff,
+};
+
 /* Configure keyboard scanning */
 #define EC_CMD_MKBP_SET_CONFIG 0x0064
 #define EC_CMD_MKBP_GET_CONFIG 0x0065
@@ -3390,6 +3401,13 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_TABLET_MODE	1
 #define EC_MKBP_BASE_ATTACHED	2
 
+/* Run keyboard factory test scanning */
+#define EC_CMD_KEYBOARD_FACTORY_TEST 0x0068
+
+struct ec_response_keyboard_factory_test {
+	uint16_t shorted;	/* Keyboard pins are shorted */
+} __ec_align2;
+
 /* Fingerprint events in 'fp_events' for EC_MKBP_EVENT_FINGERPRINT */
 #define EC_MKBP_FP_RAW_EVENT(fp_events) ((fp_events) & 0x00FFFFFF)
 #define EC_MKBP_FP_ERRCODE(fp_events)   ((fp_events) & 0x0000000F)
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
