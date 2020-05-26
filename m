Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8411E301A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 22:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DE21770;
	Tue, 26 May 2020 22:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DE21770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590525520;
	bh=Jo1+JmKnlh4Hzq9oqoxeraLVyPHb9JecSNOXBXhMvgc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V8fnkzd/glo5l1MwMUCjsET9OScyUIK69Ix2MZ3Gz1S9CXlgGxN10FFm+rXkr3tJX
	 zLsv2GA+TOITtsOL+2GDpekh3RCW3XooCgElMuWr/lcsZI3v6y+n9dkT1utUyWYJ4s
	 A4vs8suRh0vGYWnRiIybO/luznKFKI3YCOcmv4wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9307AF80290;
	Tue, 26 May 2020 22:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD73DF8026A; Tue, 26 May 2020 22:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4801DF80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 22:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4801DF80100
IronPort-SDR: d+y1FAmm1x8ylCI2kidQQ0ZQ03AbZnIEaby3tHWWrlvwNZDki7HOBeLbgtOZXaQ1OrK65qDVNh
 iU6quiUBWL+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 13:36:47 -0700
IronPort-SDR: bM7LYlezkRuULo3O6nGEPxr0uY2XEKp+yfWLj4vR4gzVT3BIyIeH6bLYe8R58e2r9hod2kRAi8
 jfIQ/bQNUefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="270208867"
Received: from lfnguyen-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.61])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2020 13:36:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: SOF: finalize Baytrail/CherryTrail support
Date: Tue, 26 May 2020 15:36:32 -0500
Message-Id: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

This long-overdue patchset adds missing system suspend/resume support
and hardens the IPC to solve module load/unload issues on specific
devices such as Cyan Chromebook. With this series SOF is finally
iso-feature with the legacy driver. Thanks to Ranjani and Keyon for
the basic patches and Enric for testing.

The last part needed for Baytrail/Cherrytrail is simplification of the
driver/card names and turn-key UCM support (on-going work with
Jaroslav).

Keyon Jie (1):
  ASoC: SOF: Intel: BYT: harden IPC initialization and handling

Pierre-Louis Bossart (3):
  ASoC: Intel: bytcr_rt5640/51: remove .ignore_suspend
  ASoC: Intel: byt/cht: add .pm_ops
  ASoC: SOF: Intel: BYT: mask BUSY or DONE interrupts in handler

Ranjani Sridharan (4):
  ASoC: SOF: Intel: byt: Add PM callbacks
  ASoC: SOF: pm: handle resume on legacy Intel platforms
  ASoC: SOF: ipc: ignore DSP replies received when they are not expected
  ASoC: SOF: Intel: BYT: add .remove op

 sound/soc/intel/boards/bytcht_cx2072x.c      |   3 +
 sound/soc/intel/boards/bytcht_da7213.c       |   3 +
 sound/soc/intel/boards/bytcht_es8316.c       |   3 +
 sound/soc/intel/boards/bytcr_rt5640.c        |   7 +-
 sound/soc/intel/boards/bytcr_rt5651.c        |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |   3 +
 sound/soc/intel/boards/cht_bsw_nau8824.c     |   3 +
 sound/soc/intel/boards/cht_bsw_rt5645.c      |   3 +
 sound/soc/intel/boards/cht_bsw_rt5672.c      |   3 +
 sound/soc/sof/intel/byt.c                    | 116 ++++++++++++++-----
 sound/soc/sof/ipc.c                          |   9 +-
 sound/soc/sof/pm.c                           |   8 +-
 sound/soc/sof/sof-priv.h                     |   2 +-
 13 files changed, 122 insertions(+), 47 deletions(-)


base-commit: 0d71a5cf691a8226151ceeb79fb872925f053df5
-- 
2.20.1

