Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB04732CA7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73282836;
	Fri, 16 Jun 2023 12:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73282836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909744;
	bh=BCWSHL/hRCdHC4pRsvoKym/JbeFSHw6jglwMIqNFKJQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K69TGaHlo1sF49eAFuGf/k4TupQ7+V28bN/hh0yeDduIV7y+xqmoB2w0LDpibQ451
	 66HhYPLJ/TiGbTnUW+p8kFG3u4Z9pYr8yRJCP9XH3WcaddQyoFlBXCoiqXUtBohUjU
	 FQDdZEGDAVHgQ6F9boqjvfmAD29RoShxwIs26F3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884C6F80149; Fri, 16 Jun 2023 12:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8885F80246;
	Fri, 16 Jun 2023 12:01:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8000CF8025E; Fri, 16 Jun 2023 12:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 646E6F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 646E6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eb8I6/fT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909660; x=1718445660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BCWSHL/hRCdHC4pRsvoKym/JbeFSHw6jglwMIqNFKJQ=;
  b=eb8I6/fTF8dqbNFJ7RyOYYs/XBsT+vce29yKjzuTINE96o3kNTU8/LG2
   PIG2RxMUscq4htOa1rvZydvgusqWAOWh+GkfC4+NWCDmTLguFju9FnaJG
   MKxGVmLVX1ZTerNVm2ycteTGpPrCsYRpMmV3DEJIGecFEt7oAMAU8Lu/q
   wubVAAG0/VrOrn3jp0vv7TZC1b/yIiAUbe+Tp4C9OtoYh+ZxZ/QpLNh3T
   3Utx2YhCcRajSzOxx4kShddb1H1fmBGmVe1hluZFwV4VYD6QK7fCoyabz
   +ioxI4Kyc94DWJ9O/DdCsBZUoU/doceHVNGwYJCk1ozSl4Ig/VX8k4rT/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591569"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689334"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689334"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:00:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/8] ASoC: SOF: misc updates for 6.5
Date: Fri, 16 Jun 2023 12:00:31 +0200
Message-Id: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VLLQCO3GFEXOATHX6AOQ5UBNHUHQLYPP
X-Message-ID-Hash: VLLQCO3GFEXOATHX6AOQ5UBNHUHQLYPP
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLLQCO3GFEXOATHX6AOQ5UBNHUHQLYPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Couple of improvements on virtual_widget support, firmware trace free,
IPC payload dump, duplicated code in suspend and MeteorLake primary
code support.

Bard Liao (2):
  ASoC: SOF: sof-audio: add is_virtual_widget helper
  ASoC: SOF: sof-audio: test virtual widget in sof_walk_widgets_in_order

Peter Ujfalusi (5):
  ASoC: SOF: core: Free the firmware trace before calling
    snd_sof_shutdown()
  ASoC: SOF: Add new sof_debug flag to request message payload dump
  ASoC: SOF: ipc3: Dump IPC message payload
  ASoC: SOF: ipc4: Switch to use the sof_debug:bit11 to dump message
    payload
  ASoC: SOF: pm: Remove duplicated code in sof_suspend

Rander Wang (1):
  ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake platform

 sound/soc/sof/core.c      |  4 +++-
 sound/soc/sof/intel/mtl.c | 19 ++++++++++++----
 sound/soc/sof/ipc3.c      | 39 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4.c      | 46 ++++++++++++++++++--------------------
 sound/soc/sof/pm.c        | 12 ++++------
 sound/soc/sof/sof-audio.c | 47 ++++++++++++++++++++++++++-------------
 sound/soc/sof/sof-priv.h  |  3 +++
 7 files changed, 117 insertions(+), 53 deletions(-)

-- 
2.37.2

