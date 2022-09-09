Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC615B3695
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D267168F;
	Fri,  9 Sep 2022 13:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D267168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723886;
	bh=ZORY8pPvVGWzFv1T0qWJ8Rg3S1+bNQ9neLCeRfp0kPQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r+I3mTiM66j6uH6L29eIo0+Nxr+T8TqqC19E6uCQAV8U+CnnkhgpHkoxESsc6RCvQ
	 JmYGAbwFSEXSs3arp6olgchVCu50p/gEKSSb5ByY8kfX0HEvG4WyjHsXD0z4OjXhsM
	 U1w0RyUfPp1HX95zf2L2Iom7qSWCmlwXcFpi8I0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4067F80528;
	Fri,  9 Sep 2022 13:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 851A7F804AE; Fri,  9 Sep 2022 13:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_MED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBA4BF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBA4BF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PYQRamSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723822; x=1694259822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZORY8pPvVGWzFv1T0qWJ8Rg3S1+bNQ9neLCeRfp0kPQ=;
 b=PYQRamSIj3JygnUNr3uw8rJ0i/14kF4INA2fbpGXzR8Lpzw7JoiWScGP
 UUmCHs6xpy+SGNtl2BUDn4ByO1th4wDRN9BfHUOGDicTDsOd5VskXT3K6
 FocsaXcd2JPK56kUj+ky/KceoEQqBL5/OM4REaTUYJX//YlVonpflO0s2
 GLEP/VkUHSG4lI5N7zWaGBNFZj3d5YP6PFBlw4t1nMfJJmeDha8Flwn7+
 U5N0kB4iWrUuOa2vxybRrzn77SSjsZmTKJKqOvHm0p1Et9KP5Og6GRQ3J
 p2a7pa7Nh0qdPMC6kAskZSqgmtCJsQ7ZQelghbOQsrysQmBg4rQraFODE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180080"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613810"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/7] ASoC: SOF: ipc4: Add support for 'mtrace' log extraction
Date: Fri,  9 Sep 2022 14:43:25 +0300
Message-Id: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The traditional dtrace used by SOF IPC3 is not available with firmware built
as IPC4.
With the new IPC implementation we have a new log extraction infrastructure and
'mtrace' is one way to get the logs out from the firmware for debugging.

The protocol is relatively simple:
The shared sram's debug window is split up to 'slots'
Each DSP core will get a dedicated slot assigned for log output.
The function of a slots can be checked in a descriptor table.
The slot used for logging has the following layout:

 u32 host_read_ptr;
 u32 dsp_write_ptr;
 u8 buffer[];

 The two pointers are offsets within the buffer.

The firmware manages the write pointer, the host updates the read pointer value
and based on the two pointers the log entries can be extracted.
The firmware also sends notification when new entries are available in the log
slot.

The user space tool to read the log entries can be found in the SOF repository:
https://github.com/thesofproject/sof/blob/main/tools/mtrace/mtrace-reader.py

Regards,
Peter
---
Peter Ujfalusi (7):
  ASoC: SOF: ipc4: Only print LOG BUFFER update message info if
    requested
  ASoC: SOF: ipc4: Add macro to get core ID from log buffer status
    message
  ASoC: SOF: ipc4: Add define for the outbox window index
  ASoC: SOF: ipc4: Configure the debug box offset
  ASoC: SOF: ipc4: Add support for mtrace log extraction
  ASoC: SOF: Intel: icl: Set IPC4-specific DSP ops
  ASoC: SOF: Intel: Add mtrace type information for IPC4

 include/sound/sof/ipc4/header.h |   5 +
 sound/soc/sof/Makefile          |   3 +-
 sound/soc/sof/intel/apl.c       |   2 +
 sound/soc/sof/intel/cnl.c       |   2 +
 sound/soc/sof/intel/icl.c       |  30 +-
 sound/soc/sof/intel/mtl.c       |   2 +
 sound/soc/sof/intel/tgl.c       |   2 +
 sound/soc/sof/ipc4-loader.c     |   2 +
 sound/soc/sof/ipc4-mtrace.c     | 643 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |  18 +-
 sound/soc/sof/ipc4.c            |  22 +-
 11 files changed, 724 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/sof/ipc4-mtrace.c

-- 
2.37.3

