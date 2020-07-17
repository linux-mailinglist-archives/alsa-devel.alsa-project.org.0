Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1D2245C4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 23:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE601612;
	Fri, 17 Jul 2020 23:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE601612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595020646;
	bh=H3PcdX6QUfP4vIhdfQndzwVp/GJoY93Y/YqhfZKTxnw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTWZwOhzZnZDs0sfr7VMUJzhDH5ltlfhpboR6hJ3Nysdr9QBh+McwhFq32DbqC6gK
	 KGrepR+0gRs8EE62XQHguJbVEXykzfJwbKB+j2pYGvfqfcQiipNvbiBXhDqX0D9TUY
	 GST4TZ4Bxl0VG/uBxezfDVlpI3Wm6ikdS6jMFtrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A85F80229;
	Fri, 17 Jul 2020 23:15:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 785F3F8023F; Fri, 17 Jul 2020 23:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB4DAF8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 23:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4DAF8014E
IronPort-SDR: H7wFDyjdeMR0auh6kAdzVmTfHzIKYVfGi5lCZvgEixq9TyGSvyMlc4BmNLbmRvZz9rB3A/S292
 z8IjutYBaKgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758199"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758199"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:47 -0700
IronPort-SDR: l6gGmo0W5i15RGQxXAYPQb9Tt3S6+x0nb73Pv/ME/Jr/P06cz0R9TACrtBp+uVFYXSY+G3TEsV
 3pM/g/pGXK9w==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="282905774"
Received: from toddjdav-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: Intel: machine driver updates for 5.9
Date: Fri, 17 Jul 2020 16:13:31 -0500
Message-Id: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
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

Small patchset to harden the SoundWire machine driver, change bad
HIDs, update PLL settings and avoid memory leaks. Given that the
SoundWire core parts are not upstream it's probably not necessary to
provide the patches to stable branches.

Bard Liao (1):
  ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name

Kai Vehmanen (2):
  ASoC: Intel: sof_sdw: add support for systems without i915 audio
  ASoC: Intel: sof_sdw: avoid crash if invalid DSP topology loaded

Libin Yang (1):
  ASoC: Intel: common: change match table ehl-rt5660

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw_rt711: remove properties in card remove

Yong Zhi (1):
  ASoC: intel: board: sof_rt5682: Update rt1015 pll input clk freq

 sound/soc/intel/boards/sof_rt5682.c           |  9 +++++-
 sound/soc/intel/boards/sof_sdw.c              | 31 +++++++++++++------
 sound/soc/intel/boards/sof_sdw_common.h       |  2 ++
 sound/soc/intel/boards/sof_sdw_hdmi.c         |  6 ++++
 sound/soc/intel/boards/sof_sdw_rt711.c        | 17 +++++++++-
 .../intel/common/soc-acpi-intel-ehl-match.c   |  2 +-
 6 files changed, 54 insertions(+), 13 deletions(-)


base-commit: 22e9b54307987787efa0ee534aa9e31982ec1161
-- 
2.25.1

