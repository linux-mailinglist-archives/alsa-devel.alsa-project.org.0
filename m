Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61B183A5A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 21:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558911774;
	Thu, 12 Mar 2020 21:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558911774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584043751;
	bh=Qp+fHlnBYd12+sxB/VMCVBAeuVgrK2HbzPcTaFMQm2E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jLr2vGqtDL6V9HAEj8gcQBu173Pdx3dd2+0ZdjDMzb2EI7NWXzVN3CfG3P2civgb6
	 O1o7Er/TTUBSBNeyKqC43LCCbhrpbt+eCmi77+FdwjXWGnACX7xnyG8N2sNrPSnwch
	 PzITQWv2rRX+vEzOUK7uTcvk7dufJ4P6mgXqSYfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E86CAF8028D;
	Thu, 12 Mar 2020 21:06:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A11DF80273; Thu, 12 Mar 2020 21:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107C6F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 21:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107C6F8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 13:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="444063047"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 13:06:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: SOF: multi-cpu dais,
 IPC and Intel improvements for 5.7
Date: Thu, 12 Mar 2020 15:06:16 -0500
Message-Id: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

Corrections for compatibility with the multi-cpu dai check for
min-channels, IPC simplifications, and removal of unnecessary
boot-related code for Intel platforms.

Amery Song (2):
  ASoC: SOF: Intel: hda: remove unnecessary ROM IPC filter function
  ASoC: SOF: Intel: remove unnecessary waitq before loading firmware

Bard Liao (2):
  ASoC: SOF: Intel: hda-dai: add stream capability
  ASoC: SOF: topology: connect dai widget to all cpu-dais

Karol Trzcinski (2):
  ASoC: SOF: Make sof_ipc_ext_data enum more rigid
  ASoC: SOF: Remove SOF_IPC_EXT_DMA_BUFFER

 include/sound/sof/info.h         | 22 +-------
 sound/soc/sof/intel/cnl.c        |  5 --
 sound/soc/sof/intel/hda-dai.c    | 96 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-ipc.c    | 20 +------
 sound/soc/sof/intel/hda-loader.c |  3 -
 sound/soc/sof/intel/hda.c        |  3 -
 sound/soc/sof/intel/hda.h        |  1 -
 sound/soc/sof/loader.c           |  6 --
 sound/soc/sof/sof-priv.h         |  5 --
 sound/soc/sof/topology.c         |  8 ++-
 10 files changed, 108 insertions(+), 61 deletions(-)


base-commit: 101247a3b86e1cc0e382b7e887a56176290fc957
-- 
2.20.1

