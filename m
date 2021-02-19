Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA43201A9
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:18:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65ACF1674;
	Sat, 20 Feb 2021 00:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65ACF1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776705;
	bh=Hh5SN70vOaTJ/wnsxumobAACLEDWcaFYFYHVeirvIe0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YZTXfsFOTNvJWfT2yg8ImQy9BVqnYaxedhGe/FcaqF9S1Foz1/bCO8Xpbg8ayoW02
	 Cxu5JJgpqN+2y/UvljajahpCNZ+Yc3e5Tk5ptwMfLT/bBk0ORBWYvXajMvSuwJbjXr
	 Ru74UnGbVhXY+W41l3KrBl7ang7bR/aDRwTSBvAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D875FF8026B;
	Sat, 20 Feb 2021 00:16:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1477F8020B; Sat, 20 Feb 2021 00:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10808F800D0
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10808F800D0
IronPort-SDR: 6HKYScnBuqNGViQxI8MraXe2UOSxhtIf6vEZeAn20rKka6PyrlLXC8OtNoJWNvdqkpRTLW5HfU
 oPITJrher4AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203290901"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203290901"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:45 -0800
IronPort-SDR: 4rvx8CwsrxWY4+/L3cBHGBBhKojQ58CvpjgRWxV1L1GKyyRkaHiF4LX7M+5g2w5hv+OTzPu02q
 Hc+TgreR3/5Q==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329779"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: sh: remove cppcheck warnings
Date: Fri, 19 Feb 2021 17:16:27 -0600
Message-Id: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

No functional changes except for patch 4 where a missing error check
was added for consistency.

Pierre-Louis Bossart (8):
  ASoC: sh: dma-sh7760: remove unused variable
  ASoC: sh: rcar: align function prototypes
  ASoC: sh: rcar: simplify return
  ASoC: sh: rcar: core: rename shadowing variables
  ASoC: sh: rcar: ctu: add  missing error check
  ASoC: sh: rcar: ssi: remove redundant assignment
  ASoC: sh: siu_pcm: remove useless assignment
  ASoC: sh: siu_pcm: remove unused variable

 sound/soc/sh/dma-sh7760.c |  1 -
 sound/soc/sh/rcar/core.c  | 14 +++++++-------
 sound/soc/sh/rcar/ctu.c   |  2 ++
 sound/soc/sh/rcar/rsnd.h  |  6 +++---
 sound/soc/sh/rcar/ssi.c   |  1 -
 sound/soc/sh/siu_pcm.c    |  6 +-----
 6 files changed, 13 insertions(+), 17 deletions(-)

-- 
2.25.1

