Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E539039CC01
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 03:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D00D1716;
	Sun,  6 Jun 2021 03:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D00D1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622941378;
	bh=HhX1N0wEEjoMVbB6RIXwjmS/nr3OA2BaKkjPcagQEuw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dJyVoHWHpBUiwljeNOev7Up8DxRZLZzNH3WkiTNMyTAK9SyjcPYx3QL3Z9vTofCQy
	 UCJsaED7CDmVimrfa9GTgHmrgi5+Qql9za82eQs5rVNAKRMPHWQpDynQ/j3ZkNCnpP
	 80Gp6XAKzcS/5nm+H5qydmQmh+c2vrzXpgur5Bss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6777F80155;
	Sun,  6 Jun 2021 03:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC3DFF80253; Sun,  6 Jun 2021 03:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC2DCF80155
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 03:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC2DCF80155
IronPort-SDR: WoF7leh5rehY/kIxaqbTQNdmH6fmCdzNMlFotUkZOq0E4Gk9bTFqbtpaEfwW+Ei5YmDkPRvKbW
 yw6Tq6IOKMnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="225797729"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="225797729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 18:01:16 -0700
IronPort-SDR: 8gAI/qrO6aPqbZyaDWytxL5LkckqlbCZJl4rgQ68lj1xViPc1LkcG6gXqRmxAWG5JwBuW0ASAm
 5jY24llwIKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="412724626"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2021 18:01:12 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Support CS42L42 on JSL platform
Date: Sun,  6 Jun 2021 08:40:58 +0800
Message-Id: <20210606004102.26190-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Dharageswari R <dharageswari.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org
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

This series consists four patches. Patch 1 adds dai sequence support
for cml/jsl/tgl platforms which is different from the sequence on glk
platform. Patch 2 adds max98360a support to the maxim-common module.
Patch 3 adds driver data for jsl_cs4242_mx98360a which supports
cs42l42 and max98360a running on jsl boards. Patch 4 refactor the
sof_rt5682 to use the max98360 code in the maxim-common module.


Brent Lu (4):
  ASoC: Intel: sof_cs42l42: support JSL DAI link sequence
  ASoC: Intel: maxim-common: support max98360a
  ASoC: intel: sof_cs42l42: add support for jsl_cs4242_mx98360a
  ASoC: Intel: sof_rt5682: code refactor for max98360a

 sound/soc/intel/boards/sof_cs42l42.c          | 340 ++++++++++++------
 sound/soc/intel/boards/sof_maxim_common.c     |  17 +-
 sound/soc/intel/boards/sof_maxim_common.h     |   4 +-
 sound/soc/intel/boards/sof_rt5682.c           |  52 +--
 .../intel/common/soc-acpi-intel-jsl-match.c   |   8 +
 5 files changed, 254 insertions(+), 167 deletions(-)

-- 
2.17.1

