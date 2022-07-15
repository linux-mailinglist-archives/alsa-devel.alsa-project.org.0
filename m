Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12D5763DF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EEB1903;
	Fri, 15 Jul 2022 16:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EEB1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896835;
	bh=aYAXNNzbJ9lFVOu1sujOPjVsoCFY0nvS0lejc2Fq6gc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I8Ofm8AlBzIq2MStxotVzBB1S8XUmD77av1oxs7xmQbwhAH4BMAnokqmgo+ezqQUb
	 OJXO5/K2LkucsR9TJM1PVD2jeyqvexhGdlSh7vBAZ4WDDL8bbEqVSg5q97mmwXbaP2
	 L8Pxqure3Tlx5H0z3t21gv+6VwQ097c1jtT5aduU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4EA0F8015B;
	Fri, 15 Jul 2022 16:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B79FEF800AA; Fri, 15 Jul 2022 16:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E018BF800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E018BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MuLZ0sBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896771; x=1689432771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aYAXNNzbJ9lFVOu1sujOPjVsoCFY0nvS0lejc2Fq6gc=;
 b=MuLZ0sBHdVj4LLfwTvKLKgqnQR2yzAoLB0oXQFGx7vm8SfMUR3Cz9jPQ
 z8HrSO7XBAT/OWsw1jUma6+5B+jrWji0tYLiNkDYmGhFanjTqWxa0PCDt
 TkmCEQg/W0AkEUhKC3le1ocFiim/pANljDb/0m1AKTsvEh+wRIJLo1+8A
 rs5y+f3nQhQmfeyJjbCv/d5NRlxpLSJrmIVlG9IK78ts83ggqyns5AOxk
 Me5dAs+6Ok2JiJCY73nA8/U+KV9RnKUo6D2DCFmyo5dUIDbGs8zah02nx
 s5Yd4inFQFUovbfxAw50k59TM/876lag7Mu6CyoHxrLRilCJQuFD91VWw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476896"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476896"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533100"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11]  ASoC: SOF: Intel: updates and cleanups
Date: Fri, 15 Jul 2022 09:52:05 -0500
Message-Id: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
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

Set of updates for IPC3, IPC4, MTL support and cleanups for the
topology filename override which was broken for HDaudio platforms.

It may be too late for 5.20, it's ok if these patches are applied in
the next cycle.

The topology override depends on the patch "ASoC: SOF: Intel: enable
dmic handling with 2 or fewer SoundWire links" shared in a separate
patchset.

Bard Liao (1):
  ASoC: SOF: ipc4-topology: move ida allocate/free to widget_setup/free

Peter Ujfalusi (2):
  ASoC: SOF: ipc3-loader: Print out the non matching ext_man magic
    number
  ASoC: SOF: Intel: atom: don't keep a temporary string in
    fixup_tplg_name

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda: don't set fw_filename
  ASoC: SOF: Intel: hda: only fixup topology name if not set already
  ASoC: SOF: probes: rename assign/free callbacks as startup/shutdown
  ASoC: SOF: Intel: hda-stream: test DMA buffer first in hw_params

Rander Wang (3):
  ASoC: SOF: ipc4-pcm: set pcm rate to dai setting
  ASoC: SOF: add ipc4 SRC module support
  ASoC: SOF: ipc4-topology: set domain bit based on dp domain type

Yong Zhi (1):
  ASoC: SOF: Intel: MTL: remove redundant snd_sof_dsp_read() call

 sound/soc/sof/intel/atom.c        |  16 +--
 sound/soc/sof/intel/hda-probes.c  |  16 +--
 sound/soc/sof/intel/hda-stream.c  |  15 ++-
 sound/soc/sof/intel/hda.c         |  71 +++++++++-----
 sound/soc/sof/intel/mtl.c         |  13 +--
 sound/soc/sof/ipc3-loader.c       |   6 +-
 sound/soc/sof/ipc4-pcm.c          |   4 +
 sound/soc/sof/ipc4-topology.c     | 156 +++++++++++++++++++++++++-----
 sound/soc/sof/ipc4-topology.h     |  27 +++++-
 sound/soc/sof/sof-client-probes.c |   8 +-
 sound/soc/sof/sof-client-probes.h |   8 +-
 11 files changed, 250 insertions(+), 90 deletions(-)

-- 
2.34.1

