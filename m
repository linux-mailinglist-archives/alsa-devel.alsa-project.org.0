Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD330150D
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 13:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E0F1AF8;
	Sat, 23 Jan 2021 13:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E0F1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611404214;
	bh=yxgPs1kcwoOkomQHbK/G7nhjbC4CAOJSbCB5sYOB9F8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8uxKAW9PTVwfwQ68rTRctczXRKVfIF7aAoF+7dWhp9BnZn7xP0f15gsLym7APjBB
	 SjKxHBcD/rLnU+P08vm2I1OpHtH9MnvV5REKY2E9pA6NdwIJvYiu3nW/DLRMaZKvbI
	 JWVjLTxu7rfCe2bOeIk7QhHaZjRd4OhnUL9JYDBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF97F804E4;
	Sat, 23 Jan 2021 13:13:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F437F800FD; Sat, 23 Jan 2021 13:13:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49785F804C3
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 13:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49785F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="CsJU1L7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611404015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFXYvyZ0CLcvB3R48S1XXO1n1GmYgmgWHpO6/q9B+/s=;
 b=CsJU1L7z69EpuE6zhquarLMnKlwqivUk6R8ULhcgMjUlV83QC3NhltCxCP6VXRpzFqqluF
 f6Dl74yKkjwZGRoXJBkdSVPs+5tnnsf62xp83sfg0ahO8/+8EELs7XrfzwSzVPg6Y39//T
 UXWLuaFisQFUvIRU7NDeU3ioQxWkxV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-91UtL8GSMf6hEMYN07eiTA-1; Sat, 23 Jan 2021 07:13:33 -0500
X-MC-Unique: 91UtL8GSMf6hEMYN07eiTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0736910054FF;
 Sat, 23 Jan 2021 12:13:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6BF8189B8;
 Sat, 23 Jan 2021 12:13:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 06/13] ASoC/extcon: arizona: Move arizona jack code to
 sound/soc/codecs/arizona-jack.c
Date: Sat, 23 Jan 2021 13:13:06 +0100
Message-Id: <20210123121313.79530-7-hdegoede@redhat.com>
In-Reply-To: <20210123121313.79530-1-hdegoede@redhat.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

The jack handling for arizona codecs is being refactored so that it is
done directly by the codec drivers, instead of having an extcon-driver
bind to a separate "arizona-extcon" child-device for this.

drivers/mfd/arizona-core.c has already been updated to no longer
instantiate an "arizona-extcon" child-device for the arizona codecs.

This means that the "arizona-extcon" driver is no longer useful
(there are no longer any devices for it to bind to).

This commit drops the extcon Kconfig / Makefile bits and moves
drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c .

This is a preparation patch for converting the arizona extcon-driver into
a helper library for letting the arizona codec-drivers directly report jack
state through the standard sound/soc/soc-jack.c functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Add sound/soc/codecs/arizona-jack.c to the WOLFSON MICROELECTRONICS DRIVERS
  MAINTAINERS section

Changes in v3:
- Fold the 2 separate patches to add a copy of extcon-arizona.c as
  sound/soc/codecs/arizona-jack.c and the follow up patch to remove the
  extcon driver into 1 patch simply moving the extcon driver code.
---
 MAINTAINERS                                               | 3 +--
 drivers/extcon/Kconfig                                    | 8 --------
 drivers/extcon/Makefile                                   | 1 -
 .../extcon-arizona.c => sound/soc/codecs/arizona-jack.c   | 0
 4 files changed, 1 insertion(+), 11 deletions(-)
 rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 036a03c794de..873817694fd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19249,7 +19249,6 @@ F:	Documentation/devicetree/bindings/sound/wlf,arizona.yaml
 F:	Documentation/hwmon/wm83??.rst
 F:	arch/arm/mach-s3c/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
-F:	drivers/extcon/extcon-arizona.c
 F:	drivers/gpio/gpio-*wm*.c
 F:	drivers/gpio/gpio-arizona.c
 F:	drivers/hwmon/wm83??-hwmon.c
@@ -19273,7 +19272,7 @@ F:	include/linux/mfd/wm8400*
 F:	include/linux/regulator/arizona*
 F:	include/linux/wm97xx.h
 F:	include/sound/wm????.h
-F:	sound/soc/codecs/arizona.?
+F:	sound/soc/codecs/arizona*
 F:	sound/soc/codecs/cs47l24*
 F:	sound/soc/codecs/wm*
 
diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index af58ebca2bf6..e3db936becfd 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -21,14 +21,6 @@ config EXTCON_ADC_JACK
 	help
 	  Say Y here to enable extcon device driver based on ADC values.
 
-config EXTCON_ARIZONA
-	tristate "Wolfson Arizona EXTCON support"
-	depends on MFD_ARIZONA && INPUT && SND_SOC
-	help
-	  Say Y here to enable support for external accessory detection
-	  with Wolfson Arizona devices. These are audio CODECs with
-	  advanced audio accessory detection support.
-
 config EXTCON_AXP288
 	tristate "X-Power AXP288 EXTCON support"
 	depends on MFD_AXP20X && USB_SUPPORT && X86 && ACPI
diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
index fe10a1b7d18b..1b390d934ca9 100644
--- a/drivers/extcon/Makefile
+++ b/drivers/extcon/Makefile
@@ -6,7 +6,6 @@
 obj-$(CONFIG_EXTCON)		+= extcon-core.o
 extcon-core-objs		+= extcon.o devres.o
 obj-$(CONFIG_EXTCON_ADC_JACK)	+= extcon-adc-jack.o
-obj-$(CONFIG_EXTCON_ARIZONA)	+= extcon-arizona.o
 obj-$(CONFIG_EXTCON_AXP288)	+= extcon-axp288.o
 obj-$(CONFIG_EXTCON_FSA9480)	+= extcon-fsa9480.o
 obj-$(CONFIG_EXTCON_GPIO)	+= extcon-gpio.o
diff --git a/drivers/extcon/extcon-arizona.c b/sound/soc/codecs/arizona-jack.c
similarity index 100%
rename from drivers/extcon/extcon-arizona.c
rename to sound/soc/codecs/arizona-jack.c
-- 
2.29.2

