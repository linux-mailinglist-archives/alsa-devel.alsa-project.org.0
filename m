Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F57A5DB6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC77A4A;
	Tue, 19 Sep 2023 11:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC77A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115513;
	bh=auaE8PR6vPscH5MRtxQ54G0lLjKqw54IL9+GjyTLNGM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R6uVsgQUVI91DKEX+3nOSm4kvhxsLDDaJJpwukVCyI9pwTGTX+xmGn3DlxHRgwYtk
	 +oNUVjtQSSwJ2iec75+YFsKNsQU/xjC1eE3ne/kFcX0qHRup50fP2+DFNyyyfyxL9J
	 y/8Z6Ig/04FWMLXa5GGt9k+bU3DeoVNn1FC2R/uM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3637F80558; Tue, 19 Sep 2023 11:24:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA71F80124;
	Tue, 19 Sep 2023 11:24:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F147CF8047D; Tue, 19 Sep 2023 11:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7688F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7688F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a/bnGd5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115455; x=1726651455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=auaE8PR6vPscH5MRtxQ54G0lLjKqw54IL9+GjyTLNGM=;
  b=a/bnGd5eYSZSumCK2S8KJExSIhzzUoDqb5748Xcm8PLQd2IywzYW8Ped
   nErBz9+4Clzb0pK9oii2j/n4IrUH39TGnMQlWGHudH7UGh/jAAv+oaZ9r
   OOp4iXPio5kXmFk5IP0i9+meGYwzAOgE7K6khyrN8ApgcDs33W3OSbqfU
   2LS9E4pe4sRjrCd4cAECSgLoardRHYJyXv4eIcxddFVG9iWzhQGpblZ+J
   bKyxq7ubecKEmf+8z31IVrKW2fGfWRtRi0P2OMCHu22Z+QQAzmxhn5ANs
   6xlqUWVa8Kmk71Xa1v+IeAoGVwTzdXVIvRod6+ICXpTI5ij14yCcsbfVg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205140"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205140"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460183"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460183"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:08 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 0/9] ASoC: SOF: ipc4/Intel: Support for firmware exception
 handling
Date: Tue, 19 Sep 2023 12:24:07 +0300
Message-ID: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4AL3N37XU3E7DTVPBMFGZMEFT3TWNP4F
X-Message-ID-Hash: 4AL3N37XU3E7DTVPBMFGZMEFT3TWNP4F
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AL3N37XU3E7DTVPBMFGZMEFT3TWNP4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

When a firmware crashes it creats a panic information into a telemetry slot.
The panic format is defined by Zephyr, includes stack and additional information
to help to identify the reason for the crash.
Part of the firmware exception handling the firmware also sends an
EXCEPTION_CAUGHT notification.

This series implements the kernel side handling of the exception:
print information into the kernel log
export the whole telemetry slot to user space for tools extract additional
information from the panic dump.

Regards,
Peter
---
Rander Wang (9):
  ASoC: SOF: Xtensa: dump ar registers to restore call stack
  ASoC: SOF: ipc4-mtrace: move debug slot related definitions to
    header.h
  ASoC: SOF: ipc4: add a helper function to search debug slot
  ASoC: SOF: ipc4: add definition of telemetry slot for exception
    handling
  ASoC: SOF: ipc4: add exception node in sof debugfs directory
  ASoC: SOF: Intel: add telemetry retrieval support on Intel platforms
  ASoC: SOF: Intel: mtl: dump dsp stack
  ASoC: SOF: Intel: hda: add ipc4 FW panic support on CAVS 2.5+
    platforms
  ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification from firmware

 include/sound/sof/ipc4/header.h | 17 ++++++
 sound/soc/sof/Makefile          |  2 +-
 sound/soc/sof/intel/Makefile    |  3 +-
 sound/soc/sof/intel/hda.c       | 14 +++++
 sound/soc/sof/intel/hda.h       |  1 +
 sound/soc/sof/intel/mtl.c       |  3 ++
 sound/soc/sof/intel/telemetry.c | 95 +++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/telemetry.h | 35 ++++++++++++
 sound/soc/sof/intel/tgl.c       |  1 +
 sound/soc/sof/ipc4-mtrace.c     | 34 ++++--------
 sound/soc/sof/ipc4-priv.h       |  3 ++
 sound/soc/sof/ipc4-telemetry.c  | 95 +++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-telemetry.h  | 73 +++++++++++++++++++++++++
 sound/soc/sof/ipc4.c            | 29 ++++++++++
 sound/soc/sof/xtensa/core.c     | 11 ++++
 15 files changed, 391 insertions(+), 25 deletions(-)
 create mode 100644 sound/soc/sof/intel/telemetry.c
 create mode 100644 sound/soc/sof/intel/telemetry.h
 create mode 100644 sound/soc/sof/ipc4-telemetry.c
 create mode 100644 sound/soc/sof/ipc4-telemetry.h

-- 
2.42.0

