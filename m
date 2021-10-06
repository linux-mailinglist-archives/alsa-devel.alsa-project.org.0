Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D362A42446D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8C1820;
	Wed,  6 Oct 2021 19:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8C1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541869;
	bh=k8uuRDhLdxhfUN7qEbd8brg4j25efIDYcodk0R4Ln54=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dnASVo8ESPVc4ROH0e+ADV7UimS2ycTN8OGsW7JEdzfkIlr85+g25E8dUvNbwFnXQ
	 9GFjuPWQVnMFIhdmNRd6bAiHgoIjtNL7/EBX2lltT77SwfpVWT8qA83F1L8PoPEtx0
	 SNfnJKiSz+SyYJjtKbh++Fz6CQ2eCu8d8vjOu9O0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5913DF804EC;
	Wed,  6 Oct 2021 19:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E49D8F804EC; Wed,  6 Oct 2021 19:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C60F804E7
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C60F804E7
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312264549"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312264549"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="524337490"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2021 10:35:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9B10A159; Wed,  6 Oct 2021 20:35:15 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC: Intel: bytcht_es8316: few cleanups
Date: Wed,  6 Oct 2021 20:33:45 +0300
Message-Id: <20211006173349.84684-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The small set of cleanups against bytcht_es8316 board file.

In v3:
- actually added a Pierre's tag (Mark)

In v2:
- added tag (Pierre)
- added commit message to the patch 2 (Joe)

Andy Shevchenko (4):
  ASoC: Intel: bytcht_es8316: Get platform data via dev_get_platdata()
  ASoC: Intel: bytcht_es8316: Use temporary variable for struct device
  ASoC: Intel: bytcht_es8316: Switch to use gpiod_get_optional()
  ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to avoid log
    saturation

 sound/soc/intel/boards/bytcht_es8316.c | 37 +++++++++-----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

-- 
2.33.0

