Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F2899909
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489182D02;
	Fri,  5 Apr 2024 11:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489182D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308260;
	bh=w4voot3MVuWaDcFzJX4FnXRWl/6tY1quMjamUlkpboY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WwssuJeOWZ7150CrN+EN+H75XjZEqkwMKkhH9Vqq9xmtwGSMlp+Lf4dfz3ZlNNE92
	 uRsB6yBhe3sQvFaDZztxTbj57PerUgdVSJ2njc5ypG4gPYn7EYuMs0S2EmmlDetAhi
	 TeWMaJK9880S17r9Zth3hw19YsHemSPIyrRD2Vo8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70883F8020D; Fri,  5 Apr 2024 11:10:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7BFF805A9;
	Fri,  5 Apr 2024 11:10:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A62B8F80568; Fri,  5 Apr 2024 11:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60EBAF80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EBAF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jsui35JW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308090; x=1743844090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w4voot3MVuWaDcFzJX4FnXRWl/6tY1quMjamUlkpboY=;
  b=jsui35JWyz14q6DeYKI8cAkQ8d8WeMWU4UmkP7ced4kXA2+TPsCJrdKK
   f0WIo1Ldkgb0OqVUY/FTe4CzfViQQhgoSu49LTfUbwXvcWZ4HUNxrNBDJ
   ADzus8p48KkGgQ8MKFqscpsoF1ir0GDt0dSSKv7rqAp0ylw6NfnJ3W5R1
   9juo0cKKFpmu0cL2srxO8nscm70PpgL1Tix7iFuF75YzgQNnRSJWZRhpw
   JFHg1KXQdwIZTsKDE8RpF8r10KI6q1WVpwGuyRW37RU1Cr64VWwiwJgI4
   4+e1p0nQK4oced1hno5JDowuXQO8KMz6rMKFVRFUYHeMstfTwl73AqJqV
   g==;
X-CSE-ConnectionGUID: +Jku+XWxS92mp2dx1eL6rg==
X-CSE-MsgGUID: CfXHGqlrSE63DFhDt0dhrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787398"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:05 -0700
X-CSE-ConnectionGUID: vUJHlC7RS3aWfM/v9UknLg==
X-CSE-MsgGUID: t5b03ECmT7+43DyoTHRvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042407"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/13] ASoC: Intel: avs: Fixes and cleanups for 6.10
Date: Fri,  5 Apr 2024 11:09:16 +0200
Message-Id: <20240405090929.1184068-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XY2XJDXPERWYMQHSROTRQZXQJHO25MOG
X-Message-ID-Hash: XY2XJDXPERWYMQHSROTRQZXQJHO25MOG
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XY2XJDXPERWYMQHSROTRQZXQJHO25MOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set of changes targeting the avs-driver only. No new features, patchset
either fixes or fortifies existing code.

Patchset starts off with a fix for debugbility on ICL+ platforms which I
have forgotten to fixup when providing support for these initially.
The next two address copier module initialization, most importantly,
silence the gcc 'field-spanning write' false-positive.

The following four:
6/13 ASoC: Intel: avs: Replace risky functions with safer variants
7/13 ASoC: Intel: avs: Fix potential integer overflow
8/13 ASoC: Intel: avs: Test result of avs_get_module_entry()
9/13 ASoC: Intel: avs: Remove dead code

address problems found out by Coverity static analysis tool.

The last two worth mentioning are: recommendation from the firmware team
to wake subsystem from D0ix when starting any pipeline -and- shielding
against invalid period/buffer sizes. Audio format shall be taken into
consideration when calculating either of these.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Restore stream decoupling on prepare
  ASoC: Intel: avs: Add assert_static to guarantee ABI sizes

Cezary Rojewski (11):
  ASoC: Intel: avs: Fix debug-slot offset calculation
  ASoC: Intel: avs: Silence false-positive memcpy() warnings
  ASoC: Intel: avs: Fix config_length for config-less copiers
  ASoC: Intel: avs: Fix ASRC module initialization
  ASoC: Intel: avs: Replace risky functions with safer variants
  ASoC: Intel: avs: Fix potential integer overflow
  ASoC: Intel: avs: Test result of avs_get_module_entry()
  ASoC: Intel: avs: Remove dead code
  ASoC: Intel: avs: Wake from D0ix when starting streaming
  ASoC: Intel: avs: Init debugfs before booting firmware
  ASoC: Intel: avs: Rule invalid buffer and period sizes out

 sound/soc/intel/avs/avs.h      |  1 +
 sound/soc/intel/avs/cldma.c    |  2 +-
 sound/soc/intel/avs/core.c     |  4 +--
 sound/soc/intel/avs/icl.c      | 12 ++++++---
 sound/soc/intel/avs/loader.c   |  6 +++--
 sound/soc/intel/avs/messages.h | 47 ++++++++++++++++++++++++++++++++--
 sound/soc/intel/avs/path.c     | 13 ++++------
 sound/soc/intel/avs/pcm.c      | 34 +++++++++++++++++++++++-
 sound/soc/intel/avs/probes.c   | 14 ++++++----
 9 files changed, 109 insertions(+), 24 deletions(-)

-- 
2.25.1

