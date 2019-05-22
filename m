Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462A26E60
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 21:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F8F1658;
	Wed, 22 May 2019 21:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F8F1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558554582;
	bh=MgmolnL6JQlQcCb+y9ChDY2wdZ/2gzznFdzJU5sVw0o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILTyJoi2oMV8Ed6suSb+lXMC6Sz0yWr3x8+NAJmYDAdN7fIemJK61J1UDEtduCC4a
	 N2T9j2RG2cdeAp6zxV7db0rs6WhC2Mj1exPZfolxv4ERFM9ocQwKS0ay7xT2w+UKtT
	 kAq04XHJXBVIMCc0WXfgljt6SV8epvWkiSM5ouyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84581F89630;
	Wed, 22 May 2019 21:47:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A95BF89636; Wed, 22 May 2019 21:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA184F80C20
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 21:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA184F80C20
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 12:47:48 -0700
X-ExtLoop1: 1
Received: from cjpowell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.154.39])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2019 12:47:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 14:47:17 -0500
Message-Id: <20190522194732.25704-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
References: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 01/15] soundwire: intel: filter SoundWire
	controller device search
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The convention is that the SoundWire controller device is a child of
the HDAudio controller. However there can be more than one child
exposed in the DSDT table, and the current namespace walk returns the
last (incorrect) device.

Intel documentation states that bits 28..31 of the _ADR field
represent the link type, with SoundWire assigned the value 4.

Add a filter and terminate early when a valid _ADR is provided,
otherwise keep iterating to find the next child.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index d3d6b54c5791..771a53a5c033 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw_intel.h>
 #include "intel.h"
 
+#define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
 #define SDW_MAX_LINKS		4
 #define SDW_SHIM_LCAP		0x0
 #define SDW_SHIM_BASE		0x2C000
@@ -150,6 +151,12 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 {
 	struct sdw_intel_res *res = cdata;
 	struct acpi_device *adev;
+	acpi_status status;
+	u64 adr;
+
+	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
+	if (ACPI_FAILURE(status))
+		return AE_OK; /* keep going */
 
 	if (acpi_bus_get_device(handle, &adev)) {
 		pr_err("%s: Couldn't find ACPI handle\n", __func__);
@@ -157,7 +164,19 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	}
 
 	res->handle = handle;
-	return AE_OK;
+
+	/*
+	 * On some Intel platforms, multiple children of the HDAS
+	 * device can be found, but only one of them is the SoundWire
+	 * controller. The SNDW device is always exposed with
+	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
+	 * SoundWire link so filter accordingly
+	 */
+	if ((adr & GENMASK(31, 28)) >> 28 != SDW_LINK_TYPE)
+		return AE_OK; /* keep going */
+
+	/* device found, stop namespace walk */
+	return AE_CTRL_TERMINATE;
 }
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
