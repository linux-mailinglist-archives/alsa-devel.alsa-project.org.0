Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C2E70B9B4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1D7822;
	Mon, 22 May 2023 12:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1D7822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684750406;
	bh=xAfwhPwzw+QIQIDTrZt1pCAhye7FjaOM8KudtbYVwLM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LXaDLJ8M09FjdjC2XMT95HAQslV0Ubzf2JVf1XYKZWvz9btmpVqthKArJ9jFsfVP8
	 krfmrEfy5Za4yaUghUjEQlEyL1tSPGoUVFgM+EEttz4QWKgEx0Q+mHIqk5XF3+6J5O
	 ATWj0aQmPH2kE1sBxzlBun8pZBr01nS4ngFuLIp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E93B1F8053D; Mon, 22 May 2023 12:12:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E69F80425;
	Mon, 22 May 2023 12:12:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AA5EF8053D; Mon, 22 May 2023 12:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0F00F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F00F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ne7+iBEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684750342; x=1716286342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xAfwhPwzw+QIQIDTrZt1pCAhye7FjaOM8KudtbYVwLM=;
  b=Ne7+iBEAWjEUsvKiVis1svrFfGXOyCcu0+yibs76uErRy7oFTGK8aJJU
   BcvD0n5yL2/agCxq5lZOcQzm567+gdYE1eVo5f5ABQIyBH57ngG1w9Bma
   5rm+XjdN8APH71oZamcRC10tJ5SfGDfJH5XqjSGdYKW2nOTXEfJZnY9Jt
   B7KeI+NtGlzhSqs0S40+yj4bU71Sd8XUfX/oVd6fcqQJ9YZU3ufHKuqFb
   5Gj+7pZbTGC6h5W3ekFaqm/N2mfNIUMpseepgWlbTd8PCTez7t7koJ/z8
   0oaqQ9hTj9xEaRzkguPFZkzzStsbqFqz4nkvd9+Bwm2at5JanVvu3w06K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350390644"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350390644"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736365224"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="736365224"
Received: from bbattach-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.157])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH 0/5] ASoC: SOF: ipc4: Querry CPC value from firmware's
 manifest
Date: Mon, 22 May 2023 13:13:08 +0300
Message-Id: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A3AYKSG4DY7TMCOMZBVGTBHVK4SWYEYW
X-Message-ID-Hash: A3AYKSG4DY7TMCOMZBVGTBHVK4SWYEYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3AYKSG4DY7TMCOMZBVGTBHVK4SWYEYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Hi,

The MOD_INIT_INSTANCE message contains a CPC (Cycles Per Chunk/processing unit)
parameter.
This CPC value is used by the firmware to calculate the total cycles needed by
the enabled module instances and based on this it can decide to set the
frequency of the DSP core(s).

The manifest section of the firmware image contains a module configuration
section, where a per module table of configurations are listed with measured
CPC values as triplet of IBS/IBS/CPC (Input/Output buffer size - corresponding
to the selected audio format).

In case the CPC value is 0 (missing from the manifest or the configuration cannot
be matched) the firmware will force the DSP cores to maximum speed to avoid audio
glitches due to starvation.
In these cases the kernel will print a warning message to let the SOF developers
know about the gap and provide information to correct it with a firmware update.

Regards,
Peter
---
Peter Ujfalusi (5):
  ASoC: SOF: ipc4-loader: Drop unused bss_size from struct
    sof_ipc4_fw_module
  ASoC: SOF: ipc4-loader: Save a pointer to fm_config in
    sof_ipc4_fw_module
  ASoC: SOF: ipc4-topology: Rename sof_ipc4_update_pipeline_mem_usage()
    to be generic
  ASoC: SOF: ipc4-topology: Do not use the CPC value from topology
  ASoC: SOF: ipc4-loader/topology: Query the CPC value from manifest

 sound/soc/sof/ipc4-loader.c   | 72 ++++++++++++++++++++++++++++++++---
 sound/soc/sof/ipc4-priv.h     | 10 ++++-
 sound/soc/sof/ipc4-topology.c | 33 +++++++++-------
 3 files changed, 94 insertions(+), 21 deletions(-)

-- 
2.40.1

