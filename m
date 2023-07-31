Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4476909E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C45827;
	Mon, 31 Jul 2023 10:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C45827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690793190;
	bh=LNv+VnT3QZhrJhTeH4mAsNhZCJHGfzshQLFDmQm7ORQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fs7VDd4X3o4yAt/BD7DsvE0qtBbDUYsEKRg18b41cg78jk2fP4XVarCUM0nn9ZHZM
	 +/8VnEJ/9x/bZbPvWw2jEq5pSeVxtENYdf7upDv+6HirX64rBhlRA6HSCdJq1j6ioU
	 IVj0szkDf15wt5PqrmAUswTFzRQF2SkOMN6280HU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F7FFF80544; Mon, 31 Jul 2023 10:45:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F35F801D5;
	Mon, 31 Jul 2023 10:45:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD9C3F80425; Mon, 31 Jul 2023 10:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFEC6F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFEC6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h1wLBBd4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690793127; x=1722329127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LNv+VnT3QZhrJhTeH4mAsNhZCJHGfzshQLFDmQm7ORQ=;
  b=h1wLBBd4wMWxDsjAcg0BA/ulBlqEm7rQh+IJn7GR1JT2oSqwSJcoReP/
   KfVcjjvOCy0P1NS6krBGmgAeWRJtYENv7MDIxLNaAWIgkiTStWD+dWxLn
   vxsk9R8pzB5lAelzmA78WNUQlSEtjuTMXIUcxC3L5B0/clDYOPT5lAVsn
   ARbVrh4Z0VGdbJvJCJTbueBF0o1ROsDrTbKlfKnhpTR0t44STq0tIOb17
   HUpOlX8osB4zlEMwZzSvp99h49mMoGqoJS8IF/2jO5nxrzPIJ8aw0ytYh
   k7fjK78VpcmIGT6fCbkRtJy64kySQVodQ6j/Y0fwQ51J/KogLYE11btkv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348557425"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="348557425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678232190"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="678232190"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 0/3] soundwire: allow for more than 8 devices,
 keep IDA for wake-capable devices
Date: Mon, 31 Jul 2023 17:13:30 +0800
Message-Id: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J766G5LMPFW6262UPTTCAWIWQWXN37HH
X-Message-ID-Hash: J766G5LMPFW6262UPTTCAWIWQWXN37HH
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J766G5LMPFW6262UPTTCAWIWQWXN37HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series suggests a hybrid strategy for device number allocation, where
only wake-capable devices use a system-unique Device Number which will be
used on LunarLake to handle wake-ups using the HDaudio WAKEEN and WAKESTS.

Pierre-Louis Bossart (3):
  soundwire: extend parameters of new_peripheral_assigned() callback
  soundwire: bus: add callbacks for device_number allocation
  soundwire: intel_auxdevice: add hybrid IDA-based device_number
    allocation

v2:
 - Move the device numver allocation from bus.c to intel_auxdevice.c
 - List the codecs with wake capability in a quirk table, and assign device
   number according to that quirk table. 

 drivers/soundwire/bus.c             | 18 +++---
 drivers/soundwire/intel_auxdevice.c | 85 ++++++++++++++++++++++++++---
 include/linux/soundwire/sdw.h       | 12 ++--
 include/linux/soundwire/sdw_intel.h |  7 +++
 4 files changed, 99 insertions(+), 23 deletions(-)

-- 
2.25.1

