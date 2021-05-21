Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5938CBD3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9305416B5;
	Fri, 21 May 2021 19:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9305416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617478;
	bh=oo1yYTrhpQ7DPRMRnyLKRk2luWrLnwLM7O4NU9J0t4g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5ic4jd0gOjK0MejkmYyPqktcGAN+aLY6mzWWB2xwQT4odjhpQ4ohrhnJQPA2hExA
	 F2jYBzcAVratbaCwhirxZlahMxWEFUUJFasgLEEczKBA9MDUIsOXPiBUVLtnSRmGW5
	 7HKPV2VKLp/ax/7WpZGQyEkJSc/mwAvHP5Q2uE5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD03FF804AC;
	Fri, 21 May 2021 19:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE7DF80431; Fri, 21 May 2021 19:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0881F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0881F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hJM7fJdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mkhx/g9o1+KLwCNNf6XwuWbTEXPk9QmgZx7ph3jkix0=;
 b=hJM7fJdlcbaL7/R6CdOWRY0rmk3YAqr73HeOcUbeQW5CreMrqIE8EffulG5BkNEeKZ7LyL
 86UwsVGbw8kBmFMfKphHVyeqDlnfcdFgAC0LCtff7O+XqQX12EqVl0TNitp/upO8c525Dz
 /dXvaeoG2oXS6EVHwHjBfvTuGCCOcmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-XA2X_rQzNc6jRQ8vb0lfWw-1; Fri, 21 May 2021 13:14:34 -0400
X-MC-Unique: XA2X_rQzNc6jRQ8vb0lfWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191828015F5;
 Fri, 21 May 2021 17:14:33 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A51F10013D6;
 Fri, 21 May 2021 17:14:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/8] iio: accel: bmc150: Move struct bmc150_accel_data
 definition to bmc150-accel.h
Date: Fri, 21 May 2021 19:14:15 +0200
Message-Id: <20210521171418.393871-6-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-1-hdegoede@redhat.com>
References: <20210521171418.393871-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, Jeremy Cline <jeremy@jcline.org>,
 Hans de Goede <hdegoede@redhat.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Further patches to bmc150-accel-i2c.c need to store some extra info
(on top of the second_dev pointer) in the bmc150_accel_data struct,
rather then adding yet more accessor functions for this lets just
move the struct bmc150_accel_data definition to bmc150-accel.h.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-core.c | 53 -----------------------
 drivers/iio/accel/bmc150-accel.h      | 61 +++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 53 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 8ff358c37a81..0d76df9e08eb 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -157,59 +157,6 @@ struct bmc150_accel_chip_info {
 	const struct bmc150_scale_info scale_table[4];
 };
 
-struct bmc150_accel_interrupt {
-	const struct bmc150_accel_interrupt_info *info;
-	atomic_t users;
-};
-
-struct bmc150_accel_trigger {
-	struct bmc150_accel_data *data;
-	struct iio_trigger *indio_trig;
-	int (*setup)(struct bmc150_accel_trigger *t, bool state);
-	int intr;
-	bool enabled;
-};
-
-enum bmc150_accel_interrupt_id {
-	BMC150_ACCEL_INT_DATA_READY,
-	BMC150_ACCEL_INT_ANY_MOTION,
-	BMC150_ACCEL_INT_WATERMARK,
-	BMC150_ACCEL_INTERRUPTS,
-};
-
-enum bmc150_accel_trigger_id {
-	BMC150_ACCEL_TRIGGER_DATA_READY,
-	BMC150_ACCEL_TRIGGER_ANY_MOTION,
-	BMC150_ACCEL_TRIGGERS,
-};
-
-struct bmc150_accel_data {
-	struct regmap *regmap;
-	struct regulator_bulk_data regulators[2];
-	struct bmc150_accel_interrupt interrupts[BMC150_ACCEL_INTERRUPTS];
-	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
-	struct mutex mutex;
-	u8 fifo_mode, watermark;
-	s16 buffer[8];
-	/*
-	 * Ensure there is sufficient space and correct alignment for
-	 * the timestamp if enabled
-	 */
-	struct {
-		__le16 channels[3];
-		s64 ts __aligned(8);
-	} scan;
-	u8 bw_bits;
-	u32 slope_dur;
-	u32 slope_thres;
-	u32 range;
-	int ev_enable_state;
-	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. */
-	const struct bmc150_accel_chip_info *chip_info;
-	struct i2c_client *second_device;
-	struct iio_mount_matrix orientation;
-};
-
 static const struct {
 	int val;
 	int val2;
diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index e30c1698f6fb..f503c5b5801e 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -2,7 +2,68 @@
 #ifndef _BMC150_ACCEL_H_
 #define _BMC150_ACCEL_H_
 
+#include <linux/atomic.h>
+#include <linux/iio/iio.h>
+#include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
+
 struct regmap;
+struct i2c_client;
+struct bmc150_accel_chip_info;
+struct bmc150_accel_interrupt_info;
+
+struct bmc150_accel_interrupt {
+	const struct bmc150_accel_interrupt_info *info;
+	atomic_t users;
+};
+
+struct bmc150_accel_trigger {
+	struct bmc150_accel_data *data;
+	struct iio_trigger *indio_trig;
+	int (*setup)(struct bmc150_accel_trigger *t, bool state);
+	int intr;
+	bool enabled;
+};
+
+enum bmc150_accel_interrupt_id {
+	BMC150_ACCEL_INT_DATA_READY,
+	BMC150_ACCEL_INT_ANY_MOTION,
+	BMC150_ACCEL_INT_WATERMARK,
+	BMC150_ACCEL_INTERRUPTS,
+};
+
+enum bmc150_accel_trigger_id {
+	BMC150_ACCEL_TRIGGER_DATA_READY,
+	BMC150_ACCEL_TRIGGER_ANY_MOTION,
+	BMC150_ACCEL_TRIGGERS,
+};
+
+struct bmc150_accel_data {
+	struct regmap *regmap;
+	struct regulator_bulk_data regulators[2];
+	struct bmc150_accel_interrupt interrupts[BMC150_ACCEL_INTERRUPTS];
+	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
+	struct mutex mutex;
+	u8 fifo_mode, watermark;
+	s16 buffer[8];
+	/*
+	 * Ensure there is sufficient space and correct alignment for
+	 * the timestamp if enabled
+	 */
+	struct {
+		__le16 channels[3];
+		s64 ts __aligned(8);
+	} scan;
+	u8 bw_bits;
+	u32 slope_dur;
+	u32 slope_thres;
+	u32 range;
+	int ev_enable_state;
+	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. */
+	const struct bmc150_accel_chip_info *chip_info;
+	struct i2c_client *second_device;
+	struct iio_mount_matrix orientation;
+};
 
 enum {
 	bmc150,
-- 
2.31.1

