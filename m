Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3440AB92
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 12:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0152175B;
	Tue, 14 Sep 2021 12:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0152175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631614855;
	bh=tJGvQrryBnIDvxXHJ+aHfHYl32W28SvmKWkf5/YEMRU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lzf286Duh2wSOUufQcYSE/+pHcSd0Ntlvnv+xy6C0pIoWLRDoSEjpsqoS8JYDjxVe
	 gqGdXq+6jjOPgQu8fIaNA0dZS1tXqOeAJXNzHMSurFkH40pajWH6SVBJuqt0IUt6Ry
	 2mDu3l4GgY8jul6u4iKDXtVIaYBF7fI2qBG+kajU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 158A1F8025E;
	Tue, 14 Sep 2021 12:19:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE32F8025E; Tue, 14 Sep 2021 12:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92301F80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 12:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92301F80132
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221989228"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221989228"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 03:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="543895824"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.10])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2021 03:19:24 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Support ALC5682I-VS codec
Date: Tue, 14 Sep 2021 18:18:43 +0800
Message-Id: <20210914101847.778688-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Rander Wang <rander.wang@intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

Support the ALC5682I-VS codec in Intel's rt5682 machine driver with
three board configurations.

Brent Lu (4):
  ASoC: Intel: sof_rt5682: support ALC5682I-VS codec
  ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015p board
  ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015 board
  ASoC: intel: sof_rt5682: support jsl_rt5682s_mx98360a board

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_rt5682.c           | 105 +++++++++++++++---
 .../intel/common/soc-acpi-intel-jsl-match.c   |  24 ++++
 3 files changed, 112 insertions(+), 18 deletions(-)

-- 
2.25.1

