Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCEF194A8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1510C1AD4;
	Thu,  9 May 2019 23:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1510C1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437556;
	bh=JKNWcRg5bmYVTTSb3CkWPq/XibJrI3RD59m2WZxiEmI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BB3euU30sgD/jgdQr1zdN/M1b+/J+ZwTpXMaP54rlRntU72c+onz6m+twgl2Xy6cL
	 7XNxjiIRmE5QUwdREdJRkE7jGBE90Ue2mX2YxApw0+ksNMGYJpyZCrSO1Js6TTkp8V
	 s/jeI8Wr4UaXXmy/Mz+Tz4HoAriEU8WRqhD6coNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 938A8F897BD;
	Thu,  9 May 2019 23:15:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B24F89787; Thu,  9 May 2019 23:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E463EF89775
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E463EF89775
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XXDM/W1t"
Received: by mail-pf1-x444.google.com with SMTP id n19so1965381pfa.1
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kndU7Xslh2hLi/DqA2dn0GioPk0zdFJqRn58k4JjEzA=;
 b=XXDM/W1tSNKpxoFI+18TDU3bZOG/87Pk6v8GCeAs16B75QQZVC7fXBA9jRV3riScD6
 Zi78CQfQMhPa/TYuIKQVsaAZG0mTIL6c8Qd+njt6gmFJR790tf4bGgeQsLM1fx5LkBjQ
 p9CRBfMAZqi65A6IjvvjSZ62RrlwCM25rLJjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kndU7Xslh2hLi/DqA2dn0GioPk0zdFJqRn58k4JjEzA=;
 b=K5tzZvwjk/yOGIEzhNN1Ndua6zGXTyt/5RIXddrGva6t6ECCZG7ks0f89P/iojBV1n
 /+t9rixLxnIls/wFzExHxi+EFNps9ZLVCKYNgVRP8krXQ0BpXPG6KOn0ezKenzwDdD/1
 nR584ZBJB67yI9UoPFk3sELa57kYqGkv84yTU983pdjEzK97gpWT60DJTuaODobc1g5T
 uomaczfPzJTbW7X/mN2cuc8ObH27mnvf081nvEHzae3wXABIUIZkirGS2ulVZZ1u4iUA
 NfLgR/UDiN11/9jg69F1cWLeuOQ1UwiYdr1QYScmJPNBSdsThDWm8QXBWZc3Q9XTLwUo
 X0kA==
X-Gm-Message-State: APjAAAUCMcozJZFICOdarfUJXhqATjnnD1IflBSxmAfbxGigL55rP7Vv
 YoefqbYE1BzV/0w3JziF+U9BGw==
X-Google-Smtp-Source: APXvYqyqQpbyug3xNASyR67esNzWvlSBWh2hPs6AEx8m/jqmlvUYfpHoe/718Hxhu55p6WgwvA/CdA==
X-Received: by 2002:a63:1055:: with SMTP id 21mr8550709pgq.200.1557436479918; 
 Thu, 09 May 2019 14:14:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id y68sm4422349pfy.28.2019.05.09.14.14.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:39 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:47 -0700
Message-Id: <20190509211353.213194-25-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 24/30] mfd: cros_ec: Add API for EC-EC
	communication
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

Allow EC to talk to other ECs that are not presented to the host.
Neeed when EC are present in detachable keyboard.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 95 ++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 59ad6bae3f9b..52fd9bfafc7f 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -5043,6 +5043,101 @@ struct ec_response_pd_chip_info_v1 {
 	};
 } __ec_align2;
 
+/*****************************************************************************/
+/* EC-EC communication commands: range 0x0600-0x06FF */
+
+#define EC_COMM_TEXT_MAX 8
+
+/*
+ * Get battery static information, i.e. information that never changes, or
+ * very infrequently.
+ */
+#define EC_CMD_BATTERY_GET_STATIC 0x0600
+
+/**
+ * struct ec_params_battery_static_info - Battery static info parameters
+ * @index: Battery index.
+ */
+struct ec_params_battery_static_info {
+	uint8_t index;
+} __ec_align_size1;
+
+/**
+ * struct ec_response_battery_static_info - Battery static info response
+ * @design_capacity: Battery Design Capacity (mAh)
+ * @design_voltage: Battery Design Voltage (mV)
+ * @manufacturer: Battery Manufacturer String
+ * @model: Battery Model Number String
+ * @serial: Battery Serial Number String
+ * @type: Battery Type String
+ * @cycle_count: Battery Cycle Count
+ */
+struct ec_response_battery_static_info {
+	uint16_t design_capacity;
+	uint16_t design_voltage;
+	char manufacturer[EC_COMM_TEXT_MAX];
+	char model[EC_COMM_TEXT_MAX];
+	char serial[EC_COMM_TEXT_MAX];
+	char type[EC_COMM_TEXT_MAX];
+	/* TODO(crbug.com/795991): Consider moving to dynamic structure. */
+	uint32_t cycle_count;
+} __ec_align4;
+
+/*
+ * Get battery dynamic information, i.e. information that is likely to change
+ * every time it is read.
+ */
+#define EC_CMD_BATTERY_GET_DYNAMIC 0x0601
+
+/**
+ * struct ec_params_battery_dynamic_info - Battery dynamic info parameters
+ * @index: Battery index.
+ */
+struct ec_params_battery_dynamic_info {
+	uint8_t index;
+} __ec_align_size1;
+
+/**
+ * struct ec_response_battery_dynamic_info - Battery dynamic info response
+ * @actual_voltage: Battery voltage (mV)
+ * @actual_current: Battery current (mA); negative=discharging
+ * @remaining_capacity: Remaining capacity (mAh)
+ * @full_capacity: Capacity (mAh, might change occasionally)
+ * @flags: Flags, see EC_BATT_FLAG_*
+ * @desired_voltage: Charging voltage desired by battery (mV)
+ * @desired_current: Charging current desired by battery (mA)
+ */
+struct ec_response_battery_dynamic_info {
+	int16_t actual_voltage;
+	int16_t actual_current;
+	int16_t remaining_capacity;
+	int16_t full_capacity;
+	int16_t flags;
+	int16_t desired_voltage;
+	int16_t desired_current;
+} __ec_align2;
+
+/*
+ * Control charger chip. Used to control charger chip on the slave.
+ */
+#define EC_CMD_CHARGER_CONTROL 0x0602
+
+/**
+ * struct ec_params_charger_control - Charger control parameters
+ * @max_current: Charger current (mA). Positive to allow base to draw up to
+ *     max_current and (possibly) charge battery, negative to request current
+ *     from base (OTG).
+ * @otg_voltage: Voltage (mV) to use in OTG mode, ignored if max_current is
+ *     >= 0.
+ * @allow_charging: Allow base battery charging (only makes sense if
+ *     max_current > 0).
+ */
+struct ec_params_charger_control {
+	int16_t max_current;
+	uint16_t otg_voltage;
+	uint8_t allow_charging;
+} __ec_align_size1;
+
 /*****************************************************************************/
 /*
  * Reserve a range of host commands for board-specific, experimental, or
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
