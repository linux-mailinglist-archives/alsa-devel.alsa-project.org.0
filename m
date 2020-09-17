Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2C26D9BA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B831663;
	Thu, 17 Sep 2020 12:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B831663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340399;
	bh=Hk+Ql8DJqrr3RAqrj2yTxSeQDYF5bv8/8idaTYTy2C8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ryEST5CKE1oKJu+PWZel7yMaMBucELS/afyvD/XeN7k4qq6R78njgBY0Kh5y8n4QE
	 VHtqrCNZooATk3blK9JysDPx4OZ3pSLt6AkdYvhDVFMyyH6ps4eUp9AKvdAr9cmrdY
	 ycHX9Iz0xV4POE1A8wG+giWC0qcUEAae0ZgXh6LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC91FF8027C;
	Thu, 17 Sep 2020 12:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4AAF8028B; Thu, 17 Sep 2020 12:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E8DCF800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8DCF800E8
IronPort-SDR: BYHSP6YDitS5EArURcqHxT08j5b5zBnOA+7oYkWy53hW0uZHuPZJfOwnUN0akZeHI31D1D0FYF
 OBJDUXoU6vvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075339"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075339"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:02 -0700
IronPort-SDR: 0w1aao6jrkLT8J2Wg/L7eJKqODEpz1qjqSnRCoRxyc4jV2bQx308Kh1eGlTToY6PEK0vGVD3YU
 En16e49+cb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177294"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:00 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/8] ASoC: SOF: small fixes for 5.10
Date: Thu, 17 Sep 2020 13:56:25 +0300
Message-Id: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Series that adds debug support for IMX platforms, more details to
FW version information, adds missing -EACCESS handling to
pm_runtime_get_sync() calls and a set of minor cosmetic, trace
verbosity and coding style issues.

Guennadi Liakhovetski (3):
  ASoC: SOF: (cosmetic) remove redundant "ret" variable uses
  ASoC: SOF: remove several superfluous type-casts
  ASoC: SOF: fix range checks

Iulian Olaru (1):
  ASoC: SOF: imx: Add debug support for imx platforms

Karol Trzcinski (1):
  ASoC: SOF: Add `src_hash` to `sof_ipc_fw_version` structure

Pierre-Louis Bossart (3):
  ASoC: SOF: debug: update test for pm_runtime_get_sync()
  ASoC: SOF: control: update test for pm_runtime_get_sync()
  ASoC: SOF: Intel: hda: reduce verbosity of boot error logs

 include/sound/sof/info.h         |  4 +-
 sound/soc/sof/control.c          | 62 +++++++++++++--------------
 sound/soc/sof/debug.c            |  2 +-
 sound/soc/sof/imx/Kconfig        |  8 ++++
 sound/soc/sof/imx/Makefile       |  3 ++
 sound/soc/sof/imx/imx-common.c   | 72 ++++++++++++++++++++++++++++++++
 sound/soc/sof/imx/imx-common.h   | 16 +++++++
 sound/soc/sof/imx/imx8.c         | 23 +++++++++-
 sound/soc/sof/imx/imx8m.c        | 17 +++++++-
 sound/soc/sof/intel/hda-loader.c | 16 +++----
 sound/soc/sof/intel/hda.c        | 12 ++++--
 sound/soc/sof/intel/hda.h        |  2 +
 sound/soc/sof/sof-audio.c        |  6 +--
 sound/soc/sof/sof-priv.h         |  8 ++++
 sound/soc/sof/topology.c         | 44 ++++++++++---------
 15 files changed, 226 insertions(+), 69 deletions(-)
 create mode 100644 sound/soc/sof/imx/imx-common.c
 create mode 100644 sound/soc/sof/imx/imx-common.h

-- 
2.27.0

