Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D42E32C1
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332C61739;
	Sun, 27 Dec 2020 22:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332C61739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103717;
	bh=3njuq9ucHrR5YabpyXyYIMjMxj5CnpzLNedMbusvVVA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHctTxrY6pr0y2O1zPdlkUNI5DrDy6Q1QPK3R98LkyZkMo47BRbWlggxkm5ijbV9L
	 Eze6Q2sZdFrOUDGSqZ8A3wYLmM8W8SGzeWdht75Jqf2pMlvGrE/3wsEAskR3/eaOlu
	 WlMw4EOj2jOPANYG32sC8TRWvQkTu0fzd+4TCi2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0030EF80279;
	Sun, 27 Dec 2020 22:12:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A74BF80085; Sun, 27 Dec 2020 22:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4B4F800C8
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4B4F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VM2ynAhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vm7Y8WgzRnmtdtSY9WnjMOrzj5tbdz7TQz37CAGCkhc=;
 b=VM2ynAhLcNE2aFPI601+O+SZoDaRubldL2WQfewEu/oAKTWGbxvRm/AKGId7sXwU6i9KN+
 QdwJ8UloemYOrjkUuIYW3r+zg7MG4AaJB5X1LJVK7zMvzw+3t2rIcWxQvXZIkcCqcRzFBA
 Y6PBnQ4F6szjhioEYEH/joZmElftq5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-gETInfbCN6GPEb1do1u5WQ-1; Sun, 27 Dec 2020 16:12:43 -0500
X-MC-Unique: gETInfbCN6GPEb1do1u5WQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B190107ACE4;
 Sun, 27 Dec 2020 21:12:41 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7A41ACB9;
 Sun, 27 Dec 2020 21:12:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/14] mfd: arizona: Add MODULE_SOFTDEP("pre: arizona_ldo1")
Date: Sun, 27 Dec 2020 22:12:20 +0100
Message-Id: <20201227211232.117801-3-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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
shared probing code runs. Add a doftdep for this to both modules to
ensure that this requirement is met.

Note this mirrors the existing MODULE_SOFTDEP("pre: wm8994_regulator")
in the wm8994 code, which has a similar init sequence.

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

