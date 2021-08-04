Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E32C3E08BD
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 21:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DF9168B;
	Wed,  4 Aug 2021 21:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DF9168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628105211;
	bh=jwmDyiyLkcJ7hjVrVkdtT1GMaK0z4HJuT1UmgGPq20Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sw7w3vCWSofeBImSq/oDPwJSdYacFomh/mXHkoj997qbm6TJxe6Hg6oOsgR0udvF6
	 iwcYk0Ywtduhmr9oBxNhqbPh4t1+CroJ+22NMOi0P0NtHii6ioQSJeZE7FMGgdll1F
	 H/2sc726zItguogc+jdFWuIEH18dtS221H46375g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 905F6F80271;
	Wed,  4 Aug 2021 21:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599F5F8025F; Wed,  4 Aug 2021 21:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85E05F8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 21:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85E05F8010A
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="235952801"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="235952801"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="569142444"
Received: from ccho-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.189.253])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 12:25:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: codecs: cppcheck warnings
Date: Wed,  4 Aug 2021 14:24:53 -0500
Message-Id: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
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

Two minor corrections for return values, and one more important one
for max98090 where duplicate reads don't seem necessary.

Pierre-Louis Bossart (3):
  ASoC: max98090: remove duplicate status reads and useless assignmment
  ASoC: mt6359-accdet.c: remove useless assignments
  ASoC: wcd938x: simplify return value

 sound/soc/codecs/max98090.c      | 4 +---
 sound/soc/codecs/mt6359-accdet.c | 8 ++++----
 sound/soc/codecs/wcd938x.c       | 2 +-
 3 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.25.1

