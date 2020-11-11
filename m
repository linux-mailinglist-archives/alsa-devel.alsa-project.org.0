Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F02AFA91
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812FA178F;
	Wed, 11 Nov 2020 22:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812FA178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605130649;
	bh=uU6XLAd3n6wpI5sG0qHlsKm+wWfDl5cwf7N+uA6TyBA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HM0Cjp7YBmNzbNQ8XHsF1Yi/Md3843/Mj/s4Vor1DRsVnly9li1yr02wfre3AC762
	 IhHMm/gZmw030AJTmxmKVkr+TWAyO/eYnPhaVdPuqNSSAsvll6GSUTo0nAuEeCuTV0
	 nGWybIZ3TfG4fsb5zxEXXkOMnZNtz6VP54LGBy3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA05BF8022D;
	Wed, 11 Nov 2020 22:35:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7502F8022B; Wed, 11 Nov 2020 22:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 970F0F8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970F0F8007E
IronPort-SDR: ZxkhiWywm/OAzIR5WAIAvyGltlMRLY+bSG6TXdHcMxvRtyCpoNtSBBnWW/PSi0bxC3AeX1WRCh
 RcgrKvy7aiQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157237647"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="157237647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:45 -0800
IronPort-SDR: gbFVJJ1NsJ4z2pciaussoJd7c9CbF4mz3FKLcHkhpyIkMzNnjVkBUkOa9yp2If9eFqFxfaNwcs
 3X4RTm8LhtLA==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="328266625"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: Kconfig corrections
Date: Wed, 11 Nov 2020 15:35:29 -0600
Message-Id: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
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

