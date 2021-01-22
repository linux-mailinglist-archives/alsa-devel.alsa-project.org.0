Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B63008DB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9502E16F0;
	Fri, 22 Jan 2021 17:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9502E16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611333927;
	bh=MQi/L+uTmOu+MHoi0A/jm1h5pJlHO8P3QAYnGYoM8JU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuZCR7dur7Ia0njNEpH6N6qXn5B7RtWv5eFVB3qPTAH06kTDYmzqZwN4mzdVCZlMS
	 FJo8LxBLVPcAMG1GguHaDBtFu63jKjxlvF2YUaJEkZ5KqBX7cRHjvcihrYruFy+rsg
	 EjkN88X7MF46BZhFh7vCHpkVRvRL1C2qTyjplAIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AAE5F8050F;
	Fri, 22 Jan 2021 17:41:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C048F804F2; Fri, 22 Jan 2021 17:41:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2550BF804EC
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2550BF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="a8DX6Idk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611333693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0VojRzSy490aBML4/rZV75ApQCa+iSFPYiEu/SMJlM=;
 b=a8DX6Idkid+Fjk60dYEqmx/5oxUanmSApT5QgjCAMFBhcANzYAi0UBJKcriiS1fkuLPTH2
 asxhfcrnN3HtSevXGlZIkl1chhzvtrd1BjKNwQ7DMc93AcDPIgiC8lANEADdxYVkzbHptT
 s5NxlICeSTSiRTTJQAtlXor2014tk08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-n8kVeyW8P9SWJhJz6QWvYA-1; Fri, 22 Jan 2021 11:41:31 -0500
X-MC-Unique: n8kVeyW8P9SWJhJz6QWvYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B04510054FF;
 Fri, 22 Jan 2021 16:41:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5787260916;
 Fri, 22 Jan 2021 16:41:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 06/13] ASoC/extcon: arizona: Move arizona jack code to
 sound/soc/codecs/arizona-jack.c
Date: Fri, 22 Jan 2021 17:41:00 +0100
Message-Id: <20210122164107.361939-7-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-1-hdegoede@redhat.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Changes in v3:
- Fold the 2 separate patches to add a copy of extcon-arizona.c as
  sound/soc/codecs/arizona-jack.c and the follow up patch to remove the
  extcon driver into 1 patch simply moving the extcon driver code.
---
 MAINTAINERS                                               | 1 -
 drivers/extcon/Kconfig                                    | 8 --------
 drivers/extcon/Makefile                                   | 1 -
 .../extcon-arizona.c => sound/soc/codecs/arizona-jack.c   | 0
 4 files changed, 10 deletions(-)
 rename drivers/extcon/extcon-arizona.c => sound/soc/codecs/arizona-jack.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 036a03c794de..270661fcdb78 100644
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
2.28.0

