Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B242D42589F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 18:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B010829;
	Thu,  7 Oct 2021 18:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B010829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633625920;
	bh=LnHEuLP3Fzl5nhey0msI1FBd4EteagznBWj53YqXdWg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kgR33mpHsKwJi8OtPwMbpY/ArAzrAnF7MAAW+hPCPwUFvhACLNm9Pm3byKWPiM1lJ
	 Raumn6X9LnGn2xKj3pUzGK/LFo7fabj87QovpWngwc9Zl9N2vmaUlU/sKmc+tAot8Z
	 YyC4klLI+wgTuTps1RmBQfvSP+whclb3VkqyW50M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C92F8028B;
	Thu,  7 Oct 2021 18:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64F8CF8027D; Thu,  7 Oct 2021 18:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5849CF800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 18:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5849CF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225081163"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225081163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="524737914"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2021 09:57:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9F566159; Thu,  7 Oct 2021 19:57:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ASoC: Intel: bytcr_rt5640: few cleanups
Date: Thu,  7 Oct 2021 19:57:11 +0300
Message-Id: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
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

The small set of cleanups against bytcr_rt5640 board file.

In v2:
- added commit message to patch 2 (Joe, Pierre)
- added cover letter (Pierre)
- added Hans to Cc list (Hans)

Andy Shevchenko (4):
  ASoC: Intel: bytcr_rt5640: Get platform data via dev_get_platdata()
  ASoC: Intel: bytcr_rt5640: Use temporary variable for struct device
  ASoC: Intel: bytcr_rt5640: use devm_clk_get_optional() for mclk
  ASoC: Intel: bytcr_rt5640: Utilize dev_err_probe() to avoid log
    saturation

 sound/soc/intel/boards/bytcr_rt5640.c | 116 +++++++++++---------------
 1 file changed, 49 insertions(+), 67 deletions(-)

-- 
2.33.0

