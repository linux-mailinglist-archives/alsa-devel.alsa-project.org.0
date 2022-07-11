Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D156FD53
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 11:54:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105E083B;
	Mon, 11 Jul 2022 11:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105E083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657533257;
	bh=mioNk0tvPDP7UvyjGTwFiy0EVcTJtI65Soj89fFF8yE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GOwTWHwE6QT/3TCwdtVRypXzF3BOtZeeufPTTd6ENkGTSlc/NZeP5SK61aoea6YGt
	 9OoF1oXvMPS4BFJLnSIbqLl+h6/z3yn6Ud9YeCnGW5Xh6Cao8HVKuzCFkdDXu36qon
	 MmjNCNEzEYeg/HYSjKniEY3QPQOypJYCsrE6Bfl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82748F80163;
	Mon, 11 Jul 2022 11:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EEEAF804FC; Mon, 11 Jul 2022 11:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8136F80256
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8136F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Io9n1Nm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657533150; x=1689069150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mioNk0tvPDP7UvyjGTwFiy0EVcTJtI65Soj89fFF8yE=;
 b=Io9n1Nm1mHWvcF1qN6HBh+EeOjJJIr5YcoLjUblyHrT2Y3jiIRjppDWO
 uCkvn6Bx5HaSAv3rAc+CTCIU4UY405w1TCg5NJtF4BtIJ3oax7j9O9wVt
 NS8KYHxkTv/X1Mqgliw6uV5PDcWfsjkq6esvUeOjX9cKYPmWxA8xn6zjM
 akKvqYs+K+k5nx4WRXKUZnqN0EONcgvuqE3dGlQB1S7LqL7mJW6Ib+9Aa
 6hLX4oBu04O840kEDxGiPAUJnG5fP29CbrvyyYx9dHfKd5S94xfokQ1Ss
 XS0dOMyThovsMb3i9qFw3zEdi1w6yyCIiPw3aOPVa2fPkp0zCvoPIOCaE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="283374562"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="283374562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 02:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="737035121"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2022 02:52:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7C029481; Mon, 11 Jul 2022 12:52:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v1 3/4] ALSA: hda: cs35l41: Drop wrong use of ACPI_PTR()
Date: Mon, 11 Jul 2022 12:52:18 +0300
Message-Id: <20220711095219.36915-3-andriy.shevchenko@linux.intel.com>
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

ACPI_PTR() is more harmful than helpful. For example, in this case
if CONFIG_ACPI=n, the ID table left unused which is not what we want.

Instead of adding ifdeffery or attribute here and there, drop ACPI_PTR().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/cs35l41_hda_i2c.c | 8 +++-----
 sound/pci/hda/cs35l41_hda_spi.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index e810b278fb91..5cfb5aac37ac 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -6,9 +6,9 @@
 //
 // Author: Lucas Tanure <tanureal@opensource.cirrus.com>
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
-#include <linux/acpi.h>
 
 #include "cs35l41_hda.h"
 
@@ -42,19 +42,17 @@ static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
 	{}
 };
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l41_acpi_hda_match[] = {
 	{"CLSA0100", 0 },
 	{"CSC3551", 0 },
-	{ },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_hda_match);
-#endif
 
 static struct i2c_driver cs35l41_i2c_driver = {
 	.driver = {
 		.name		= "cs35l41-hda",
-		.acpi_match_table = ACPI_PTR(cs35l41_acpi_hda_match),
+		.acpi_match_table = cs35l41_acpi_hda_match,
 	},
 	.id_table	= cs35l41_hda_i2c_id,
 	.probe		= cs35l41_hda_i2c_probe,
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 22e088f28438..c9a61675c4fd 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -6,7 +6,7 @@
 //
 // Author: Lucas Tanure <tanureal@opensource.cirrus.com>
 
-#include <linux/acpi.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
 
@@ -38,18 +38,16 @@ static const struct spi_device_id cs35l41_hda_spi_id[] = {
 	{}
 };
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l41_acpi_hda_match[] = {
 	{ "CSC3551", 0 },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_hda_match);
-#endif
 
 static struct spi_driver cs35l41_spi_driver = {
 	.driver = {
 		.name		= "cs35l41-hda",
-		.acpi_match_table = ACPI_PTR(cs35l41_acpi_hda_match),
+		.acpi_match_table = cs35l41_acpi_hda_match,
 	},
 	.id_table	= cs35l41_hda_spi_id,
 	.probe		= cs35l41_hda_spi_probe,
-- 
2.35.1

