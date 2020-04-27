Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330071BA22B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 13:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D4616AA;
	Mon, 27 Apr 2020 13:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D4616AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587986305;
	bh=648GifqM/Tsj2gjfYVs7JUGjOwar1Od5J+rqVut5PRE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OCdQFgG2STJlEoeEL9xoYdXL22Y9hcTzffhPnIgUBSOXKcrG5TSmYI0OseLmua1iu
	 MfXkke8J4+QCDbyHfr01dceQJNcF2oaI+vBxO2izPPowr3qqZEu5Rxj5xr58bQXUvi
	 X//pXPlYKqj3gDLTujXXI0NWeoBC+bOgo6fdUM54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC29F8029A;
	Mon, 27 Apr 2020 13:15:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECB9AF80299; Mon, 27 Apr 2020 13:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B228F8028C
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 13:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B228F8028C
IronPort-SDR: xwfDXaxvs1VrW/l7lzlx8peElZKFVexVSH21S/a/tp+W+DqSTAZ1i7CogMxALMoM1HbUnsKSD8
 dih0zhCWghSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 04:15:26 -0700
IronPort-SDR: 7vEIFG1SYUV1JD+phAbk3QwqLgzF7QUQSDws8mM9sv0a9j6d6/Jfjnmii48VbowflWA4k9idHC
 XG2Rk38FlfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="292456499"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2020 04:15:25 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 0/3] Add support for different DMIC configurations
Date: Mon, 27 Apr 2020 13:15:17 +0200
Message-Id: <20200427111520.12076-1-mateusz.gorski@linux.intel.com>
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

Changes in v4:
- refactored patch 2/3 to use one common helper function to deal with both
  set and get pipe configuration operations, as suggested by Pierre
- adjusted patch 3/3 to also use this helper function for DMIC pipes
- added comment in patch 3/3 explaining the change of access rights for
  DMIC enums

Changes in v5:
- fixed alignment issue in patch 2/3
- addressed "checkpatch.pl --strict" warnings in patches

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Mateusz Gorski (3):
  ASoC: Intel: Skylake: Add alternative topology binary name
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 178 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 3 files changed, 176 insertions(+), 5 deletions(-)

-- 
2.17.1

