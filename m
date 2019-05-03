Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF313572
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481E8187A;
	Sat,  4 May 2019 00:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481E8187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556922146;
	bh=bmL0LhAmUopK72+G+KYpi9Vf69gUNLHeCJqkQsFawmM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHWWOK4C+zVpKJ4VsN5NTCVAkNeM6zZ7+q75mBdHLn9oWokhfAFYNH/3fwYCOxLAr
	 HBdPCFD5oK/kCJ03N2Fy31KjIZFPFtxbIXIycykEPoMsGcLXOadvLak/KelXL6jTjd
	 LeBsSuZyE3mnnDd9adMbzE5zXGLJWt5OA9/RnSfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F9BF897BF;
	Sat,  4 May 2019 00:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EE78F8973B; Sat,  4 May 2019 00:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D286EF89754
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D286EF89754
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="UAtBg6n5"
Received: by mail-pf1-x443.google.com with SMTP id 13so3227475pfw.9
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1PKEqDM378kY+fiX0biAqbBpeI8zOEYVZPaEEhsQfc=;
 b=UAtBg6n5bXdlAdjlBcRXonMnEy8aQ1/zsgfeP1VOfuTFsrcenQqlBXzdZfJ+5cmAum
 mlPVNuimtSdlNEfL/zLwb5vRtlrvi6WRou9e2lrZ+SdNsvFyd9IbXlFOXVAjyXF/JOX8
 mGLPKDttdiF972NtQa4s0Y1UQfNRizf9hGaf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1PKEqDM378kY+fiX0biAqbBpeI8zOEYVZPaEEhsQfc=;
 b=NNWF9w82Jg5xvlTF1rAE10y2jdxsY41IWqzG1IbNhcrPZa85dh8DxseAQz3VowXwna
 bCL75IRZ7OOBF1RY92TskyGLK2XFWn57p4G1qumjMO3aXZFoPoW60Rn6B+iQ+gbPg4vK
 NifkCtcgaNRO1N3+9nShaRUdzb220O8LUAXsM206hGHpQjNqfuzjJzRGMvM9ZUbxH+EZ
 tk9VC4cXcK7uDi8VY4ccRn73HLVpeE1iHVfERLCOvxUy4UiqsSZ7IFLMfD6g3Y/hsVBH
 Y03GQfihsP9QLx/H3Za1mTfvNFdKFNmO/ZAOjHJAZHf4L5e1cdDiUNA9Uo4HEtNYwFhF
 q0kg==
X-Gm-Message-State: APjAAAUkruoonb6sgOpcliL7y59Zabbwtvku2w4THJCI6dOEuASQfvtS
 2ubWPrkDymd/dPjMK9pY3/GL3w==
X-Google-Smtp-Source: APXvYqzFG5JHQMwF1zwyuVu33jSdE9Z0d14+r7tp18tTYjUtUaK8k5Wou9ZPJDFKWSjUZi67hh+qvA==
X-Received: by 2002:a63:4f41:: with SMTP id p1mr13845074pgl.63.1556921002394; 
 Fri, 03 May 2019 15:03:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id j12sm8701522pgg.79.2019.05.03.15.03.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:21 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:27 -0700
Message-Id: <20190503220233.64546-25-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 24/30] mfd: cros_ec: Add API for EC-EC
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
