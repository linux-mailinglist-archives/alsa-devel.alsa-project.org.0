Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EE31A143
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 16:15:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F9A16EB;
	Fri, 12 Feb 2021 16:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F9A16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613142944;
	bh=/Q0FzcGz5kU5POWn0R9Y+f4g9+VSxkN8dUjXlI3Knho=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YVXlm49KB3yamVPISa27Hy7cOfDO4KZQIfj4MhjGW7nwm6VOomfrYM66aIFrYtjZr
	 Tmv5GuZtr87+i5ShWzjIxrUkkPMK/BzKgVLtbZYGHauvIY5Cd/XYlcpdSsn/PMIiMT
	 0APX5wF1/gj8lwmmOLuXGw2w1jRB7nYIi3d4b5cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C76C0F8014D;
	Fri, 12 Feb 2021 16:14:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CD5F8022B; Fri, 12 Feb 2021 16:14:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7970DF8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 16:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7970DF8014D
IronPort-SDR: zNEO85TIJu8UVMvQF1fNMe9aXHApRU5aD9qGZTX7mZo1AA+5CoSYKM27S+hetM7qwvWvbp/yhp
 HW/qHYL2nCdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="161571132"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="161571132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 07:13:57 -0800
IronPort-SDR: SvQxLvM5D+SVjPfRNds/xxYqc3pQIUHzoAmsP8H9d50x5hFhm4EoH/XoYwonUAoJZbwXMB1Z/O
 x3w4K5bx4rGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="491001567"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2021 07:13:56 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: Add another CometLake-H PCI ID
Date: Fri, 12 Feb 2021 17:10:22 +0200
Message-Id: <20210212151022.2568567-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

Add one more HD Audio PCI ID for CometLake-H PCH.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 801c5dd25707..7ba665e9272c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2475,6 +2475,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* CometLake-H */
 	{ PCI_DEVICE(0x8086, 0x06C8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	{ PCI_DEVICE(0x8086, 0xf1c8),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* CometLake-S */
 	{ PCI_DEVICE(0x8086, 0xa3f0),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},

base-commit: 03cc2c42871ecf90017cace94bfd1ca5ecaf6e48
-- 
2.29.2

