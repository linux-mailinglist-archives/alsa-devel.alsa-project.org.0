Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76F33897
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:52:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1221F1682;
	Mon,  3 Jun 2019 20:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1221F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587976;
	bh=4/2+fa1PYSRKTf4NelaoUS5JclDYHZInN12Li8dUC10=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IbRUIOrwqSa0q0RO8FaA7aRtOPWomJKO0whBvqHx2XMf5iRe6R3hga5T5oyT6tWpR
	 w0IqHNUvM2BEfHvkh3CHrLpiySBuN3M+7OX0OJ9y+MifU17yK12aUAlCRdVKtap+tb
	 jr0r01dWnnZ0AnzUG4eD8Ib1JIntJNuXxsP7r3DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0367BF80CC4;
	Mon,  3 Jun 2019 20:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68B1FF89793; Mon,  3 Jun 2019 20:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78151F89784
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78151F89784
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PxfEqanv"
Received: by mail-pg1-x543.google.com with SMTP id 20so8777095pgr.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11H9eJ6PsDChSyARkFGWtgFkqyq4bAPSq9amltsDDFQ=;
 b=PxfEqanv/PRY0M/VY4e1O9gn4s07yciX2RzwRkNeh2FKLAo974fldUJFmzbdHU2msY
 K3lfwXtSqyTQ4zAiun8HPxjjxJrltz8yAHX07HNCkwUY0jfcMtNFSEFkGliOFj5oLdeF
 P9dZuni3OAWZrcPdCd1G1IhAEd9Zk+/7Sbpw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11H9eJ6PsDChSyARkFGWtgFkqyq4bAPSq9amltsDDFQ=;
 b=ZYJ8ZaDuTZKDlauyajMjN+0uMd8xQRXzH8IwR1IYbTfVGj9+EUbE3AIFLDNkM9OE2s
 IgClfHVPtL8OnTWy3xPZkf3BFlNTETlyAIMYhnb7ZzwhExuIcieO81M7J1hgqL7Sk6D6
 7my9Rhmmxlbou4jJbbMnXCsoSqmRzzwynuIVEwX5EDEs4Hkd9sm6hPR3pPGUwULgUOiC
 YJiZcVN71NGsypv864mhLRaQcV5sO1fcIDjsMW9hFqKuWC8aS2m7D8R7W1iOLAsqYqNm
 pfqx5ryo5YdoHq1aArmC/Z+Cccpr9ZO//ecood3xoTkN8bI5NB8yBd1ozQuiFv995bOQ
 3Hfw==
X-Gm-Message-State: APjAAAUZ19nGa0tFmheWHaFou0N+LSLtZB+G4zjeInnL7L0CgyPsDEeF
 YNNYAGyg1dr9Vb/kBPiz3Ya3IEGrQozcqQ==
X-Google-Smtp-Source: APXvYqwuAAvudQpkCNvX1FttFw+zwQdqr4m3Inozl8aJNBtybkzM7fS5SzEiIecujKL7X9T3XIFYuQ==
X-Received: by 2002:a62:a508:: with SMTP id v8mr32386909pfm.87.1559586886463; 
 Mon, 03 Jun 2019 11:34:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id 12sm5195115pfi.60.2019.06.03.11.34.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:45 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:56 -0700
Message-Id: <20190603183401.151408-26-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 25/30] mfd: cros_ec: Add API for
	Touchpad support
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
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
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
