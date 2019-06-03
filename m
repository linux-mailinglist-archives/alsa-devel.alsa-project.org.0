Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765D33889
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F3416AB;
	Mon,  3 Jun 2019 20:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F3416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587776;
	bh=/fC9Aczkuy2Zi9DTxulNnlZso8Kqyd6xsIPFEOckl3A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwOWL/OJPHxkgITuqly/fJJsHlHnxamhNnJyvTbt+ZtjhMQF+xIRKJKM8v/bBjzOV
	 QX6etLT4Hv6mP+3pkohdfL4CBI+Q09mgbM3oyqdwqVK3awXhox44uCoZMHhgxOdK+V
	 +sErZOU3Lke4jTRdojEz+rjQ1SP8o7MC7iuupq3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F5EF897AA;
	Mon,  3 Jun 2019 20:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C76DEF89767; Mon,  3 Jun 2019 20:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DF0F8975D
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DF0F8975D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Exrmzr0P"
Received: by mail-pf1-x444.google.com with SMTP id j2so11100080pfe.6
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nb+PgCRBJxop3uf8r602eq6y1vRy3WUbzAXUz/wfEs8=;
 b=Exrmzr0Pv/rn0cesaXFdN43DSBj2vNYxvfrY407IBv+l8PAtUViJ4o5BsGkSd8hC1e
 dAXXdBgfcyfXEF2tE1H04cZ3qv0MBzYhXVTP3RDpCW8LxKcV9D3VTTiTQPpKPO/guJpF
 ATlu/13n9et54oqDsAQD54G0uDMLDZCKGG29Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nb+PgCRBJxop3uf8r602eq6y1vRy3WUbzAXUz/wfEs8=;
 b=SVdYZczJFz4R0k71XCE7hHiFxJ1jQwU3B630Avokua9R5WTP3EvKdERieCqS356Wrj
 6EUWzihbSkTAHpGzfP5/UA3nLIlrcMK8L6arzBwgTrm9XsDfUsDz3xh/MyiGxPJ4vu0C
 GpD810lnX+GeHuqscXoC7GkvvwpXWKWmHAK1JuQoopnm1vj8k34nOSSgPnaSOxKsWoIJ
 z0G400pvyLl9emKbqfiEx38B9yJbOEikXiGY7c80y53jGB+oty4wLRJvhMu8fjqb2x8u
 g60jno5JGYtL51RepHu6B1lpCaMHnIUZc2hfq5yv3q+jkQN9vFiMqu3eDXV2a+BB/qdy
 cTzQ==
X-Gm-Message-State: APjAAAWZuK9rAOw+zVS3p6lNmBZu0lrQxfYg5BvCDm/2lQ5GAjSiQxRm
 7jAdk2UOdbmWrXAhgQvbVBruSg==
X-Google-Smtp-Source: APXvYqzg2GsQdPQCqzTAsGUqBYg9mmxxW5ZwdJcwGOJjC1wRZk/Qg4qCH7oPmmhSJS7pMvVSqynP6A==
X-Received: by 2002:a17:90a:af8a:: with SMTP id
 w10mr32552517pjq.132.1559586878476; 
 Mon, 03 Jun 2019 11:34:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id j22sm21415275pfn.121.2019.06.03.11.34.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:37 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:51 -0700
Message-Id: <20190603183401.151408-21-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 20/30] mfd: cros_ec: Add API for
	keyboard testing
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
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
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
