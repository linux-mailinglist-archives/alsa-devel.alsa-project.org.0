Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196D1B5A6B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE36B16A1;
	Thu, 23 Apr 2020 13:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE36B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587641022;
	bh=L8RP8aAz6XednSyufsFW15bdtL/6M2dWdon8NPHA/sE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nHKAXSWy4a9+Mfqc1mg0hLq/CfWHWFvjWR95VjoutWSXMIAgU9QEe8P2P9LSvI6Zl
	 bXTWBpNUlVQjoFje9vaiyJtur62WY/dSSa8mpHfw8nb+HwIh6t+GjSBPhcRcf4Vdq9
	 Z17xwAwcYkwajvag//Tcu1KTEBHJMOkACRhBLgFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03061F801ED;
	Thu, 23 Apr 2020 13:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4186F801EC; Thu, 23 Apr 2020 13:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3586F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3586F800F2
IronPort-SDR: fRwUcK6Duy9zhyzzPEc04Q/o3QydGUe8w4cog0wuApJcZ+ESVu86Q1O8mf1or0Es/4hzvdCxnY
 X/932Qgv4MbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 04:21:47 -0700
IronPort-SDR: i497mNb0+iGgJ8cBjX58Ma4C/T38tdP1+kYSjR/1QeZGdr4TqV+eigAAl6AjAbs0V44KqiP7Yz
 YgtgWB5jT07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="457468810"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2020 04:21:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Refactor Intel NHLT init
Date: Thu, 23 Apr 2020 13:21:36 +0200
Message-Id: <20200423112136.25207-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

NHLT fetch based on _DSM prevents ACPI table override mechanism from
being utilized. Make use of acpi_get_table to enable it and get rid of
redundant code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-nhlt.c | 49 +++++++-----------------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 99a23fe7fab9..2f741d2792d8 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -4,58 +4,25 @@
 #include <linux/acpi.h>
 #include <sound/intel-nhlt.h>
 
-#define NHLT_ACPI_HEADER_SIG	"NHLT"
-
-/* Unique identification for getting NHLT blobs */
-static const guid_t osc_guid =
-	GUID_INIT(0xA69F886E, 0x6CEB, 0x4594,
-		  0xA4, 0x1F, 0x7B, 0x5D, 0xCE, 0x24, 0xC5, 0x53);
-
 struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
 {
-	acpi_handle handle;
-	union acpi_object *obj;
-	struct nhlt_resource_desc *nhlt_ptr;
-	struct nhlt_acpi_table *nhlt_table = NULL;
-
-	handle = ACPI_HANDLE(dev);
-	if (!handle) {
-		dev_err(dev, "Didn't find ACPI_HANDLE\n");
-		return NULL;
-	}
+	struct nhlt_acpi_table *nhlt;
+	acpi_status status;
 
-	obj = acpi_evaluate_dsm(handle, &osc_guid, 1, 1, NULL);
-
-	if (!obj)
-		return NULL;
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_dbg(dev, "No NHLT table found\n");
-		ACPI_FREE(obj);
+	status = acpi_get_table(ACPI_SIG_NHLT, 0,
+				(struct acpi_table_header **)&nhlt);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(dev, "NHLT table not found\n");
 		return NULL;
 	}
 
-	nhlt_ptr = (struct nhlt_resource_desc  *)obj->buffer.pointer;
-	if (nhlt_ptr->length)
-		nhlt_table = (struct nhlt_acpi_table *)
-			memremap(nhlt_ptr->min_addr, nhlt_ptr->length,
-				 MEMREMAP_WB);
-	ACPI_FREE(obj);
-	if (nhlt_table &&
-	    (strncmp(nhlt_table->header.signature,
-		     NHLT_ACPI_HEADER_SIG,
-		     strlen(NHLT_ACPI_HEADER_SIG)) != 0)) {
-		memunmap(nhlt_table);
-		dev_err(dev, "NHLT ACPI header signature incorrect\n");
-		return NULL;
-	}
-	return nhlt_table;
+	return nhlt;
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_init);
 
 void intel_nhlt_free(struct nhlt_acpi_table *nhlt)
 {
-	memunmap((void *)nhlt);
+	acpi_put_table((struct acpi_table_header *)nhlt);
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_free);
 
-- 
2.17.1

