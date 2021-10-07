Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255264258D5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 19:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF723829;
	Thu,  7 Oct 2021 19:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF723829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633626314;
	bh=j6mii2M7D8fU41Ozs4+xvcp0kmTiGNqQhUqNJq2om5w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SOW4BIhGkdjMdbaZeWwpuUnRpPHE8cQ1htaBE6O2v3tkiv5lOf9pNMJNUgKY3taiZ
	 FlYinhsPnm1sFJwa/1fal4Kdcg8vwNnkEgvHqDaXXEuvVta3mJiwRYFzFggCbte97M
	 lAsEcEyN7apscIg5g6MSIeiJuC+Z8iFYSEpwJmZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 361D6F804E6;
	Thu,  7 Oct 2021 19:03:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3963F804E5; Thu,  7 Oct 2021 19:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B95F802A0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 19:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B95F802A0
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="213450376"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="213450376"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="715241973"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2021 10:02:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 405AB159; Thu,  7 Oct 2021 20:02:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5651: few cleanups
Date: Thu,  7 Oct 2021 20:02:46 +0300
Message-Id: <20211007170250.27997-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
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

The small set of cleanups against bytcr_rt5651 board file.

In v2:
- added commit message to patch 2 (Joe, Pierre)
- added cover letter (Pierre)
- added Hans to Cc list (Hans)

Andy Shevchenko (4):
  ASoC: Intel: bytcr_rt5651: Get platform data via dev_get_platdata()
  ASoC: Intel: bytcr_rt5651: Use temporary variable for struct device
  ASoC: Intel: bytcr_rt5651: use devm_clk_get_optional() for mclk
  ASoC: Intel: bytcr_rt5651: Utilize dev_err_probe() to avoid log
    saturation

 sound/soc/intel/boards/bytcr_rt5651.c | 118 +++++++++++---------------
 1 file changed, 50 insertions(+), 68 deletions(-)

-- 
2.33.0

