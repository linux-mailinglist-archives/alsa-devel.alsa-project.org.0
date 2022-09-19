Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAC5BCBB0
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91333E7;
	Mon, 19 Sep 2022 14:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91333E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590156;
	bh=Qbl7CkR6Xl3s2wf5DMf6HNAj5J58FaCgocn/vg9FObI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=soFLALY681cT9NntzVwx68cKCy2p34hKB8pq/JKjyRloOxEMZoCAaN2f2fWOBNCXf
	 oDsfwP5TtEep//GnADHL4fHJnR3Lt04B75bGfuA/AtK1a36oLGXZSiTU8+0Ex26UOL
	 oxxb7vcFBxpxOh99qPxOaq0Ot8aGpCS+OhgdwZUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5858EF8023A;
	Mon, 19 Sep 2022 14:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE155F8023A; Mon, 19 Sep 2022 14:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC97F800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC97F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N5nN46mr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590095; x=1695126095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qbl7CkR6Xl3s2wf5DMf6HNAj5J58FaCgocn/vg9FObI=;
 b=N5nN46mrAxS0g23NeREWYLvg/MEmqyGtd0wuGZNzVHAjVCHEj6Vc/Bh7
 wgKkqxqvahndMQ7yNTaee/JCsjuDT43laaJaj6GyOQwbXaM9938Dhc95n
 v5yEyDSwFys/2PJsf27QZF8nobxByYm5k23AAATUhu8W6Zn4+ArInq/9U
 1F6c/L+KN+ZnHbb7tCpkWN3lwbxtF20zqml+JaaMcNkqEeXRCGsKcReY+
 gRXrAplanaukzjrTovYB6JIFt6RJS0KDgYSMwUHiCiXxztIJ0DLBXPgl5
 WOppyslDERG8GJfXoq3naABjLT8s7I0qk/nAprpQYU1o5FFzEELwEAzGN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="361123217"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361123217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837629"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: SOF: start using tracing instead of dev_dbg
Date: Mon, 19 Sep 2022 14:21:01 +0200
Message-Id: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Multiple maintainers have told us to start using the tracing
subsystem. Wish granted, this patchset suggested by Noah Klayman
removes a number of verbose and arguably useless dev_dbg or dev_vdbg
logs.

Beyond higher efficiency and less intrusive instrumentation, the use
of bpftrace scripts bring new functionality and helps gather
statistics on usage count on a running system, see how we can get
information on suspend/resume times with [1]

[1] https://github.com/thesofproject/sof-test/blob/main/kernel_tracing/bpftrace_scripts/suspend_resume_time.bt

Bard Liao (2):
  ASoC: SOF: add widget setup/free tracing
  ASoC: SOF: Intel: replace dev_vdbg with tracepoints

Noah Klayman (5):
  ASoC: SOF: Intel: add HDA interrupt source tracing
  ASoC: SOF: Intel: remove unneeded dev_vdbg
  ASoC: SOF: remove unneeded dev_vdbg
  ASoC: SOF: replace dev_vdbg with tracepoints
  ASoC: SOF: replace ipc4-loader dev_vdbg with tracepoints

 include/trace/events/sof.h       | 121 +++++++++++++++++++++++++
 include/trace/events/sof_intel.h | 148 +++++++++++++++++++++++++++++++
 sound/soc/sof/core.c             |   3 +
 sound/soc/sof/intel/cnl.c        |   9 +-
 sound/soc/sof/intel/hda-dsp.c    |   4 +-
 sound/soc/sof/intel/hda-ipc.c    |  11 +--
 sound/soc/sof/intel/hda-pcm.c    |   4 +-
 sound/soc/sof/intel/hda-stream.c |   9 +-
 sound/soc/sof/intel/hda.c        |  19 +++-
 sound/soc/sof/intel/mtl.c        |   3 +-
 sound/soc/sof/ipc3.c             |  12 +--
 sound/soc/sof/ipc4-loader.c      |   7 +-
 sound/soc/sof/pcm.c              |   5 +-
 sound/soc/sof/sof-audio.c        |   5 ++
 sound/soc/sof/sof-utils.c        |   2 -
 sound/soc/sof/topology.c         |   9 --
 16 files changed, 320 insertions(+), 51 deletions(-)
 create mode 100644 include/trace/events/sof.h
 create mode 100644 include/trace/events/sof_intel.h

-- 
2.34.1

