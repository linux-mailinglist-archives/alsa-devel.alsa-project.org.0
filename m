Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E2528287
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330A01692;
	Mon, 16 May 2022 12:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330A01692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698155;
	bh=j+g3A2xwruRIPTDD5jvBK8JWFiIpTMHe+5w4Qs0vn0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hfuuSv3fSrHq0AgFWvI75hx32lKohZDZ/6ZqVlR6xWNaj49CpRP754so+u71HdUET
	 DT3Ohf/cncdcOrRUtp3EykuedgYe/vqGJMibZS43dWlEB4PX45fzqJ1nOQnTL+7LS2
	 G+H5RzibrAr1ts4/TT0thzP60LQO5rwLZFrSNbqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB931F80171;
	Mon, 16 May 2022 12:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF093F80520; Mon, 16 May 2022 12:47:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB68F8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB68F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d7OdSPYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698044; x=1684234044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+g3A2xwruRIPTDD5jvBK8JWFiIpTMHe+5w4Qs0vn0o=;
 b=d7OdSPYK6Ccgl4xr+3sL/i/TVrVfU63fCVyKtg8deNMvPSK/934CA9zv
 XG9IH/1fkvTEZeD4EblkxpEWXHlaTFP/5+HfV4ZtVOuvfawN3ZJMUTo2w
 alEE5hsof68xkiaHpIAbbG33J4GcGusmyjyfZM2rSfGx0jGPkpMnXmMLU
 MihuYvUwGR6DNv1ChDGV7OTqKquW0yf8SnxHmfzT/BG43oKMyVI6XMyRC
 JadBY9miT8Z71XEBfRdh2KThGIPkXUwMfDWozSNDMy1WrmpLLGcYw8/Au
 WfUBIZ9dYxWa0iZ80hlB6PFGdfhntS9F+n1c+Ga0S1EQpSDcOhjqjN8Ii Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853231"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459709"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 0/8] ASoC: SOF: Introduce generic (in)firmware tracing
 infrastructure
Date: Mon, 16 May 2022 13:47:03 +0300
Message-Id: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
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

SOF is using dma-trace (or dtrace) as a firmware tracing method, which is only
supported with IPC3 and it is not applicable for IPC4.

Currently the dtrace is 'open managed' regardless of IPC version (we do force
disable it for IPC4, but the dtrace calls remain in place).

From the kernel point of view there are only few ops that needs to be exposed
by the firmware tracing support and everything else is IPC private, should not
be known by the core.

This series converts the current dma-trace as ipc3 specific firmware tracing
sub-component and moves all private data out from generic code.

Regards,
Peter
---
Peter Ujfalusi (8):
  ASoC: SOF: Introduce IPC independent ops for firmware tracing support
  ASoC: SOF: Rename dtrace_is_supported flag to fw_trace_is_supported
  ASoC: SOF: Clone the trace code to ipc3-dtrace as fw_tracing
    implementation
  ASoC: SOF: Switch to IPC generic firmware tracing
  ASoC: SOF: ipc3-dtrace: Move host ops wrappers from generic header to
    private
  ASoC: SOF: Modify the host trace_init parameter list to include dmab
  ASoC: SOF: Introduce opaque storage of private data for firmware
    tracing
  ASoC: SOF: ipc3-dtrace: Move dtrace related variables local from
    sof_dev

 sound/soc/sof/Makefile          |   1 +
 sound/soc/sof/amd/acp-trace.c   |   4 +-
 sound/soc/sof/amd/acp.h         |   2 +-
 sound/soc/sof/core.c            |  13 +-
 sound/soc/sof/debug.c           |   2 +-
 sound/soc/sof/intel/hda-dsp.c   |   2 +-
 sound/soc/sof/intel/hda-trace.c |   4 +-
 sound/soc/sof/intel/hda.h       |   2 +-
 sound/soc/sof/ipc.c             |   6 +
 sound/soc/sof/ipc3-dtrace.c     | 649 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3-priv.h       |  38 ++
 sound/soc/sof/ipc3.c            |   3 +-
 sound/soc/sof/ops.c             |   2 +-
 sound/soc/sof/ops.h             |  26 --
 sound/soc/sof/pm.c              |   8 +-
 sound/soc/sof/sof-priv.h        |  53 +--
 sound/soc/sof/trace.c           | 621 ++----------------------------
 17 files changed, 767 insertions(+), 669 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-dtrace.c

-- 
2.36.1

