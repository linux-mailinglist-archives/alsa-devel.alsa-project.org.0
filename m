Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CC84CA70
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 13:10:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2EF1850;
	Wed,  7 Feb 2024 13:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2EF1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707307804;
	bh=vGgUGRrdA1r6NFau95DVl0fNBdIbIr0pIl2y125jwpw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vP2ibzCLFONlDDwwb2klSIBmYz/npuSF1O3ECOi5uEM8fv7W6iBL3C6nBQgrYpWKj
	 BCEOlmzlCmR4LOfrRCbYSIwG9Zup5+vIvbSR7h9y73btpl8nfHhv4f5hK5g+1c2MQK
	 Fz5ui71x9XNWhiNQMRZ+cU+4rr+RCru+1PWgKI9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58C40F80578; Wed,  7 Feb 2024 13:09:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCCDF80578;
	Wed,  7 Feb 2024 13:09:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF334F80567; Wed,  7 Feb 2024 13:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D4E2F800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 13:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4E2F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZM7R1EMv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307764; x=1738843764;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vGgUGRrdA1r6NFau95DVl0fNBdIbIr0pIl2y125jwpw=;
  b=ZM7R1EMvhwhdpNzSjyYDryW9ptehdZsgT5iSnfF2QR3CD07MzLssmU0b
   2LNsMaHQEY6Xm0zCilR6mOCzZVmyiqVVl73XbaQL3r7tnJXxIfLvHM3G1
   h5jDO+4mEtLW/WlMxwcVlZCt0KppZkEVI+zvlrJFbqaGhrNknHSRGMWuE
   YwjmVpHua/BfQ5pgo+V9m17PPpr2XxEjhnektb/6W42OuS+0HFn3MRpcf
   QlFxp9fw/mjg+mtV1pXdXyh/ojPiBY0/dmFaY/znylixXzSkYsU6gxVzI
   WGDFT7v3QMXdskurN586SfWpqaIKQOTzat73oSxgDz5UQvLCXuNHv2cbE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4757830"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="4757830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 04:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="1631795"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 04:09:15 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/3] ASoC: Intel: avs: Add support for sending initial module
 config
Date: Wed,  7 Feb 2024 13:09:43 +0100
Message-Id: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OMEKNA7FCSKKVVWGPGNWO4NM23UOMKER
X-Message-ID-Hash: OMEKNA7FCSKKVVWGPGNWO4NM23UOMKER
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMEKNA7FCSKKVVWGPGNWO4NM23UOMKER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In some cases it may be desirable to provide default initial
configuration for FW module using payload. To facilitate such solution
extend topology to contain initial config information, parse it and then
send data to FW if present.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: UAPI: Add tokens for initial config feature
  ASoC: Intel: avs: Add topology parsing support for initial config
  ASoC: Intel: avs: Send initial config to module if present

 include/uapi/sound/intel/avs/tokens.h |   9 ++
 sound/soc/intel/avs/path.c            |  33 ++++++
 sound/soc/intel/avs/topology.c        | 163 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |  13 ++
 4 files changed, 216 insertions(+), 2 deletions(-)

-- 
2.34.1

