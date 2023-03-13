Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91626B7801
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790C91452;
	Mon, 13 Mar 2023 13:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790C91452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711801;
	bh=D+mtglxQQymJ52pcxboi1L1M74rNmhTuz8TO2Qxq/JI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mo/LA/UkPcyLVLrZe0ECy/3jabCCu48ilAGlg9HyGUK5Xsz7j6pb1/Lm7PUSxBF/C
	 CkFQA4Gsxl0NShYNGwoFz1u4jRUE9PjSYjQSW2gPYeCJ924zPEOfPwlgWQgw1ZD/3w
	 M54okc7i+OszsAtC7wEgwQms+Or/EueiBRDQLc44=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5AEF80423;
	Mon, 13 Mar 2023 13:49:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71B97F804FE; Mon, 13 Mar 2023 13:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8782BF8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8782BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HrJNv23Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711738; x=1710247738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D+mtglxQQymJ52pcxboi1L1M74rNmhTuz8TO2Qxq/JI=;
  b=HrJNv23Q63ZIfrY1PZPFk8h1YBX6OTdHJqPA6HA2S6PgC6UFiwcTaoiz
   LxE6XwFsYJimFhSaiL9PfJl3al0gjuzDMeLJDWyTuJBxaFX3c1BCzqQx8
   Ldgh01BakdN4KWXIcBAtI6kc0RxeXNQNmwbt6HywjBeOWcXBwZesm+znM
   uoLyldSBIXS/gmZwdRr1tS42ZP5OPbRigidCsuL2UfHC9nROEPlw6Ti/e
   Oo4MqSwkjCpOaKKo/mwryoyRKK6/UBGAcjlaBaqV33XShR2pMz7xB6/Kv
   OclTwoNDabUglFDadCgspJkl52rfj+FNNsCpPYMpfrR+D00z0Eq/n7e5N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728025"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116395"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116395"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 00/11] ASoC: SOF: ipc4: Add support for formats per pins
Date: Mon, 13 Mar 2023 14:48:45 +0200
Message-Id: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A6VQ6HMU743OINGXI3NMNKXUAM3SSWKU
X-Message-ID-Hash: A6VQ6HMU743OINGXI3NMNKXUAM3SSWKU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6VQ6HMU743OINGXI3NMNKXUAM3SSWKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The modules in IPC4 can have multiple 'pins' on their input and output and these
pins can receive or output audio in different formats.
Currently we assume that all pins are using the same format which is a limitation
that needs to be lifted in order to support more complex components.

This series will extend and rework the format handling to allow different formats
on pins.

Regards,
Peter
---

Ranjani Sridharan (11):
  ASoC: SOF: rename a couple of tokens
  ASoC: SOF: Use input/output pin consistently
  ASoC: SOF: ipc4-topology: Add a new field in struct
    sof_ipc4_available_audio_format
  ASoC: SOF: ipc4-topology: Do not parse the DMA_BUFFER_SIZE token
  ASoC: SOF: ipc4-topology: Parse the SOF_COMP_TOKENS only once
  ASoC: SOF: ipc4-topology: Always parse the output formats in topology
  ASoC: SOF: ipc4-topology: Modify the type of available input/output
    formats
  ASoC: SOF: ipc4-topology: Modify the signature of
    sof_ipc4_init_audio_fmt()
  ASoC: SOF: ipc4-topology: Remove the ref_audio_fmt field
  ASoC: SOF: ipc4-topology: Add new tokens for input/output pin format
    count
  ASoC: SOF: ipc4-topology: Search only pin 0 formats

 include/uapi/sound/sof/tokens.h |  20 +-
 sound/soc/sof/ipc4-pcm.c        |   2 +-
 sound/soc/sof/ipc4-topology.c   | 529 +++++++++++++++-----------------
 sound/soc/sof/ipc4-topology.h   |  36 ++-
 sound/soc/sof/sof-audio.h       |  35 +--
 sound/soc/sof/topology.c        | 124 ++++----
 6 files changed, 371 insertions(+), 375 deletions(-)

-- 
2.39.2

