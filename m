Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961C687EB0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:31:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC794E93;
	Thu,  2 Feb 2023 14:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC794E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675344660;
	bh=Zo/BZGqBARSKZd47+qdf1MiEwycN4NKfr5cIx+FysXY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Z5LJJOXaf/AT9HzE+p0BphuvPGDST3oZRUgCusnGYMBVURchjsZk+HutPwmGWVhP5
	 efo5tAdqxPwuXut8IHImL2/l6A0+EsYfeZcxAqpHaHNhZTU+hB9iWj+09aXorPD2CF
	 bbzXqz4/cLP5vJNBd1b909IsrwJBbxq7sdV5iXi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 072C6F804EB;
	Thu,  2 Feb 2023 14:30:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00CEF804E0; Thu,  2 Feb 2023 14:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E598F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E598F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Gdp9RUX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675344592; x=1706880592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zo/BZGqBARSKZd47+qdf1MiEwycN4NKfr5cIx+FysXY=;
 b=Gdp9RUX0GFPzj2ri+cyTenbIjRkTq1s6OswEsXL1xZgsQFdpqwOG1CBn
 pBLQcmjlMXQnURXncSJhmQ3y3CQI6v2f4l36YtzqjXyd35hYy6KkADuu3
 8t1+DTd9JPa2Zle8isiQE2SFwbrE6oEmf7JeGWQRNoQDDX1tdcUxzoMVC
 o82SOKQ4GnYb4LSMmrIB/wOeDGfvyd6bUunJkY6XcEGtiTQ+BiWKWAa6h
 jXckhVsfPwRenJAWif9WHvPzSTzwTlHUiPyR2hhUF3BFNDV4tRNMKxvQv
 AyE1BPGTnd6+43AKx1KG1scSrZC6FG2Y0oFnLiEPCq2HjTRku6J/t+hUU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308783230"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308783230"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:29:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658727273"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658727273"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:29:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v3 0/9] ASoC: SOF: core/ipc4/mtl: Add support for PCM delay
 reporting
Date: Thu,  2 Feb 2023 15:29:45 +0200
Message-Id: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

Changes since v2:
- Use div64_u64_rem() to make the code compile and work on non 64bit architectures

Changes since v1:
- The delay calculation updated to take into account the counter wrapping on both
  ends (host and link side).

The following series adds support for the PCM delay reporting in SOF core level
and implements the needed infrastructure with IPC4 to finally enable it for MTL.

Currently this is only supported on MTL (and via IPC4), but with the
infrastructure in place it will be possible to support other platforms with
DeepBuffer.

Regards,
Peter
---
Rander Wang (9):
  ASoC: SOF: add ipc4_fw_reg header file
  ASoC: SOF: add fw_info_box support
  ASoC: SOF: add time info structure for ipc4 path
  ASoC: SOF: ipc4-pcm: allocate time info for pcm delay feature
  ASoC: SOF: ipc4-pcm: add hw_params
  ASoC: SOF: add delay function support in sof framework
  ASoC: SOF: add get_stream_position ops for pcm delay
  ASoC: SOF: Intel: mtl: add get_stream_position support
  ASoC: SOF: ipc4-pcm: add delay function support

 sound/soc/sof/intel/mtl.c   |  14 +++
 sound/soc/sof/intel/mtl.h   |   6 +
 sound/soc/sof/ipc4-fw-reg.h | 155 ++++++++++++++++++++++++
 sound/soc/sof/ipc4-pcm.c    | 232 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h   |  15 +++
 sound/soc/sof/ipc4.c        |   3 +
 sound/soc/sof/ops.h         |  10 ++
 sound/soc/sof/pcm.c         |  13 ++
 sound/soc/sof/sof-audio.h   |   6 +
 sound/soc/sof/sof-priv.h    |  10 ++
 10 files changed, 464 insertions(+)
 create mode 100644 sound/soc/sof/ipc4-fw-reg.h

-- 
2.39.1

