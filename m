Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FD546698
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18B71B0E;
	Fri, 10 Jun 2022 14:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18B71B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864028;
	bh=9lkw50oB2H5wn6PJf5Qa0p0gV8WF4XY1M2R/93Lgijw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eRAFNtPYiUWHGikcK3LKEaC8S8aCX1lUQArs/KUKl4TIJMmKiyNgNi6zH+0Cdu7ZL
	 pNMgXrT8GHXaa18aS8AQdIB8JFvDPc7hR6afLBxAFfvx5NzF3xtLV2JBwvSjAFEy4w
	 F1fUjHKcQA7ztDXb3V9kZFgAnYccWRbq4kF8AE2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F70F80526;
	Fri, 10 Jun 2022 14:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A30F804D2; Fri, 10 Jun 2022 14:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC175F804D2
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC175F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JWApyysn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863974; x=1686399974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9lkw50oB2H5wn6PJf5Qa0p0gV8WF4XY1M2R/93Lgijw=;
 b=JWApyysnEjy0HdWCtl2VPCyQWcNMDLzM0EiyAbnsS+AD+qQs1rmykXJM
 KJFx+DCO4l8jp1RvzSjGxAANk4AKduhW0tHoaM85RXdsGaKp3KgDy7cJA
 nFtX1ZNJFOsLAVW/wTtcogzVo2c9LK7X/3IigYRzU55hcYI1mZQKc79QF
 OMzk+pbsyErNWZNUSal/CcjHEXByY8mgqzHBdWb38kObJvKtszlshxifw
 gC+3OwvarPO4g58vQHedPWBV1Gqf4HbkGZgNHLQY7gI2DKiiUwp9xw+mZ
 nNtCxNDZ5v4W4EDJS/gsvns6P/N1BPQEKK/I0xY+FGBr2lnJMgzJdwxV/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414307"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414307"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517808"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/17] ASoC: Intel: haswell and broadwell boards update
Date: Fri, 10 Jun 2022 14:36:10 +0200
Message-Id: <20220610123627.1339985-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

A number of patches improving overall quality and readability of
haswell.c and broadwell.c source files found in sound/soc/intel/boards.
Both files are first renamed and only then actual changes are being
incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
to match the pattern found in more recent boards.

Most patches bring no functional change - the more impactful patches at
are placed the end:

Refactor of suspend/resume flow for the bdw_rt286 board by dropping
dev->remove() in favour of card->remove() and adjust jack handling to
reduce code size slightly by implementing card_set_jack().

The last patch is removing of FE DAI ops. Given the existence of
platform FE DAI capabilities (either static declaration or through
topology file), this code is redundant.

Cezary Rojewski (17):
  ASoC: Intel: Rename haswell source file to hsw_rt5640
  ASoC: Intel: hsw_rt5640: Reword prefixes of all driver members
  ASoC: Intel: hsw_rt5640: Reword driver name
  ASoC: Intel: hsw_rt5640: Update code indentation
  ASoC: Intel: hsw_rt5640: Update file comments
  ASoC: Intel: hsw_rt5640: Improve probe() function quality
  ASoC: Intel: hsw_rt5640: Improve hw_params() debug-ability
  ASoC: Intel: Rename broadwell source file to bdw_rt286
  ASoC: Intel: bdw_rt286: Reword prefixes of all driver members
  ASoC: Intel: bdw_rt286: Reword driver name
  ASoC: Intel: bdw_rt286: Update code indentation
  ASoC: Intel: bdw_rt286: Update file comments
  ASoC: Intel: bdw_rt286: Improve probe() function quality
  ASoC: Intel: bdw_rt286: Improve hw_params() debug-ability
  ASoC: Intel: bdw_rt286: Improve codec_init() quality
  ASoC: Intel: bdw_rt286: Refactor suspend/resume
  ASoC: Intel: bdw_rt286: Remove FE DAI ops

 sound/soc/intel/boards/Kconfig                |   4 +-
 sound/soc/intel/boards/Makefile               |   4 +-
 sound/soc/intel/boards/bdw_rt286.c            | 257 +++++++++++++
 sound/soc/intel/boards/broadwell.c            | 338 ------------------
 sound/soc/intel/boards/haswell.c              | 202 -----------
 sound/soc/intel/boards/hsw_rt5640.c           | 176 +++++++++
 .../common/soc-acpi-intel-hsw-bdw-match.c     |   6 +-
 7 files changed, 440 insertions(+), 547 deletions(-)
 create mode 100644 sound/soc/intel/boards/bdw_rt286.c
 delete mode 100644 sound/soc/intel/boards/broadwell.c
 delete mode 100644 sound/soc/intel/boards/haswell.c
 create mode 100644 sound/soc/intel/boards/hsw_rt5640.c

-- 
2.25.1

