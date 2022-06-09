Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F8B5441E1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0AD1FE3;
	Thu,  9 Jun 2022 05:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0AD1FE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745288;
	bh=TsNQcm7TrLnwYxGKtm0I2qdVbHH07A9dLRjfI/VOWTI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mXP3nRHCfTXG+DGHJwgl2ttVdnf5UVsDcO6QY1sSrt751E6f5AE0Byd3A04fV/vCE
	 tWxDgE238KITQ4oOUna6+lkhSfqPQilVo2o3XveJjdkws05aMawITEZm+lzRi7X6HW
	 VYKgnw3cyIsOk5FmiS5XX8ueoIteJU2q92TlVK6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0F3F80240;
	Thu,  9 Jun 2022 05:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9288F801F5; Thu,  9 Jun 2022 05:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C780F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C780F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KqmN39DJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745225; x=1686281225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TsNQcm7TrLnwYxGKtm0I2qdVbHH07A9dLRjfI/VOWTI=;
 b=KqmN39DJRstua/bxRUEh/jwRVkG4u5XUO/1Ll++Wne0t/cZy2y5ALHGO
 UINGE7DVgPSw63Pe7wKXvHdj7m82riqer+wFbXX+I4Nw3ZXHXBrOlXIko
 QZPbzVteiQabdfFffOwFJan/DVcejG9TdZbw12KEdBGbPpgRoNkPQK6NC
 tIL75QQGQlaWtJgUi8r0/C/sdyn8+ofD0JN+G5KbSr/yVM0xkTNOqrWRd
 lDnLYhTQ4lkzO/rovyjj5XoTQu5ZMxP6gow5bIE9a0Wl0hloDWCR3DvcM
 Dg97BDyJxlY2fT03IAYUYCOvrjMgIcSvJvda41OgdviOx/NfRjRX+tp5Q Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219544"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219544"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260226"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:57 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/23] ASoC: SOF: IPC4: Add topology, control and PCM ops
Date: Wed,  8 Jun 2022 20:26:20 -0700
Message-Id: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

This set of patches includes changes to add the topology, control and
PCM ops for IPC4. It also includes a couple of patches to set the IPC4
BE DAI trigger ops for SSP/DMIC/HDA type DAI's.

Bard Liao (1):
  ASoC: SOF: IPC4: add sdw blob

Ranjani Sridharan (22):
  ASoC: SOF: Add topology tokens for IPC4
  ASoC: SOF: IPC4: Introduce topology ops
  ASoC: SOF: ipc4-topology: Add support for parsing AIF_IN/AIF_OUT
    widgets
  ASoC: SOF: ipc4-topology: Add support for parsing DAI_IN/DAI_OUT
    widgets
  ASoC: SOF: ipc4-topology: Add prepare op for AIF type widgets
  ASoC: SOF: ipc4-topology: Add prepare op for DAI type widgets
  ASoC: SOF: ipc4-topology: Add support for parsing and preparing pga
    widgets
  ASoC: SOF: ipc4-topology: Add support for parsing mixer widgets
  ASoC: SOF: ipc4-topology: Add control_setup op
  ASoC: SOF: ipc4-topology: Add control IO ops
  ASoC: SOF: IPC4: Add pcm ops
  ASoC: SOF: ipc4-topology: Add widget_setup/widget_free ops
  ASoC: SOF: ipc4-topology: Add route_setup/route_free ops
  ASoC: SOF: ipc4-topology: Add the dai_config op
  ASoC: SOF: ipc4-pcm: Expose sof_ipc4_set_pipeline_state()
  ASoC: SOF: IPC4: set the BE DAI ops
  ASoC: SOF: Add ops_free
  ASoC: SOF: Intel: hda: init NHLT for IPC4
  ASoC: SOF: Add two new structures for topology manifest data
  ASoC: SOF: Add a new IPC op for parsing topology manifest
  ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's
  AsoC: SOF: ipc4-topology: Add dai_get_clk op

 include/sound/sof.h             |    1 +
 include/uapi/sound/sof/abi.h    |    2 +
 include/uapi/sound/sof/header.h |   30 +
 include/uapi/sound/sof/tokens.h |   40 +
 sound/soc/sof/Makefile          |    2 +-
 sound/soc/sof/core.c            |    7 +-
 sound/soc/sof/intel/hda-dai.c   |  201 +++-
 sound/soc/sof/intel/hda.h       |    1 +
 sound/soc/sof/intel/pci-apl.c   |    1 +
 sound/soc/sof/intel/pci-cnl.c   |    1 +
 sound/soc/sof/intel/pci-icl.c   |    1 +
 sound/soc/sof/intel/pci-tgl.c   |    1 +
 sound/soc/sof/ipc3-topology.c   |   48 +
 sound/soc/sof/ipc4-control.c    |  216 ++++
 sound/soc/sof/ipc4-pcm.c        |  230 +++++
 sound/soc/sof/ipc4-priv.h       |    7 +
 sound/soc/sof/ipc4-topology.c   | 1702 +++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h   |  234 +++++
 sound/soc/sof/ipc4.c            |    2 +
 sound/soc/sof/ops.h             |    6 +
 sound/soc/sof/sof-audio.h       |   11 +
 sound/soc/sof/topology.c        |  114 +--
 22 files changed, 2794 insertions(+), 64 deletions(-)
 create mode 100644 sound/soc/sof/ipc4-control.c
 create mode 100644 sound/soc/sof/ipc4-pcm.c
 create mode 100644 sound/soc/sof/ipc4-topology.c
 create mode 100644 sound/soc/sof/ipc4-topology.h

-- 
2.25.1

