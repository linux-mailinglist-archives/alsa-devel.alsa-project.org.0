Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E400ACC848
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D1C1691;
	Sat,  5 Oct 2019 08:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D1C1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255380;
	bh=fqTy5MERAc/zubfe/oe51WGUO8MQb6O8zYfyfwZMrY0=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZUJqVM1/fqYo8HpbWOMZyxdjpF0OI57dUvQNAgWW+NPznzTcl7UMDW4Q9MdL8ZJq
	 HudWAEySWZIFHylZeFJMrASZ5MedFwaC4mOMlsqMFLFnXnzmsxXHb7lFSGxOFsmcyD
	 Xzxcr/Vk66AHdzAfb3fTujGxhnW+Tn1teKEzpjng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0022F80637;
	Sat,  5 Oct 2019 07:58:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D9FF80638; Sat,  5 Oct 2019 07:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7155F80636
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7155F80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gQcVUJ+X"
Received: by mail-qk1-x74a.google.com with SMTP id s28so8794840qkm.5
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 22:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NeC00R2HDPjugyY089WdATWGGggY9LDPrJpjGM7g9N0=;
 b=gQcVUJ+XpqurKBASnZl+Mwj5bZMVoRMdX5B6KjbbhnrQJscx/JqIIoB045wqSc36BU
 5jg9Pr8zuIvWPWim7wW1zai7arWV8cJ8241rjAOiokot5W+TY1BV02dnQIrGuf0GTkdP
 gBQ3mkXQw5BJojsYPJ2DawQsUehAJFqBTpF2K8ldQSZsdpWLDLGsSnZpaSXL5J4X1Pu4
 Eh9f+PgX2EnJpKzwXCpyBqu7VbuQ+0oyhdUgxU6wtGT3jMj4ximqEQO+MYgKZgLwHr1f
 DmsKfXdZlcccVfHN+Pbyax+3wwWBBHK2g4kJLNWIN21Elr21/esoHgWvMT9nfPMbhwN5
 /J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NeC00R2HDPjugyY089WdATWGGggY9LDPrJpjGM7g9N0=;
 b=fP+HC61F5JuJdevtGMbkVs0GV2KCtJyQFXpHMvRhUTqwk165PpQPUjxUMzjpCf3/HV
 oonVtyCLuEAKjF5TLwrz4B3PjmuESfSMX2eHZDnkhAyVy/VUqWzOj6z9LGfeSbbJIuUv
 0ufWO00Qn4yVHbTsCDNmKFTeJFjK7u08axU+thsBtTW2zb9SLDYnHy9wEjpIeSjBr0MN
 SpQiAGOikcpHWPSGPIGIZjBvMYccowJUsRQJuKCBUyfm6P9JgCeg7LjGPzI2l4tl+dLW
 jk8VIVZNolT2EJSahAbmX+PZEEwcyRCzA6/A+4tBsHVFbRBitnSXuqP06r5/NNhBT6bB
 8iZw==
X-Gm-Message-State: APjAAAWTApUhRxRZfd/ALWo+YWWrU8Qb/PvbCrRC1osKuHEyuwSrRciL
 xulif1iQNUpYz5wwjYossPGVmiBsnoXf
X-Google-Smtp-Source: APXvYqxWeSW1A2QUEGeWYqnxp/i3scGMYhcDvxbpndqqbVhBiuL+kV3G4ctRS9IJDexwFucU9VzAUnBb1/08
X-Received: by 2002:ac8:474c:: with SMTP id k12mr20289760qtp.319.1570255132978; 
 Fri, 04 Oct 2019 22:58:52 -0700 (PDT)
Date: Sat,  5 Oct 2019 13:58:02 +0800
In-Reply-To: <20191005055808.249089-1-tzungbi@google.com>
Message-Id: <20191005130552.4.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
Mime-Version: 1.0
References: <20191005055808.249089-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH 04/10] platform/chrome: cros_ec: add common
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
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
