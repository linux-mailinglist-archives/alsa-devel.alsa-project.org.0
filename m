Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E98123B8A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:28:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8196D82A;
	Wed, 18 Dec 2019 01:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8196D82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576628902;
	bh=UDfADNEeSXZ+y5vY9L/IZSWRbXho8u9v4PiHixcJ1l8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vDqqNrWDQy6uh0ZQAIhSgRkfSt4F0Sf4ISAx15mxZoTXGOhid25grfg6l+L+YhQvi
	 r55D3TDQpLA0vqLgEQkWw+SGAt3kt9//K+973tcRnBMWPTPCJcW8sDD+ew/qCXJ5OK
	 OhLhUy/3eP/Tya/eryXxFmnU+QsOIQxvTLw47Yxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B32FF80234;
	Wed, 18 Dec 2019 01:26:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE92DF80256; Wed, 18 Dec 2019 01:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E500F8020B
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E500F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="217974208"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 16:26:29 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:26:08 -0600
Message-Id: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/8] ASoC: SOF: last patches for 2019
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset adds a set of somewhat independent changes for i.MX,
Intel, boards and core.

Guido Roncarolo (2):
  ASoC: SOF: imx: Describe SAI parameters to be sent to DSP
  ASoC: SOF: imx: Read SAI parameters and send them to DSP

Kai Vehmanen (2):
  ASoC: SOF: Intel: drop HDA codec upon probe failure
  ASoC: Intel: boards: fix incorrect HDMI Kconfig dependency

Karol Trzcinski (2):
  ASoC: SOF: define struct with compiler name and version
  ASoC: SOF: log compiler name and version information

Ranjani Sridharan (1):
  ASoC: SOF: Introduce state machine for FW boot

Yong Zhi (1):
  ASoC: Intel: Add machine driver for da7219_max98373

 include/sound/sof/dai-imx.h                   |  20 +
 include/sound/sof/dai.h                       |   1 +
 include/sound/sof/info.h                      |  15 +
 include/uapi/sound/sof/tokens.h               |   3 +-
 sound/soc/intel/boards/Kconfig                |  28 +-
 sound/soc/intel/boards/Makefile               |   3 +
 sound/soc/intel/boards/sof_da7219_max98373.c  | 371 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-jsl-match.c   |   7 +
 sound/soc/sof/core.c                          |  50 ++-
 sound/soc/sof/intel/hda-codec.c               |  12 +-
 sound/soc/sof/intel/hda-loader.c              |   1 -
 sound/soc/sof/intel/hda.c                     |   4 +-
 sound/soc/sof/intel/hda.h                     |   4 +-
 sound/soc/sof/ipc.c                           |  17 +-
 sound/soc/sof/loader.c                        |  58 ++-
 sound/soc/sof/pcm.c                           |   8 +
 sound/soc/sof/pm.c                            |  21 +-
 sound/soc/sof/sof-priv.h                      |  12 +-
 sound/soc/sof/topology.c                      |  69 +++-
 19 files changed, 662 insertions(+), 42 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_da7219_max98373.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
