Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544B1E9DF0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 08:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B93316FD;
	Mon,  1 Jun 2020 08:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B93316FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590992253;
	bh=s4+Cz3BZbykVXd0jRPzFR4iyxMWXr3e2fJkiSiSf/gE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DtgDXyvc0O8F5n/wbgTGjdwi8q3C9uhdKLPVpbrA+Xj0Am1oduYhBx7ClDcK2IC2j
	 Yv4BbxAQzRA2LuSu8Az5AqOpez97xdlNafMxaxD3xG5yraLFHlh2eu53Is5HqmYvaf
	 sVr2jqbQVQk5xRP6rlfiOnbJuNpf3FjTdmrNieWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F25F801EC;
	Mon,  1 Jun 2020 08:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84AA4F801F5; Mon,  1 Jun 2020 08:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6D3DF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 08:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D3DF8013D
IronPort-SDR: WwLFdf9m/9Uqvg+jvrg+/INYIBwEQ10K68goa5LjkRFYE4eUJYuSjRpuMQENUsS13K0HnDqUiu
 VH1A9R6b6tUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 23:15:41 -0700
IronPort-SDR: NQOJu57jWeC+5P//WyPvrqjGOmuxbwGW9lqoKQe0i1L9lmpip4v9sRSyFUtLo8vibJYI6eftM2
 3lKkcvMpE0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470208623"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 23:15:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/6] soundwire: intel: transition to 3 steps initialization
Date: Mon,  1 Jun 2020 02:20:56 +0800
Message-Id: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
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

This series is to split the original "soundwire: intel: transition to 3
steps initialization" patch into different patches for better review.
It also address comments from Vinod.

Pierre-Louis Bossart (6):
  soundwire: intel: cleanups for indirections/logs
  soundwire: intel: clarify drvdata and remove more indirections
  soundwire: intel_init: remove useless test
  soundwire: intel_init: use devm_ allocation
  soundwire: intel_init: pass link information as platform data
  soundwire: intel: transition to 3 steps initialization

 drivers/soundwire/intel.c      | 138 +++++++++--------
 drivers/soundwire/intel.h      |  13 ++
 drivers/soundwire/intel_init.c | 261 ++++++++++++++++++++++++++-------
 3 files changed, 295 insertions(+), 117 deletions(-)

-- 
2.17.1

