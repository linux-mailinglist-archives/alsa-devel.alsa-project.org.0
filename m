Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89E8AAADA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8368CDEE;
	Fri, 19 Apr 2024 10:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8368CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516496;
	bh=ojVZrBBLkQUiA+8w8ZReZUeAU4aBcYejjyFtUBkDAaY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kuxa1kRPvOcJo/ZYZib+PKq4a1U3NB2v2ci6v9Q/KoKrJvmNf9a7yYxfWK9wpCTe7
	 FkS53XuMl5RR/CexmU/jgmxDbIs0gLUyHsxnfalD7YqFQIkGJaK2KXI7kkKv/L4A3K
	 PzyZmCFzpszXedJAWZnuG8Qhl70e6UuGjf/1Z8Ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E9FEF805E7; Fri, 19 Apr 2024 10:47:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A4D4F805A8;
	Fri, 19 Apr 2024 10:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4375DF8058C; Fri, 19 Apr 2024 10:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06D47F80236
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D47F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HjnUROfz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516444; x=1745052444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ojVZrBBLkQUiA+8w8ZReZUeAU4aBcYejjyFtUBkDAaY=;
  b=HjnUROfztgXo8P6jwY2Us+hfi7/Cb+Xfzofv3ZEaIvcdKNxPQUYyp0ts
   V0pTNvFYHn4ghIfo7RVFRO22W8geZM3h/ARVYX2PaDX4CRFHXFWmphSeP
   f0pCXP7/OSeUAAw/32jrBIm5lhIwM7aY78S8vOB0ml2VqzGBpECSUkN7W
   TPoD+MUCHHnlJAprwtQRHS/GWuMmun9b2GzLlDYrZpX3+by4RRRRj5ttw
   1LA638J+PpsikJ6I7YjccZ+6M8KJsuXxKBMFg6VrS111yKawiQgEoJEsy
   A2ShaiKNPGBMvo/xsyrTryXNMaBVlcooXyolV2nylXi+fS9m2oQ2CEB1x
   w==;
X-CSE-ConnectionGUID: OssrktPHTOOmcr+Y2s3hzw==
X-CSE-MsgGUID: ILn1BN+8TpSQotTWcz+hwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12941962"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="12941962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:47:19 -0700
X-CSE-ConnectionGUID: jQ0m5LCPSBqotRGCA+/r9g==
X-CSE-MsgGUID: +2+E6CDwSheR+Hp3Oc417g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="46551798"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 01:47:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Refactor IRQ handling
Date: Fri, 19 Apr 2024 10:48:55 +0200
Message-Id: <20240419084857.2719593-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KA6AU2ID4K6GROMTRSYDDU6PT5PRTPQ7
X-Message-ID-Hash: KA6AU2ID4K6GROMTRSYDDU6PT5PRTPQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KA6AU2ID4K6GROMTRSYDDU6PT5PRTPQ7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code can be both improved and simplified. To make this
change easier to manage, first add new implementation and then remove
deadcode in a separate patch.

Simplification achieved with:

- reduce the amount of resources requested by the driver i.e.: IPC and
  CLDMA request_irq() merged into one
- reduce the number of DSP ops from 2 to 1:
  irq_handler/thread() vs dsp_interrupt()
- drop ambiguity around CLDMA interrupt, let skl.c handle that
  explicitly as it is the only user

With that done, switch to the new implementation and remove unused
members. While the change is non-trivial, from functional perspective
status quo is achieved.

Cezary Rojewski (2):
  ASoC: Intel: avs: New IRQ handling implementation
  ASoC: Intel: avs: Remove unused IRQ-related code

 sound/soc/intel/avs/apl.c   | 20 +++++++-
 sound/soc/intel/avs/avs.h   |  8 ++--
 sound/soc/intel/avs/cldma.c | 42 ++++-------------
 sound/soc/intel/avs/cldma.h |  1 +
 sound/soc/intel/avs/cnl.c   | 91 ++++++++++++++++++++++++-------------
 sound/soc/intel/avs/core.c  | 85 ++++++++++++++++------------------
 sound/soc/intel/avs/icl.c   |  3 +-
 sound/soc/intel/avs/ipc.c   | 48 -------------------
 sound/soc/intel/avs/skl.c   | 73 +++++++++++++++++++++--------
 sound/soc/intel/avs/tgl.c   |  3 +-
 10 files changed, 186 insertions(+), 188 deletions(-)

-- 
2.25.1

