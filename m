Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE42B44CF
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57FF5175A;
	Mon, 16 Nov 2020 14:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57FF5175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605533739;
	bh=di+zvBY/aJVEm2OUiJto16qf9Ybs/NWFy+R0g/mG2BY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S8bKiteHmeSZvwnkLyI9hJdUPik37/1aedMgJQCTKf+CsvBBO1nJVP4xTWciOK16U
	 mc1tVQYLojg2zAMdcx/N/D4SE1wTicT5a4XsnDoTrCta9linUPK1BS4XoqwMSTj0Po
	 PsCJkiCUDXChtoGvfkRSxfxXXIGZ1uS2ZnR3ZETc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D3BF80229;
	Mon, 16 Nov 2020 14:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D72F802A9; Mon, 16 Nov 2020 14:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01068F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01068F8014A
IronPort-SDR: a3AMN5vz37o40UfpzoqDdVbVv8Cf3IXjdUeCF7oMg8Pr6F3uLKo5jMyiIu5cZ8almsaq0tPv+8
 qFFgRmq4rg9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158520534"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="158520534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:33:47 -0800
IronPort-SDR: tsTnBPMsutux7fRe9Z1uIFa2PUs5zT70+Nwt8XgCgILeGpj7K2q5rQSbMCnH9U73fRtfyc8mTU
 wbElhZ5VVhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="475525009"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 05:33:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Intel: catpt: Offload fixes and code optimization
Date: Mon, 16 Nov 2020 14:33:27 +0100
Message-Id: <20201116133332.8530-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, broonie@kernel.org
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

First two of the series address bugs connected mainly to offload streams:
- scenarios with very low buffer sizes: RESET_STREAM IPC timeouts
- fix lp clock selection when switching between PAUSE <-> RESUME states:
  glitches on first offload when no additional stream is opened
  simultaneously

Follow ups are: code reduction and optimization oriented patches.
This has been foretold in:

[PATCH v10 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
https://www.spinics.net/lists/alsa-devel/msg116440.html
  Note: LPT power up/down sequences might get aligned with WPT once
  enough testing is done as capabilities are shared for both DSPs.

First, optimize applying of user settings - prevent redundand calls from
happening - and then as mentioned above, streamline power on/off sequence
for LPT and WPT.

Cezary Rojewski (5):
  ASoC: Intel: catpt: Skip position update for unprepared streams
  ASoC: Intel: catpt: Correct clock selection for dai trigger
  ASoC: Intel: catpt: Optimize applying user settings
  ASoC: Intel: catpt: Streamline power routines across LPT and WPT
  ASoC: Intel: catpt: Cleanup after power routines streamlining

 sound/soc/intel/catpt/core.h   |  10 ++-
 sound/soc/intel/catpt/device.c |  18 +++---
 sound/soc/intel/catpt/dsp.c    |  56 ++--------------
 sound/soc/intel/catpt/pcm.c    | 113 ++++++++++++++++-----------------
 4 files changed, 74 insertions(+), 123 deletions(-)

-- 
2.17.1

