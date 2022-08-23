Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9963559CF1F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 05:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E6371670;
	Tue, 23 Aug 2022 05:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E6371670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661224022;
	bh=dFchl2bmcRn49wmin1I4Kwm9RG7Qfuh91pAl14MRq5w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KFOQm3HEkL3vbdll/ttZ0gRn0nOmpebyjq0iyt/BQrUpVSwP1/OTURuz3I70Im9xJ
	 qrxtnrL7EKXcu9G4dcFWg8wGJQgG6DIN8S1YPw0Fx80ZSDzZs02CeYfp3s0Ux/cpWe
	 m9+gLfwilV4TgSdokcrYvY9SovvJPieljSOpo+GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E44AEF80152;
	Tue, 23 Aug 2022 05:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38DB3F8020D; Tue, 23 Aug 2022 05:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B99F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 05:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B99F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BCRrw0N9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661223953; x=1692759953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dFchl2bmcRn49wmin1I4Kwm9RG7Qfuh91pAl14MRq5w=;
 b=BCRrw0N9QEngZDIpZDGjQcBK4+252gmq48yWihfQov+P9jZoe+nhGxPR
 O0MrDqUFgFcpVa/13V3xaXFvFLa5gH2e2iQwOsjOxhv0EsNr5/u7H1uE7
 zwmBft7XbJGGrvWoAnuf9nGpNjxJZKN8ujvOvefQapHfJXRpM7BRzyjqs
 4xukgqalqpjFSbp7Ws+k/HZccR3kaWyzHx2W7MuiaFjQOZQEr5jLQyKMh
 g7baTfjrGqbk7reyierYBJir9ceWp+Jx8w33Lg/UFgADBarvMUwr3Y10s
 dGgu3Z706dvdA9m7rlbGv5nIaRbjYn2v6EF8y9KuLfsZepzCdL5QC9peR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355307155"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="355307155"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 20:05:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="638470575"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 20:05:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: dmi-quirks: add remapping for HP Omen 16-k0005TX
Date: Tue, 23 Aug 2022 11:09:19 +0800
Message-Id: <20220823030919.2346629-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The DSDT for this device has a number of problems:
a) it lists rt711 on link0 and link1, but link1 is disabled
b) the rt711 entry on link0 uses the wrong v2 instead of v3 (SDCA)
c) the rt1316 amplifier on link3 is not listed.

Add a remapping table to work-around these BIOS shenanigans.

BugLink: https://github.com/thesofproject/sof/issues/5955
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
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
2.25.1

