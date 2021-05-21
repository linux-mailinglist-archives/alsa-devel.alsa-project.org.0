Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652038CBCB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED7916BB;
	Fri, 21 May 2021 19:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED7916BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617428;
	bh=GRk37J8hM4Klh4WXbTwLaPdrQlNoFOgQzWCt/VSRsls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WswVnEcQjMEMLov0THYHl06hdcHZH5mAtvRkD5WJ/YVmhBF7QSkpQWWwTTAWU4++U
	 f33pS7MLydtPZL8iDNmhM8KTlvYFlqQ1pj7sufCol6Jaolk4900mqIY9Gep+odm/Od
	 6yC0m1cxeRLjneVPP7RzbgQwIhoQ09vFjMxxbd6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA18F80153;
	Fri, 21 May 2021 19:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74649F80153; Fri, 21 May 2021 19:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A45FF80258
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A45FF80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Z1lQELzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3jEOk5usRD8N5s+si9Ssqu1dNmmtHu+tN0BDZH3GZ8=;
 b=Z1lQELzBFX57RefssASBWXG21xaISGOgRjiDH3LC10eW6kItNL99hyUbIMFJF9rmtKJRQO
 uin4JuJlFUcXiQ2Lnd9ZaeX7nNWBgOXeB+GVAL790ivSmR8Qiz3tylM6+TIaIpj6ikZ+K+
 KUNWssn1bTUDPTTYD/rM7t/rJTiNMNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-_g0gb0XwMYWM9O7vFmGxUg-1; Fri, 21 May 2021 13:14:29 -0400
X-MC-Unique: _g0gb0XwMYWM9O7vFmGxUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B401EBBEEF;
 Fri, 21 May 2021 17:14:27 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AB910013D6;
 Fri, 21 May 2021 17:14:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/8] iio: accel: bmc150: Move check for second ACPI device
 into a separate function
Date: Fri, 21 May 2021 19:14:13 +0200
Message-Id: <20210521171418.393871-4-hdegoede@redhat.com>
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

Move the check for a second ACPI device for BOSC0200 ACPI fwnodes into
a new bmc150_acpi_dual_accel_probe() helper function.

This is a preparation patch for adding support for a new "DUAL250E" ACPI
Hardware-ID (HID) used on some devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-i2c.c | 80 +++++++++++++++++-----------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 2afaae0294ee..e24ce28a4660 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -21,6 +21,51 @@
 
 #include "bmc150-accel.h"
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
+	{"BOSC0200"},
+	{ },
+};
+
+/*
+ * Some acpi_devices describe 2 accelerometers in a single ACPI device, try instantiating
+ * a second i2c_client for an I2cSerialBusV2 ACPI resource with index 1.
+ */
+static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	struct i2c_client *second_dev;
+	struct i2c_board_info board_info = {
+		.type = "bmc150_accel",
+		/*
+		 * The 2nd accel sits in the base of 2-in-1s. Note this
+		 * name is static, as there should never be more then 1
+		 * BOSC0200 ACPI node with 2 accelerometers in it.
+		 */
+		.dev_name = "BOSC0200:base",
+		.fwnode = client->dev.fwnode,
+		.irq = -ENOENT,
+	};
+
+	if (acpi_match_device_ids(adev, bmc150_acpi_dual_accel_ids))
+		return;
+
+	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
+	if (!IS_ERR(second_dev))
+		bmc150_set_second_device(client, second_dev);
+}
+
+static void bmc150_acpi_dual_accel_remove(struct i2c_client *client)
+{
+	struct i2c_client *second_dev = bmc150_get_second_device(client);
+
+	i2c_unregister_device(second_dev);
+}
+#else
+static void bmc150_acpi_dual_accel_probe(struct i2c_client *client) {}
+static void bmc150_acpi_dual_accel_remove(struct i2c_client *client) {}
+#endif
+
 static int bmc150_accel_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -30,7 +75,6 @@ static int bmc150_accel_probe(struct i2c_client *client,
 		i2c_check_functionality(client->adapter, I2C_FUNC_I2C) ||
 		i2c_check_functionality(client->adapter,
 					I2C_FUNC_SMBUS_READ_I2C_BLOCK);
-	struct acpi_device __maybe_unused *adev;
 	int ret;
 
 	regmap = devm_regmap_init_i2c(client, &bmc150_regmap_conf);
@@ -46,42 +90,16 @@ static int bmc150_accel_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	/*
-	 * Some BOSC0200 acpi_devices describe 2 accelerometers in a single ACPI
-	 * device, try instantiating a second i2c_client for an I2cSerialBusV2
-	 * ACPI resource with index 1. The !id check avoids recursion when
-	 * bmc150_accel_probe() gets called for the second client.
-	 */
-#ifdef CONFIG_ACPI
-	adev = ACPI_COMPANION(&client->dev);
-	if (!id && adev && strcmp(acpi_device_hid(adev), "BOSC0200") == 0) {
-		struct i2c_board_info board_info = {
-			.type = "bmc150_accel",
-			/*
-			 * The 2nd accel sits in the base of 2-in-1s. Note this
-			 * name is static, as there should never be more then 1
-			 * BOSC0200 ACPI node with 2 accelerometers in it.
-			 */
-			.dev_name = "BOSC0200:base",
-			.fwnode = client->dev.fwnode,
-			.irq = -ENOENT,
-		};
-		struct i2c_client *second_dev;
-
-		second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
-		if (!IS_ERR(second_dev))
-			bmc150_set_second_device(client, second_dev);
-	}
-#endif
+	/* The !id check avoids recursion when probe() gets called for the second client. */
+	if (!id && has_acpi_companion(&client->dev))
+		bmc150_acpi_dual_accel_probe(client);
 
 	return 0;
 }
 
 static int bmc150_accel_remove(struct i2c_client *client)
 {
-	struct i2c_client *second_dev = bmc150_get_second_device(client);
-
-	i2c_unregister_device(second_dev);
+	bmc150_acpi_dual_accel_remove(client);
 
 	return bmc150_accel_core_remove(&client->dev);
 }
-- 
2.31.1

