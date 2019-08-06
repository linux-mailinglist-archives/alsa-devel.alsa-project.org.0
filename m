Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59882905
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964861679;
	Tue,  6 Aug 2019 03:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964861679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053651;
	bh=Q73pn0TCUUN+PHexv8QOv3Eb/fGrIBKaBihOVy+RIrg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kH7NPktB/LBrvgm6bktzFNxOcqnqXUjPHQ9G1dKzv+RZPqOZXHI/RHMuoOVHUywTs
	 NWYxENAAzbBLnTKybBgFYFHpWD9w3mDdtCggGoGE6rLgxRMsIvGQxCQSchpLcqPPus
	 NLSfH/Sq7HMQLvXbrG+8xWqr2E8OyAsN2gY2/CHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2361CF80714;
	Tue,  6 Aug 2019 02:55:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC15F80709; Tue,  6 Aug 2019 02:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE08F8067C
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE08F8067C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153234"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:20 -0500
Message-Id: <20190806005522.22642-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 15/17] soundwire: intel_init: add kernel module
	parameter to filter out links
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

The hardware and ACPI info may report the presence of links that are
not physically enabled (e.g. due to pin-muxing or hardware reworks),
which in turn can result in errors being thrown. This shouldn't be the
case for production devices but will happen a lot on development
devices - even more so when they expose a connector.

Even when the ACPI information is correct, it's useful to be able to
only enable the links that need attention - mostly to filter out
dynamic debug messages.

Add a module parameter to filter out such links, e.g. adding the
following config to a file in /etc/modprobe.d will select the second
and third links only.

options soundwire_intel_init sdw_link_mask=0x6

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 70637a0383d2..b74c2f144962 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -22,6 +22,10 @@
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
+static int link_mask;
+module_param_named(sdw_link_mask, link_mask, int, 0444);
+MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
+
 struct sdw_link_data {
 	struct sdw_intel_link_res res;
 	struct platform_device *pdev;
@@ -111,6 +115,13 @@ static struct sdw_intel_ctx
 
 	/* Create SDW Master devices */
 	for (i = 0; i < count; i++) {
+		if (link_mask && !(link_mask & BIT(i))) {
+			dev_dbg(&adev->dev,
+				"Link %d masked, will not be enabled\n", i);
+			link++;
+			continue;
+		}
+
 		link->res.irq = res->irq;
 		link->res.registers = res->mmio_base + SDW_LINK_BASE
 					+ (SDW_LINK_SIZE * i);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
