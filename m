Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B62B0A9F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D091832;
	Thu, 12 Nov 2020 17:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D091832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199580;
	bh=oqGtjrpBiEGvCpwxSS44sv7OihpQAGvNSuLAoT1u3HY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uQGNw8edUfSjXsqmUSwyFW5jp4hygRuRZsCaMlVIGjcYHnOqxt0zIPu/GfY0gDv8i
	 abjK7bjwJQ6P0zPosTuf/BU2ES/HebalbBguJjsn9IPZE38EZDalaXAnQiSuL+NNBX
	 ki2b/NDR/q0gWkR9k2qIVGw3PHloPga+1eiWb1Wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72683F801EC;
	Thu, 12 Nov 2020 17:44:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3C59F801D5; Thu, 12 Nov 2020 17:44:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14787F8007E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14787F8007E
IronPort-SDR: MwYpFHgF+U2vlegrTllRVTGSByrc1plXLCIzfQIfux3/Pa0CI9tKn8vlVMYFKyvzABuT+n4jo0
 jcCk0DKkQM4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170508854"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="170508854"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:38 -0800
IronPort-SDR: 4Fz9ywaxD3ULZZOO65BdTGlSbtPtzHVJ5FKw4jicEfVt8OLpfg692qUqO1ZcB2RJSDB+Bg8RDO
 jMFGi9uySplA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="355251415"
Received: from uikram-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.181.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ASoC: SOF: Kconfig corrections
Date: Thu, 12 Nov 2020 10:44:21 -0600
Message-Id: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
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

Three cosmetic patches and a fix for a randconfig issue.

v2: rebase to remove git am issue (worked with --3way before)

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: fix Kconfig dependency for SND_INTEL_DSP_CONFIG

Randy Dunlap (3):
  ASoC: SOF: imx: fix Kconfig punctuation
  ASoC: SOF: Kconfig: fix Kconfig punctuation and wording
  ASoC: SOF: Intel: fix Kconfig punctuation and wording

 sound/soc/sof/Kconfig       | 42 ++++++++++++------------
 sound/soc/sof/imx/Kconfig   | 10 +++---
 sound/soc/sof/intel/Kconfig | 64 ++++++++++++++++++-------------------
 3 files changed, 58 insertions(+), 58 deletions(-)

-- 
2.25.1

