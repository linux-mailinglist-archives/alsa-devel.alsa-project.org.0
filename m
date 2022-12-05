Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96D6424C1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B263A16C3;
	Mon,  5 Dec 2022 09:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B263A16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229450;
	bh=mLU6eKCxq/D3pY0PWqjuRxTTvNRqdKygV3fgrcy5C4w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W826S8HnVCtfrMlmtWew1NKOpYPFEiye1lCGWoxBuNdiUiYISbhOXwIgij0kCFalw
	 Te9K4Qjgdo8O8bnMQ6ehJsrtfluhnwIS4Eu7ziIDMSqZcZFA1W459YU+o7L7KVDe9E
	 w1TdAF8UxAxz3N4+qhA+h+lpqt/R/IC7tVnOG97E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A70F804C2;
	Mon,  5 Dec 2022 09:36:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BF76F800BD; Mon,  5 Dec 2022 09:36:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 049FEF8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049FEF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lLy8f9W2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229391; x=1701765391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mLU6eKCxq/D3pY0PWqjuRxTTvNRqdKygV3fgrcy5C4w=;
 b=lLy8f9W2RAtpXXJiJAw32jrkv8dBctw9DC1pTfwqABtvXnxuP49VeyZm
 u0COmT0B7kEs3UXnz2af0b4tg7U97rkw7+bkqF1R7+4ad11SgRY+kUeft
 LSbmsllj+FLbrVUQSPLa7P6WP8+doT+CqURu3Zxy6XJ1Q/XObkZUI/Wa6
 va3uc8oouuIlVT29JMoX1zjL8K2iFmcbH/n26J0GBg+NHPYj++CIqDe1F
 8W1nzSrOwA19W1jk81YA+UQKvnsutQKUzcO8R86DgtiQ7HEtROvvC6sht
 G+9l9LKdaVtvowIuc4Z+tdvkLpdAhJUG5PiK37BbPJBP7IW+M+2mzyoKN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288254"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866099"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866099"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:23 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 0/6] ASoC: Intel: Skylake: Topology and shutdown fixes
Date: Mon,  5 Dec 2022 09:53:24 +0100
Message-Id: <20221205085330.857665-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Even though skylake-driver is going to be replaced by the avs-driver,
the goal is to keep it functional on all the configurations it supports
until its EOL. When comparing chrome trees against upstream
skylake-driver, couple fixes pop up that are not part of upstream
repository. These fixes are backed up by real bugs (issue trackers),
address real problems. There is no reason for them to stay in the
internal tree.

Patches 1-4 combined together address issue where the driver updates the
presumably static audio format descriptions coming from the topology
files through its "fixup" functions. As long as given audio format is
used by a single path, nothing collides and any updates are harmless.
However, when multiple paths e.g.: DMIC and HDMI1 utilize the same audio
format descriptor, any updates caused by the opening of the first path,
may cause the second to fail.

The 5th change from the set fixes driver hang sporadically occurring
during shutdown procedure. Once HDAudio links are powered down along
with the AudioDSP, the hang stops reproducing.

The last change helps survive in environments with limited/fragmented
memory. While the BDL is small already, other buffers can be allocated
using scatter-gather. This basically aligns the code with what the
avs-driver does.


Changes in v2:
- no changes to the first 5 patches
- added patch that I forgot to add in v1

Cezary Rojewski (6):
  ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
  ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
  ASoC: Intel: Skylake: Drop pipe_config_idx
  ASoC: Intel: Skylake: Introduce single place for pipe-config selection
  ASoC: Intel: Skylake: Fix driver hang during shutdown
  ASoC: Intel: Skylake: Use SG allocation for SKL-based firmware load

 sound/soc/intel/skylake/skl-sst-cldma.c | 27 +++++----
 sound/soc/intel/skylake/skl-topology.c  | 73 ++++++++-----------------
 sound/soc/intel/skylake/skl-topology.h  |  1 -
 sound/soc/intel/skylake/skl.c           |  5 +-
 4 files changed, 44 insertions(+), 62 deletions(-)

-- 
2.25.1

