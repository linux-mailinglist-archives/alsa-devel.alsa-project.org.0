Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6215763B0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D011878;
	Fri, 15 Jul 2022 16:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D011878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657895651;
	bh=quW627AYiv93futAt78+uK7DnE7SJUAGBKVp5o/sVZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZT0SlJteJfmZxyG+2OVTYIvi0IFHM4F4VHD9bCKIVrgbCYtgeuS6Gr7iyMO+GjZc
	 /taQxFf80VIitS160B5C35CJ3vw1vylnH2ptBe0hZYdau3DF72HfrDr4WdKGN/Yl50
	 J8/a2loRFFPf3OBQbc1ZpEQGu7bNKvzYXxUZ2uec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DD4F800AA;
	Fri, 15 Jul 2022 16:33:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1DCAF8015B; Fri, 15 Jul 2022 16:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DECCCF800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DECCCF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZSGMPi2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657895583; x=1689431583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=quW627AYiv93futAt78+uK7DnE7SJUAGBKVp5o/sVZQ=;
 b=ZSGMPi2pTNURsk3wVaaMtUuQUaoK8yFQprHmweWygDpni897U1A7iX5M
 i20fGJhMw3qlT2ISSC28aCrpB7B6+m5YktDQ9orayj45lcA0CIpuDbDPi
 aWybes3o9at0o6vvKB6w160Kg0GjbeochjVA7cOweLQWeovQO7p1n4jQs
 o/Jndwl/HyTKs78VKPZNpow4rQ9VviurP7XI6IiKgt1P8ZMA5oawyye6v
 9jiZAHJsckSO2LEAT5Ll+66BKXdztAwQjdPNQonSWVSqP64RLOPSlB7De
 TIfIzx2H3c778QY/tvhCN2qx03IX9HSP+bQkpmXPMdzjnZAyNQ54gHJ2q g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286545969"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286545969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:32:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="629123765"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:32:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] soundwire: dmi-quirks: add remapping for HP Omen 16-k0005TX
Date: Fri, 15 Jul 2022 09:32:49 -0500
Message-Id: <20220715143249.274542-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

The DSDT for this device has a number of problems:
a) it lists rt711 on link0 and link1, but link1 is disabled
b) the rt711 entry on link0 uses the wrong v2 instead of v3 (SDCA)
c) the rt1316 amplifier on link3 is not listed.

Add a remapping table to work-around these BIOS shenanigans.

BugLink: https://github.com/thesofproject/sof/issues/5955
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 747983743a14..f81cdd83ec26 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -55,7 +55,26 @@ static const struct adr_remap dell_sku_0A3E[] = {
 	{}
 };
 
+/*
+ * The HP Omen 16-k0005TX does not expose the correct version of RT711 on link0
+ * and does not expose a RT1316 on link3
+ */
+static const struct adr_remap hp_omen_16[] = {
+	/* rt711-sdca on link0 */
+	{
+		0x000020025d071100ull,
+		0x000030025d071101ull
+	},
+	/* rt1316-sdca on link3 */
+	{
+		0x000120025d071100ull,
+		0x000330025d131601ull
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
+	/* TGL devices */
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
@@ -78,6 +97,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)dell_sku_0A3E,
 	},
+	/* ADL devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16-k0xxx"),
+		},
+		.driver_data = (void *)hp_omen_16,
+	},
 	{}
 };
 
-- 
2.34.1

