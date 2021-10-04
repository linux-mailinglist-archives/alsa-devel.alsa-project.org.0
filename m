Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A7421958
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9701684;
	Mon,  4 Oct 2021 23:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9701684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633383417;
	bh=aADFZH6ZLyAzXRBXaL2d6lkJ0ovS3novwZy0w4NiFg8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vSnwpvBfBc1spXA+VBNdG8A7Mb7sW0Cfdfjcy6asmevAypecVv0vbNgVvT5QikPe2
	 Z8Zr5bR+I1Aa4jdNnxSfUu8XKNetGQbE/EsSHzOyxkcyWEE2m7fdSgVTg2BFpnySYX
	 /N2hLWm+WkazI4+KzAkVvJMSM07Izmo+UAoSuP54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6228BF802D2;
	Mon,  4 Oct 2021 23:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC85F8010B; Mon,  4 Oct 2021 23:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 887FFF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887FFF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223012788"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="223012788"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="521588490"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Intel: machine driver updates for 5.16
Date: Mon,  4 Oct 2021 16:35:07 -0500
Message-Id: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

One quirk for a Dell TigerLake/SoundWire device, and initial support
for platforms based on the ES8336 codec (aka ES8316). For full
functionality, an update of the codec driver will be needed.

Pierre-Louis Bossart (5):
  ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices based on
    ES8336 codec
  ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on
    ES8336 codec
  ASoC: Intel: add machine driver for SOF+ES8336
  ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA single amp
  ASoC: Intel: sof_sdw: add missing quirk for Dell SKU 0A45

 sound/hda/intel-dsp-config.c                  |  22 +-
 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/sof_es8336.c           | 569 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw.c              |  10 +
 .../intel/common/soc-acpi-intel-bxt-match.c   |   6 +
 .../intel/common/soc-acpi-intel-glk-match.c   |   7 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  47 ++
 8 files changed, 674 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_es8336.c

-- 
2.25.1

