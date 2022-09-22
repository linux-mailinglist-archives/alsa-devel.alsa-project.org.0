Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E563C5E6E74
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CBD1ED;
	Thu, 22 Sep 2022 23:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CBD1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882678;
	bh=zYezlwYgxPKB8bQ2fyMBNpZC3KD/RY1erupbCm++zlo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DmQ1RDHOIhkzgIHXdC8uz/oTfdS4/kdv4KDkFuruWtBuhuwJYs7qoovHM9BiAAHCR
	 VQekGc0UtggyskLxnpY2S0teQQoM98y7zyGX2qT19Zh3tIK4NWcWeGS+AwIgWsWBiO
	 syTW0688HpQMxgJqaj+nKjc0NYSJY8WwUvwvs9ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B73F8053B;
	Thu, 22 Sep 2022 23:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC007F804FE; Thu, 22 Sep 2022 23:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24563F8012A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24563F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GgRa4S5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882617; x=1695418617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zYezlwYgxPKB8bQ2fyMBNpZC3KD/RY1erupbCm++zlo=;
 b=GgRa4S5/SwluBFjgZkIDRY0yOVAfnF0ebTQiyw+e/1A+2rFojwt4h+Tp
 VjkqvMNiaLua+zoWPC90IkaBx1yUpQU/WqMAxkmA5bv7/OCEhLZaLyGFG
 x6V2750yLfaxYOHYgqFb3gw+5hyrevDV9EBQA34BMFoOnEGw5vv7FWp/e
 BePuKMFqvULstVq9qQ08O3M+8ONx23QCUZhb9pVl36qgrrUqju6VJSpI6
 9xXgk3HDQAII73pMHyA1fS/0609T1Yg9L+Ex+aYRDoU6alQ0u51DDIyem
 xRZKTfvJfBFIBgd+bm7DTtehxmCnYS55m9txKnKtAU2iMqBlBMLs5rFYz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725755"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550836"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:49 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: SOF: Intel: MTL: Fixes for suspend/resume
Date: Thu, 22 Sep 2022 14:36:34 -0700
Message-Id: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This series includes fixes for suspend/resume and module
loading/unloading for the MTL platform.

Fred Oh (4):
  ASoC: SOF: Intel: introduce new op to handle dsp power down
  ASoC: SOF: Intel: define and set power_down_dsp op for HDA platforms
  ASoC: SOF: Intel: mtl: define and set power_down_dsp op
  ASoC: SOF: Intel: use power_down_dsp op in hda_dsp_remove

Ranjani Sridharan (5):
  ASoC: SOF: Intel: Add a new op for disabling interrupts
  ASoC: SOF: Intel: define and set the disable_interrupts op for cavs
    platforms
  ASoC: SOF: Intel: MTL: define and set the disable_interrupts op
  ASoC: SOF: Intel: HDA: use IPC version-specific ops
  ASoC: SOF: Intel: MTL: reuse the common ops for PM

Yong Zhi (1):
  ASoC: SOF: Intel: MTL: remove the unnecessary snd_sof_dsp_read()

 sound/soc/sof/intel/apl.c     |   2 +
 sound/soc/sof/intel/cnl.c     |   4 +
 sound/soc/sof/intel/hda-dsp.c |  21 ++--
 sound/soc/sof/intel/hda.c     |  14 ++-
 sound/soc/sof/intel/hda.h     |   2 +
 sound/soc/sof/intel/icl.c     |   2 +
 sound/soc/sof/intel/mtl.c     | 193 ++++++----------------------------
 sound/soc/sof/intel/shim.h    |   2 +
 sound/soc/sof/intel/skl.c     |   2 +
 sound/soc/sof/intel/tgl.c     |   8 ++
 10 files changed, 81 insertions(+), 169 deletions(-)

-- 
2.25.1

