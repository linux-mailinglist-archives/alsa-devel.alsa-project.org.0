Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69D64E167
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 19:55:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19EB62145;
	Thu, 15 Dec 2022 19:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19EB62145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671130512;
	bh=cbcXyvBH99CiQL3kNxgx1X/TDzVvB2zkY1ZsF6Qgc3A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kbi2mqW/u5HDxkrfSjaCkEqDGakhBXlVSxFF16oSi8H2cYl5MJzCcKJ1jc99bFJvp
	 Lr8mVQRII/tpcpscfnkGiZcwn6YL6ezb966AMZGL6ewOT6kRHuSYFwsE+ZBcrtz4L+
	 m16r5bMEUDvFJ+MAonV7oOiwiDv6r9CD8ngTAtok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D979CF804E7;
	Thu, 15 Dec 2022 19:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3549F804ED; Thu, 15 Dec 2022 19:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB666F801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 19:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB666F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cQ91Z9v9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671130452; x=1702666452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cbcXyvBH99CiQL3kNxgx1X/TDzVvB2zkY1ZsF6Qgc3A=;
 b=cQ91Z9v9++S1jiP0MWt4KxY31vKAlXaB6NJtsOVWWJEqeaEwMqxH3xW7
 nIywuLHcZUw/pZtc55t5tWDqsp4aPUFoiyed81+b3sRsNRaeYFJgzkO3N
 /qNxVhJV1HjizkqL6A9OcwZYBc3yJMV9B3+sXgtj0cEzhQaTkm1Fijfoo
 kz6rjkPSo9IFE5MUextEuPUgJGc4DqfM+2QW1ghh2/ImrcnHW9JyF0rgT
 JeUCNqkUb2r3YnFH6qqIoEI7FzIuhGr6rhHbWB4pY/cTSaxRxXjC+4ufq
 uN4yjlkqLH+WMS4wA7faup4RouT4vb9HZ61+z1+almRfXb/3eyZo4rvzs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="318819918"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="318819918"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="738260651"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="738260651"
Received: from mayurarx-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.35.200])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:54:05 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: Fixes for suspend after firmware crash
Date: Thu, 15 Dec 2022 10:53:44 -0800
Message-Id: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
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
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series contains 2 patches to fix device suspend after a firmware
crash and another patch to allow reading the FW state from debugfs.

Curtis Malainey (1):
  ASoC: SOF: Add FW state to debugfs

Ranjani Sridharan (2):
  ASoC: SOF: pm: Set target state earlier
  ASoC: SOF: pm: Always tear down pipelines before DSP suspend

 sound/soc/sof/debug.c | 4 +++-
 sound/soc/sof/pm.c    | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1

