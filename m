Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A68AAABF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC9093A;
	Fri, 19 Apr 2024 10:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC9093A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516236;
	bh=h0KetJO9To1Cm7HgblSbAoEW0LeAk8mv3CuNxq3NfsU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P+BySouoGtJWX8lHVBp6Ym2ccB7Pu0HWDUxHQ3Qfnj1lJ0uBYUHKJ44w6QJxgQsNh
	 XwpIehlesr9WF8ilRbK1JRe9A0/dtEu637fnIA20fL5si5mPdYaFr6fr82K9jRubBU
	 pV9GfRq88CZNDVpW6bUK+I30OcD2zTmRewTtveqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1DBFF805AE; Fri, 19 Apr 2024 10:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9A6F8057C;
	Fri, 19 Apr 2024 10:43:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD10EF8013D; Fri, 19 Apr 2024 10:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90B10F8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B10F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GFCZ08A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516112; x=1745052112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h0KetJO9To1Cm7HgblSbAoEW0LeAk8mv3CuNxq3NfsU=;
  b=GFCZ08A5SqzxnJOQjdz/GwT5L4DVFjSwRRYJW7lANjt800P2/I43Ykfg
   QyphmP1+11zpUVuCCI5hwYFY/XrGj8yC1if36p6EwA3wTHbSuFJahj+Kc
   mv90dq89i85Zk0FxwAaHIOY//u7/4QPw5wFKbBS9aGegXZsrB/g+V8BAh
   Dm6RHrx+Dmp3ZAKv9+/3roow+NjzvnQy1YJi1oZRcT4gv7Egd2V6Rqc9/
   CRscTuOmUpxHQ9odefoxpR56KwV7KclnLNfIyA/4A0SLFPmRdyQkqJ02s
   J0pWhM2MRffscGMO11+cjgtsHEPvptLfmrqClmvvU1ahcnjUeAmoWfVph
   A==;
X-CSE-ConnectionGUID: qUaZSSCHTTql0FNPGxGDHw==
X-CSE-MsgGUID: q/urNPhbREK3nxqOZ9xYWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233731"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="9233731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:41:47 -0700
X-CSE-ConnectionGUID: K2cFY9h0Rlaa736nEfN2cQ==
X-CSE-MsgGUID: svcevjaPSwS3jUMPJB+VWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="23353157"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Switch to acpi-nhlt
Date: Fri, 19 Apr 2024 10:43:05 +0200
Message-Id: <20240419084307.2718881-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ODI6MI3HKHITZRDA7L7YWNWC7WYIJ3OF
X-Message-ID-Hash: ODI6MI3HKHITZRDA7L7YWNWC7WYIJ3OF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODI6MI3HKHITZRDA7L7YWNWC7WYIJ3OF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The change is based on rafael/acpi-nhlt [1] immutable branch which
Rafael kindly prepared for me. Without the topmost changes to ACPI/NHLT,
the patches present will fail to compile.

Recent changes for the ACPI tree [2] refactored interfaces of the NHLT
table. Currently we have two implementations - one found in acpi
subsystem (unused) and one in sound/hda/. As NHLT is part of ACPI, idea
is to make the former useful and then switch all users of existing
sound/hda/intel-nhlt.c to this new interface over time and remove the
duplicate afterward.

Two patches present here migrate the avs-driver and the intel-dsp-config
module.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/?h=acpi-nhlt
[2]: https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/

Amadeusz Sławiński (2):
  ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
  ASoC: Intel: avs: Switch to ACPI NHLT

 sound/hda/Kconfig                     |  1 +
 sound/hda/intel-dsp-config.c          | 16 ++++++++------
 sound/soc/intel/Kconfig               |  1 +
 sound/soc/intel/avs/avs.h             |  1 -
 sound/soc/intel/avs/board_selection.c |  7 +++---
 sound/soc/intel/avs/core.c            | 10 ++++-----
 sound/soc/intel/avs/path.c            | 32 +++++++++++++--------------
 7 files changed, 34 insertions(+), 34 deletions(-)


base-commit: a640acab545b21ed1f347376f34d34e461ea92ba
-- 
2.25.1

