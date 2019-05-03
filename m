Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2113553
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF2D183C;
	Sat,  4 May 2019 00:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF2D183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921653;
	bh=VmkI6SFxwTocHAmXCQ31qU4NslQXoxmwDkISWSR2plg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L28s2Tz/N0FPqqIuK60+nWb9iKBeH2m6myWnxwci3iIBX0UxCBDdmzlgvmiKjMPa5
	 7Dkc4r0gzsVUOaC029h+J1LeTd6WZ7tksFzTQdkv1zc5IlbYttWj7im0VMhGcSo79I
	 8QmjG/uP+vojStSsv4dfqzoTv3tnfiCErnK5w2IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D97F89777;
	Sat,  4 May 2019 00:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2DF7F89750; Sat,  4 May 2019 00:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCCB1F89738
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCCB1F89738
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Sb3qIa/c"
Received: by mail-pl1-x642.google.com with SMTP id z8so3325396pln.4
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvWQKN4ldbQtxhC2Mo0V29fBja+ZKnVpKgJauRZWMXc=;
 b=Sb3qIa/c+z5t+KRSwycp0sHfuZBmeJVIWsbLbDE1cTRbxd6STgm44tjW51Y675C368
 dJuQTOfPjLohmWBYgflYxi2FpEi3pUAQhut9WrqyP2QuZZ4TXqtQpgIpuv5+UWKIGYh7
 bOG1/BBm4cfSigOEoM2C2qkYWLX/OzGlrTNb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvWQKN4ldbQtxhC2Mo0V29fBja+ZKnVpKgJauRZWMXc=;
 b=Ja3DxMJ5A7rO2xNKezcP7u43Z3wfejk04+D+bqmg1crFcQzNXkZrHJhK9c5zbPtNQt
 DrKFpgDaSlEFSzYczkzp8VfuQ6rJ5ePFyl90Tvei3gOSecf3/LNveWUrCIRT8CV0qUSu
 d3ZvYbfLM4n/eG2jmn/8qESXeQ5Pxh2AKG3hG0k5tZ8GEhZaT+W7GTwhVz3pLwI8zDnW
 NCGpNy03Jk+qtgJRwwU//9okb5aIBWo1cnWyf1bxwEYK9FcuTelHjcGeKPHh3u8Wme1z
 rI3/6ocA1SlMpWytyGTJWEApDCEg3jA6FXymjc0UvTXk0rifP/qQfQKcxirvYoerMLAw
 gyRw==
X-Gm-Message-State: APjAAAXaZq08RKFKoYwNA6I38bFLJTMcoVgU8Qlp4AOTn7vh/6a4lYK5
 ETS5Hv0yDFHVfbNSL964uH/cIQ==
X-Google-Smtp-Source: APXvYqxv5YQ9QUjYnNZopsONp33NCin2jYenipJ8UTsEYFIN9EDQKqUXVX/ukdjXJemvrSNPAAMIUA==
X-Received: by 2002:a17:902:7d90:: with SMTP id
 a16mr13457675plm.122.1556920986539; 
 Fri, 03 May 2019 15:03:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id p2sm8513289pfi.73.2019.05.03.15.03.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:05 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:17 -0700
Message-Id: <20190503220233.64546-15-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 14/30] mfd: cros_ec: Add EC transport
	protocol v4
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

Introduce a new transport procotol between EC and host.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 143 ++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 29a996832af0..48e753df7e2d 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -455,7 +455,10 @@
 #define EC_LPC_STATUS_BUSY_MASK \
 	(EC_LPC_STATUS_FROM_HOST | EC_LPC_STATUS_PROCESSING)
 
