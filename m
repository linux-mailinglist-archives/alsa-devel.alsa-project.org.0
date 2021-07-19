Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99593CEFF4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 01:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCB2167A;
	Tue, 20 Jul 2021 01:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCB2167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626737705;
	bh=UM0dPDrs3+e3rAm0EEw8GVQNqhOMRD2EsQXVEAfextQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aIUdx6dk1gHWTje49obVVCwGxCe1fQrQshQp5zwIcV7xm1gOG6KpBF54n3VwZDkVi
	 YdQR7HjnKPvliyYkmdlp8EQ65owt5gPrz+N6K6nmbbOKGm1EdFoJoYXO/J2CPPbtyp
	 7CSp+jfWcbVxlqBxcX8sDmoV+d75LqB8zu89caCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E43F800DA;
	Tue, 20 Jul 2021 01:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37AD6F804AC; Tue, 20 Jul 2021 01:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E854F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 01:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E854F800DA
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="198350324"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="198350324"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:33:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="494333680"
Received: from mjduranm-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.21])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:33:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] soundwire: dmi-quirks: add quirk for Intel 'Bishop
 County' NUC M15
Date: Mon, 19 Jul 2021 18:32:47 -0500
Message-Id: <20210719233248.557923-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
References: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

The same quirk is used for LAPBC510 and LAPBC710 skews who use the
same audio design.

These devices have the same BIOS issues inherited from the Intel
reference, add the same _ADR remap previously used on HP devices.

BugLink: https://github.com/thesofproject/linux/issues/3049
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 drivers/soundwire/dmi-quirks.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 1ac16687e315..0ca2a3e3a02e 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -16,11 +16,11 @@ struct adr_remap {
 };
 
 /*
- * HP Spectre 360 Convertible devices do not expose the correct _ADR
- * in the DSDT.
+ * Some TigerLake devices based on an initial Intel BIOS do not expose
+ * the correct _ADR in the DSDT.
  * Remap the bad _ADR values to the ones reported by hardware
  */
-static const struct adr_remap hp_spectre_360[] = {
+static const struct adr_remap intel_tgl_bios[] = {
 	{
 		0x000010025D070100ull,
 		0x000020025D071100ull
@@ -61,7 +61,15 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
 		},
-		.driver_data = (void *)hp_spectre_360,
+		.driver_data = (void *)intel_tgl_bios,
+	},
+	{
+		/* quirk used for NUC15 'Bishop County' LAPBC510 and LAPBC710 skews */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LAPBC"),
+		},
+		.driver_data = (void *)intel_tgl_bios,
 	},
 	{
 		.matches = {
-- 
2.25.1

