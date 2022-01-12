Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE148C096
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 10:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA5E1938;
	Wed, 12 Jan 2022 10:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA5E1938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641978113;
	bh=qui2EOI7BTx4Qk6aHTNZshsKh1WcvPMH0R3UnUK75bc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XnVTbdLdVltlozLeEacJ0EhWQum1opjlolts8pRYs7e6Jz91OC0ucvi3yMTxBWCsX
	 UbnHab5Ric4t8Y55x5gJI5GFL9JcjVt9Zp0Xk7SFpozXMHALux03D+D0j6kd77oZbP
	 h/u/fhMUx9VmyyDhbXMhpDyVON0q9x3pCcb0eMpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C16CF80279;
	Wed, 12 Jan 2022 10:00:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72A1F80236; Wed, 12 Jan 2022 10:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED, DKIM_VALID, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A18F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 10:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A18F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iMi4KrWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641978040; x=1673514040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qui2EOI7BTx4Qk6aHTNZshsKh1WcvPMH0R3UnUK75bc=;
 b=iMi4KrWUxTomh0k0ACPAlnEYiVl13A5SiiC9NqXskTgSAJhWE+qXZs5/
 YuUPJZqb5BjuP/FpvGOyyKkZfiww9Fdltl6D/jp4tsEOVjxlWPuEO8F6U
 zSSS2fbddrYeorlMe4S9cowiXbsjjqoUtUi1ke9MYhWfzP83Y42FVW0w0
 CAOjIlxDVZMXAobNoDsTeBUFwVTXoX1RxS5gJcisB4+LL+6ToC+JsG03g
 x3oX6yGP0DDQh+82vZ8IdZDWXARnHZUTRcSlZJN6vuxZyjQjMKHpXvHH1
 pTTwSjRU8dUMxim7QHSHwzVybsM7XbPYBkmOAB0BDhBFdNMx+nhcAJ2JS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223674366"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="223674366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 01:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="691318348"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 12 Jan 2022 01:00:34 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] ASoC: topology: Fixes
Date: Wed, 12 Jan 2022 18:00:27 +0100
Message-Id: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

Following series performs few cleanups in topology code.

First patch reduces number of prints we get from failure.
Second allos TLV controls to be either read or write which should be
possible as evidenced by further code in function.
Last one cleanups after refactoring of memory handling.

v2:
 - Add missing Fixes tag on second patch
 - Add Reviewed-by tag from Pierre

Amadeusz Sławiński (3):
  ASoC: topology: Remove superfluous error prints
  ASoC: topology: Allow TLV control to be either read or write
  ASoC: topology: Optimize soc_tplg_dapm_graph_elems_load behavior

 sound/soc/soc-topology.c | 103 ++++++++++-----------------------------
 1 file changed, 27 insertions(+), 76 deletions(-)

-- 
2.25.1

