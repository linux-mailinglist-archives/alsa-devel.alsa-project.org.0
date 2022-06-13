Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2DD548295
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40ECA17C9;
	Mon, 13 Jun 2022 11:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40ECA17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111197;
	bh=l8S3Z+0zbZSIg4WtSqTEwKIJlqjfS3FsszNBCyCwNW0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OlQzqcNmjk4jVFmTz8+NMR48Pf/lcGvuod1M4pWu8HYAKhEHZ39jeoYKc1uXhNQip
	 9dbVm5c0tTG16VTqyxUSYd2mxsGYjga0Uwx96/nmpIHsNVPG8aALFYq0aSzOYXI9lI
	 mYpN7iTNFpjjeH+0RdK3YeFSsej+ms9uKT4IRQ3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A072AF800D8;
	Mon, 13 Jun 2022 11:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098ADF80139; Mon, 13 Jun 2022 11:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C8BF80139
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C8BF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A9/4PkWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111134; x=1686647134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8S3Z+0zbZSIg4WtSqTEwKIJlqjfS3FsszNBCyCwNW0=;
 b=A9/4PkWURjvybLSIBb/6ZvjiH6XW6abvPxMzJzwgEnzvMmHKJq0IHNkl
 I3+A4KZHDK4MQPtE+W+uQnih+dRLl+k5yUMlkuRLkQro1zlPE7ulDDBxG
 9zPRW3X7j+lS/+Ul3sioAadCm1l+18EGbeZhvyCewzRqLNsj44ByenqHH
 nnEHpeUKds2emm86gMRG80gZyN/5D9MbXT/OHd7My/XbB0ojjx9p7RAq0
 pCsEsKPMrpevuhN3cus56EWw8PfNtHvl3YNc/SXFUJu3z/M0qhpP8dCWR
 fQ64xxN/K2WaTaY/JkyzLNu/+DSURlnet7ubWPnbgXBf2zrfuh7Rz029p A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753754"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753754"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639625504"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 00/17] ASoC: Intel: haswell and broadwell boards update
Date: Mon, 13 Jun 2022 11:15:29 +0200
Message-Id: <20220613091546.1565167-1-cezary.rojewski@intel.com>
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
  ASoC: Intel: bdw_rt286: Improve codec_link_init() quality
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

