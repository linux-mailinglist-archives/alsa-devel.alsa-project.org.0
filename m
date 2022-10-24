Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E60609FC9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 13:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7627B28;
	Mon, 24 Oct 2022 13:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7627B28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666609748;
	bh=s7TKH+xxYf4u0gTGeWEzIo70SyH0kaUFMatps0oseJI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DJBqGGtwjvmMwUuscZJKAOsZs4oJ30KjBK0SmTEbar0uGESO74aJu2bAkC/N9CDXl
	 WC3cYROjrFuGJlBK9fdoOgf0N8Q3voA5P96Oau1TuFaPazK7ETFbYnLIi0EEvWdctj
	 MSR/sTtPvaWE+Gtyr+k2dGosL6hyyKZNxvBVIvhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FED6F80543;
	Mon, 24 Oct 2022 13:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68812F80542; Mon, 24 Oct 2022 13:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CABAF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 13:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CABAF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j8WRlQol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666609690; x=1698145690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s7TKH+xxYf4u0gTGeWEzIo70SyH0kaUFMatps0oseJI=;
 b=j8WRlQolhmXQE7MfVpWUvgRKBqzR5UR1CIKYDo2nmn0+1tzL/yBxUIJ6
 v0lUrcaGVnCkVo2mJ+a0YC5OAJu2pr/lf3ay+yXt7uWit/YILtapy2mYf
 OBCOgDjwEH7lEZiBOjtyZYgH3a3i+7k/i/JbvIvBpWUB0rFArLNZQODPw
 mQoZ4RAKpyaQs+oCYpcAFqDJ2L4hwVj6amsaEES9nHTGnZ2SbNSm1eafK
 +nR/jmHch+VV0EXG6CAMJtn30Ur6xHKBLM73iWKuk8hrPsX3Zv7aURQfv
 4yFrA3rmwZPMYSM/0je0K7g6bi1Sx3iELZII7ybVvMGS2YdKvjfGZsNaG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369457555"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="369457555"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 04:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633673415"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633673415"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2022 04:08:01 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Intel: Fix typo in comments
Date: Mon, 24 Oct 2022 21:08:39 +0200
Message-Id: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

There is a typo which keeps propagating through existing Intel machine
boards fix it with hope that fix stops it from appearing in new boards.

Amadeusz Sławiński (2):
  ASoC: Intel: boards: Fix typo in comments
  ASoC: Intel: avs: boards: Fix typo in comments

 sound/soc/intel/avs/boards/max98373.c           | 2 +-
 sound/soc/intel/avs/boards/max98927.c           | 2 +-
 sound/soc/intel/avs/boards/ssm4567.c            | 2 +-
 sound/soc/intel/boards/bdw-rt5650.c             | 2 +-
 sound/soc/intel/boards/bdw-rt5677.c             | 2 +-
 sound/soc/intel/boards/bxt_rt298.c              | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c         | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c          | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c           | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c           | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c           | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c    | 2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c        | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c         | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c         | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c   | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.25.1

