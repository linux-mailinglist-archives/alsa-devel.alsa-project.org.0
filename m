Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BD2E32D5
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2501754;
	Sun, 27 Dec 2020 22:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2501754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103771;
	bh=LNQWr1wGi1Fdirec6U/n9yVnpV6ANUw/vSAa5Yu80t4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWE0Ah6R7QFFIEoLo/i3qAWmgc+vRSHFHEsM7L9O9xk3EhJegTocDZ0t8RY2OmHFy
	 u63e2q6u4lfdbaMuBIQtta6++ZtM/sP1wbkNyVwSB2mUngG043gbXAtKXPV7TfS3/R
	 f4yZwp8XJTwPgztChS6NgNTxO82h5fLzBGw4aRkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 080A6F804E7;
	Sun, 27 Dec 2020 22:13:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4C0CF80279; Sun, 27 Dec 2020 22:12:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F383F8020C
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F383F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YAqqiWti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvFJh0Qn1ycOxxwBE4kQRIv/qlxm9GSq3qk1YZJCsBI=;
 b=YAqqiWtipAtR20BEantkmJIA8r0QwK0XwXwvbPihXrtWiFhJbW89LN18APO/CY6OZ7Upfr
 qk0VG25iVUJvzKAgWcQcPWYUK7Z6oPMiKq/06OAuu84lao8y7fk6vIz+XKd9Vcrx0eiVtY
 eTOp0sGNBfYMIMnLqykfXZ2/hLYcJek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-2-wQVVySM4mPqReCKZ943A-1; Sun, 27 Dec 2020 16:12:48 -0500
X-MC-Unique: 2-wQVVySM4mPqReCKZ943A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C69800D53;
 Sun, 27 Dec 2020 21:12:46 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB641ACB9;
 Sun, 27 Dec 2020 21:12:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 04/14] mfd: arizona: Allow building arizona MFD-core as module
Date: Sun, 27 Dec 2020 22:12:22 +0100
Message-Id: <20201227211232.117801-5-hdegoede@redhat.com>
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

There is no reason why the arizona core,irq and codec model specific
regmap bits cannot be build as a module. All they do is export symbols
which are used by the arizona-spi and/or arizona-i2c modules, which
themselves can be built as module.

Change the Kconfig and Makefile arizona bits so that the arizona MFD-core
can be built as a module.

This is especially useful on x86 platforms with a WM5102 codec, this
allows the arizona MFD driver necessary for the WM5102 codec to be
enabled in generic distro-kernels without growing the base kernel-image
size.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/Kconfig        |  2 +-
 drivers/mfd/Makefile       | 14 +++++++-------
 drivers/mfd/arizona-core.c |  2 ++
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index cc0b73280c68..8fe9e10eaf51 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1831,7 +1831,7 @@ config MFD_ARIZONA
 	select REGMAP
 	select REGMAP_IRQ
 	select MFD_CORE
-	bool
+	tristate
 
 config MFD_ARIZONA_I2C
 	tristate "Cirrus Logic/Wolfson Microelectronics Arizona platform with I2C"
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 14fdb188af02..3f208af1664f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -41,24 +41,24 @@ obj-$(CONFIG_MFD_TQMX86)	+= tqmx86.o
 
 obj-$(CONFIG_MFD_LOCHNAGAR)	+= lochnagar-i2c.o
 
-obj-$(CONFIG_MFD_ARIZONA)	+= arizona-core.o
-obj-$(CONFIG_MFD_ARIZONA)	+= arizona-irq.o
+arizona-objs			:= arizona-core.o arizona-irq.o
+obj-$(CONFIG_MFD_ARIZONA)	+= arizona.o
 obj-$(CONFIG_MFD_ARIZONA_I2C)	+= arizona-i2c.o
 obj-$(CONFIG_MFD_ARIZONA_SPI)	+= arizona-spi.o
 ifeq ($(CONFIG_MFD_WM5102),y)
-obj-$(CONFIG_MFD_ARIZONA)	+= wm5102-tables.o
+arizona-objs			+= wm5102-tables.o
 endif
 ifeq ($(CONFIG_MFD_WM5110),y)
-obj-$(CONFIG_MFD_ARIZONA)	+= wm5110-tables.o
+arizona-objs			+= wm5110-tables.o
 endif
 ifeq ($(CONFIG_MFD_WM8997),y)
-obj-$(CONFIG_MFD_ARIZONA)	+= wm8997-tables.o
+arizona-objs			+= wm8997-tables.o
 endif
 ifeq ($(CONFIG_MFD_WM8998),y)
-obj-$(CONFIG_MFD_ARIZONA)	+= wm8998-tables.o
+arizona-objs			+= wm8998-tables.o
 endif
 ifeq ($(CONFIG_MFD_CS47L24),y)
-obj-$(CONFIG_MFD_ARIZONA)	+= cs47l24-tables.o
+arizona-objs			+= cs47l24-tables.o
 endif
 obj-$(CONFIG_MFD_WCD934X)	+= wcd934x.o
 obj-$(CONFIG_MFD_WM8400)	+= wm8400-core.o
diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 000cb82023e3..a9ba1c865abf 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -1478,3 +1478,5 @@ int arizona_dev_exit(struct arizona *arizona)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_dev_exit);
+
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

