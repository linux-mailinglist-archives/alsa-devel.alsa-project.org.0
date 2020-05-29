Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD481E7EA2
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C2A17B7;
	Fri, 29 May 2020 15:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C2A17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590758873;
	bh=LUhq28bC2A5Yg9G7MVW362xFI5LECEmkxyotMYHJs8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YeaQnboZQEFbOfcnLSUlios7abjEwBOODIxqZJRwlTgnQAocNZNgATN+JKi6yrhz/
	 BAeynjuZ/3+enfrJYDoDDtl82uUJ+DluvgoqBs2L1orpvOFZfYt/kc3Phjeo0lkQKr
	 OmCDRl+AALi16RvwGGpoc2hwrIFFsMMe3UONfrh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E59F8026F;
	Fri, 29 May 2020 15:26:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61F47F8016F; Fri, 29 May 2020 15:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74249F80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74249F80125
IronPort-SDR: VbxX6KVUeKrrIDaORe3/r5ymXiEB03+ilMuuRWLIhp+e9mSHyiKSN6PnUcPTKPVhQpTz9offzM
 idiWFiqbMLHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 06:25:57 -0700
IronPort-SDR: mZqrY5tb0+nM8zNtDrkBKPdI5AU0OOvXLroHx9jqeqk7yrZn/BsTGO7Z/Gy7ORhB0rDeuASOdI
 KlUECuaG1nGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="311240280"
Received: from bbaum-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.67.71])
 by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 06:25:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: simplify driver/card names for SOF/UCM
 integration
Date: Fri, 29 May 2020 08:25:41 -0500
Message-Id: <20200529132544.17449-1-pierre-louis.bossart@linux.intel.com>
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

As suggested by Jaroslav, this patchset simplifies legacy cards
compiled with SOF: they now expose an 'SOF' driver name and an
'sof-bytcht <codec>' card name. UCM uses this driver name and
additionally checks for the card name to load a configuration shared
with the SST driver.

This patchset is just a rename with no functionality change. There is
no modification when SOF is not used, and Kconfig for SOF are disabled
when SST is enabled so no risk of interference.

I know this is cutting it very close to the merge window but hope that
this helps make 5.8 the first kernel version where SOF 'just
works'(tm) on legacy platforms with no additional configuration needed
(as is already the case with more recent HDaudio+DMIC platforms).

Thanks to Jaroslav for all the hard work on the alsa-lib/UCM side (the
majority of the configs are already merged in alsa-ucm-conf, only
minor updates are in-flight for max98090 and broadwell).

Pierre-Louis Bossart (3):
  ASoC: Intel: byt*: simplify card names for SOF uses
  ASoC: Intel: cht*: simplify card names for SOF uses
  ASoC: Intel: broadwell: simplify card names for SOF uses

 sound/soc/intel/boards/bdw-rt5650.c          | 12 +++++++++++-
 sound/soc/intel/boards/bdw-rt5677.c          | 12 +++++++++++-
 sound/soc/intel/boards/broadwell.c           | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_cx2072x.c      | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_da7213.c       | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_es8316.c       | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5640.c        | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5651.c        | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 17 +++++++++++++++--
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 12 +++++++++++-
 12 files changed, 136 insertions(+), 13 deletions(-)


base-commit: 67866ff9b7a7d9d4a3030efaadb079290ebaf967
-- 
2.20.1

