Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A1442B71
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 11:13:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B823216DB;
	Tue,  2 Nov 2021 11:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B823216DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635847981;
	bh=pw9l04w7GDXR2zyWPZodfkvrKn4MILwehdKLFKMzQa8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=abNBGiL57SiOY9sKFos9uSG5nm91uGR6fG9r/4/vLx1ZeixIE3F/BNGgNuJZwa2KX
	 SciZtjX/PiszEY0KOQywZSGCtBK5ta9SX2wwIHiefIefTsCNf+8aTszUx6kWVrxN9U
	 M4s2L+/tiT3R2xVzU/54Jlae5sYAarIblSCIa8LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31EEDF8027C;
	Tue,  2 Nov 2021 11:11:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455CAF8012E; Tue,  2 Nov 2021 11:11:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9936DF8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9936DF8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211277987"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211277987"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="500477147"
Received: from asorichi-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.44.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: Implement support for DMA trace free IPC
 command
Date: Tue,  2 Nov 2021 12:10:16 +0200
Message-Id: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

This series adds support for the new DMA_TRACE_FREE IPC message to gracefully
stop and free the DMA trace related resources on the firmware side.

Regards,
Peter
---
Ranjani Sridharan (3):
  ASoC: SOF: IPC: Add new IPC command to free trace DMA
  ASoC: SOF: IPC: update ipc_log_header()
  ASoC: SOF: trace: send DMA_TRACE_FREE IPC during release

 include/sound/sof/header.h |  1 +
 sound/soc/sof/core.c       |  2 +-
 sound/soc/sof/ipc.c        | 17 ++++++++++++++++-
 sound/soc/sof/trace.c      | 18 ++++++++++++++++++
 4 files changed, 36 insertions(+), 2 deletions(-)

-- 
2.33.1

