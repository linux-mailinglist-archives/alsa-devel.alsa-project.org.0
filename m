Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7FFF5E42
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 10:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDC01674;
	Sat,  9 Nov 2019 10:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDC01674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573292730;
	bh=KIIqb2KJ62GnziLbvkYLwx3WolQ5T5uaz6TXDjtBL3A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i74PrHuBmPdoPnROznjrwO3NciXGqPg6rAWf9JeL4mQwuoQiV5fTXyopUWZKeRwH/
	 54YXaE45jWDwIkYMg1MojLb/oIBWr402Jk9j81aSfyF8xlWOerF76IWZfC6gV+l3CJ
	 BPCLml7uZx/iPdwEMKIKfmaO5YU9uCyrSJw0Ey9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1C8F8049B;
	Sat,  9 Nov 2019 10:43:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C204BF803D0; Fri,  8 Nov 2019 08:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CC3F80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 08:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CC3F80111
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 23:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,280,1569308400"; d="scan'208";a="377690434"
Received: from unknown (HELO cooperch-i9.itwn.intel.com) ([10.5.253.42])
 by orsmga005.jf.intel.com with ESMTP; 07 Nov 2019 23:13:51 -0800
From: "Chiou, Cooper" <cooper.chiou@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 15:13:49 +0800
Message-Id: <20191108071349.12840-1-cooper.chiou@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 09 Nov 2019 10:43:38 +0100
Cc: "Chiou, Cooper" <cooper.chiou@intel.com>, Chiou@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: hda: Add Cometlake-S PCI ID
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add HD Audio Device PCI ID for the Intel Cometlake-S platform

Signed-off-by: Chiou, Cooper <cooper.chiou@intel.com>
---
 sound/pci/hda/hda_intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index cf53fbd872ee..c52419376c74 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2396,6 +2396,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* CometLake-H */
 	{ PCI_DEVICE(0x8086, 0x06C8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* CometLake-S */
+	{ PCI_DEVICE(0x8086, 0xa3f0),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Icelake */
 	{ PCI_DEVICE(0x8086, 0x34c8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
