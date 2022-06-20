Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F6551530
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A90D183E;
	Mon, 20 Jun 2022 12:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A90D183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719495;
	bh=zr6VMQioBySyht2zXsQHKQt8RAO9xK3VUFFQXX2Rqw4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JsJoe0Bf4kFlVpo0mTHfJCdYM2Qp4qcmzdC7ff0t0wuNbD4f3QdoP9DShEWjd9dCw
	 Tq73m6hSvQIsyBKmHN71di6IDzr9jmGYak9ODSQnQnNvDK/35Tcwr7z7TJTAq9fjD1
	 O7dWFrk9GAipACbsUHYCvtK0ZbVcX2+jiSI44iOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B7EF804CF;
	Mon, 20 Jun 2022 12:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D437F804D2; Mon, 20 Jun 2022 12:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 928FEF800FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 928FEF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IAxA8Ttd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719432; x=1687255432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zr6VMQioBySyht2zXsQHKQt8RAO9xK3VUFFQXX2Rqw4=;
 b=IAxA8Ttd57+KXT36umOQYmpgBN7YReJUsiwWV+PDRRj72yHJj6jj8c8G
 iNM2VVJmPLcyCHnh6hC6mTcz0QaDCXwUSp9pOWZVo8KbPydGhEqe9gVlB
 mzLDbezyljQ+4qqV6Gs0EuQWuGsDXzTy9jUgYBLXZSTAR4V9ZboMpjWc6
 t9nUlqUbEEohaPD3EC3DAiIB4C5eGhx5OzdcLEnYKCz1oazjzrA128qGW
 nK5CbKTp0WiTQS5OCWwdOyUeWuFjCmagxaEKjCJulJEevf1+PV4RgGYBh
 VTbN+bjTzHcKrz/y+JZdvHIaWcKoxB05NpvhU9d5kuYspOdSTpDkyXijf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180634"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180634"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046247"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:03:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Date: Mon, 20 Jun 2022 12:13:45 +0200
Message-Id: <20220620101402.2684366-1-cezary.rojewski@intel.com>
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


Changes in v4:
- just a rebase to fix missed conflicts with for-next

Changes in v3:
- Patch 16/17 refactoring suspend/resume has been renamed to "Refactor
  jack handling". Dropped the usage of card->remove() in favor of
  link->exit() in that very patch

Changes in v2:
- fixed wording error in patch 02/17 so it correctly mentions
  'haswell_rt5640', not 'broadwell_rt286'
- decided not to add kernel module names changes to this patchset so the
  review is not complicated unnecessarily. Will send them separately
  instead

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
  ASoC: Intel: bdw_rt286: Refactor jack handling
  ASoC: Intel: bdw_rt286: Remove FE DAI ops

 sound/soc/intel/boards/Kconfig                |   4 +-
 sound/soc/intel/boards/Makefile               |   4 +-
 sound/soc/intel/boards/bdw_rt286.c            | 256 +++++++++++++
 sound/soc/intel/boards/broadwell.c            | 338 ------------------
 sound/soc/intel/boards/haswell.c              | 202 -----------
 sound/soc/intel/boards/hsw_rt5640.c           | 176 +++++++++
 .../common/soc-acpi-intel-hsw-bdw-match.c     |   6 +-
 7 files changed, 439 insertions(+), 547 deletions(-)
 create mode 100644 sound/soc/intel/boards/bdw_rt286.c
 delete mode 100644 sound/soc/intel/boards/broadwell.c
 delete mode 100644 sound/soc/intel/boards/haswell.c
 create mode 100644 sound/soc/intel/boards/hsw_rt5640.c

-- 
2.25.1

