Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DAD7424B4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD897F4;
	Thu, 29 Jun 2023 13:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD897F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036877;
	bh=FLoL8An0bukglSPKXHABsGoYDKvwe2tm5bWLwcg/0gA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C17nw+ArxrgWvRvV6UM+WEGcZKN333yQgmWPMxnTJVVhvQmZTPxS9MbB/jWOst5+A
	 ESWVN3/ICWEzlzvB4iaxHeBe0xSXIvrtgj7pL3sCoBcdeygA/IDV/PddYFkgXN+WtG
	 sM6NSKmiBkBb5RChjkhndSCTJXXjvUrvI4/pJpK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C6D4F80212; Thu, 29 Jun 2023 13:07:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83FB1F80212;
	Thu, 29 Jun 2023 13:07:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CD3F80246; Thu, 29 Jun 2023 13:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 096A1F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 096A1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HsQuQ/3m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036820; x=1719572820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FLoL8An0bukglSPKXHABsGoYDKvwe2tm5bWLwcg/0gA=;
  b=HsQuQ/3muBYuW+VxjocIhFsk1d+bB+dTyT/qxhb1PSGw/oHN5hcJI/xw
   AsCsB7xdeoMRowdGTSXBfhAnGkYCTn84cHanFCJ6UBJvBndUOkGHPUfEX
   ZGIStdS0GAy7c0IUXa/MPX4BRVfcxvjs2hpaJ5qNWOBpJ8J1PJFpQk+tL
   30kgFbLtbhiTaoQJ5VOnJvzKT4FwP+4ejIYIpzLArEW2mycGY4kZAoGhO
   6VlHfjBCTmn7lGNypOPFekc7Ymf7gPLVZGXw50eVnkoKCVd/fnrcFPzNU
   H+0pppQuPc/HtTkzWOpFuRgHFKauuTh3+Z9TDgdbw9L4eYas5vGmdzyfP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543564"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732684"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732684"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:06:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/8] ASoC: Intel: avs: New boards and fixes to existing ones
Date: Thu, 29 Jun 2023 13:24:41 +0200
Message-Id: <20230629112449.1755928-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BOPUJ3HWBK2ADDIOLCNF72CVEFXDTJYG
X-Message-ID-Hash: BOPUJ3HWBK2ADDIOLCNF72CVEFXDTJYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOPUJ3HWBK2ADDIOLCNF72CVEFXDTJYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Series adds support for two boards: es8336 and rt5663. The former is
utilized by some KBL-based tablets whereas the latter unlocks
Chromebooks with rt5663 i2c codecs.

As existing implementation of es8336 (es8316.c) codec driver is not
prepared to cope with KBL-based platforms, couple of small,
clock-related changes precede anything avs-driver related.

The tail of patchset cleans up existing implementation of rt5682.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Add rt5663 machine board
  ASoC: Intel: avs: Load rt5663 board on KBL-based platforms

Cezary Rojewski (6):
  ASoC: codecs: es8316: Add support for 24 MHz MCLK
  ASoC: codecs: es8316: Add support for S24_3LE format
  ASoC: Intel: avs: Add es8336 machine board
  ASoC: Intel: avs: Load es8336 board on KBL-based platforms
  ASoC: Intel: avs: rt5682: Add missing components
  ASoC: Intel: avs: rt5682: Tidy up hw_params()

 sound/soc/codecs/es8316.c             |   5 +-
 sound/soc/intel/avs/board_selection.c |  16 ++
 sound/soc/intel/avs/boards/Kconfig    |  20 ++
 sound/soc/intel/avs/boards/Makefile   |   4 +
 sound/soc/intel/avs/boards/es8336.c   | 315 ++++++++++++++++++++++++++
 sound/soc/intel/avs/boards/rt5663.c   | 254 +++++++++++++++++++++
 sound/soc/intel/avs/boards/rt5682.c   |  67 +++---
 7 files changed, 652 insertions(+), 29 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/es8336.c
 create mode 100644 sound/soc/intel/avs/boards/rt5663.c

-- 
2.25.1

