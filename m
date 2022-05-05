Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0AC51BC75
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 11:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33F517DE;
	Thu,  5 May 2022 11:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33F517DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651744151;
	bh=YBAcsGjgTLipZ8pYfRz7qXtnVcuYgp1qjwVhEZemzOo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZyBKGlSecQW/9mlGxvod6rZ32MK4cUTHYNENtr9LYX0KM1zQ7eosDXv6Pr0iR3mNS
	 J9donHQStsKyGON735QLvxv7icwyeVOQqpO5ht0mfZN5zGpT/yq3enhHP++76aWDf2
	 cYIpid9ALTRwm8jfyyzETSLIVnXDL5qapamMAd8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C96F800D3;
	Thu,  5 May 2022 11:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6B1F8049C; Thu,  5 May 2022 11:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70880F800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 11:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70880F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YKIsHE6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651744085; x=1683280085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YBAcsGjgTLipZ8pYfRz7qXtnVcuYgp1qjwVhEZemzOo=;
 b=YKIsHE6nOHpKwYGXFmctW1ZSf6trvPJLW1uwzR40Im6j1dbubZOoJ/8x
 LhiVHBOCDLj/ZBewp90cbzeN7ClcBzmA/acllsuEydbJrIabm92u55Jy5
 HwBfBZb1vLhGewPxbgQ1RNFrlnllixewMNdyaZqJp6sm3S5FhM+bxZOy8
 QjlZ6cxeYB+Kx5xbE76DKLuRvprOiHNXxX57e0cwfI+i8w6D6cj69c0hS
 pZLMVOib8WcT8pkB4pDW25Q3NHVUMd6DRv/TaDa2L8QhdPqrgu8cpXP5E
 Pg7wLM4VkuWzW09A2UIVVOjLGSW0a+Jw32XFMVBk53RhN/k8ts6UpLZcu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267655057"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="267655057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 02:47:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="708870929"
Received: from oluwakem-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.34.211])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 02:47:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 0/3] ASoC: SOF: IPC4: Introduce message handling functionality
Date: Thu,  5 May 2022 12:48:15 +0300
Message-Id: <20220505094818.10346-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The series adds the basic IPC4 message handling code, implementing the ipc
callbacks.
Due to the difference between IPC3 and IPC4 messaging we need to introduce new
message container for IPC4, but the SOF internal callbacks and structures can be
kept as they were and leaving it for the IPC specific code to handle the
differences.

The series provides the foundation for both lowe level (sound/soc/sof/intel) and
high level IPC4 implementation (topologies, firmware loading, control handling,
etc).

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: Add rx_data pointer to snd_sof_ipc_msg struct
  ASoC: SOF: Add initial header file for ipc4
  ASoC: SOF: ipc4: Add support for mandatory message handling
    functionality

 include/sound/sof/ipc4/header.h | 460 ++++++++++++++++++++++++
 sound/soc/sof/Makefile          |   3 +-
 sound/soc/sof/ipc4.c            | 604 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h        |   4 +
 4 files changed, 1070 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sof/ipc4/header.h
 create mode 100644 sound/soc/sof/ipc4.c

-- 
2.36.0

