Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F209F571F8A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 17:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95AF116BD;
	Tue, 12 Jul 2022 17:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95AF116BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657640249;
	bh=S2GftDn+xorE6UM3YzlFwuDAbmRpEb7074YgFP8dxNY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvuV2As//+fKxd2U5WHhK2wrY6XgYyxYON9JA6V5U8RzvHUxZ90YWaFfAsORyDSLk
	 89m2UTwQ6JJ5RlnZO70YhcAmjUf1tN+mJmcb+iMddmOhAbvF6GDxlihiJNfY8xPwVj
	 iOYYvM4q2Hjxs7wNU20qgWYYlWRiRVAtQ5McPun0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A10F8054A;
	Tue, 12 Jul 2022 17:35:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 438C8F8023B; Tue, 12 Jul 2022 17:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94A4F8023B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 17:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94A4F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XFL7yt+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657640128; x=1689176128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2GftDn+xorE6UM3YzlFwuDAbmRpEb7074YgFP8dxNY=;
 b=XFL7yt+dOttuxK2oT5lwzxJEK+lzaIZLgAgC1WK9hkolXXLplHnEBLS2
 bcOrWWUKV/KOAjPlZA+BLkPpTpqZuniZmMAm4hmx5dHYGQVzLGTJmV+HX
 TYJE7MWjek7bMcTCwJvo5L73FmQKEf6DP1aMGixrW8/M1Ru7yeX0LK4He
 uXKmNk6NInBdeRRTnntZChFtBJbHZI918nzVyDaGItrZTjeRYuHgbxMTx
 Nug4kjio+yv5KFemw6cVvLN5wgWpXTIU65ZoV4hxxPi8213FBQS1CW4a+
 nQTMcwQCdJsZUK+MJhNX2VCu6UQiv3Uhl4SbNOmjWcHNabTI+8Svk/7dw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="346651821"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="346651821"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 08:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="771922134"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 12 Jul 2022 08:35:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3234E18E; Tue, 12 Jul 2022 18:35:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v2 3/4] ALSA: hda: cs35l41: Drop wrong use of ACPI_PTR()
Date: Tue, 12 Jul 2022 18:35:18 +0300
Message-Id: <20220712153519.35692-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712153519.35692-1-andriy.shevchenko@linux.intel.com>
References: <20220712153519.35692-1-andriy.shevchenko@linux.intel.com>
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
v2: no changes
 sound/pci/hda/cs35l41_hda_i2c.c | 8 +++-----
 sound/pci/hda/cs35l41_hda_spi.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index ec626e0fbedc..df39fc76e6be 100644
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
 
@@ -43,19 +43,17 @@ static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
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
index 3a1472e1bc24..2f5afad3719e 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -6,7 +6,7 @@
 //
 // Author: Lucas Tanure <tanureal@opensource.cirrus.com>
 
-#include <linux/acpi.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
 
@@ -39,18 +39,16 @@ static const struct spi_device_id cs35l41_hda_spi_id[] = {
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

