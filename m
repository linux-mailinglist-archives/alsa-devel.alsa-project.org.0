Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA58828FD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0201D16C8;
	Tue,  6 Aug 2019 03:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0201D16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053488;
	bh=GUECeIIcCspAc6JB5OIaNImyaa7LnGuohHLTWf1sRXA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBZFS9nhSEbK70tyXQrq2MXfBoXo0EzGbOaFp8nx1vv3UEgboky8qcTdv0sYzJxtd
	 qmeju0dpov7mvVc/n0Bt4vMX0VY0l2uJhiBAcV2EEhJBjygkjcNzZH4ws6eIMW7LS6
	 mbNN1tGH3Ac9BTF9gRYTt+2QzmD50p2KUUD1I/IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33585F8068A;
	Tue,  6 Aug 2019 02:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9CE2F8065D; Tue,  6 Aug 2019 02:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDC6FF80638
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC6FF80638
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153204"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:16 -0500
Message-Id: <20190806005522.22642-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 11/17] soundwire: intel: read mclk_freq
	property from firmware
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

The BIOS provides an Intel-specific property, let's use it to avoid
hard-coded clock dividers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index fe3266bc1d12..3f876642cb7f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -909,11 +909,37 @@ static int intel_register_dai(struct sdw_intel *sdw)
 					  dais, num_dai);
 }
 
+static int sdw_master_read_intel_prop(struct sdw_bus *bus)
+{
+	struct sdw_master_prop *prop = &bus->prop;
+	struct fwnode_handle *link;
+	char name[32];
+	int nval, i;
+
+	/* Find master handle */
+	snprintf(name, sizeof(name),
+		 "mipi-sdw-link-%d-subproperties", bus->link_id);
+
+	link = device_get_named_child_node(bus->dev, name);
+	if (!link) {
+		dev_err(bus->dev, "Master node %s not found\n", name);
+		return -EIO;
+	}
+
+	fwnode_property_read_u32(link,
+				 "intel-sdw-ip-clock",
+				 &prop->mclk_freq);
+	return 0;
+}
+
 static int intel_prop_read(struct sdw_bus *bus)
 {
 	/* Initialize with default handler to read all DisCo properties */
 	sdw_master_read_prop(bus);
 
+	/* read Intel-specific properties */
+	sdw_master_read_intel_prop(bus);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
