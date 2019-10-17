Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21580DAF18
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7161677;
	Thu, 17 Oct 2019 16:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7161677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321111;
	bh=Q5UD8liRTY7ZJFwVOdqIezOTjwkwPebnqnio00GadUA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOBpb961yb+qljukZ3UQyUrTPFDDnMlUmOFlZBnt+WBMoRLh5VxHqTEacLUtDRuYi
	 0tGQqioq8Rxw+lwUtv9A8BF9zOLIhjK5IVHd7J2TksIpjY9YIHySYgjHQaZF55BFY9
	 of5DkHD/UpiPd92GE5X0q2yBwCFmToNUd7Lec2bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 639AFF80649;
	Thu, 17 Oct 2019 16:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF7D6F80642; Thu, 17 Oct 2019 16:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA60F80637
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA60F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="M6nU9KLE"
Received: by mail-pf1-x44a.google.com with SMTP id d126so1778932pfd.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZtxS2Vg5dy9sdeqWSW4v3GMIuu7neueM+a0/0finMLQ=;
 b=M6nU9KLEjXfvAKGGIcTXI6zJp5ma5N1gkNMHB3hbGpFV61JejCigl7E+o/dhIf83tT
 j0vlBK7A2lKWCYAlynxa+bA4bVRyB7E8ulDDGQ2l4r3iSw/eIKHnhmHb664mmihZ6hoP
 SBt9wZ19QKMPhxDsksVnx2dPqZcIXslPF+HjQ21P+sgn2IFXHMwUGXnauHA26gNVrPMK
 9TvsBfV2hLW6H0t1m5H2khoawd+BpK0E/GxNZ+w0CB75R4y441lFXdh7yytbXxUwaxXI
 V3WNRa/tS/NQiGv96/m6ipIt70b014erxEkTEtwMuQlaWOAB4uhhXTl/i95S7C1ktZlf
 DI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZtxS2Vg5dy9sdeqWSW4v3GMIuu7neueM+a0/0finMLQ=;
 b=eMMrIrg8NZkNzWMZYuTbFlNHYJ6yfzd7EOP5R7b8ZRQHno5UCDtjwNpRHfzbJf5S7v
 vl2SCjuusmbc2ltoFdNe8/ecJ7C4SfRbY87EgmX7ZjdykKeerm/YgS56w8pinvrUKA5U
 IxkNifqTxGiqfdB2h6AL3WN2hIsqrAv4fHMHtEfj3pQFB45th01O6VJbdlUGr65mkXmy
 5KCIWm3HQh0uqe/1Aw4qVvCbYc31eZ9EuBAE6b9PRixasupIupGUfIA/PLRTZOfCZUEb
 wCQ2aySJR8eMaUzVoW543zJypG5bQIF8+BKHopPY1Rbxwl0316s6mrCvBOsW/Eumjl+s
 +9hQ==
X-Gm-Message-State: APjAAAXcYhl8gNEO8ECP7F9zmxAxoYbPFGKSCtAn7zLlYDTU4nLmuTP3
 24smz0Wk26HYfYwmwmDoxgDPbdz0kW1x
X-Google-Smtp-Source: APXvYqwLBYAeOAkN4xCiOGFngVLfQJS4wUNwXvRTKtCCPOqhKcppsuSiHc0p+LqI7MBnVxOFEUuJC7vx1Xfb
X-Received: by 2002:a65:6701:: with SMTP id u1mr4348299pgf.368.1571320853382; 
 Thu, 17 Oct 2019 07:00:53 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:09 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, Benson Leung <bleung@chromium.org>,
 tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH v4 04/10] platform/chrome: cros_ec: add common
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

Acked-by: Benson Leung <bleung@chromium.org>
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
