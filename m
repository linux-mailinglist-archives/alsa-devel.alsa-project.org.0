Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A572F9574
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 22:24:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9B2176F;
	Sun, 17 Jan 2021 22:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9B2176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610918692;
	bh=3Y4PjJfeiwnk+hOrYWtklS0p8bt+jT8fjwKcmcesI/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsVv/fnO8EHrAJmAmtB+3ovUXMQGamRd5D+tCAY3WMPctEJXHeNi3Eu2q7ocGWjz/
	 hyHoTkYj1LUZ/7ThA63tgdMh+Zt27fSAtbMVv538+BvLj7YBtoueISLFtoOqXc9YpX
	 +ifI6gqp5zjLpqXpD4mBVYQfPD7LHLndW6iBSLOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 882FEF802BE;
	Sun, 17 Jan 2021 22:23:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55443F8029B; Sun, 17 Jan 2021 22:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F86F80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 22:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F86F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OsUTovpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610918585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOaqbIKSRS9ckIeSaq3IkbuULYGxEaXINEMbw0LKySc=;
 b=OsUTovpICNJqe6qcfyds0cjWOUQSGkTkd2J4PN5ao82E9e4qeUsfxtEsTKsL/z0IlAWIpv
 XImdqq9Rx4jT/6J3ncnfncGGDEdMR+2Ue/7SK4TwYvZe0Pa7goC2lzzIbjfChtUEIxjqYs
 k0Flr2I3KKbbmds0MfB44JgL9AA/d+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-__A6O-G6N9ifoupu4dAKPA-1; Sun, 17 Jan 2021 16:23:03 -0500
X-MC-Unique: __A6O-G6N9ifoupu4dAKPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5026A107ACE4;
 Sun, 17 Jan 2021 21:23:01 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24B151002388;
 Sun, 17 Jan 2021 21:22:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 2/5] mfd: arizona: Replace arizona_of_get_type() with
 device_get_match_data()
Date: Sun, 17 Jan 2021 22:22:49 +0100
Message-Id: <20210117212252.206115-3-hdegoede@redhat.com>
In-Reply-To: <20210117212252.206115-1-hdegoede@redhat.com>
References: <20210117212252.206115-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Replace the custom arizona_of_get_type() function with the generic
device_get_match_data() helper. Besides being a nice cleanup this
also makes it easier to add support for binding to ACPI enumerated
devices.

While at it also fix a possible NULL pointer deref of the id
argument to the probe functions (this could happen on e.g. manual
driver binding through sysfs).

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patchset
---
 drivers/mfd/arizona-core.c | 11 -----------
 drivers/mfd/arizona-i2c.c  | 10 ++++++----
 drivers/mfd/arizona-spi.c  | 10 ++++++----
 drivers/mfd/arizona.h      |  9 ---------
 4 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 000cb82023e3..75f1bc671d59 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -797,17 +797,6 @@ const struct dev_pm_ops arizona_pm_ops = {
 EXPORT_SYMBOL_GPL(arizona_pm_ops);
 
 #ifdef CONFIG_OF
-unsigned long arizona_of_get_type(struct device *dev)
-{
-	const struct of_device_id *id = of_match_device(arizona_of_match, dev);
-
-	if (id)
-		return (unsigned long)id->data;
-	else
-		return 0;
-}
-EXPORT_SYMBOL_GPL(arizona_of_get_type);
-
 static int arizona_of_get_core_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
index 2a4a3a164d0a..5e83b730c4ce 100644
--- a/drivers/mfd/arizona-i2c.c
+++ b/drivers/mfd/arizona-i2c.c
@@ -23,14 +23,16 @@
 static int arizona_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
 {
+	const void *match_data;
 	struct arizona *arizona;
 	const struct regmap_config *regmap_config = NULL;
-	unsigned long type;
+	unsigned long type = 0;
 	int ret;
 
-	if (i2c->dev.of_node)
-		type = arizona_of_get_type(&i2c->dev);
-	else
+	match_data = device_get_match_data(&i2c->dev);
+	if (match_data)
+		type = (unsigned long)match_data;
+	else if (id)
 		type = id->driver_data;
 
 	switch (type) {
diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index 704f214d2614..798b88295c77 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -23,14 +23,16 @@
 static int arizona_spi_probe(struct spi_device *spi)
 {
 	const struct spi_device_id *id = spi_get_device_id(spi);
+	const void *match_data;
 	struct arizona *arizona;
 	const struct regmap_config *regmap_config = NULL;
-	unsigned long type;
+	unsigned long type = 0;
 	int ret;
 
-	if (spi->dev.of_node)
-		type = arizona_of_get_type(&spi->dev);
-	else
+	match_data = device_get_match_data(&spi->dev);
+	if (match_data)
+		type = (unsigned long)match_data;
+	else if (id)
 		type = id->driver_data;
 
 	switch (type) {
diff --git a/drivers/mfd/arizona.h b/drivers/mfd/arizona.h
index 995efc6d7f32..801cbbcd71cb 100644
--- a/drivers/mfd/arizona.h
+++ b/drivers/mfd/arizona.h
@@ -50,13 +50,4 @@ int arizona_dev_exit(struct arizona *arizona);
 int arizona_irq_init(struct arizona *arizona);
 int arizona_irq_exit(struct arizona *arizona);
 
-#ifdef CONFIG_OF
-unsigned long arizona_of_get_type(struct device *dev);
-#else
-static inline unsigned long arizona_of_get_type(struct device *dev)
-{
-	return 0;
-}
-#endif
-
 #endif
-- 
2.28.0

