Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4A56A2EF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E616A1651;
	Thu,  7 Jul 2022 14:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E616A1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657198666;
	bh=e1nCzOfxLYBxm071KDMWG+1vx4nlXoEO0lz6N9LCes0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kjtp211svWTBnU/77fP37zS0bn84vCecfUBcSqlxpqi3UDS0YqrHaLpVr66NTIgSH
	 Kgd3dX2aichPShjEd5tkFoV/iVB8dtmDs153ZhHq1Uy01CFkZoVwArbhoX4FzaTQql
	 SFs81EUllU3VKyakNepbXSk19gRt0lJ0/8OBL2uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DB5F8016A;
	Thu,  7 Jul 2022 14:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29D0FF8016A; Thu,  7 Jul 2022 14:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FFF3F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFF3F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="byKS5KOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657198601; x=1688734601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e1nCzOfxLYBxm071KDMWG+1vx4nlXoEO0lz6N9LCes0=;
 b=byKS5KOoyJ57twrEoODfwuW8i2DMcyvaGeYC4PtnJZOB7RgXFeBYRJYZ
 3+LnkCAS4/kUmDiuJO9foTEzOPyeqZ8O1sScWyo5RLzzAMOIBXhsmTJ2a
 /Fyjf4j0MMEvQHwsgO5RdoxmLqM0dtKkgyKREVyNbNc1/TRatp0hj9GKm
 ZzdXhqRSHuONSDemc09W+NIwATSNXje/+feTHXGHtJPxJLFsNp1qme1cw
 im+YzpP0EvzEvTaYnaOap8Lp/6Xbjopj5hPAw/zlJnh9O0jqEd9RHxug4
 Vsl0cRK6M3BLjRYLm8afKTe4QNFc6L1yC559EuW9W6MWTmH/3li80vZcs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272810604"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272810604"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="620781717"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 05:56:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/5] ASoC: codecs: Series of fixes for realtek codecs used
 on RVPs
Date: Thu,  7 Jul 2022 14:56:56 +0200
Message-Id: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
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
and machine boards for it, we identified some problems with those codec
drivers.

This series aims to fix those issues.

Changes in v2:
 - Drop patches which were merged from v1
 - Drop patches changing IRQ behaviour
 - Add patches to set component to NULL on remove - disabling IRQs
   worked around the problem, so those patches weren't needed in earlier
   series

Amadeusz Sławiński (5):
  ASoC: codecs: rt298: Fix NULL jack in interrupt
  ASoC: codecs: rt298: Fix jack detection
  ASoC: codecs: rt286: Set component to NULL on remove
  ASoC: codecs: rt298: Set component to NULL on remove
  ASoC: codecs: rt274: Set component to NULL on remove

 sound/soc/codecs/rt274.c |  1 +
 sound/soc/codecs/rt286.c |  1 +
 sound/soc/codecs/rt298.c | 43 ++++++++++++++++++++--------------------
 3 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.25.1

