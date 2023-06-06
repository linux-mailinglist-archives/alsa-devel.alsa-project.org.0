Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B70724F8F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 00:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC6282B;
	Wed,  7 Jun 2023 00:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC6282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686090459;
	bh=7dGq1MYkZEc/hW7p0dKXAEXmhH2v1xre7ZvIXkC+ZHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jm+OE0XOGdfTatT+3NezkIt2mxWZTrBJav3gLNIphZcZMKB2EjqOWeWlAPeWVuNI7
	 SLzBrxh1RY4KVBUWLtTp/mQvGjMIBrJO+AZtU/dagrLPDnYL+HWNtnOM378Qh104qn
	 4e4bNhypUQvZ5zwUsxD8FGEjnKPK6s5bWUs2JlJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2822F80254; Wed,  7 Jun 2023 00:25:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7BFEF80520;
	Wed,  7 Jun 2023 00:25:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CB39F80254; Wed,  7 Jun 2023 00:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C56E4F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 00:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56E4F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EwU8nrLj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686090347; x=1717626347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dGq1MYkZEc/hW7p0dKXAEXmhH2v1xre7ZvIXkC+ZHA=;
  b=EwU8nrLjSz0RmwgbH3UxSQZihRefWmkNCg2pfU930zOR28sD2MYxMRLn
   Alq14Dx236XW2hPlFfQwwuZ9cJbmiaZKGeGhjvKVMZHlO++J4L2ea3BxT
   BWhS811L7U2Y3An6sHAOcIfpkGwE2JPfdxEt8ENHrKp+IbDfm5be3fa5I
   25ZIrRRMS9lNLe+irwOy2mP0A9YLXr3CnditMTjFOpJUElqUHtInmxXpS
   pqW5nkDclUm+iYwZPE4UgsjhR97QiH6ObJyYcNH/60+k87PIe4bLKpspA
   dVzx5XB4q6wpaZklTImvM/vfy/iMkKVM4rbHXEGkWyO3SEmaUrE+lV2i4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341465401"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="341465401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712356553"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="712356553"
Received: from jrmonard-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.150.10])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda-pcm: remove kernel parameter init
Date: Tue,  6 Jun 2023 17:25:29 -0500
Message-Id: <20230606222529.57156-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
References: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7BCGANISX5JMD4MLRG5TC2XEQ5CZODUB
X-Message-ID-Hash: 7BCGANISX5JMD4MLRG5TC2XEQ5CZODUB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BCGANISX5JMD4MLRG5TC2XEQ5CZODUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 'hda_disable_rewinds' kernel parameter is initialized with a
non-existent CONFIG_SND_SOC_SOF_HDA_DISABLE_REWINDS.

We probably forgot to clean this up when this Kconfig option was
removed when upstreaming in 2021.

Reported-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 981e7b699bdb..f23c72cdff48 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -33,7 +33,7 @@ static bool hda_always_enable_dmi_l1;
 module_param_named(always_enable_dmi_l1, hda_always_enable_dmi_l1, bool, 0444);
 MODULE_PARM_DESC(always_enable_dmi_l1, "SOF HDA always enable DMI l1");
 
-static bool hda_disable_rewinds = IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_DISABLE_REWINDS);
+static bool hda_disable_rewinds;
 module_param_named(disable_rewinds, hda_disable_rewinds, bool, 0444);
 MODULE_PARM_DESC(disable_rewinds, "SOF HDA disable rewinds");
 
-- 
2.37.2

