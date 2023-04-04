Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06776D5BBB
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39941FA;
	Tue,  4 Apr 2023 11:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39941FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600111;
	bh=AhQRfrkjFvDiGbeN/zyWyO7YJn02IFUuX6QRpFlbUC0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bObf0Go+WP7fXNYIKjm7U7AcedJ/T9cgLlMm4Mi7ME/Ew9Ryh299C0+B+LKnJhrSr
	 3G5o6cQHIL8h/XlZ15lc4dihG3T9K60xtg2+PonNQ1Ij7+UY/ZM0DZABc2n6B6fcP4
	 Dc2mylxCt8g4wJu0gnT7bzBhO+WQd6SgxB1zLhxQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC6F2F80482;
	Tue,  4 Apr 2023 11:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09F1F80482; Tue,  4 Apr 2023 11:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3CEBF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3CEBF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R+OCkKT/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600048; x=1712136048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AhQRfrkjFvDiGbeN/zyWyO7YJn02IFUuX6QRpFlbUC0=;
  b=R+OCkKT//RlrAeKPHm0cmZRpqvNLEV8ir9ttEw+FbcLnrB9IaSpY5CVF
   utCbd8x8fKU8xzuKG0ag5MBxFiTMiyybFjuG7/61rndmCMCD8kd0z9lUD
   NhpKxs4k1WEZwW0g6qShvB6TeSyoWFZlgH7lSg04Eb35n0Vd4hgsZvl12
   CqAdWBuia+0aETekrJgCRtR6r7+2XRgsqLKbPhCP+7u9p4l7RNmd8fyFY
   1XpajOquSAJ6anmb26BPMxOODw7vw1lJstDOa8s6QwJ4tvi6ePY5CD1Ih
   AEQEdqqNMxU2OXY1wiZXwFPZqWCbEkaYF9DYhPN3yhKQoBPcVabPW0UGB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620485"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620485"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688819924"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688819924"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 00/12] ASoC: SOF: core/Intel: Introduce DSPless mode
Date: Tue,  4 Apr 2023 12:21:03 +0300
Message-Id: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P6B2WLN6FWAIRLFKGVOJE6G647MBW3B2
X-Message-ID-Hash: P6B2WLN6FWAIRLFKGVOJE6G647MBW3B2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6B2WLN6FWAIRLFKGVOJE6G647MBW3B2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series will add support for SOF Linux stack to run without using the DSP.

DSPless mode provides a good tool for verification that the hardware itself
works correctly by taking the DSP use out from the picture.
It can only work with interfaces which supports this mode: Intel HDA at the
moment but with LNL it could be possible to support other audio interfaces.

The main driver for this mode is to be able to test programming sequences,
low-level code and for low-level verification of a platform.

The feature is not targetted for end-users and it will not make the SOF stack
to work on hardware without DSP, but it is giving us a tool to debug and enable
platforms earlier (when for example t he firmware is not mature enough).

Regards,
Peter
---
Peter Ujfalusi (11):
  ASoC: SOF: Intel: hda-stream: Do not dereference hstream until it is
    safe
  ASoC: SOF: Add flag and state which will be used for DSP-less mode
  ASoC: SOF: Add support for DSPless mode
  ASoC: SOF: Intel: hda: Skip interfaces not supported on a platform
  ASoC: SOF: Intel: hda: Add support for DSPless mode
  ASoC: SOF: Intel: pci-apl: Allow DSPless mode
  ASoC: SOF: Intel: pci-cnl: Allow DSPless mode
  ASoC: SOF: Intel: pci-icl: Allow DSPless mode
  ASoC: SOF: Intel: pci-mtl: Allow DSPless mode
  ASoC: SOF: Intel: pci-skl: Allow DSPless mode
  ASoC: SOF: Intel: pci-tgl: Allow DSPless mode

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: hda: make DSPless mode work with DSP disabled in
    BIOS

 include/sound/sof.h               |   5 +
 sound/soc/sof/core.c              |  31 ++++++-
 sound/soc/sof/debug.c             |   1 +
 sound/soc/sof/intel/hda-dai-ops.c |  33 ++++++-
 sound/soc/sof/intel/hda-dai.c     |  25 ++++-
 sound/soc/sof/intel/hda-dsp.c     |  30 ++++--
 sound/soc/sof/intel/hda-ipc.c     |   3 +
 sound/soc/sof/intel/hda-pcm.c     |  24 +++--
 sound/soc/sof/intel/hda-stream.c  |  67 ++++++++------
 sound/soc/sof/intel/hda.c         | 149 +++++++++++++++++++++++-------
 sound/soc/sof/intel/pci-apl.c     |   2 +
 sound/soc/sof/intel/pci-cnl.c     |   3 +
 sound/soc/sof/intel/pci-icl.c     |   2 +
 sound/soc/sof/intel/pci-mtl.c     |   1 +
 sound/soc/sof/intel/pci-skl.c     |   2 +
 sound/soc/sof/intel/pci-tgl.c     |   8 ++
 sound/soc/sof/pcm.c               |  13 ++-
 sound/soc/sof/pm.c                |   5 +
 sound/soc/sof/sof-audio.c         |   2 +-
 sound/soc/sof/sof-client.c        |   3 +
 sound/soc/sof/sof-priv.h          |  11 +++
 sound/soc/sof/topology.c          | 130 +++++++++++++++++++++++++-
 22 files changed, 459 insertions(+), 91 deletions(-)

-- 
2.40.0

