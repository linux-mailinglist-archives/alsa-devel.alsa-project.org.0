Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F777077FD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 04:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082D01FE;
	Thu, 18 May 2023 04:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082D01FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684376507;
	bh=RJrWgw2jrqW43LRQXu0u3SFenMNt8UEk4W3t6XTV+J0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X4t/AGMcg29VzqsM3qlD5DGBjZfhVsgU/O28ccxRuaAQJEbQvrdUW5wNNBBB6IPLL
	 iuEacuHY2Y67LVQRMUc1kh+14KUW2yH/tsSuUhDTRT/EEO+GVFWfDaBYVNbMNoS1zF
	 sL0DSdfRMzbbOWZVYSp/1D5L/MHLdQhxrhru177I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3850F80551; Thu, 18 May 2023 04:20:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A08F80431;
	Thu, 18 May 2023 04:20:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 840E2F8016D; Thu, 18 May 2023 04:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C427F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 04:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C427F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VBzgZPRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684376439; x=1715912439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RJrWgw2jrqW43LRQXu0u3SFenMNt8UEk4W3t6XTV+J0=;
  b=VBzgZPRYRmtJAmJ1ZpDOfCbz1yOOywztuWTs7vumAg8cNLfe3e3OcgE8
   kZgicQ7AMtAYt5P6jYZixLfgZWN2z5+Lb8It4jq73YPyz1g2ERf5I+1pe
   TxVqebVXATHPrFcLdvd+W2zM36Nj85Nm1Uknvtz5n5F9Y0NGJp2xHcVP3
   PSLt7IMOjUJjsWz/07hk5oysy+nDwMUbe+W2kH0MN3vNLN7RfixwJdPeY
   NvD5PmiCx41AEAkoqeGxysO1SotJdG9DhlPz0nnSeoQFkWLSY+fht1TA/
   hPV4vpnSIIgbyTCTxPGS/+I+NxWrBhc5wOkRIn+xfCMAgffrElBmtgFNR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336504758"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="336504758"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826195206"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="826195206"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/3] soundwire: improve bus reset
Date: Thu, 18 May 2023 10:41:16 +0800
Message-Id: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RCISSRGD2ZI7T2H2MC66GVHDQG7K7UDG
X-Message-ID-Hash: RCISSRGD2ZI7T2H2MC66GVHDQG7K7UDG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCISSRGD2ZI7T2H2MC66GVHDQG7K7UDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve bus reset sequence by updating programing sequence.

Pierre-Louis Bossart (3):
  soundwire: intel_bus_common: enable interrupts last
  soundwire: intel/cadence: update hardware reset sequence
  soundwire: cadence: revisit parity injection

 drivers/soundwire/cadence_master.c   | 50 ++++++++++-----
 drivers/soundwire/cadence_master.h   |  3 +
 drivers/soundwire/intel_bus_common.c | 93 ++++++++++++++++------------
 3 files changed, 89 insertions(+), 57 deletions(-)

-- 
2.25.1

