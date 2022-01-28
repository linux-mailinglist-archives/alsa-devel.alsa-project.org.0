Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB38849F984
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 13:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B41784D;
	Fri, 28 Jan 2022 13:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B41784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643373428;
	bh=AznW+XkSyo/mLt2MIP4GisdFQYr1chvbcpAvE1j7WYo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q6DhFyvyokuqdDulQBsVEpeHfPLZTKQvInR7t/qHTlWVxkr//CGCoQGBm52NfbDYQ
	 o9Z0G+6RLCTHdevWOU5LglzpIlFh7kZsycu+4NOMpmOiw+VzlSIP3XuL+moWsHuxrr
	 8RNHpPW1/PBkXOsVt9HMc5vAoc3rGrjIr3MjzTK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD9BF80425;
	Fri, 28 Jan 2022 13:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2561F80249; Fri, 28 Jan 2022 13:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A3CCF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 13:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A3CCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KGXr1PEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643373358; x=1674909358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AznW+XkSyo/mLt2MIP4GisdFQYr1chvbcpAvE1j7WYo=;
 b=KGXr1PEj2EjO+LpyMhn8gSE46dY2lmyCSN7uJnGq6OZ8I2HscW4fmJ1N
 FZ1F7ywEOVAXw7TEx8SEkMDqwIViF/VOHR0BTkt4NQsHXEMbdiTeJfb2n
 og8NeNOhspPgO2pGEAcMiSTZ4kPBvnrKM4ioCGhmQxO+tCR6gIjVviw/F
 n3233AM6SkEIn8mcPdmcEYcOMkaYUPABTVr+xGMrvtEoZ6coRj39Gg6bf
 bLI91kdii8IRHuFlkKwNpCfvVAAJkR/nkcBdfP2/UVRPCKyru8gCyNDh/
 A10ev8NsMO/F+qQM9s1ImSxp2wciCc0NLXqfVpAMnS9xdz/ip7kOhdyg5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310426924"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="310426924"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:35:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="536117044"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:35:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: SOF: dma-trace: Change trace_init() ops parameter
 list
Date: Fri, 28 Jan 2022 14:36:21 +0200
Message-Id: <20220128123623.23569-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 AjitKumar.Pandey@amd.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

the DMA trace implementation on AMD platform assumes that the stream_tag pointer
is pointing the stream_tag member of struct sof_ipc_dma_trace_params_ext, which
is true at the moment, but it can not be guarantied and a change in the dtrace
core can cause out of bound accesses for AMD.

For this reason, change the API to pass the struct itself which will remove the
assumption and makes it clear from both sides what is expected to be sent via the
parameter list.

This opens up a window to clean up the intel and AMD implementation at the same
time.

Regards,
Peter
---

Peter Ujfalusi (2):
  ASoC: SOF: intel: hda-trace: Pass the dma buffer pointer to
    hda_dsp_trace_prepare
  ASoC: SOF: dma-trace: Pass pointer to params_ext struct in
    trace_init()

 sound/soc/sof/amd/acp-trace.c   | 38 ++++++++-------------------------
 sound/soc/sof/amd/acp.h         |  3 ++-
 sound/soc/sof/intel/hda-trace.c | 17 ++++++++-------
 sound/soc/sof/intel/hda.h       |  3 ++-
 sound/soc/sof/ops.h             |  4 ++--
 sound/soc/sof/sof-priv.h        |  2 +-
 sound/soc/sof/trace.c           |  2 +-
 7 files changed, 26 insertions(+), 43 deletions(-)

-- 
2.35.0

