Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5617717443
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 05:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E627E1DC;
	Wed, 31 May 2023 05:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E627E1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685503010;
	bh=/VL76X1WW1uKCaAq0pPGpA4itNI1rlmGDz9p+rE4p1w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rXN5EvZh4wSGseC25nYgUxBxlQrLPA/Gf4xc14fNui/QW2UbqWrXzKXhpNouGqK0G
	 Nq6ZzXJmrGWIfSsE58qD0YCk5TytBpHhB9hXX7P2ed4kOsteeIiKNHA+NmTLXz4Lax
	 IyB02FGS80IXD6OPKF5FU6TaB5+XGm4qa1Dx5tlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 434C4F80549; Wed, 31 May 2023 05:15:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08292F80510;
	Wed, 31 May 2023 05:15:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BD5F8053D; Wed, 31 May 2023 05:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDE90F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE90F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YlPN2cbO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685502940; x=1717038940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/VL76X1WW1uKCaAq0pPGpA4itNI1rlmGDz9p+rE4p1w=;
  b=YlPN2cbO7BW+NK1h2bg+05KJhGqOYVqcAclQqBAADcd9+0tbKmJofcNh
   CA8ZVcjH/KjblWqFqF64ybHHznqUPo/ZESMXlxD2Dptc1Q6c3zCc+a+Hy
   8r99FnKejBNH36Xy4y3QD0fCJrYuns41U2rGLrgFssdgZvtLfH916ln5D
   mRtoy8+d/7TjiNhw7o6/oX+r6qbA4FOjOxnhNgfBQy52jAN7YAshb/Au9
   FNdT3zR1dM/bhODbMS/SQotgjd0PGeCD/5Y6edOFaO/rgTyhTbwzab6Hm
   Jtf3WJqcDt2qfo5VrjSkDnVlG0vLAqmjI7WR96VOlCw8fFatm9rD3AbnP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357507645"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="357507645"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739769457"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="739769457"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/4] soundwire: allow for more than 8 devices,
 keep IDA for wake-capable devices
Date: Wed, 31 May 2023 11:37:32 +0800
Message-Id: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKBXWQRGOMZIP5IEKJUI2FGUYIVJPBUD
X-Message-ID-Hash: PKBXWQRGOMZIP5IEKJUI2FGUYIVJPBUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKBXWQRGOMZIP5IEKJUI2FGUYIVJPBUD/>
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

Pierre-Louis Bossart (4):
  soundwire: add enum to control device number allocation
  soundwire: introduce SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY
  soundwire: extend parameters of new_peripheral_assigned() callback
  soundwire: intel_auxdevice: use SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY

 drivers/soundwire/bus.c             | 28 ++++++++++++++++++++++------
 drivers/soundwire/intel_auxdevice.c | 26 ++++++++++++++++++++++----
 include/linux/soundwire/sdw.h       | 24 ++++++++++++++++++++++--
 3 files changed, 66 insertions(+), 12 deletions(-)

-- 
2.25.1

