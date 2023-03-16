Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCC6BD302
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:12:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D2010E9;
	Thu, 16 Mar 2023 16:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D2010E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979553;
	bh=DZpFNpga/v0n0SMeDfwwFD6po1pwvtNSD7PUkmU8THg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ApywkzjR9oRSiFWgsWmaGFT+T7+fOTn5lL5qtsPPSxOY+6V1CrVWjo1EqC1otPePM
	 wj4EhdXK2om1lqxDlKFyxpfQA5tmambq8FPMpZ1VFClPkICjTt2qfz/UUlX8xyDA57
	 Z+VcnVTle7Qg6WZv1MT0av772RqIV2F1SPnRKtO0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D16F8051B;
	Thu, 16 Mar 2023 16:11:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BA0AF800C9; Thu, 16 Mar 2023 16:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1F7FF800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F7FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dqo4kR2N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979495; x=1710515495;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DZpFNpga/v0n0SMeDfwwFD6po1pwvtNSD7PUkmU8THg=;
  b=Dqo4kR2NGf3YXmp/xPX1TYniAzB/oj5X66aa5QEH9wxPVSFFoIwSySv2
   e+B60wNw/FTAoTFNZ0pyr+Leu0aJpFxafbI+/n3UFZLXMLFnNkkCwqqMv
   okoJuQllgElMWnu527h9R6njiMDr2PPIZRsA9rKht5+KzRySaxikekAQ1
   V/w6dkQWTX16DThYjeRp7dYJd1Rka1VtjBvKrMmS8QW1T7g2ZtdzOp+Ds
   856clQmMbVoJznOdQ0R+jG5PasmXcFJ1oR5mEMs2XH5NQnkCcyXbHu7Nu
   7nCF7gSCJvxBX2jfHT+kt6wu60w22AlZaRQKamXYojAEEDlTz3wxrs3eW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501527"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501527"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286466"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286466"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/6] ASoC: SOF: ipc4-topology: Add support for effect widget
Date: Thu, 16 Mar 2023 17:11:31 +0200
Message-Id: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PEFT3ZEMENKM3RYCTRQQVDDDOIRGN2NW
X-Message-ID-Hash: PEFT3ZEMENKM3RYCTRQQVDDDOIRGN2NW
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEFT3ZEMENKM3RYCTRQQVDDDOIRGN2NW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The following series will add support for IPC4 process modules as effect widgets.
We can cover wide range of modules as a generic process or effect module, the
patches will lay down the fundation and the generic code to handle them.

At initialization time process modules can receive additional information on
top of the base_cfg, which is defined as base_cfg_ext, an extension for the base
configuration struct.
Other parameters or blobs for these modules are sent as a separate message via
LARGE_CONFIG message, which is handled by the existing bytes control support.

Regards
Peter
---
Chao Song (2):
  ASoC: SOF: ipc4-topology: add base module config extension structure
  ASoC: SOF: ipc4-topology: set copier output format for process module

Libin Yang (2):
  ASoC: SOF: ipc4-topology: add effect widget support
  ASoC: SOF: ipc4-topology: update pipeline_params in process prepare

Peter Ujfalusi (1):
  ASoC: SOF: ipc4-topology: Move the kcontrol module_id update to helper

Ranjani Sridharan (1):
  ASoC: SOF: ipc4-topology: Add support for base config extension

 sound/soc/sof/ipc4-topology.c | 367 ++++++++++++++++++++++++++++++++--
 sound/soc/sof/ipc4-topology.h |  45 +++++
 2 files changed, 396 insertions(+), 16 deletions(-)

-- 
2.39.2

