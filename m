Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52556FD52
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 11:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1607582A;
	Mon, 11 Jul 2022 11:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1607582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657533247;
	bh=IFixV8KBTV+chD2hbw0USw+m4VI10depIHGAYgCIDEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYG1OFF0CAkS0uUh1w+RrgCXZwt1aqaFjwctDBgCw6m0yvlmFHpTjSI3Mk4cNih8W
	 ThnGTnHXhAZ5lW/iUJ2c/aVHHYQv53CY5v3zTfJDETV4pkOoBQAsD3v3vUnCuqxcul
	 t6eG9kyMU5mddtmo5LaUjk9/rTXezL1SQm6BVqmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E5EF80542;
	Mon, 11 Jul 2022 11:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C11D4F8047C; Mon, 11 Jul 2022 11:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FAFF80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FAFF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EzDOFAAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657533148; x=1689069148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFixV8KBTV+chD2hbw0USw+m4VI10depIHGAYgCIDEc=;
 b=EzDOFAALLZ9Md5zznK/U8Wz9MRDGZYYL+QsdvdyUIz06Xd2R6UT81kCz
 RuV5Im5QyvX2TQhp6OOrAt/29vJPXSDSrSXVNUYaFfVsE9M1G4C0nesnB
 G03lEw6Z3knu4cRxeQZOjozYY2apQmKdUFbuHRIuIWqejRnkARaEaxMoX
 CEZeyrDsSCZgie0XjXSOI7IxOFyn/wo6CF8X6C4QyBHcMqHJUjrPhR6oZ
 cIX2J2cTWKZyBI5+DV6FmyZwWmbJkF8rfnqGi7Pe9hM3Y3MboZ6ZAkMbZ
 bUyuS6bt/35uc1ctV0venlrr/g9hmY7VWeYP3T1xz1wSv0nY2tMJRqy7T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="370930113"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="370930113"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 02:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="840953939"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2022 02:52:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 73BD5AD; Mon, 11 Jul 2022 12:52:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v1 2/4] ALSA: hda: cs35l41: Allow compilation test on non-ACPI
 configurations
Date: Mon, 11 Jul 2022 12:52:17 +0300
Message-Id: <20220711095219.36915-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
References: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>
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

ACPI is needed only for functioning of this codec on some platforms,
there is no compilation dependency, so make it optional

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 79ade4787d95..e86cf80bdf96 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -97,7 +97,7 @@ config SND_HDA_SCODEC_CS35L41
 config SND_HDA_SCODEC_CS35L41_I2C
 	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
 	depends on I2C
-	depends on ACPI
+	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
@@ -113,7 +113,7 @@ comment "Set to Y if you want auto-loading the side codec driver"
 config SND_HDA_SCODEC_CS35L41_SPI
 	tristate "Build CS35L41 HD-audio codec support for SPI Bus"
 	depends on SPI_MASTER
-	depends on ACPI
+	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
-- 
2.35.1

