Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E49700E14
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC198E7F;
	Fri, 12 May 2023 19:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC198E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913640;
	bh=wgeVii9IRi5ReIm/wE+3Nuc6XCZ/Cs5Ln5gztqksKxs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XNgjJNQcP2l8KF7UZRqmPlxpC+H+gGEHmdC41//tLC/FFqYqfHUM4YTXZx7QBjMmh
	 zwvDKJje6EqqfFilUZ5U6G/ygIrTHTnY6JjoU9mzW8DhGESkiAP0L33cYk2Qmn8Bme
	 ejMn6BwR2YEGB4TVEBkoSzcnmH7IsmKzfPoCkaoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2352F80553; Fri, 12 May 2023 19:46:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 619D6F80542;
	Fri, 12 May 2023 19:46:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 141BEF8014C; Fri, 12 May 2023 19:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEFA3F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEFA3F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VlQPz1VE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913583; x=1715449583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wgeVii9IRi5ReIm/wE+3Nuc6XCZ/Cs5Ln5gztqksKxs=;
  b=VlQPz1VEYk93tSi/sb0ha36kh1Pz1pqbi4/rPfkj6c6IkAouDI/DJgY+
   0sl9Ztyr67ZqZUJOTYEPWulxQMn93+w5ibyLcPRsgb8zX6ZjD1MgEXOUT
   d5rOwRWETKLTJ44i1snFzSzlzsqdQU0glRMrUuz3o5/JJj5MkU6KeNILA
   KHRCT3ojSoNSJpSdyQdjgo77xotCGs+vHAiq+248T8/ju0NpcPbmWr2o8
   QWPd4VmgwDnuCR6erGMnsnhN/AZeh9MvERreKpAl/24fMFRPBtlqJ40Q+
   VRzan1cH/lYEWsJaqtSytHQLsa1kHgECCrIWmaesJKS6WGxbQNCnghoqE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688040"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167737"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167737"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/6] ASoC: SOF: Intel: hda-mlink: fixes and extensions
Date: Fri, 12 May 2023 12:46:05 -0500
Message-Id: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQH5ZHDIKLXVCFOLSQEGLVW3VA3VOAX2
X-Message-ID-Hash: ZQH5ZHDIKLXVCFOLSQEGLVW3VA3VOAX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQH5ZHDIKLXVCFOLSQEGLVW3VA3VOAX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With additional testing with multiple links and multiple DAI types, we
found a couple of mistakes with refcounts, base address, missing
initialization.

A new helper was also added due to a change in the SoundWire
programming sequences, with the host driver in charge of setting up
the DMA channel mapping instead of the firmware.

Pierre-Louis Bossart (6):
  ASoC: SOF: Intel: hda-mlink: fix sublink refcounting
  ASoC: SOF: Intel: hda-mlink: add helper to get SoundWire hlink
  ASoC: SOF: Intel: hda-mlink: fix base_ptr computation
  ASoC: SOF: Intel: hda-mlink: use 'ml_addr' parameter consistently
  ASoC: SOF: Intel: hda-mlink: initialize instance_offset member
  ASoC: SOF: Intel: hda-mlink: add helper to program SoundWire PCMSyCM
    registers

 include/sound/hda-mlink.h       | 14 +++++
 sound/soc/sof/intel/hda-mlink.c | 96 +++++++++++++++++++++++++++++----
 2 files changed, 101 insertions(+), 9 deletions(-)

-- 
2.37.2

