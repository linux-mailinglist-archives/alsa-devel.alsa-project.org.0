Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88281231D3B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 13:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212AD16E5;
	Wed, 29 Jul 2020 13:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212AD16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596021000;
	bh=3C6EW1DBcUlJEc9KqnoRbyvG3N+YZZeuxcHEYMbR7rA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TVssKYSLifrcs0w06MkbxR223lF+YxHunACFNDMcH3fxtNsWe8Ge3KoiWYzR11lj+
	 OlO9QN8VDspq4yeYKKB3Z5y1SuelslHv+XOfw/9w+OmAsncrLLO5XoDb7+YIK7B1uw
	 MqpDOjT9bg0ZC5PeTjADfxF4pmxBN7a6eiUGgrN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD69F801EB;
	Wed, 29 Jul 2020 13:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B674F801A3; Wed, 29 Jul 2020 13:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98507F8012F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 13:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98507F8012F
IronPort-SDR: nEBu5I7S3+eV+Of/XkyEI2S/TbulbOrqGTey/VqjVgIYf27/zuEmC98f3bSeaih3Fq5hi+MKjv
 gOonTVyDn0sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="215893152"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="215893152"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 04:07:59 -0700
IronPort-SDR: 6q3ObfXHhAmD/7ZkVTNxq7TjBbtQxv4gPtus3R33bX3z+k7cQWfbvY1vcf5AWir2F7yANU6IZ4
 K09zWkdPHbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="490254701"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2020 04:07:54 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] Add period size constraint for Atom Chromebook
Date: Wed, 29 Jul 2020 19:03:03 +0800
Message-Id: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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

Two different constraints are implemented: one is in platform's CPU
DAI to enforce period sizes which are already used in Android BSP. The
other is in Atom Chromebook's machine driver to use 240 as period size.

Brent Lu (1):
  ASoC: intel: atom: Add period size constraint

Yu-Hsuan Hsu (1):
  ASoC: Intel: Add period size constraint on strago board

 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 15 +++++++++++++++
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.7.4

