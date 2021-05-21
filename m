Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C765538CBC7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57C0B16C5;
	Fri, 21 May 2021 19:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57C0B16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617414;
	bh=+6BrXU5MP4GOdngL5gXI20RWHvqFwmvusVHAagfkEYg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1PODrON+HaPd5UaaRfP+yQDwTetV72EYYmYvrutoAEeD2Z+v+QjbxBIcjcUMWHJO
	 ncRky68/O2DalZ/kmF6OyC9dJvQVa6R5Qaje70L10A7YR5u/JJtH+HA/Xwzb82hyXM
	 dmc7omPGXfd0g9mypv0xAdn3T+Zrpnd3KM5SFA7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AFB9F8042F;
	Fri, 21 May 2021 19:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF4F6F802E7; Fri, 21 May 2021 19:14:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D83DF8016E
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D83DF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="NSLj+Mev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aC2btrd0oAiIt2nxc3OcNaXdUe09FXy+FKy/oiXFHAM=;
 b=NSLj+MevKd1JFtbyP3Uda4XLJWVI3mq+JnH+ic6wPdwuWV1gd3gX/FARIwLJlwcXV1ZIbG
 V+rAdultyuD+KUtXEuqUxIOrPgPBwAcdZxhurg+JFxEUpqIaOWGlOkGYidf2BBXFEQWFPc
 Wamyu/VpbFZm47o/4iQvU8B0KyCyM7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-mdOG9VcbM2OUQz-veC5WUA-1; Fri, 21 May 2021 13:14:28 -0400
X-MC-Unique: mdOG9VcbM2OUQz-veC5WUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D0C802946;
 Fri, 21 May 2021 17:14:25 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16FD10013D6;
 Fri, 21 May 2021 17:14:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/8] iio: accel: bmc150: Don't make the remove function of the
 second accelerometer unregister itself
Date: Fri, 21 May 2021 19:14:12 +0200
Message-Id: <20210521171418.393871-3-hdegoede@redhat.com>
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

On machines with dual accelerometers described in a single ACPI fwnode,
the bmc150_accel_probe() instantiates a second i2c-client for the second
accelerometer.

A pointer to this manually instantiated second i2c-client is stored
inside the iio_dev's private-data through bmc150_set_second_device(),
so that the i2c-client can be unregistered from bmc150_accel_remove().

Before this commit bmc150_set_second_device() took only 1 argument so it
would store the pointer in private-data of the iio_dev belonging to the
manually instantiated i2c-client, leading to the bmc150_accel_remove()
call for the second_dev trying to unregister *itself* while it was
being removed, leading to a deadlock and rmmod hanging.

Change bmc150_set_second_device() to take 2 arguments: 1. The i2c-client
which is instantiating the second i2c-client for the 2nd accelerometer and
2. The second-device pointer itself (which also is an i2c-client).

This will store the second_device pointer in the private data of the
iio_dev belonging to the (ACPI instantiated) i2c-client for the first
accelerometer and will make bmc150_accel_remove() unregister the
second_device i2c-client when called for the first client,
avoiding the deadlock.

Fixes: 5bfb3a4bd8f6 ("iio: accel: bmc150: Check for a second ACPI device for BOSC0200")
Cc: Jeremy Cline <jeremy@jcline.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-core.c | 4 ++--
 drivers/iio/accel/bmc150-accel-i2c.c  | 2 +-
 drivers/iio/accel/bmc150-accel.h      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 3a3f67930165..8ff358c37a81 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -1815,11 +1815,11 @@ struct i2c_client *bmc150_get_second_device(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(bmc150_get_second_device);
 
-void bmc150_set_second_device(struct i2c_client *client)
+void bmc150_set_second_device(struct i2c_client *client, struct i2c_client *second_dev)
 {
 	struct bmc150_accel_data *data = iio_priv(i2c_get_clientdata(client));
 
-	data->second_device = client;
+	data->second_device = second_dev;
 }
 EXPORT_SYMBOL_GPL(bmc150_set_second_device);
 
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 69f709319484..2afaae0294ee 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -70,7 +70,7 @@ static int bmc150_accel_probe(struct i2c_client *client,
 
 		second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
 		if (!IS_ERR(second_dev))
-			bmc150_set_second_device(second_dev);
+			bmc150_set_second_device(client, second_dev);
 	}
 #endif
 
diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index 6024f15b9700..e30c1698f6fb 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -18,7 +18,7 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 			    const char *name, bool block_supported);
 int bmc150_accel_core_remove(struct device *dev);
 struct i2c_client *bmc150_get_second_device(struct i2c_client *second_device);
-void bmc150_set_second_device(struct i2c_client *second_device);
+void bmc150_set_second_device(struct i2c_client *client, struct i2c_client *second_dev);
 extern const struct dev_pm_ops bmc150_accel_pm_ops;
 extern const struct regmap_config bmc150_regmap_conf;
 
-- 
2.31.1

