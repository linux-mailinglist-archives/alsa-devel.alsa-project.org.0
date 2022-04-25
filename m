Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBD350EB80
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F50C1897;
	Tue, 26 Apr 2022 00:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F50C1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924884;
	bh=TVb4C3uy+cnmvsgkY4/a7hTOm/j5I7TKH7rlRsI8fBI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kvq87Tjoyu43X0J8aIDFnsefbd+WqV961YoJ2pDNpuON2QfM27JCAW47aIVz9a6Oz
	 tgrqNj6nT2TVx5QRMOJ9Y4ij8ORoYboxEs8mujuGEdVOcf8oey2roXz1Tdv9AJEg25
	 MBbCQxdekDyVqWGEQ9o2zoDA7yzHNlmBkVNPs6NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C51F80539;
	Tue, 26 Apr 2022 00:12:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5FCDF80528; Tue, 26 Apr 2022 00:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F47F80506
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F47F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eksO1T+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924712; x=1682460712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TVb4C3uy+cnmvsgkY4/a7hTOm/j5I7TKH7rlRsI8fBI=;
 b=eksO1T+GcXVRRxEoWQ2DTRHpzmXLcSb2tTb9uzDGhMrmf92g7gW1ICym
 aFXpy+7IZ44q/4HELhs5NqKfpGWwQlH4j+P0uY1zsVxa7WqqNaf6TQ4wn
 NgbYVW/ZLHjwmz5eYHVxHc/AonTLGijeE3wGgE4zchSMSP29EyGLJwcQV
 wA7jgkT6BVbMqzmqrr0zjCOShvcMtdV2VdCfBoUnqNonVC0EbFVfJxJTs
 qDJH+wsrLGVEIrukL/z5tlZxV+yIl9Uz2lNUQJvu2+H7J9ESAyxJJGEKU
 rMrFy9X4WN+tauHwHldycHNKjw9AeC8cY5HZy3AhFtT6jy4rJTrhwpu/V A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245942137"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="245942137"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939894"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:35 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: SOF: IPC Abstraction for FW loading
Date: Mon, 25 Apr 2022 15:11:19 -0700
Message-Id: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This series introduces IPC abstraction for FW loading in the SOF driver
in preparation for supporting the new IPC version in the SOF firmware.

Peter Ujfalusi (10):
  ASoC: SOF: Introduce IPC dependent ops for firmware handling, loading
  ASoC: SOF: ipc3-loader: Implement firmware parsing and loading
  ASoC: SOF: ipc: Add check for fw_loader ops
  ASoC: SOF: loader: Switch to use the fw_loader ops
  ASoC: SOF: amd: renoir: Do not set the load_module ops
  ASoC: SOF: imx: Do not set the load_module ops
  ASoC: SOF: Intel: bdw/byt/pci-tng: Do not set the load_module ops
  ASoC: SOF: mediatek: mt8195: Do not set the load_module ops
  ASoC: SOF: loader: Remove snd_sof_parse_module_memcpy() as it is not
    used
  ASoC: SOF: loader: Call optional query_fw_configuration on first boot

 sound/soc/sof/Makefile                 |   2 +-
 sound/soc/sof/amd/renoir.c             |   3 -
 sound/soc/sof/imx/imx8.c               |   6 +-
 sound/soc/sof/imx/imx8m.c              |   3 +-
 sound/soc/sof/intel/bdw.c              |   3 -
 sound/soc/sof/intel/byt.c              |   6 -
 sound/soc/sof/intel/pci-tng.c          |   3 -
 sound/soc/sof/ipc.c                    |  57 +--
 sound/soc/sof/ipc3-loader.c            | 416 ++++++++++++++++++++++
 sound/soc/sof/ipc3-priv.h              |  24 ++
 sound/soc/sof/ipc3.c                   |  62 +++-
 sound/soc/sof/loader.c                 | 471 +------------------------
 sound/soc/sof/mediatek/mt8195/mt8195.c |   2 -
 sound/soc/sof/sof-priv.h               |  24 +-
 14 files changed, 539 insertions(+), 543 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-loader.c
 create mode 100644 sound/soc/sof/ipc3-priv.h

-- 
2.25.1

