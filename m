Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6E54C3DA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 10:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1518D18E4;
	Wed, 15 Jun 2022 10:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1518D18E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655282714;
	bh=h96Y6vygZdErxysNcG3e66JkY2qPD10lIFpev7lcDkA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sdeh1pp0RicOSSec9sVXpwP98Hj4/TMRhz0WnrlEXkUWigAki4F3hvVJ8di2dqgMZ
	 IGX1z6fbeQwJrDe2NI4TDpd+tp+0TuEGjKfeE899FEd5X8BoSZJT6St7+KHUx+Dbci
	 7qBgnp3ObSMG66k18WehhbLpqW5xkaeTsUSfQAbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD9BF8028D;
	Wed, 15 Jun 2022 10:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4FF6F800D8; Wed, 15 Jun 2022 10:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 609EBF800D8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 10:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 609EBF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZEHq6Wfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655282644; x=1686818644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h96Y6vygZdErxysNcG3e66JkY2qPD10lIFpev7lcDkA=;
 b=ZEHq6WfsUIAMNCl5Vt4KxeExF+BgUk12ULYrH+hK3JMP5iWN5iH3NlZi
 C591Xn7Bhc7wp2HMSllMXiofI6bKGYtkwJ54pEOQYYBRui2xGJRVSnoX/
 fN8zNWy/E3KlTrycE3j8jeTnBLC91MWMUO8tKfKnLnSQVT+629oMVz9Xk
 3FzwHL52YMUizwo6TNDS/L7rS9MbccFr0UeoIahtHXlqX+iuDPhlmzvRJ
 UgzlevcgdYXe/7rApYFugj4iGxCqHsiWGhHJ+3VFVqTTNJ/YVHUjq4OEd
 IfEiASh7YxCSVNoT8g5Q0pyL5kwpG/puNJy2MsX92DUVXsrLoNM3ZzGLK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267573723"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="267573723"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640876212"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/2] ASoC: SOF: Intel: Add support for MeteorLake
Date: Wed, 15 Jun 2022 16:43:46 +0800
Message-Id: <20220615084348.3489-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

Add platform abstraction for the Meteor Lake platform.

This platform has significant differences compared to the TGL/ADL
generation: it relies on new hardware using the code name 'ACE' and
only supports the INTEL_IPC4 protocol and firmware architecture based
on the Zephyr RTOS

Bard Liao (2):
  ASoC: SOC: Intel: introduce cl_init callback
  ASoC: SOF: Intel: Add support for MeteorLake (MTL)

 include/linux/soundwire/sdw_intel.h |   2 +
 sound/soc/sof/intel/Kconfig         |  16 +
 sound/soc/sof/intel/Makefile        |   4 +-
 sound/soc/sof/intel/apl.c           |   1 +
 sound/soc/sof/intel/cnl.c           |   2 +
 sound/soc/sof/intel/hda-loader.c    |  15 +-
 sound/soc/sof/intel/hda.h           |   4 +
 sound/soc/sof/intel/icl.c           |   1 +
 sound/soc/sof/intel/mtl.c           | 800 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/mtl.h           |  76 +++
 sound/soc/sof/intel/pci-mtl.c       |  71 +++
 sound/soc/sof/intel/shim.h          |   2 +
 sound/soc/sof/intel/tgl.c           |   4 +
 13 files changed, 994 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/sof/intel/mtl.c
 create mode 100644 sound/soc/sof/intel/mtl.h
 create mode 100644 sound/soc/sof/intel/pci-mtl.c

-- 
2.17.1