-/* Host command response codes */
+/*
+ * Host command response codes (16-bit).  Note that response codes should be
+ * stored in a uint16_t rather than directly in a value of this type.
+ */
 enum ec_status {
 	EC_RES_SUCCESS = 0,
 	EC_RES_INVALID_COMMAND = 1,
@@ -471,7 +474,13 @@ enum ec_status {
 	EC_RES_OVERFLOW = 11,		/* Table / data overflow */
 	EC_RES_INVALID_HEADER = 12,     /* Header contains invalid data */
 	EC_RES_REQUEST_TRUNCATED = 13,  /* Didn't get the entire request */
-	EC_RES_RESPONSE_TOO_BIG = 14    /* Response was too big to handle */
+	EC_RES_RESPONSE_TOO_BIG = 14,   /* Response was too big to handle */
+	EC_RES_BUS_ERROR = 15,		/* Communications bus error */
+	EC_RES_BUSY = 16,		/* Up but too busy.  Should retry */
+	EC_RES_INVALID_HEADER_VERSION = 17,  /* Header version invalid */
+	EC_RES_INVALID_HEADER_CRC = 18,      /* Header CRC invalid */
+	EC_RES_INVALID_DATA_CRC = 19,        /* Data CRC invalid */
+	EC_RES_DUP_UNAVAILABLE = 20,         /* Can't resend response */
 };
 
 /*
@@ -744,6 +753,136 @@ struct ec_host_response {
 	uint16_t reserved;
 } __ec_align4;
 
+/*****************************************************************************/
+
+/*
+ * Host command protocol V4.
+ *
+ * Packets always start with a request or response header.  They are followed
+ * by data_len bytes of data.  If the data_crc_present flag is set, the data
+ * bytes are followed by a CRC-8 of that data, using using x^8 + x^2 + x + 1
+ * polynomial.
+ *
+ * Host algorithm when sending a request q:
+ *
+ * 101) tries_left=(some value, e.g. 3);
+ * 102) q.seq_num++
+ * 103) q.seq_dup=0
+ * 104) Calculate q.header_crc.
+ * 105) Send request q to EC.
+ * 106) Wait for response r.  Go to 201 if received or 301 if timeout.
+ *
+ * 201) If r.struct_version != 4, go to 301.
+ * 202) If r.header_crc mismatches calculated CRC for r header, go to 301.
+ * 203) If r.data_crc_present and r.data_crc mismatches, go to 301.
+ * 204) If r.seq_num != q.seq_num, go to 301.
+ * 205) If r.seq_dup == q.seq_dup, return success.
+ * 207) If r.seq_dup == 1, go to 301.
+ * 208) Return error.
+ *
+ * 301) If --tries_left <= 0, return error.
+ * 302) If q.seq_dup == 1, go to 105.
+ * 303) q.seq_dup = 1
+ * 304) Go to 104.
+ *
+ * EC algorithm when receiving a request q.
+ * EC has response buffer r, error buffer e.
+ *
+ * 101) If q.struct_version != 4, set e.result = EC_RES_INVALID_HEADER_VERSION
+ *      and go to 301
+ * 102) If q.header_crc mismatches calculated CRC, set e.result =
+ *      EC_RES_INVALID_HEADER_CRC and go to 301
+ * 103) If q.data_crc_present, calculate data CRC.  If that mismatches the CRC
+ *      byte at the end of the packet, set e.result = EC_RES_INVALID_DATA_CRC
+ *      and go to 301.
+ * 104) If q.seq_dup == 0, go to 201.
+ * 105) If q.seq_num != r.seq_num, go to 201.
+ * 106) If q.seq_dup == r.seq_dup, go to 205, else go to 203.
+ *
+ * 201) Process request q into response r.
+ * 202) r.seq_num = q.seq_num
+ * 203) r.seq_dup = q.seq_dup
+ * 204) Calculate r.header_crc
+ * 205) If r.data_len > 0 and data is no longer available, set e.result =
+ *      EC_RES_DUP_UNAVAILABLE and go to 301.
+ * 206) Send response r.
+ *
+ * 301) e.seq_num = q.seq_num
+ * 302) e.seq_dup = q.seq_dup
+ * 303) Calculate e.header_crc.
+ * 304) Send error response e.
+ */
+
+/* Version 4 request from host */
+struct ec_host_request4 {
+	/*
+	 * bits 0-3: struct_version: Structure version (=4)
+	 * bit    4: is_response: Is response (=0)
+	 * bits 5-6: seq_num: Sequence number
+	 * bit    7: seq_dup: Sequence duplicate flag
+	 */
+	uint8_t fields0;
+
+	/*
+	 * bits 0-4: command_version: Command version
+	 * bits 5-6: Reserved (set 0, ignore on read)
+	 * bit    7: data_crc_present: Is data CRC present after data
+	 */
+	uint8_t fields1;
+
+	/* Command code (EC_CMD_*) */
+	uint16_t command;
+
+	/* Length of data which follows this header (not including data CRC) */
+	uint16_t data_len;
+
+	/* Reserved (set 0, ignore on read) */
+	uint8_t reserved;
+
+	/* CRC-8 of above fields, using x^8 + x^2 + x + 1 polynomial */
+	uint8_t header_crc;
+} __ec_align4;
+
+/* Version 4 response from EC */
+struct ec_host_response4 {
+	/*
+	 * bits 0-3: struct_version: Structure version (=4)
+	 * bit    4: is_response: Is response (=1)
+	 * bits 5-6: seq_num: Sequence number
+	 * bit    7: seq_dup: Sequence duplicate flag
+	 */
+	uint8_t fields0;
+
+	/*
+	 * bits 0-6: Reserved (set 0, ignore on read)
+	 * bit    7: data_crc_present: Is data CRC present after data
+	 */
+	uint8_t fields1;
+
+	/* Result code (EC_RES_*) */
+	uint16_t result;
+
+	/* Length of data which follows this header (not including data CRC) */
+	uint16_t data_len;
+
+	/* Reserved (set 0, ignore on read) */
+	uint8_t reserved;
+
+	/* CRC-8 of above fields, using x^8 + x^2 + x + 1 polynomial */
+	uint8_t header_crc;
+} __ec_align4;
+
+/* Fields in fields0 byte */
+#define EC_PACKET4_0_STRUCT_VERSION_MASK	0x0f
+#define EC_PACKET4_0_IS_RESPONSE_MASK		0x10
+#define EC_PACKET4_0_SEQ_NUM_SHIFT		5
+#define EC_PACKET4_0_SEQ_NUM_MASK		0x60
+#define EC_PACKET4_0_SEQ_DUP_MASK		0x80
+
+/* Fields in fields1 byte */
+#define EC_PACKET4_1_COMMAND_VERSION_MASK	0x1f  /* (request only) */
+#define EC_PACKET4_1_DATA_CRC_PRESENT_MASK	0x80
+
 /*****************************************************************************/
 /*
  * Notes on commands:
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
