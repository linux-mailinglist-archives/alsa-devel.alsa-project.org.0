Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293F3296B4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 08:53:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABDD167D;
	Tue,  2 Mar 2021 08:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABDD167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614671632;
	bh=h/H+xLf9uu49Lu/5VXsNxSLikuxnG2R8cOuSVJ3o5HU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lW/2/60RmZeyrOQRnfAJZlKMohRxKFTbz37PI1obIaJXogYCBAO6AS0YK8mNnoKiE
	 oFVX7UuP/EvoZHSX194v7fvoPOQ2yUQGyRQM4X7YRsoRXay7lrfdHYh/7K0STatGQl
	 BSwUdCgTI+yP54gWCAT2c0n/GxkgwRb3MHqkfAAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D88BF80423;
	Tue,  2 Mar 2021 08:51:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8854EF802A9; Tue,  2 Mar 2021 08:51:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B2AF802A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 08:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B2AF802A9
IronPort-SDR: rni5FAyoL5KeQ4AVCjxHwG5nt4iFBimpCVPR/Vx4vIWwF2ACat/FDSZXe84FagtUtovq1EIBLh
 jmmd7YO1Gnfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186782249"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186782249"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:18 -0800
IronPort-SDR: rRLCUJqweNM8xiqk/1TUkIdq0Zb+mCgiA0ko5v3fufJG+lBob8szTNJz08aOmL/JoQgBzs7l6W
 eMALVJM2ekkQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406597610"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:15 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/3] soundwire: Intel: add DMI quirk for Dell SKU 0A3E
Date: Tue,  2 Mar 2021 15:51:05 +0800
Message-Id: <20210302075105.11515-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
References: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

We've been handling ACPI issues on early versions of the product with
a local ACPI initrd override but now that we have the possibility of a
kernel quirk let's get rid of the initrd override. This helps make
sure that the kernel will support all versions of the BIOS, with or
without updates.

Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 249e476e49ea..82061c1d9835 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -32,6 +32,29 @@ static const struct adr_remap hp_spectre_360[] = {
 	{}
 };
 
+/*
+ * The initial version of the Dell SKU 0A3E did not expose the devices
+ * on the correct links.
+ */
+static const struct adr_remap dell_sku_0A3E[] = {
+	/* rt715 on link0 */
+	{
+		0x00020025d071100,
+		0x00021025d071500
+	},
+	/* rt711 on link1 */
+	{
+		0x000120025d130800,
+		0x000120025d071100,
+	},
+	/* rt1308 on link2 */
+	{
+		0x000220025d071500,
+		0x000220025d130800
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
 	{
 		.matches = {
@@ -40,6 +63,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)hp_spectre_360,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
+		},
+		.driver_data = (void *)dell_sku_0A3E,
+	},
 	{}
 };
 
-- 
2.17.1

