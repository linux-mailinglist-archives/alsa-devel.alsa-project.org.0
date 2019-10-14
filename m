Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE13D601F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 12:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2E91690;
	Mon, 14 Oct 2019 12:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2E91690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571048710;
	bh=8n1/bhHQ7ycHdbyR4xx7YqfDP/OhjNSS4W6SNhe+q+0=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RsQzYit4nlzgghiVj+xDXLqGGKlayonbKkswAlj1mvhsNXgaQw9T35V/+fj7jGfKs
	 854ZTNcKNis43i32+j/sLp/VSjXwm9G1Z7SOCUWHzD6F+2TrLqHwQzEWWXF+gXKZZ5
	 Dkf4j15qawUYhOsaO50tXa+jdwc2OGZ5xjZ1mcO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0931FF80638;
	Mon, 14 Oct 2019 12:21:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68747F80639; Mon, 14 Oct 2019 12:21:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 605AEF80635
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 12:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 605AEF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Rleh7TzN"
Received: by mail-pl1-x64a.google.com with SMTP id p15so9830408plq.4
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TLh1zlLddJfY1tcfiX9PMO1jsoV1ruw1rDn5Rffer8A=;
 b=Rleh7TzNZmFh8cyq+gHWiaQO2joOFPMzRZ0tPkAhT5j0JqpSDvhlBaGaD8ODTcbPeJ
 0rsB1tmsHCmxYL2YLHmqcwlXG953mFv+BNnbckm0ZSazVPNZuVc/7TeQufOU06CEKw1q
 oTOgKR4m6YDvswatHLbRGhXK1zAQUNG8GN6wjIdREAuc45IAQqS5sq23oNTI70K4TOIY
 rdakiARNh9CeaG72/jn5Ii43IvIqqt38uYApPxM08DWScKTM+7OCffbDn6OCKcdzvhLw
 1bbnIP/H/2RhiIc1w3so4RkJ+Pb5WHmjEmWg+aJ5fLbM8Bf6Ms3jITDPqhIuQzb6umV8
 5/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TLh1zlLddJfY1tcfiX9PMO1jsoV1ruw1rDn5Rffer8A=;
 b=YxU5MgCPK9NCgW71AHc69teFMF6fQXvzRw+f9DDkX8tDonQe4ISTqjFRRPP24h/gj4
 dlvsxomISU3qGM87wGBCpJZItR9Of2nvNxHaC26eyk7llAfSnqj1cB+hlvQwJfNSBb9g
 HIqH6WGV7nhw+Iy0uws4hQSUyz7o3hMnRsT7+HlKGUnVOwcfPLdfQlCHneDrOBjb0pYj
 d8PC2AC/vzT96exQcYGuFxho5yhmH0pqp9Dbe2cMjxugkTIHsnhd7dqswqHkbfybVx3f
 t3BWepqGovrizpCw8sDcHbOonMjYYVVy4+J/uD8GiTWt0w2PKhV3v71bb6SnaAa4txrs
 DHBg==
X-Gm-Message-State: APjAAAW/kFE8WFY2Xf4ZL8F5fAxyewQqmwCS8jsfSOv9NlhoyuoxAndW
 FV1RZbN4GKtCQem6PlhFnG+kUkED1UTl
X-Google-Smtp-Source: APXvYqwlshs8exA240tFvmfw5Hfa4JFHcrmRDH0bla0X83GrSR2knU6EWAOFhn4I/BQVfcV+pGVGPrjIHhZ/
X-Received: by 2002:a63:6301:: with SMTP id x1mr33705963pgb.271.1571048458538; 
 Mon, 14 Oct 2019 03:20:58 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:20:16 +0800
In-Reply-To: <20191014102022.236013-1-tzungbi@google.com>
Message-Id: <20191014180059.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
Mime-Version: 1.0
References: <20191014102022.236013-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v3 04/10] platform/chrome: cros_ec: add common
	commands for EC codec
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

Add the following common commands:
- GET_CAPABILITIES
- GET_SHM_ADDR
- SET_SHM_ADDR

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec_trace.c       |  1 +
 .../linux/platform_data/cros_ec_commands.h    | 64 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index e73bb6a8b00e..2ea0d4e0d54d 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -98,6 +98,7 @@
 	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 58e460c015ef..3ca0fa9e92a7 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4466,8 +4466,68 @@ enum mkbp_cec_event {
 
 /*****************************************************************************/
 
+/* Commands for audio codec. */
+#define EC_CMD_EC_CODEC 0x00BC
+
+enum ec_codec_subcmd {
+	EC_CODEC_GET_CAPABILITIES = 0x0,
+	EC_CODEC_GET_SHM_ADDR = 0x1,
+	EC_CODEC_SET_SHM_ADDR = 0x2,
+	EC_CODEC_SUBCMD_COUNT,
+};
+
+enum ec_codec_cap {
+	EC_CODEC_CAP_LAST = 32,
+};
+
+enum ec_codec_shm_id {
+	EC_CODEC_SHM_ID_LAST,
+};
+
+enum ec_codec_shm_type {
+	EC_CODEC_SHM_TYPE_EC_RAM = 0x0,
+	EC_CODEC_SHM_TYPE_SYSTEM_RAM = 0x1,
+};
+
+struct __ec_align1 ec_param_ec_codec_get_shm_addr {
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec_set_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec {
+	uint8_t cmd; /* enum ec_codec_subcmd */
+	uint8_t reserved[3];
+
+	union {
+		struct ec_param_ec_codec_get_shm_addr
+				get_shm_addr_param;
+		struct ec_param_ec_codec_set_shm_addr
+				set_shm_addr_param;
+	};
+};
+
+struct __ec_align4 ec_response_ec_codec_get_capabilities {
+	uint32_t capabilities;
+};
+
+struct __ec_align4 ec_response_ec_codec_get_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t type;
+	uint8_t reserved[3];
+};
+
+/*****************************************************************************/
+
 /* Commands for DMIC on audio codec. */
-#define EC_CMD_EC_CODEC_DMIC 0x00BC
+#define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
 	EC_CODEC_DMIC_SET_GAIN = 0x0,
@@ -4500,7 +4560,7 @@ struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
 
 /* Commands for I2S RX on audio codec. */
 
-#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
+#define EC_CMD_EC_CODEC_I2S_RX 0x00BE
 
 enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_ENABLE = 0x0,
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
