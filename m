Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2A509A35
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70401701;
	Thu, 21 Apr 2022 10:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70401701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650528501;
	bh=YIhG42N133uPAmB2DX/zeexG6KuJo/mGBNXmfxPLQ6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dExKFglzZ9TenI05Dio6BYQ1SV8uujQ8vy8gVKWV7cDBQ2wXOC7yLgpNrsrFYH3YE
	 860TZppm03Ol0D4UmaDQU5Xmcha2Y7Iczo6XZK2TYypBnKk9F+idccYjsRVCo7DDkP
	 eiM4ts4erK0TN2SwQKqF641GMZikhSLDw5X3cow8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC8DF804DA;
	Thu, 21 Apr 2022 10:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F131F80125; Thu, 21 Apr 2022 10:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23681F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23681F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GyCtZjsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650528437; x=1682064437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YIhG42N133uPAmB2DX/zeexG6KuJo/mGBNXmfxPLQ6U=;
 b=GyCtZjsWbfSDHE6iWJUxl7D+mF/PRehxu2V1pg4gS+dsE0bePLwFBhrr
 RrbzowHMbcU4BTu26+/JO8dWjzCRRtVInMhia4JgUX2sGu6J9+eFhlpFJ
 KNI99iwiF811bcjVlVJ08+bdxJc0Tn3xoPi60GIfUwN75QnfMLkQAG3La
 1nMNShPr0ke1CcLVftX6GMPPqQP+rCWQjBaSJLSZapkfA2MGK17hftvjO
 WzA4oWDW8cOs4eyx84/KxqvRrRobulRL9+84hAV8oS8ZZxVSwIPyY1xlR
 eO15NbAzZJN4L0vDReOqxq0YI/frW1SsgTv72cGSN3A+0GGhERDpI/rmD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324718764"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324718764"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="577086924"
Received: from dchirca-mobl4.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:11 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com,
 daniel.baluta@nxp.com
Subject: [PATCH 0/6] ASoC: SOF: Rework the firmware ready message handling
Date: Thu, 21 Apr 2022 11:07:29 +0300
Message-Id: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The firmware ready (fw_ready) message is sent by the firmware to notify the host
that it has been booted up and caries additional information about it's
configuration.
All of this is IPC specific, the message itself is IPC version specific and the
information itself also.

Move the code to handle the fw_ready message under ipc3.c since the parsing and
interpretation is IPC specific.

A followup series is going to take care of the rest of the loader.c to make it
IPC agnostic.

Regards,
Peter
---
Peter Ujfalusi (6):
  ASoC: SOF: ipc3: Add local implementation for handling fw_ready
    message
  ASoC: SOF: Do not check for the fw_ready callback
  ASoC: SOF: amd: Do not set fw_ready callback
  ASoC: SOF: imx: Do not set fw_ready callback
  ASoC: SOF: Intel: Do not set fw_ready callback
  ASoC: SOF: loader: Remove the old fw_ready related code

 sound/soc/sof/amd/renoir.c           |   1 -
 sound/soc/sof/core.c                 |   2 +-
 sound/soc/sof/imx/imx8.c             |   2 -
 sound/soc/sof/imx/imx8m.c            |   1 -
 sound/soc/sof/intel/bdw.c            |   1 -
 sound/soc/sof/intel/byt.c            |   2 -
 sound/soc/sof/intel/hda-common-ops.c |   1 -
 sound/soc/sof/intel/pci-tng.c        |   1 -
 sound/soc/sof/ipc.c                  |  15 --
 sound/soc/sof/ipc3.c                 | 306 ++++++++++++++++++++++++++-
 sound/soc/sof/loader.c               | 227 --------------------
 sound/soc/sof/sof-priv.h             |   9 +-
 12 files changed, 307 insertions(+), 261 deletions(-)

-- 
2.35.3

