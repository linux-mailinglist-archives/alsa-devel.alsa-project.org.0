Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9EE0EC5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 01:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91C81673;
	Wed, 23 Oct 2019 01:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91C81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571788330;
	bh=pml8udqROIUikaUG5nPMVRfV+CKkekEMsWJ8AAKfnCc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAOXWebH8OTJTvXwo6ZcSh9HNnweSpP8tYYvDx+HhOXxdYsJLTT6Z3H9+LzRZeHEp
	 QskH15BOdt3dl9ZPj0Cy1GY+/LlgGejPA0yskH57RZQz+aBLBcblVca3tuk7nV8/Vq
	 Lzi8RgGmT+eSfdoLYJmCTILtqkM2yHlgGEbXnNoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A10F805FE;
	Wed, 23 Oct 2019 01:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C63CF805FD; Wed, 23 Oct 2019 01:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05DDF800C0
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05DDF800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 16:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="399211306"
Received: from srajamoh-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.20.203])
 by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2019 16:48:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 22 Oct 2019 18:48:07 -0500
Message-Id: <20191022234808.17432-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/3] soundwire: slave: add helper to extract
	slave ID
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

Simplify the loop with a helper. The only functionality change is that
we continue the loop even with an ACPI error.

Follow-up patches will build on this change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/slave.c | 50 ++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 6473fa602f82..5dbc76772d21 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -64,6 +64,36 @@ static int sdw_slave_add(struct sdw_bus *bus,
 }
 
 #if IS_ENABLED(CONFIG_ACPI)
+
+static bool find_slave(struct sdw_bus *bus,
+		       struct acpi_device *adev,
+		       struct sdw_slave_id *id)
+{
+	unsigned long long addr;
+	unsigned int link_id;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(adev->handle,
+				       METHOD_NAME__ADR, NULL, &addr);
+
+	if (ACPI_FAILURE(status)) {
+		dev_err(bus->dev, "_ADR resolution failed: %x\n",
+			status);
+		return false;
+	}
+
+	/* Extract link id from ADR, Bit 51 to 48 (included) */
+	link_id = (addr >> 48) & GENMASK(3, 0);
+
+	/* Check for link_id match */
+	if (link_id != bus->link_id)
+		return false;
+
+	sdw_extract_slave_id(bus, addr, id);
+
+	return true;
+}
+
 /*
  * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
  * @bus: SDW bus instance
@@ -81,29 +111,11 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
 	}
 
 	list_for_each_entry(adev, &parent->children, node) {
-		unsigned long long addr;
 		struct sdw_slave_id id;
-		unsigned int link_id;
-		acpi_status status;
-
-		status = acpi_evaluate_integer(adev->handle,
-					       METHOD_NAME__ADR, NULL, &addr);
-
-		if (ACPI_FAILURE(status)) {
-			dev_err(bus->dev, "_ADR resolution failed: %x\n",
-				status);
-			return status;
-		}
 
-		/* Extract link id from ADR, Bit 51 to 48 (included) */
-		link_id = (addr >> 48) & GENMASK(3, 0);
-
-		/* Check for link_id match */
-		if (link_id != bus->link_id)
+		if (!find_slave(bus, adev, &id))
 			continue;
 
-		sdw_extract_slave_id(bus, addr, &id);
-
 		/*
 		 * don't error check for sdw_slave_add as we want to continue
 		 * adding Slaves
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
