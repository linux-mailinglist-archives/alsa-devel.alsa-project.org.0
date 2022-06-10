Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2153C545F4D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B541A1FAB;
	Fri, 10 Jun 2022 10:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B541A1FAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850184;
	bh=D9DHe3KvVC27smfngIvo/h6iRgoP2jHO4IYjOTnSOrU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X1Kae4agrsrrY5U18cAHWDYn9hCPuBx5tpLCdj20Gv8kya+XGZ6PNFZYieXy9cJoY
	 pPLIcEW/NXofFHR2mJmdglEW7UGMK75nuhSc0XMSEalfqip9f2mT6vLm20xAPgT5qf
	 spITltjP3dvVPqfIatql26b4j5eL98DL2PJhdyKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B814F804E7;
	Fri, 10 Jun 2022 10:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D46EDF800DF; Fri, 10 Jun 2022 10:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48100F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48100F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K2Ag6ned"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850121; x=1686386121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D9DHe3KvVC27smfngIvo/h6iRgoP2jHO4IYjOTnSOrU=;
 b=K2Ag6neds7XlJ7oTISzzf7LYcwvzZgs+UGSedoYPw3r2j+nZKFo52o1A
 v1I2/cz7NMzBa+3LERLRBSOjE/Qy7uiPR3KgPtfTHEUWi6qDm9DNjme+6
 yAv60tAmBBwW/WjJBV24PGMoLN+X2W4KxeasCLp8PdFevWKZynAoi6a7e
 SsxyOWf6Ht9OzoZy08ZncD483CdeJCTgaQFoaA7i3WmEjLIQkr/9d5wLU
 dF3xZRs81RO7ClCmjbJtDphAt5CSsPNddE9JuN07MomArgQhAxhM9kmMZ
 fkFyJ3jF4EXYl8sNDMIrI8zCYXK85ky6gF12Xzbi8AjJXNEvHl3Mc8aPZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936590"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020803"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/6] ASoC: SOF: Add support ctx_save with IPC4
Date: Fri, 10 Jun 2022 11:35:43 +0300
Message-Id: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Hi,

The context save functionality with IPC4 is triggered by sending a message to
the firmware about the pending power down of the primary core by the host.

In order to have this functionality implemented in a clean way we need to
introduce a new IPC level PM ops for core state management and use that instead
of open coding IPC messages here and there.

The first patch updates the ctx store/ctx_restore documentation to clarify that
they are optional.

Regards,
Peter
---
Peter Ujfalusi (6):
  ASoC: SOF: make ctx_store and ctx_restore as optional
  ASoC: SOF: sof_ipc_pm_ops: Add support for DSP core power management
  ASoC: SOF: ipc3: Add set_core_state pm_ops implementation
  ASoC: SOF: ipc4: Add set_core_state pm_ops implementation
  ASoC: SOF: Intel: Switch to use the generic pm_ops.set_core_state
  ASoC: SOF: ipc4: implement pm ctx_save callback

 include/sound/sof/ipc4/header.h |  8 +++++++
 sound/soc/sof/intel/hda-dsp.c   | 15 +++++-------
 sound/soc/sof/intel/tgl.c       | 30 ++++++++----------------
 sound/soc/sof/ipc3.c            | 18 +++++++++++++++
 sound/soc/sof/ipc4.c            | 41 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h        |  6 +++--
 6 files changed, 87 insertions(+), 31 deletions(-)

-- 
2.36.1

