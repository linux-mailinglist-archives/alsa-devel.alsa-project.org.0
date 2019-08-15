Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C98F00C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBE51662;
	Thu, 15 Aug 2019 18:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBE51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565885033;
	bh=JdiOAmUgO3UendTFAJCehDwtsX3nqJRC+cOMLuAlcaU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hg1241QhGPaLZgEXukQs+gC1aVabgCzEGWcKMU6KXwyCtdOeT5greZEGJHlRgk7Tj
	 Yzuoac08U8CrRWPjRRcvAcp16jZS7eectzm75gaeX4mNfBd/mJDlFXuY0L4VMXlVNi
	 cOczBnzNOCLen0l+inLITEqNShKoTVapl9ofG1ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45778F805F5;
	Thu, 15 Aug 2019 18:01:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD52AF8044C; Thu, 15 Aug 2019 18:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD92FF80273
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD92FF80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="194790035"
Received: from ranofal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.136.131])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 08:58:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 10:57:45 -0500
Message-Id: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: Intel/SOF: add initial support for
	Tiger Lake and Elhkart Lake
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

Add initial/minimal support for PCI enumeration, hardware descriptions
and ACPI match tables.

Follow-up patches will be provided to enable multi-core support
(requires new IPC calls). Machine drivers will be provided at a later
point as well when there are fewer configurations. And last HDMI work
is required to handle the 4 converters (which may be combined with the
transition from hdac_hdmi to patch_hdmi already mentioned by Kai).

Pan Xiuli (4):
  ASoC: Intel: common: add ACPI matching tables for Tiger Lake
  ASoC: SOF: Intel: initial support for Tiger Lake.
  ASoC: Intel: common: add ACPI matching tables for EHL
  ASoC: SOF: Intel: initial support for Elkhart Lake

 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-ehl-match.c   | 18 ++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 24 ++++++++++
 sound/soc/sof/intel/Kconfig                   | 32 ++++++++++++++
 sound/soc/sof/intel/cnl.c                     | 32 ++++++++++++++
 sound/soc/sof/intel/hda.h                     |  2 +
 sound/soc/sof/sof-pci-dev.c                   | 44 +++++++++++++++++++
 8 files changed, 155 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ehl-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-tgl-match.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
