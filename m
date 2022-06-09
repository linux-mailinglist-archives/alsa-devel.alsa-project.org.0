Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82594544DD0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9E71A6A;
	Thu,  9 Jun 2022 15:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9E71A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781809;
	bh=ULHzArisbPyE0SszF6N1LzBS2y0TF/4mi0NtIs8i+0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AsscRIeacc9KbK9A7qY53/T5cGQokxh1qT2MHzpib9HuK9M8/jnj4eDti4XEJVkTq
	 1XmoK0YTd8yBUEl6P+t5a5KaSBNaaKJrFNL/trjpnDEpGpw/8l9RJoxrjvRb6nEl63
	 NX919wqojJrLmdH425pCQp1lsCl+zICEYyRFNlZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913EFF801F5;
	Thu,  9 Jun 2022 15:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8720F80240; Thu,  9 Jun 2022 15:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8F7F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8F7F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b89H/kiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781744; x=1686317744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ULHzArisbPyE0SszF6N1LzBS2y0TF/4mi0NtIs8i+0E=;
 b=b89H/kiRwYgGJ4g+f93vwo56Pepig8lhrGbgnhyqJejAOP6CznM3AZNy
 InYZq3xaBw7R/K5rs7VPbFoVejcR95CrJ4wfLCDEyorQOrzAGGqIXcdrC
 cdKtRwqHhphoN2V7FGKfQpM6NBEmmt9UL16HDsGFXKksLQiAuc/07KjOZ
 gj0dWCJTHQTDgrDDbdTNOgfMYG1U9WVRzVG6P7HTOyk0fwxqWLI1+Tvga
 5WLZdilTeGYo1+1CN0MDpMoo+oU8bGCzsv0EU/6tgwE3R9nczNpBHU1Uv
 uDuGarH4ZzcOq0hC/m0J3djjN77bcOPUM/WFzCeuUHg4iBBd0rhGpcSWN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061374"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966115"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:38 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] ASoC: codecs: Series of fixes for realtek codecs used
 on RVPs
Date: Thu,  9 Jun 2022 15:35:30 +0200
Message-Id: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Our tests platforms do use realtek codecs, while implementing avs driver
and machine boards for it, we identified quite a lot of problems with
those codec drivers.

This series aims to fix those issues.

Amadeusz Sławiński (8):
  ASoC: codecs: rt274: Move irq registration and cleanup
  ASoC: codecs: rt286: Move irq registration and cleanup
  ASoC: codecs: rt298: Move irq registration and cleanup
  ASoC: codecs: rt274: Enable irq only when needed
  ASoC: codecs: rt286: Enable irq only when needed
  ASoC: codecs: rt298: Enable irq only when needed
  ASoC: codecs: rt298: Fix NULL jack in interrupt
  ASoC: codecs: rt298: Fix jack detection

Cezary Rojewski (3):
  ASoC: codecs: rt274: Always init jack_detect_work
  ASoC: codecs: rt286: Reorganize jack detect handling
  ASoC: codecs: rt298: Reorganize jack detect handling

 sound/soc/codecs/rt274.c           | 67 +++++++++++----------
 sound/soc/codecs/rt286.c           | 56 ++++++++----------
 sound/soc/codecs/rt286.h           |  2 -
 sound/soc/codecs/rt298.c           | 93 +++++++++++++-----------------
 sound/soc/codecs/rt298.h           |  2 -
 sound/soc/intel/boards/broadwell.c |  6 +-
 sound/soc/intel/boards/bxt_rt298.c |  2 +-
 sound/soc/intel/boards/skl_rt286.c |  2 +-
 8 files changed, 108 insertions(+), 122 deletions(-)

-- 
2.25.1

