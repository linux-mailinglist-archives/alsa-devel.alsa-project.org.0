Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A001355E
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0B31869;
	Sat,  4 May 2019 00:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0B31869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921782;
	bh=ULVQ6puqDjXIuiNa492r6DqpYk81bLZX3QAhtGJ4vcE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SsOqjkXc98aZW3dftZst1O+XvhexOXWoZUgaZigM6KyWL+WpTbLtAf/dKYA1czH9/
	 mAaKqGbkGrufI6gRCVmY7ufmihinEo5y/OprRPo1m6h+Xrmf0Fu9ZaEhoYlXoieNsS
	 7B9NbSJILn5Kep3QD2v/d+qQa5oAFMbDaboxTax0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC787F89786;
	Sat,  4 May 2019 00:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30154F89757; Sat,  4 May 2019 00:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA52BF8973F
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA52BF8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eJsxHrmw"
Received: by mail-pf1-x443.google.com with SMTP id u17so3534740pfn.7
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YdMBv2JbD+JMuVmqPdEWtBwMJQhsKyQHNFOHdvl1N0=;
 b=eJsxHrmwC2QbMKNCw6wdkeVDYXxoP1tLcZbMrimsNjsvUS6jk1V/T8nMJdqGAdD6Cb
 B9hGeT6WwVpKQxoKwO6oH1OJqRMIHPXQLbagoQP50PIyZfD+nWTiXKwprjiWq/lFhfo7
 Tn6cpGYiGzKxJrl9gc1Lmyxsq6ZtoT/uyFL9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YdMBv2JbD+JMuVmqPdEWtBwMJQhsKyQHNFOHdvl1N0=;
 b=YPdtXJJcv1LQG8Pm4MGbvciyh/XVT+iun0iFHTEVRpnb6YMXqyGmL/vXNyzYoI+lzp
 Jzyza1BlVjoM3TW8aQOR3g7fu03h5lwXtCHSdEZUljTzfDI7T1xsocwoE7YjlshVoXiz
 MQ9ljpLKqESWE9rfU7LRsUW3/1nZJo32VtW7VA1BR4wk0N3dydEI9jpxqknfpjDfhloX
 ICSYtKOhwy/ux2W1SGWUpdo+DRFMG/lX/VmxgrXl1oDZaQcb1f48HOvr4HCjsubVHvoV
 negNMGaMXnzINwgZYJqBEpdSyxZBi/wZgv5THHzol/H6zGzDaDD4GfMXCa3ZAPErBxj7
 4ciQ==
X-Gm-Message-State: APjAAAUo3bir3v5TZaBTJ9yS6QAZbUF5sZASDAMIx7vuZ5nWJ5Vu7I/R
 SMBM1tB7/btM2qkuKAI4Fd0iiA==
X-Google-Smtp-Source: APXvYqw5tCuqq+vYOC4kMN4VAag5nQaDGAjptCMcGAquI0SAsN4sRjIbD7bxOhn6RGSAe6MjN2PnOA==
X-Received: by 2002:a63:3dca:: with SMTP id
 k193mr13875616pga.146.1556920991276; 
 Fri, 03 May 2019 15:03:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id g72sm8053070pfg.63.2019.05.03.15.03.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:10 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:20 -0700
Message-Id: <20190503220233.64546-18-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 17/30] mfd: cros_ec: Add fingerprint API
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

Add support for fingerprint sensors managed by embedded controller.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 2d59b4480876..399fedebc388 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -3339,6 +3339,40 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_TABLET_MODE	1
 #define EC_MKBP_BASE_ATTACHED	2
 
+/* Fingerprint events in 'fp_events' for EC_MKBP_EVENT_FINGERPRINT */
+#define EC_MKBP_FP_RAW_EVENT(fp_events) ((fp_events) & 0x00FFFFFF)
+#define EC_MKBP_FP_ERRCODE(fp_events)   ((fp_events) & 0x0000000F)
+#define EC_MKBP_FP_ENROLL_PROGRESS_OFFSET 4
+#define EC_MKBP_FP_ENROLL_PROGRESS(fpe) (((fpe) & 0x00000FF0) \
+					 >> EC_MKBP_FP_ENROLL_PROGRESS_OFFSET)
+#define EC_MKBP_FP_MATCH_IDX_OFFSET 12
+#define EC_MKBP_FP_MATCH_IDX_MASK 0x0000F000
+#define EC_MKBP_FP_MATCH_IDX(fpe) (((fpe) & EC_MKBP_FP_MATCH_IDX_MASK) \
+					 >> EC_MKBP_FP_MATCH_IDX_OFFSET)
+#define EC_MKBP_FP_ENROLL               BIT(27)
+#define EC_MKBP_FP_MATCH                BIT(28)
+#define EC_MKBP_FP_FINGER_DOWN          BIT(29)
+#define EC_MKBP_FP_FINGER_UP            BIT(30)
+#define EC_MKBP_FP_IMAGE_READY          BIT(31)
+/* code given by EC_MKBP_FP_ERRCODE() when EC_MKBP_FP_ENROLL is set */
+#define EC_MKBP_FP_ERR_ENROLL_OK               0
+#define EC_MKBP_FP_ERR_ENROLL_LOW_QUALITY      1
+#define EC_MKBP_FP_ERR_ENROLL_IMMOBILE         2
+#define EC_MKBP_FP_ERR_ENROLL_LOW_COVERAGE     3
+#define EC_MKBP_FP_ERR_ENROLL_INTERNAL         5
+/* Can be used to detect if image was usable for enrollment or not. */
+#define EC_MKBP_FP_ERR_ENROLL_PROBLEM_MASK     1
+/* code given by EC_MKBP_FP_ERRCODE() when EC_MKBP_FP_MATCH is set */
+#define EC_MKBP_FP_ERR_MATCH_NO                0
+#define EC_MKBP_FP_ERR_MATCH_NO_INTERNAL       6
+#define EC_MKBP_FP_ERR_MATCH_NO_TEMPLATES      7
+#define EC_MKBP_FP_ERR_MATCH_NO_LOW_QUALITY    2
+#define EC_MKBP_FP_ERR_MATCH_NO_LOW_COVERAGE   4
+#define EC_MKBP_FP_ERR_MATCH_YES               1
+#define EC_MKBP_FP_ERR_MATCH_YES_UPDATED       3
+#define EC_MKBP_FP_ERR_MATCH_YES_UPDATE_FAILED 5
+
+
 /*****************************************************************************/
 /* Temperature sensor commands */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
