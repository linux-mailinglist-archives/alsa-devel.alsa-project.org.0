Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8227AE773
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D64CAE8;
	Tue, 26 Sep 2023 10:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D64CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695715683;
	bh=5NS8xMHon5zCCUvrqBo2dtiUMwLQ2Hq/eaD29nxiBgo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oEPTl/11Fk1CRSrv+CLvT54EuvlbVerUBLAScjXsomLNLUqZpnzrdEah9rQibRlkA
	 G8JrheuYXmPT8uMFhWhqNse7jOkM5JSd+9LM5Yufvgnv6JaMJyAKCPsM/yzJcep1Fe
	 tpcBL6Tm9blTUi1pSyNgbJ2d3Pncl77WoxbgSp3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64B8F80552; Tue, 26 Sep 2023 10:07:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12FD3F80130;
	Tue, 26 Sep 2023 10:07:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E49B0F8047D; Tue, 26 Sep 2023 10:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01A3DF80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A3DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dEzpUlUm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695715612; x=1727251612;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5NS8xMHon5zCCUvrqBo2dtiUMwLQ2Hq/eaD29nxiBgo=;
  b=dEzpUlUmG6G2gyDbRwcKFaGSk3OLEqb08c/QULYitYW5qWXQvQgiaO69
   BPsUTFubkCegggXsvdy4zWVX+AZRMAmZpBJT7IxEfq5bwpP/awdYolFmV
   8EDdooo2657kTh1nOwC9uCdA56aUVV4trTlTtW2fEobXE1CeigfjEwhN8
   APqSmACifF4Nb3xnIlZGetwUOGrzW7FoXq2qeckXgjNMIK1K+g9foI51m
   ytwmSZcOlnwGwn0tpt0xjRx68W88S7M5RvKFHd01U1gyFEjOX89DtzJ7e
   qiS7d2x3ZqZCyOu4t4DdVl7U7RUGC2HqnrKrAKTxQhinX8H2C00deVwUa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360891398"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="360891398"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725357959"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="725357959"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:06:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
Date: Tue, 26 Sep 2023 10:06:19 +0200
Message-Id: <20230926080623.43927-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FUCIKLRAZT5K6WC2OMTC5UQVVEAVNFYN
X-Message-ID-Hash: FUCIKLRAZT5K6WC2OMTC5UQVVEAVNFYN
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUCIKLRAZT5K6WC2OMTC5UQVVEAVNFYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patchset targets two intertwined topics:

The driver shall poll SDxFIFOS to ensure a valid value is set by the
controller after programming SDxFMT. Due to amount of users and
limited-number of configuration available in our CI when compared to
overall possibilities on the market, the check is non-blocking.

Second topic relates to stream setup procedure. The procedure differs
between HDAudio controller device revisions. Right now those differences
are handled directly by a platform driver. Existing top-level
'if (pci->device == APL)' could be replaced by a abstraction in lower
parts of the code instead.

With that done, the two users are updated accordingly. In avs-driver
case, this updates the flow to the recommended one.

Changes in v3:
- fixed issues pointed out by scripts/kernel-doc

Changes in v2:
- fixed ->host_setup assignment in patch 02/04

Cezary Rojewski (4):
  ALSA: hda: Poll SDxFIFOS after programming SDxFMT
  ALSA: hda: Introduce HOST stream setup mechanism
  ASoC: Intel: avs: Use helper to setup HOST stream
  ASoC: Intel: Skylake: Use helper to setup HOST stream

 include/sound/hda_register.h      |  2 ++
 include/sound/hdaudio.h           |  3 +++
 include/sound/hdaudio_ext.h       |  3 +++
 sound/hda/ext/hdac_ext_stream.c   | 41 +++++++++++++++++++++++++++++++
 sound/hda/hdac_stream.c           |  8 ++++++
 sound/soc/intel/avs/pcm.c         |  2 +-
 sound/soc/intel/skylake/skl-pcm.c | 14 +----------
 7 files changed, 59 insertions(+), 14 deletions(-)

-- 
2.25.1

