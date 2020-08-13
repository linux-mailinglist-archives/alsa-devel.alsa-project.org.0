Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA66243F98
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D41F91671;
	Thu, 13 Aug 2020 22:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D41F91671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349037;
	bh=RE0k0I90QXhLhvmW/Cf4lrokGzpWF719FMCXJsCVk9k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DfF7sAnOwP2AbRpc0vMPGY9hLtBS+T6aC6741GhNwVjx0dOymo1251LvjLLvV5MNy
	 XlmgCoystGp7Y25ksaN9b1XEts3zljBKs69N9sQTWjDDeiWKsvbyh35h0fXLir1KPR
	 WFsQzBOSCRXas5VzI3xkFNYddLQ/iFsIVXykb2+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFED1F802DB;
	Thu, 13 Aug 2020 22:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F0EFF802A1; Thu, 13 Aug 2020 22:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E71AFF800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71AFF800D3
IronPort-SDR: diY210YJQhCT/m82w6kblGJXdKlIS33zRmXrLy+YZMAYHElWUE6pEn+Fknp4JsqVF6geNkMzwz
 41nKNLvOQHLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="172360694"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="172360694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:01 -0700
IronPort-SDR: imHLXU+jrDuFA4v5UKv2bl7LX/DKax0Q3U7AjuS2Rtj/mOJiwPpUitcCeqMgrswEKNaDWWDcu+
 DkvBPt7Qsuyw==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506238"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:01:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/21] ASoC: Intel: fix cppcheck warnings
Date: Thu, 13 Aug 2020 15:01:26 -0500
Message-Id: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
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

This patchset tries to reduce the number of warnings on those drivers,
so that cppcheck can become a viable tool to detect issues (currently
hundreds of reports).

Most of the problems are related to unnecessary/redundant variable
assignments, prototypes and one nice logical mistake resulting in an
always-true condition.

Pierre-Louis Bossart (21):
  ASoC: Intel: Atom: sst-atom-controls: remove redundant assignments
  ASoC: Intel: Atom: compress: remove redundant assignment
  ASoC: Intel: Atom: platform-pcm: remove redundant assignment
  ASoC: Intel: Atom: sst: remove useless NULL assignment
  ASoC: Intel: Atom: remove redundant initialization
  ASoC: Intel: Atom: sst_pvt: remove redundant initialization
  ASoC: Intel: Atom: platform-pcm: fix redundant return
  ASoC: Intel: Atom: remove useless assignment
  ASoC: Intel: Atom: sst_loader: remove always-true condition
  ASoC: Intel: Atom: sst_pvt: simplify return handling
  ASoC: Intel: Atom: (cosmetic) align parameters
  ASoC: Intel: Baytrail: (cosmetic) align function parameters
  ASoC: Intel: common: (cosmetic) align function parameters
  ASoC: Intel: haswell: (cosmetic) align function parameters
  ASoC: Intel: haswell-ipc: remove redundant assignments
  ASoC: Intel: Skylake: skl-nhlt: remove redundant initialization
  ASoC: Intel: Skylake: cldma: remove redundant initialization
  ASoC: Intel: Skylake: sst-utils: remove redundant assignment
  ASoC: Intel: Skylake: skl-topology: remove redundant assignments
  ASoC: Intel: Skylake: skl-topology: remove redundant assignment
  ASoC: Intel: Skylake: (cosmetic) align function parameters

 sound/soc/intel/atom/sst-atom-controls.c      |  4 +--
 .../intel/atom/sst-mfld-platform-compress.c   |  3 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c  |  4 +--
 sound/soc/intel/atom/sst-mfld-platform.h      |  4 +--
 sound/soc/intel/atom/sst/sst.c                |  5 ++-
 sound/soc/intel/atom/sst/sst.h                | 34 +++++++++----------
 sound/soc/intel/atom/sst/sst_loader.c         |  3 +-
 sound/soc/intel/atom/sst/sst_pvt.c            |  4 +--
 sound/soc/intel/baytrail/sst-baytrail-ipc.h   |  3 +-
 sound/soc/intel/common/sst-dsp-priv.h         |  2 +-
 sound/soc/intel/common/sst-dsp.h              | 15 ++++----
 sound/soc/intel/haswell/sst-haswell-ipc.c     |  4 +--
 sound/soc/intel/haswell/sst-haswell-ipc.h     |  2 +-
 sound/soc/intel/skylake/cnl-sst-dsp.h         |  4 +--
 sound/soc/intel/skylake/skl-nhlt.c            |  2 +-
 sound/soc/intel/skylake/skl-sst-cldma.c       |  2 +-
 sound/soc/intel/skylake/skl-sst-ipc.h         | 16 ++++-----
 sound/soc/intel/skylake/skl-sst-utils.c       |  2 +-
 sound/soc/intel/skylake/skl-topology.c        |  8 ++---
 sound/soc/intel/skylake/skl-topology.h        |  8 ++---
 sound/soc/intel/skylake/skl.h                 |  2 +-
 21 files changed, 63 insertions(+), 68 deletions(-)

-- 
2.25.1

