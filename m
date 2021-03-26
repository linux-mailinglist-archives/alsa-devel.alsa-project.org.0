Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147C34B1BA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF42C167B;
	Fri, 26 Mar 2021 23:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF42C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796091;
	bh=q6YnRjaBFhAfPu170ptoxqbLkp+sJcMYRdkGVkPT3ME=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TqVpTdxVv7HF2c71m+c2GN5eq74DKxHT9XOQXkKjoEy2dNgORQUG//hwcI1NBL90z
	 O0sGMK92gI7gXf+ShMIUiTUQdNF2bmyhADgqvicUsavU2pxeDEFr6LH3wQCQ4IG1Bt
	 obYMcAEASQEBhjUWbKVVBC4PTSeI0aLIemQU0c2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40FC2F80240;
	Fri, 26 Mar 2021 23:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E057F80103; Fri, 26 Mar 2021 22:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E882FF80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 22:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E882FF80103
IronPort-SDR: cZEAyGT0tylZ7mhVjsL0FvFK1rYH7I7TrZedaYV2Y9HwfTsqT9OPX5HS8MqWlZ3ydJY3ohG+vf
 T7j9QMQ5PPqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="276371062"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="276371062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:46 -0700
IronPort-SDR: cvMv4ltXgyHozMqp91iGvXNe2CgxJp9zV41gu6oqhn+hdNgV0W7BgUpFBc2rba+G634N9a7x+n
 M7eW3ftuOfng==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706637"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/17] ASoC: remove cppcheck warnings for multiple SOCs
Date: Fri, 26 Mar 2021 16:59:10 -0500
Message-Id: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
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

Trivial cleanups to make cppcheck less verbose.

There should be no functionality change, except for the 'sti_uniperif'
patch where an error check was added.

Pierre-Louis Bossart (17):
  ASoC: amd: renoir: acp3x-pdm-dma: remove unnecessary assignments
  ASoC: atmel: fix shadowed variable
  ASoC: atmel: atmel-i2s: remove useless initialization
  ASoC: bcm: cygnus_ssp: remove useless initialization
  ASoC: meson: axg-tdmin: remove useless assignment
  ASoC: meson: axg-tdmout: remove useless assignment
  ASoC: pxa: remove useless assignment
  ASoC: sti: sti_uniperif: add missing error check
  ASoC: sti: uniperif: align function prototypes
  ASoC: stm: stm32_adfsdm: fix snprintf format string
  ASoC: sunxi: sun8i-codec: clarify expression
  ASoC: tegra: tegra20_das: clarify expression
  ASoC: tegra: tegra20_das: align function prototypes
  ASoC: ti: omap-abe-twl6040: remove useless assignment
  ASoC: ti: omap-mcsp: remove duplicate test
  ASoC: ux500: mop500: rename shadowing variable
  ASoC: ux500: mop500: align function prototype

 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 --
 sound/soc/atmel/atmel-classd.c       | 6 +++---
 sound/soc/atmel/atmel-i2s.c          | 2 +-
 sound/soc/bcm/cygnus-ssp.c           | 2 +-
 sound/soc/meson/axg-tdmin.c          | 2 +-
 sound/soc/meson/axg-tdmout.c         | 2 +-
 sound/soc/pxa/mmp-pcm.c              | 2 +-
 sound/soc/sti/sti_uniperif.c         | 2 ++
 sound/soc/sti/uniperif.h             | 4 ++--
 sound/soc/stm/stm32_adfsdm.c         | 2 +-
 sound/soc/sunxi/sun8i-codec.c        | 2 +-
 sound/soc/tegra/tegra20_das.c        | 8 ++++----
 sound/soc/tegra/tegra20_das.h        | 6 +++---
 sound/soc/ti/omap-abe-twl6040.c      | 2 +-
 sound/soc/ti/omap-mcbsp.c            | 3 +--
 sound/soc/ux500/mop500.c             | 6 +++---
 sound/soc/ux500/mop500_ab8500.h      | 2 +-
 17 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.25.1

