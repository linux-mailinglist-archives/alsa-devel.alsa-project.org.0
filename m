Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F031867B1D8
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:47:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF321FC;
	Wed, 25 Jan 2023 12:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF321FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647232;
	bh=Y4MDaIFdAkxlz4T8TGmshBV4wjCywYa2pIfPeVA1rUE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kAUF79lhnRRqMOlHD+z86j8y2Xb0KueTN8Zb9jzvFxYjRCC8HMLxzfh0AJRX7ckB9
	 m7e53B7BJThrnGIYXV+dIQ6IFccdEnQGZogU3SMOHFFxma6fWTPVzoGmdVuEhHudFS
	 s8Ymt7B47kaiT0O4ZDF5Vw5JqFzTvvlzrG8MJgdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8080F802E8;
	Wed, 25 Jan 2023 12:46:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06ED6F804FD; Wed, 25 Jan 2023 12:46:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 872DBF80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 872DBF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YxTrFSX8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647164; x=1706183164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y4MDaIFdAkxlz4T8TGmshBV4wjCywYa2pIfPeVA1rUE=;
 b=YxTrFSX8NsWBvQl60bqi02t8GzW7wFITbCyJkEJw3cm3tZItA6lunv0L
 7c1stSBIXwQ0VWpcg6RuBsh49pCu4Ifx0sQoIog8HBX+hiIEGEj04F2fe
 eQK4JQt9Lfqo1LAuyJDIq/VwWn68YMeU9g7pGz+3R8PQ3LQy4VI8cLzFO
 j7a3FFVZRmqxNqTKPC+7iDuE27cy6XDheOtmXVj11+GkIT2ixSKE90a0J
 zG1HSfD8w7dFJKnaadBOymyd+79/YLJQS9TV3D3XVouBD0Dg3mkhdb6+w
 z3Ao2FbI3MT8uu+2RGGc8Ee0AAxIskKO3nquchD0SBHd5xhnriSufkEIU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234142"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612393916"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612393916"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:45:56 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Date: Wed, 25 Jan 2023 20:46:38 +0100
Message-Id: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Following is series of fixes and cleanups for core topology code. Few
patches fixing various problems all around and few fixing function
names.

Amadeusz Sławiński (11):
  ASoC: topology: Properly access value coming from topology file
  ASoC: topology: Remove unused SOC_TPLG_PASS_PINS constant
  ASoC: topology: Fix typo in functions name
  ASoC: topology: Fix function name
  ASoC: topology: Rename remove_ handlers
  ASoC: topology: Remove unnecessary forward declarations
  ASoC: topology: Pass correct pointer instead of casting
  ASoC: topology: Return an error on complete() failure
  ASoC: Topology: Remove unnecessary check for EOF
  ASoC: topology: Use unload() op directly
  ASoC: topology: Unify kcontrol removal code

 include/sound/soc-topology.h |   2 +-
 sound/soc/soc-topology.c     | 183 ++++++++++++++---------------------
 2 files changed, 74 insertions(+), 111 deletions(-)

-- 
2.25.1

