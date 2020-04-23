Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3D1B5A21
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2588169E;
	Thu, 23 Apr 2020 13:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2588169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587640340;
	bh=EEDPPq6DgdyDI9SEfFz5tM9+xYyuBJ8yJsbWtjniQno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AZH0daWBdLDyfbSKIgCgIiu8oWVSdxa96XlBNr7c2+vooyBkDvJ3DMcEdAa0q0fQm
	 M77xFwtTn+6DtP7OaC/eBuVctbYo/ZYDskA/WJAv2x9JYJnb6TTMCbM7HYhrMZR2rj
	 Y1Fh2gcuh1vy0Y5clrfg1MR4qpKvJwl8hm+iGaGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F093BF801F5;
	Thu, 23 Apr 2020 13:10:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD727F80212; Thu, 23 Apr 2020 13:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 662DAF800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662DAF800FF
IronPort-SDR: j9zXAH+H5tPN3sZKIMptFhtnudEOJwC9yswk13AT3S2Y0+rWD1aFifpGw6OuuvI3xaN6ipMSYS
 8kFM54dVj7Rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 04:10:28 -0700
IronPort-SDR: zUJ1793N+CGnLPOjHVbUgSFxmjWpG8nk5eHj3ii9bK4jOKq6+vBgcI0x38fOU/yjw88efGYBUy
 AR058amYUUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="247726317"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2020 04:10:26 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/3] Add support for different DMIC configurations
Date: Thu, 23 Apr 2020 13:11:45 +0200
Message-Id: <20200423111148.6977-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Set of patches to enable DMIC capture on different hardware
configurations.
Information about supported DMIC configuration is read from NHLT and
correct pipeline configuration is selected automatically.
Also, adding additional option for topology binary name which is
based on used machine driver.

Changes in v2:
- removed patch 1/4 swapping machine device and platform device
  registration order
- alt_tplg_name creation now uses different field to read machine driver
  name
- including of <sound/soc-acpi.h> moved to different patch

Changes in v3:
- cosmetic changes in skl-topology.c file

Mateusz Gorski (3):
  ASoC: Intel: Skylake: Add alternative topology binary name
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 188 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 3 files changed, 186 insertions(+), 5 deletions(-)

-- 
2.17.1

