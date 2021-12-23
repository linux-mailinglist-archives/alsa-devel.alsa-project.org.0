Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0B47DFB3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 08:43:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32D217B6;
	Thu, 23 Dec 2021 08:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32D217B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640245426;
	bh=a80VhwaD2kFp3n0IV1p+x4qKwYmGt5Y4zsDnZrL970A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l97D4y69s19kpNOYJJiGeY/+kie9HALG+XVfi5ZER859q1gU2lAnwV4Fbfa1OsvP8
	 RZYLjh537bQ8a1OD95ydY1B+nuaXEyfOKaNf/rLxlcJ8R5ggxUYO3bOQDWZ7eJykm0
	 MbiR8OR7htLjqmCHIfdnRd+ttAt25/2PMe9uyQXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F4BCF8011C;
	Thu, 23 Dec 2021 08:42:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF5EF80115; Thu, 23 Dec 2021 08:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D34AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 08:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D34AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k1fWCZk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640245351; x=1671781351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a80VhwaD2kFp3n0IV1p+x4qKwYmGt5Y4zsDnZrL970A=;
 b=k1fWCZk+WZsaj3QHlKoasO0nRHyM4VdeHnErEfMwimB8yB5xuvk/xkqV
 MVoj/nVbHPXj3pv1Lgnjqz7n9pxRXdsgYynZT/7Yacbih8pGH3E2avyH7
 94pEt70UTSfs4Gvn1lewOzKqcSbxrPf/QwJRUie0y6mQTWg2sJjFIVI/f
 k5mv8upYVkQPpm9SgrfjvBRAaEKPWLwMNuoC/Jz/Hno7hM9mvbSZ4Bac+
 +3T936A6u3uWNFnkDQjnD291Aj62JVJPjcWJDIc1s5MEoHyDM0PXJyeck
 BILL1OjJ5/0n6z6UaUg7FVtdbJSwWRS8z58/uV5mlQvdS0ecBMrK2Bd/7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="241002231"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="241002231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 23:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="685294038"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 22 Dec 2021 23:42:19 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 1/2] ALSA: hda: Add AlderLake-N PCI ID
Date: Thu, 23 Dec 2021 09:34:23 +0200
Message-Id: <20211223073424.1738125-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Add HD Audio PCI ID for Intel AlderLake-N. Add rules to
snd_intel_dsp_find_config() to choose DSP-based SOF driver for ADL-N
systems with PCH-DMIC or Soundwire codecs, and plain HDA driver for the
rest (DSP not used).

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 sound/pci/hda/hda_intel.c    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b5bfa94bcb89..e035cecb37f7 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -374,6 +374,10 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51cc,
 	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x54c8,
+	},
 #endif
 
 };
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b98d7975adea..cdd4a58244d7 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2496,6 +2496,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-M */
 	{ PCI_DEVICE(0x8086, 0x51cc),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* Alderlake-N */
+	{ PCI_DEVICE(0x8086, 0x54c8),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Elkhart Lake */
 	{ PCI_DEVICE(0x8086, 0x4b55),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},

base-commit: 74a50bd2899fdc9b6b2f2eb9624551e4aa795ad8
-- 
2.34.1

