Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90F47DFB4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 08:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57FD317E6;
	Thu, 23 Dec 2021 08:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57FD317E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640245469;
	bh=4cnfHiuW9OsseDb9l55WU5ViRBHyeV1x1V17tSUXAPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qep3ZFByXqdSRiIgAGfqu0NTW6FsP4fqMjZxigXcxRc3EAt0MHMmhQumvjzJdijI5
	 Nq2VfzH3hy2pF7Szk6PEd7M0fmb25o/EmMdS7evLCSp2oazV7pB8W11gEp6L26ksFr
	 os1xwMnc9LLsu6bZJD00Rzgpc5G4BeOmJoa1cPfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E95EAF80121;
	Thu, 23 Dec 2021 08:43:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F8CF800FF; Thu, 23 Dec 2021 08:43:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A0DF80104
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 08:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A0DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XPxevl07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640245355; x=1671781355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4cnfHiuW9OsseDb9l55WU5ViRBHyeV1x1V17tSUXAPw=;
 b=XPxevl07snsLOAnzGL0l+NFy4k4LFz84r5ceZHV6bf0VIj7FzMoXiQHP
 f50no6zlmVJRfsllcpziS2mSEKdGmMY+mrIEA4c01YBz2iJlOlMTTS/2U
 FFzayK0aFN0/WNNOMRwM/aa3Azs/PMMUOYkmweYnFQfbGDj8/mppnQ0ap
 +a70PZVhHgzQVrLaT5/vz6A4W5d6LaF1PwCZGzZwdjAEiWZ8woNpSeE1K
 4JsTN6t3jhz5oPmB6b5rIStjuwMf/QCXtOML5dXFbFX+/YvmvnkTNcyL/
 keNNyAZpntoIqlgwwUb7JqIJbpYO9zNgQxDaRI8S3+7XdR8R/Cp6VdOtL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240581186"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="240581186"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 23:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="685294063"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 22 Dec 2021 23:42:27 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 2/2] ALSA: hda: Add new AlderLake-P variant PCI ID
Date: Thu, 23 Dec 2021 09:34:24 +0200
Message-Id: <20211223073424.1738125-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223073424.1738125-1-kai.vehmanen@linux.intel.com>
References: <20211223073424.1738125-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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

Add HD Audio PCI ID for a variant of Intel AlderLake-P. Use same driver
match rules as for existing AlderLake-P devices.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 sound/pci/hda/hda_intel.c    | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index e035cecb37f7..c26229ed642f 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -374,6 +374,10 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51cc,
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51cd,
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x54c8,
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index cdd4a58244d7..4b0338c4c543 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2493,6 +2493,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-P */
 	{ PCI_DEVICE(0x8086, 0x51c8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	{ PCI_DEVICE(0x8086, 0x51cd),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-M */
 	{ PCI_DEVICE(0x8086, 0x51cc),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
-- 
2.34.1

