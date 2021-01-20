Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086202FDC17
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 22:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F05E1777;
	Wed, 20 Jan 2021 22:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F05E1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611179516;
	bh=GhU8PGO1+yx8Njokzd23JuRMxpfYiQ6QA0BKKiNBVyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFPfJU1b8JY0PI/gYmE5UEZT3dVtuXEtUJ1W6V39GIzF3XD8JC2UYS9O+d/Bafkfg
	 EV6Ngqp99y9d1LhEsALiFIf34hvqsd4QFDiTnzSf1L9RiUM7vOLgCbbzDW45Qm4bTH
	 mr3ltewp01AdWtvK4+cV0SCmZhnas0f1HmPL2gXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B11F8012C;
	Wed, 20 Jan 2021 22:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE46F804B2; Wed, 20 Jan 2021 22:50:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AAA8F8019B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AAA8F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Brg3nKvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611179409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwWb/jzvcF0HeOiU902re41Et7/qhlMHI34fzUY/I1I=;
 b=Brg3nKvJjCzp9VKIsxNJ6JMirvDCvHayOqJa6sEkKBbH13Ijy8e994svvQneQOVRdrjrHd
 5BPjgX+BUxNNnjvYlQatFKQP6JiEhvwrKyQSPn2230f5vDZPSlxYKBtQyIUYK+4sB4GHWd
 UWBLkRXqeTNyEgTsgSbzPmR5ajCm8mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-DW4KbaaFP52ECPAscXvJHw-1; Wed, 20 Jan 2021 16:50:06 -0500
X-MC-Unique: DW4KbaaFP52ECPAscXvJHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F18051BE;
 Wed, 20 Jan 2021 21:50:04 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9C6627DD;
 Wed, 20 Jan 2021 21:50:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 1/5] mfd: arizona: Add MODULE_SOFTDEP("pre: arizona_ldo1")
Date: Wed, 20 Jan 2021 22:49:53 +0100
Message-Id: <20210120214957.140232-2-hdegoede@redhat.com>
In-Reply-To: <20210120214957.140232-1-hdegoede@redhat.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

The (shared) probing code of the arizona-i2c and arizona-spi modules
takes the following steps during init:

1. Call mfd_add_devices() for a set of early child-devices, this
includes the arizona_ldo1 device which provides one of the
core-regulators.

2. Bulk enable the core-regulators.

3. Read the device id.

4. Call mfd_add_devices() for the other child-devices.

This sequence depends on 1. leading to not only the child-device
being created, but also the driver for the child-device binding
to it and registering its regulator.

This requires the arizona_ldo1 driver to be loaded before the
shared probing code runs. Add a softdep for this to both modules to
ensure that this requirement is met.

Note this mirrors the existing MODULE_SOFTDEP("pre: wm8994_regulator")
in the wm8994 code, which has a similar init sequence.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/arizona-i2c.c | 1 +
 drivers/mfd/arizona-spi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
index 4b58e3ad6eb6..2a4a3a164d0a 100644
--- a/drivers/mfd/arizona-i2c.c
+++ b/drivers/mfd/arizona-i2c.c
@@ -115,6 +115,7 @@ static struct i2c_driver arizona_i2c_driver = {
 
 module_i2c_driver(arizona_i2c_driver);
 
+MODULE_SOFTDEP("pre: arizona_ldo1");
 MODULE_DESCRIPTION("Arizona I2C bus interface");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index 2633e147b76c..704f214d2614 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -110,6 +110,7 @@ static struct spi_driver arizona_spi_driver = {
 
 module_spi_driver(arizona_spi_driver);
 
+MODULE_SOFTDEP("pre: arizona_ldo1");
 MODULE_DESCRIPTION("Arizona SPI bus interface");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_LICENSE("GPL");
-- 
2.28.0

