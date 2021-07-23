Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE33D39D5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 13:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B99170A;
	Fri, 23 Jul 2021 13:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B99170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627041398;
	bh=J+8y3ZMn0PxEGpc5vLCemXkQ9YQbKHunnGnINHniEgY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CG6cGS9g/60i9oACBrnEVOl9rAhzdOFm/hRzYxuHEvFV7wx5qgAMGn+Z9iGemUcI+
	 nhOU5Ccy56TFB56P9rIPdN9hxGmRlKMDubtZKqt7Gm4DJeW9mVMtx5O3Ahm6SgjT9a
	 vFc/5r0KL07TTPZo9/pWlMZ2sAvtAamZ4loltjtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93844F804AD;
	Fri, 23 Jul 2021 13:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D19F804AC; Fri, 23 Jul 2021 13:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E28E1F800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 13:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E28E1F800DA
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="209972190"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="209972190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:55:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="455069739"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:54:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent bases
Date: Fri, 23 Jul 2021 19:54:45 +0800
Message-Id: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

shim base and alh base are platform-dependent. This series suggests
to use variables for those bases. It allows us to use different bases
for new platforms.

v2:
 - Update the commit message of "soundwire: move intel sdw register
   definitions to sdw_intel.h"

Bard Liao (6):
  soundwire: move intel sdw register definitions to sdw_intel.h
  ASoC: SOF: intel: add sdw_shim/alh_base to sof_intel_dsp_desc
  ASoC: SOF: intel: hda: remove HDA_DSP_REG_SNDW_WAKE_STS definition
  ASoC: SOF: intel: move sof_intel_dsp_desc() forward
  ASoC: SOF: intel: add snd_sof_dsp_check_sdw_irq ops
  soundwire: intel: introduce shim and alh base

 drivers/soundwire/intel.c           | 74 ------------------------
 drivers/soundwire/intel_init.c      | 14 ++---
 include/linux/soundwire/sdw_intel.h | 87 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/cnl.c           |  6 ++
 sound/soc/sof/intel/hda.c           | 39 ++++++++-----
 sound/soc/sof/intel/hda.h           |  8 ++-
 sound/soc/sof/intel/icl.c           |  3 +
 sound/soc/sof/intel/shim.h          |  3 +
 sound/soc/sof/intel/tgl.c           | 12 ++++
 9 files changed, 149 insertions(+), 97 deletions(-)

-- 
2.17.1

