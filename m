Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4B38CBE2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC54D16A3;
	Fri, 21 May 2021 19:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC54D16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617504;
	bh=qHEzV+6yWJ9kXn0/Dr0pX1MlFhf+4/HywGv6/yibPhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pa4RUHkdEqj1Ysr44IxJDSrHldrSGYFt8J9xQ9u7zgJgbfkwoctyYB+VVA+8VJSSZ
	 IVidhWZS78NZ2LIPnttbWJUDSF3Ltl7frxg87qD+qO4qyka1uQoGVsDzWyQWcj73NW
	 lbtz5CmiJ2AXvXShMfikQM7siMA0csjQNu/hAlPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33711F804D1;
	Fri, 21 May 2021 19:14:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F952F804D1; Fri, 21 May 2021 19:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D1B7F804AC
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D1B7F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bcOvArkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ujay28NNxKhNc3RUgY9uwKzgnuXEDC1Wk9n9fIO3VU=;
 b=bcOvArkKghtk15s8kjZbZEVaD1rEDBobPCb9Wbl+H3g2/jdnZy26mROkQDS2oWzkz71X9i
 RS6N7QSCvIb9I9aeJ7sN2H4w7wU5l6Xhjs1v3nJFZ8XASE1a2ugFvB1ze3duvnUzh/IbRO
 iCGrdmu5WW23142CCDOj4ohPX/kTqPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-PA3yBeYVNOuex-VgD1j66w-1; Fri, 21 May 2021 13:14:36 -0400
X-MC-Unique: PA3yBeYVNOuex-VgD1j66w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 297061936B66;
 Fri, 21 May 2021 17:14:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B83910013D6;
 Fri, 21 May 2021 17:14:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/8] iio: accel: bmc150: Remove bmc150_set/get_second_device()
 accessor functions
Date: Fri, 21 May 2021 19:14:16 +0200
Message-Id: <20210521171418.393871-7-hdegoede@redhat.com>
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

Now that the definition of the bmc150_accel_data struct is no longer
private to bmc150-accel-core.c, bmc150-accel-i2c.c can simply directly
access the second_dev member and the accessor functions are no longer
necessary.

Note if the i2c_acpi_new_device() for the second-client now fails,
an ERR_PTR gets stored in data->second_dev this is fine since it is only
ever passed to i2c_unregister_device() which has an IS_ERR_OR_NULL() check.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-core.c | 16 ----------------
 drivers/iio/accel/bmc150-accel-i2c.c  | 10 ++++------
 drivers/iio/accel/bmc150-accel.h      |  2 --
 3 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 0d76df9e08eb..0291512648b2 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -1754,22 +1754,6 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 }
 EXPORT_SYMBOL_GPL(bmc150_accel_core_probe);
 
-struct i2c_client *bmc150_get_second_device(struct i2c_client *client)
-{
-	struct bmc150_accel_data *data = iio_priv(i2c_get_clientdata(client));
-
-	return data->second_device;
-}
-EXPORT_SYMBOL_GPL(bmc150_get_second_device);
-
-void bmc150_set_second_device(struct i2c_client *client, struct i2c_client *second_dev)
-{
-	struct bmc150_accel_data *data = iio_priv(i2c_get_clientdata(client));
-
-	data->second_device = second_dev;
-}
-EXPORT_SYMBOL_GPL(bmc150_set_second_device);
-
 int bmc150_accel_core_remove(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index b81e4005788e..1dd7b8a9a382 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -34,8 +34,8 @@ static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
  */
 static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
 {
+	struct bmc150_accel_data *data = iio_priv(i2c_get_clientdata(client));
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
-	struct i2c_client *second_dev;
 	char dev_name[16];
 	struct i2c_board_info board_info = {
 		.type = "bmc150_accel",
@@ -54,16 +54,14 @@ static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
 
 	board_info.irq = acpi_dev_gpio_irq_get_by(adev, NULL, 1);
 
-	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
-	if (!IS_ERR(second_dev))
-		bmc150_set_second_device(client, second_dev);
+	data->second_device = i2c_acpi_new_device(&client->dev, 1, &board_info);
 }
 
 static void bmc150_acpi_dual_accel_remove(struct i2c_client *client)
 {
-	struct i2c_client *second_dev = bmc150_get_second_device(client);
+	struct bmc150_accel_data *data = iio_priv(i2c_get_clientdata(client));
 
-	i2c_unregister_device(second_dev);
+	i2c_unregister_device(data->second_device);
 }
 #else
 static void bmc150_acpi_dual_accel_probe(struct i2c_client *client) {}
diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index f503c5b5801e..5da6fd32bac5 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -78,8 +78,6 @@ enum {
 int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 			    const char *name, bool block_supported);
 int bmc150_accel_core_remove(struct device *dev);
-struct i2c_client *bmc150_get_second_device(struct i2c_client *second_device);
-void bmc150_set_second_device(struct i2c_client *client, struct i2c_client *second_dev);
 extern const struct dev_pm_ops bmc150_accel_pm_ops;
 extern const struct regmap_config bmc150_regmap_conf;
 
-- 
2.31.1

