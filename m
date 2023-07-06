Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B711749B07
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4249F84A;
	Thu,  6 Jul 2023 13:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4249F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688643842;
	bh=7V0IiqwCRKVXTRZ+4Acio3NJxJf7pXTiiEWwWpMKguk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lJkkf0vgNlHhttoEX8blEHndbGdRYxRDEFjmRPIU8S7fWTe75mR1PKpin1WaImCaa
	 KJ78bdqQfhb7kG6KpZTRum+06X6owF0SilBuzcQ+JkD4Yq7dYJQ0Qs8I3anhd85ygG
	 XAe6Ohzh7K/Ba6nL9EIOHIf335lUYl8Wxd/iCApc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0BAF80548; Thu,  6 Jul 2023 13:42:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BFE1F80548;
	Thu,  6 Jul 2023 13:42:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 630BAF80093; Thu,  6 Jul 2023 13:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15F99F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F99F80093
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
	by michel.telenet-ops.be with bizsmtp
	id Hni62A00145Xpxs06ni620; Thu, 06 Jul 2023 13:42:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qHNN3-000faq-HA;
	Thu, 06 Jul 2023 13:42:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qHNN7-000QkF-Ro;
	Thu, 06 Jul 2023 13:42:05 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] regmap: Replace "default y if" by select
Date: Thu,  6 Jul 2023 13:42:02 +0200
Message-Id: 
 <525c37a568b10623ffb2d108850afd7e37f9350e.1688643442.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688643442.git.geert@linux-m68k.org>
References: <cover.1688643442.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FMX3LUBE2V3ALOJE7C3QDWFJMQ5IHCCK
X-Message-ID-Hash: FMX3LUBE2V3ALOJE7C3QDWFJMQ5IHCCK
X-MailFrom: geert@linux-m68k.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMX3LUBE2V3ALOJE7C3QDWFJMQ5IHCCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Merely setting the default to enabled is no guarantee that a Kconfig
option is actually enabled.  While this works for an invisible option,
the user can still disable it manually if the option is visible.
Hence since the REGMAP option was made visible if KUNIT_ALL_TESTS is
enabled, the user can now manually disable REGMAP, causing build
failures if any of the REGMAP_* configuration options are enabled.

Fix this by replacing "default y if ..." by individual "select REGMAP"
statements for all users.

Fixes: 70a640c0efa76674 ("regmap: REGMAP_KUNIT should not select REGMAP")
Reported-by: Benjamin Gray <bgray@linux.ibm.com>
Closes: https://lore.kernel.org/r/20230705003024.1486757-1-bgray@linux.ibm.com
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Closes: https://lore.kernel.org/r/d8437dd4-63b6-13fb-22fd-9b92c661071c@csgroup.eu
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/base/regmap/Kconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 0db2021f7477f2ab..e25cc619c75de3d9 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -5,7 +5,6 @@
 
 config REGMAP
 	bool "Register Map support" if KUNIT_ALL_TESTS
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	select MDIO_BUS if REGMAP_MDIO
 	help
@@ -25,10 +24,12 @@ config REGMAP_KUNIT
 
 config REGMAP_AC97
 	tristate
+	select REGMAP
 
 config REGMAP_I2C
 	tristate
 	depends on I2C
+	select REGMAP
 
 config REGMAP_SLIMBUS
 	tristate
@@ -37,23 +38,29 @@ config REGMAP_SLIMBUS
 config REGMAP_SPI
 	tristate
 	depends on SPI
+	select REGMAP
 
 config REGMAP_SPMI
 	tristate
 	depends on SPMI
+	select REGMAP
 
 config REGMAP_W1
 	tristate
 	depends on W1
+	select REGMAP
 
 config REGMAP_MDIO
 	tristate
+	select REGMAP
 
 config REGMAP_MMIO
 	tristate
+	select REGMAP
 
 config REGMAP_IRQ
 	bool
+	select REGMAP
 
 config REGMAP_RAM
 	tristate
@@ -61,23 +68,29 @@ config REGMAP_RAM
 config REGMAP_SOUNDWIRE
 	tristate
 	depends on SOUNDWIRE
+	select REGMAP
 
 config REGMAP_SOUNDWIRE_MBQ
 	tristate
 	depends on SOUNDWIRE
+	select REGMAP
 
 config REGMAP_SCCB
 	tristate
 	depends on I2C
+	select REGMAP
 
 config REGMAP_I3C
 	tristate
 	depends on I3C
+	select REGMAP
 
 config REGMAP_SPI_AVMM
 	tristate
 	depends on SPI
+	select REGMAP
 
 config REGMAP_FSI
 	tristate
 	depends on FSI
+	select REGMAP
-- 
2.34.1

