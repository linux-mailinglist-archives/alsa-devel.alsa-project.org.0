Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7D35422D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 14:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF4116E7;
	Mon,  5 Apr 2021 14:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF4116E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617627008;
	bh=Es7AiRWUC358x2UBP900e+IroLJIgKKKlkIv0F9xLB0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iabW26aeHbIkPj05PNs7CVmvDpxM+70V9yvzFz2Fk2FiDfCY6ompwklelHVC+gRs3
	 r7nMX/h7S2W0VRQYG0ESe+KssI5NTOsAO1KtATOHwQMuYiwC6DRzRuHh1m0e49O1J0
	 rKw0r3roT3VPpq66bDz6tbNjlS/qHcQFXLg0ticI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD32F80245;
	Mon,  5 Apr 2021 14:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C380F8003A; Mon,  5 Apr 2021 14:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81EB0F8003A
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 14:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EB0F8003A
IronPort-SDR: PSjJ1luKiYhz6MQzG50ov/6tEIjvfnOelvSpqov37Y1sPRtqFUFSSPj+MxnwFyCFYjWahD4alp
 EBgqmoAxPTvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="278081137"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="278081137"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 05:49:08 -0700
IronPort-SDR: 70hCiO8PwFRfX/MTWGeOw/L7cGvOb5FB/qQqENcR5mhrfilNlvq7xETuI/I0l8utJb+q+kPczn
 3aw3fCmhlZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; d="scan'208";a="414280072"
Received: from snappy-s2600wt2r.iind.intel.com ([10.223.163.26])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2021 05:49:06 -0700
From: vamshi.krishna.gopal@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/2] kbl_da7219_max9357a machine changes for wov and MST
Date: Mon,  5 Apr 2021 18:18:33 +0530
Message-Id: <20210405124835.71247-1-vamshi.krishna.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: harshapriya.n@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, biernacki@google.com,
 vamshi.krishna.gopal@intel.com, pierre-louis.bossart@intel.com
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.corp-partner.google.com>

Hi all,

This patch series about creating dailink for Wake on voice functionality
and also adding MST route changes.

changes in v3:

-Remove DP from widgets
-Add MST support in other routing table for kbl_rt5663_max98927.c 

v2 is here:

https://patchwork.kernel.org/project/alsa-devel/cover/20210325174325.31802-1-vamshi.krishna.gopal@intel.com/

v1 is here:

https://patchwork.kernel.org/project/alsa-devel/cover/20210324175200.44922-1-vamshi.krishna.gopal@intel.com/


Mac Chiang (1):
  ASoc: Intel: board: add BE DAI link for WoV

Vamshi Krishna Gopal (1):
  ASoC: Intel: kbl: Add MST route change to kbl machine drivers

 sound/soc/intel/boards/kbl_da7219_max98357a.c | 58 +++++++++++++++++--
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 10 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 14 +++--
 3 files changed, 70 insertions(+), 12 deletions(-)

-- 
2.17.1

