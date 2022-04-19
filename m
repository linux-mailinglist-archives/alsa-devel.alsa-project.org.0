Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C950B8A3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43802846;
	Fri, 22 Apr 2022 15:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43802846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634599;
	bh=/w2/TuJUuh8aAeAb2m2RYQ0ha5XDa7wX5MqtonXBziw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDB10OZYSmtxI6faGVyh7hlf1eBSsMhHLcb2QlqwDHwn/RRcFfnd5PfWCC3X+I8zk
	 TCG4ATTUp1ywP9Xu6tMmyGq8u/h/2vyX0X15lGI3AhCXphoTy/8YFMeS3ws6XABxrR
	 tFwHhr4pjDVK0TWoHoaJWtNCPvipaL/9Zq3uLCP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFD6F8056F;
	Fri, 22 Apr 2022 15:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A6CF80121; Tue, 19 Apr 2022 18:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E03F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E03F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JSa8soCO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 714FA617D1;
 Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23EEC385AB;
 Tue, 19 Apr 2022 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386346;
 bh=/w2/TuJUuh8aAeAb2m2RYQ0ha5XDa7wX5MqtonXBziw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSa8soCOWoHbvEvEMCJM5/utpcask8B1DWr5x2vp91tbyaynmX0rTSsEKOTeoQHXR
 xSRS3Xno7rnCUQ3pMwm4mb0C5Nn4Un3kthir4lze9lCf7arGoOqvJyX6s9isYF1BTg
 81xrpPmbsNyOwda4gry9Su9QAWOc6aLDIvSCivZ6D7ALqa5hnnFk8qqp6WGo4H0jz/
 n3cmV2yg+Hsqp/2KBOQWv4OG8fsDhuMeF3RquJVsVmQ3r03jGQ5Jb/kE9Eg+MfTnPV
 0fhh0N+QRSE/UK4kqmfvj+oYMYiI2cyul44m5sN6XHaZpuap2KcE/Ox9+lUvfY7liW
 OcEgijUbKxbQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/48] ARM: pxa: make mainstone.h private
Date: Tue, 19 Apr 2022 18:37:24 +0200
Message-Id: <20220419163810.2118169-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

From: Arnd Bergmann <arnd@arndb.de>

No driver includes this any more, so don't expose it globally.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                    | 2 +-
 arch/arm/mach-pxa/{include/mach => }/mainstone.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/mainstone.h (99%)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index d237bd030238..997f6e502201 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -45,7 +45,7 @@
 #include <asm/mach/flash.h>
 
 #include "pxa27x.h"
-#include <mach/mainstone.h>
+#include "mainstone.h"
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/mainstone.h b/arch/arm/mach-pxa/mainstone.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/mainstone.h
rename to arch/arm/mach-pxa/mainstone.h
index 1698f2ffd7c7..ba003742e003 100644
--- a/arch/arm/mach-pxa/include/mach/mainstone.h
+++ b/arch/arm/mach-pxa/mainstone.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/mach-pxa/include/mach/mainstone.h
- *
  *  Author:	Nicolas Pitre
  *  Created:	Nov 14, 2002
  *  Copyright:	MontaVista Software Inc.
-- 
2.29.2

