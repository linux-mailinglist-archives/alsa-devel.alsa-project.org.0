Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1C38CBD2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 19:17:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488C116D0;
	Fri, 21 May 2021 19:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488C116D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621617464;
	bh=9ORgZTMH/+S0155mYHUZ0iKppzwdMgSojLkWPu1sJSI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLvS6XvZXarcPl88E8hhLsM1yMl1rhAwz2pNHBPzuc8sBje6lubK66n8K+UoJWBqj
	 6Sn5oaJlYUEsRlkb5eooZuN89jFKk2Pxv8Hrbn8KSgdjrgHMj2zXEmkNfue85dhcab
	 qDvrxduaLtveUdaX+MbPsyDCYxn1tn81npIabE5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8111DF804B0;
	Fri, 21 May 2021 19:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAED6F80430; Fri, 21 May 2021 19:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ADB1F80259
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 19:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADB1F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FiRgaJwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fFjcUtzMReY73BfFJI/Z8RNbe9NqtwA0zqMyc2zXSs=;
 b=FiRgaJwl7EXomIbYu45bKEtLVbk0iw3/b1oNQ1VBtM6jI0C5xqGOsnctg2Nk2utZxHx8yI
 QtZRs0vrg/UvtIrC/oaIUvMyAdeWgpgMY0uOEPR2Hc7TtR1xxGwwyNQX/XRUX2bdXNYugp
 ncvV7rlc7hyvx6szqjrQNhHLOIDOy5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-vDq6zOIoN7azK5Y-8uxUSg-1; Fri, 21 May 2021 13:14:32 -0400
X-MC-Unique: vDq6zOIoN7azK5Y-8uxUSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA0308042AA;
 Fri, 21 May 2021 17:14:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-187.ams2.redhat.com [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022AE10013D6;
 Fri, 21 May 2021 17:14:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jonathan Cameron <jic23@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/8] iio: accel: bmc150: Add support for dual-accelerometers
 with a DUAL250E HID
Date: Fri, 21 May 2021 19:14:14 +0200
Message-Id: <20210521171418.393871-5-hdegoede@redhat.com>
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

The Lenovo Yoga 300-11IBR has a ACPI fwnode with a HID of DUAL250E
which contains I2C and IRQ resources for 2 accelerometers, 1 in the
display and one in the base of the device. Add support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/iio/accel/bmc150-accel-i2c.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index e24ce28a4660..b81e4005788e 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -24,6 +24,7 @@
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
 	{"BOSC0200"},
+	{"DUAL250E"},
 	{ },
 };
 
@@ -35,21 +36,24 @@ static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct i2c_client *second_dev;
+	char dev_name[16];
 	struct i2c_board_info board_info = {
 		.type = "bmc150_accel",
-		/*
-		 * The 2nd accel sits in the base of 2-in-1s. Note this
-		 * name is static, as there should never be more then 1
-		 * BOSC0200 ACPI node with 2 accelerometers in it.
-		 */
-		.dev_name = "BOSC0200:base",
+		.dev_name = dev_name,
 		.fwnode = client->dev.fwnode,
-		.irq = -ENOENT,
 	};
 
 	if (acpi_match_device_ids(adev, bmc150_acpi_dual_accel_ids))
 		return;
 
+	/*
+	 * The 2nd accel sits in the base of 2-in-1s. The suffix is static, as
+	 * there should never be more then 1 ACPI node with 2 accelerometers in it.
+	 */
+	snprintf(dev_name, sizeof(dev_name), "%s:base", acpi_device_hid(adev));
+
+	board_info.irq = acpi_dev_gpio_irq_get_by(adev, NULL, 1);
+
 	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
 	if (!IS_ERR(second_dev))
 		bmc150_set_second_device(client, second_dev);
@@ -114,6 +118,7 @@ static const struct acpi_device_id bmc150_accel_acpi_match[] = {
 	{"BMA222E",	bma222e},
 	{"BMA0280",	bma280},
 	{"BOSC0200"},
+	{"DUAL250E"},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);
-- 
2.31.1

