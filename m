Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDD3C6503
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBF916A5;
	Mon, 12 Jul 2021 22:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBF916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122070;
	bh=cHjxd9scT7xXyxRZtIcXIBh3dY7Yjoxeky42dBLHS18=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FZAX7EJ4xpUIO9aQhzodHferoChODOzOVtE1T3lh/3tfblLZyrm9EUE7N/08OQ8Z8
	 00tsjS7WPMG6q0sa+b1JLuKT1o37VdW03uzV4VPhxCtMvTKu2po613vJ7wA90LInR0
	 HJo2egu9GSOFey40dVmazkCUC+RSsFX3NuPNHzWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A89F8026D;
	Mon, 12 Jul 2021 22:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD429F8026D; Mon, 12 Jul 2021 22:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C892FF8020C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C892FF8020C
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431638"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431638"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880757"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: Intel: updates for JasperLake and SoundWire machines
Date: Mon, 12 Jul 2021 15:32:33 -0500
Message-Id: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
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

The first 4 patches enable the use of a Maxim 98360a amplifier on
JasperLake using the existing sof_cs42l42 machine driver, and a
slightly different hardware layout compared to GeminiLake devices.

The last 3 patches reflect recent changes in the RT711 codec driver:
we want to avoid duplicating the JD modes and can following the
definitions from the codec driver.

Bard Liao (2):
  ASoC: Intel: sof_sdw: extends SOF_RT711_JDSRC to 4 bits
  ASoC: Intel: sof_sdw: include rt711.h for RT711 JD mode

Brent Lu (4):
  ASoC: Intel: sof_cs42l42: support arbitrary DAI link sequence
  ASoC: Intel: maxim-common: support max98360a
  ASoC: Intel: sof_cs42l42: add support for jsl_cs4242_mx98360a
  ASoC: Intel: sof_rt5682: code refactor for max98360a

jairaj arava (1):
  ASoC: Intel: sof_sdw: update quirk for jack detection in ADL RVP

 sound/soc/intel/boards/sof_cs42l42.c          | 353 ++++++++++++------
 sound/soc/intel/boards/sof_maxim_common.c     |  17 +-
 sound/soc/intel/boards/sof_maxim_common.h     |   4 +-
 sound/soc/intel/boards/sof_rt5682.c           |  52 +--
 sound/soc/intel/boards/sof_sdw.c              |  23 +-
 sound/soc/intel/boards/sof_sdw_common.h       |  27 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |   8 +
 7 files changed, 292 insertions(+), 192 deletions(-)

-- 
2.25.1

