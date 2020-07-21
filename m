Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF877229395
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478DA852;
	Wed, 22 Jul 2020 10:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478DA852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595406827;
	bh=RX91LDFItxaQZZGMAXCi+agvPiiOhgeC5kWKeq9YV2E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mfyF474ok5dT9o31O5TZgytDcnqBDjP30BPte++vx3Cw2qeDE+smrkYej4OJ99sQB
	 ha8gl4PgM0B+zYkm4stQ+eNX7cazQgUNDQOr/t9VEBh08vQ1HZVryfUJ5O2I0jTLaB
	 aF0Qn7zCtI5uldOY6fOk4SKxB/fBBvnR/X2+6+jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6610EF801F5;
	Wed, 22 Jul 2020 10:32:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 177C0F801F5; Wed, 22 Jul 2020 10:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04508F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04508F80139
IronPort-SDR: QogXXwSOxSHIk+FGCcmzxSh+yT+IOWF1I4japce9n4I089yP2Bx6oUFAhEcCkvjr6nVTXgAT+K
 GWZ7Zx+msMLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149457241"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="149457241"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:31:43 -0700
IronPort-SDR: zMd+VLFpbMOrJmmWr/9BSElL1yk2Edq9WGb8p9IFUybiVaKfRysjU8cvlhfZYv/fzhlv65NTuv
 mVVb800E6W5Q==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303114"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:31:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/13] soundwire: intel: add power management support
Date: Wed, 22 Jul 2020 04:37:10 +0800
Message-Id: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

This series adds power management support for Intel soundwire links.

Bard Liao (1):
  soundwire: intel: reinitialize IP+DSP in .prepare(), but only when
    resuming

Pierre-Louis Bossart (10):
  soundwire: intel: Add basic power management support
  soundwire: intel: add pm_runtime support
  soundwire: intel: reset pm_runtime status during system resume
  soundwire: intel: fix race condition on system resume
  soundwire: intel: call helper to reset Slave states on resume
  soundwire: intel: pm_runtime idle scheduling
  soundwire: intel: add CLK_STOP_TEARDOWN for pm_runtime suspend
  soundwire: intel: add CLK_STOP_NOT_ALLOWED support
  soundwire: intel_init: handle power rail dependencies for clock stop
    mode
  soundwire: intel: support clock_stop mode without quirks

Rander Wang (2):
  soundwire: intel: add CLK_STOP_BUS_RESET support
  soundwire: intel: refine runtime pm for SDW_INTEL_CLK_STOP_BUS_RESET

 drivers/soundwire/cadence_master.h |   4 +
 drivers/soundwire/intel.c          | 448 ++++++++++++++++++++++++++++-
 drivers/soundwire/intel.h          |   2 +
 drivers/soundwire/intel_init.c     |  19 +-
 4 files changed, 465 insertions(+), 8 deletions(-)

-- 
2.17.1

