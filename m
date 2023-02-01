Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 411476865F6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7B082E;
	Wed,  1 Feb 2023 13:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7B082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254817;
	bh=tFddUHtOVgwvjVM+0gmJXWsjIARB5Qfbh97T0KNUV2w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NeNJETM7R/4XrnOJkxi/6kz8bzokuEZwg96JL1Amz+JfEUrTFptB0pb6ttx9xJoB8
	 j2J2Fsxv0REuDkrLCQ4FMDTJcLbYcZVHiHfMcWVFj4jrG3MS5k266nP1M5/XBsuuoU
	 HFtAJdgea0kLy33Z+UqI6UwLO8O0mM2lHrIFrqeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44663F80169;
	Wed,  1 Feb 2023 13:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDBA0F80169; Wed,  1 Feb 2023 13:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49775F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49775F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RlKT37IR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254750; x=1706790750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tFddUHtOVgwvjVM+0gmJXWsjIARB5Qfbh97T0KNUV2w=;
 b=RlKT37IRQE3envsJfGhyUI+oUwiDsdFn2Q17DwtlRmRbWBVLSgVlTPlw
 m50M3qCNj+1r14lMghovl1UZrc+cHlZWzysnonu/xoWKVxet0HjVArvpQ
 0rOzFEZ3pcEguvoScQYsZyxhtVXWZ72vDmtA14EP4pyUa/CtEZDytHQZ9
 VZ7zbbyhYdgn+2JWn2EIgsm8ER65+aslKUm6QWBW9Da1bAK5qAkfYLVaR
 jfaidXFwxgg2aE3nRWdCuqbQfocjXTN7ijhxwVwdDBIGITF2VVJNvIzTM
 gLayI8l91rbNTHwN/fj+B9+tR77T1tVdw5FZAgVmRBipa3D6wnVQx52Om A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143499"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143499"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865663"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865663"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:21 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/9] ASoC: SOF: core/ipc4/mtl: Add support for PCM delay
 reporting
Date: Wed,  1 Feb 2023 14:32:22 +0200
Message-Id: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/ipc4-pcm.c    | 230 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h   |  15 +++
 sound/soc/sof/ipc4.c        |   3 +
 sound/soc/sof/ops.h         |  10 ++
 sound/soc/sof/pcm.c         |  13 ++
 sound/soc/sof/sof-audio.h   |   6 +
 sound/soc/sof/sof-priv.h    |  10 ++
 10 files changed, 462 insertions(+)
 create mode 100644 sound/soc/sof/ipc4-fw-reg.h

-- 
2.39.1

