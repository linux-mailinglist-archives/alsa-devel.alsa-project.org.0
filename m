Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D326D706
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 01:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35B871691;
	Fri, 19 Jul 2019 01:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35B871691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563491080;
	bh=q/lhWKxG7KyKBiHnOzew+Wk9Idxlmxu3SeAJOxB7/Ow=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YhpotOktn9oy6gMB7gHAEakkkZmsBPqdQ+abKGzvULrDCKs60ISlQYoUUkEjD4EHZ
	 LHjmu6AzL9dPaT85sGmVA8IlhldT2CMy35+nf7c4imoGenl2vLS/jiGa4U4zjlXn08
	 jjxfa4VcvzvNeYoHXcK6Fap/qr8yBOtpXStikvoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BC54F800D2;
	Fri, 19 Jul 2019 01:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68728F80362; Fri, 19 Jul 2019 01:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB1D5F800D2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 01:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1D5F800D2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 16:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="367512460"
Received: from jmendes-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.24.98])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2019 16:02:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2019 18:02:15 -0500
Message-Id: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and align
	with other serial links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The existing code has a mixed select/depend usage which makes no sense.

config SOUNDWIRE_BUS
       tristate
       select REGMAP_SOUNDWIRE

config REGMAP_SOUNDWIRE
        tristate
        depends on SOUNDWIRE_BUS

Let's remove one layer of Kconfig definitions and align with the
solutions used by all other serial links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/base/regmap/Kconfig | 2 +-
 drivers/soundwire/Kconfig   | 7 +------
 drivers/soundwire/Makefile  | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 6ad5ef48b61e..8cd2ac650b50 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -44,7 +44,7 @@ config REGMAP_IRQ
 
 config REGMAP_SOUNDWIRE
 	tristate
-	depends on SOUNDWIRE_BUS
+	depends on SOUNDWIRE
 
 config REGMAP_SCCB
 	tristate
diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 3a01cfd70fdc..f518273cfbe3 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -4,7 +4,7 @@
 #
 
 menuconfig SOUNDWIRE
-	bool "SoundWire support"
+	tristate "SoundWire support"
 	help
 	  SoundWire is a 2-Pin interface with data and clock line ratified
 	  by the MIPI Alliance. SoundWire is used for transporting data
@@ -17,17 +17,12 @@ if SOUNDWIRE
 
 comment "SoundWire Devices"
 
-config SOUNDWIRE_BUS
-	tristate
-	select REGMAP_SOUNDWIRE
-
 config SOUNDWIRE_CADENCE
 	tristate
 
 config SOUNDWIRE_INTEL
 	tristate "Intel SoundWire Master driver"
 	select SOUNDWIRE_CADENCE
-	select SOUNDWIRE_BUS
 	depends on X86 && ACPI && SND_SOC
 	help
 	  SoundWire Intel Master driver.
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index fd99a831b92a..45b7e5001653 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -5,7 +5,7 @@
 
 #Bus Objs
 soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
-obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
+obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
 #Cadence Objs
 soundwire-cadence-objs := cadence_master.o
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
