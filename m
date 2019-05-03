Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88513571
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD36188B;
	Sat,  4 May 2019 00:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD36188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556922106;
	bh=V53pqVAmZhMAoD2n1wquiKY7EbBnLhrPBekztoiSR7M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYczUmLiV3Xt4T1HmsCmhEx2oWnfb1s0EoHR/BxrXHJHrQiyd/3FHaESqdmRFS6ED
	 tXFZfZi/QHgge1ga0mjcpIGBC5cAsfWC3Scb6sA/r+/DZXl64j8kmkzoKFdxDniDwy
	 lN0LuLmrvxt20bX8lp8h5UuSACyYNTgh/8u5tkNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE867F897BA;
	Sat,  4 May 2019 00:04:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC023F89764; Sat,  4 May 2019 00:03:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EECBF8973B
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EECBF8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YoYGS1F1"
Received: by mail-pg1-x543.google.com with SMTP id t22so3332875pgi.10
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=av7W5ynTFf4qECgZY1aSKemrc6LUQhXC9NlzuZ12Hu4=;
 b=YoYGS1F1oQXjukBhnrK7t6lGE2Tg29COzefrmIkQ6mGImiL3BLJ92f4PEqNxBPM3fR
 Z5vPlUfkJg6BIHFdZwtNYXSnxzHjylfOhpq7wUl1budX4PbRRu1id/ExV8hy/jvjM9G8
 +ofIx9lhjnZP7HcFpfp6q/RUiDRDLCB16uM1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=av7W5ynTFf4qECgZY1aSKemrc6LUQhXC9NlzuZ12Hu4=;
 b=jAgLdDVcvXaDLEnZceAQ9/RyLv5icFz5ddzWBLAiry8g7SpwbkIuM/chIIr1el6V05
 F0o4MHSv70bqrMlRmmFLbmYUBapvlUsFlhia+whlYhmcMICfn8dHeHH0Gz0w2cU7rwga
 42iz2qm7ZQ0OXrpwq+NJPu+SRCFQ5ijxNWkNQlmbAKn1ZfOB5a1YRuADpLRAVZH7nuzj
 E03GPydF2bUNiRaNc2wl9dGiCNdHt6VBpjFAK3idRWZRO5BCffyj0i6nb6yOHl8fJXGy
 kI57rBjcBxtwwdcQ8BSB/M0ohFmwMOqiZXlSl4P9eJc+qXByhLkZPpNS8it2O//LCaex
 TTxw==
X-Gm-Message-State: APjAAAWko7QbMp7ZrbY5rphPuSrOBu4enudMObSaYhtgouHuwjLQIA8V
 YP2zriuLNHMvtuNkjAgyfwfDbA==
X-Google-Smtp-Source: APXvYqwHuNR0rW4qS/p65gY4BZJtqs4GTLUnV/TC2lkxU7YO7LxbSGm8WH2nSWsutq1pXSfgqda8lA==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr14486184pfa.200.1556921004119; 
 Fri, 03 May 2019 15:03:24 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id a6sm4097402pfn.181.2019.05.03.15.03.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:23 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:28 -0700
Message-Id: <20190503220233.64546-26-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 25/30] mfd: cros_ec: Add API for Touchpad
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
