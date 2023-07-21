Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2A75C89D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55FA1FC;
	Fri, 21 Jul 2023 15:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55FA1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689947830;
	bh=3MSckVn5qsO7bfLBe8ow7Ordiut8gzU7sy2GOa487Lo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PHty8/57JDhRNOq8rtuzM13YrwWq8sCanC5KWU+5HgfizBH/uWUjApjNE7KtMEErh
	 NaDQZFs8371GSidFlLIvmRv0R2NMBP9eWBlIotjybHXPWWO2sds4LX9eN0d7UvDxiC
	 +QWq5X6ZGeZh5B8/UdXSo7cWKoAuVOTZe1TSNhRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7316F8027B; Fri, 21 Jul 2023 15:56:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E6EF8032D;
	Fri, 21 Jul 2023 15:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E8CAF804DA; Fri, 21 Jul 2023 15:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 334DEF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 334DEF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kSamCIr+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689947772; x=1721483772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3MSckVn5qsO7bfLBe8ow7Ordiut8gzU7sy2GOa487Lo=;
  b=kSamCIr+6Jxe1hNqk62MZk7JDyONvJphhAYXfa6X+zJ+F67rcyiyppjz
   lnwe+DY9344MwNsNXl0KeXQ46R+4aQfa5QANzIQffOeKUNezfX8n53ahS
   OdEgs14b8Kt9JcFxaYEdLy2awkjkla5n4YEODFLe7IzjQoBYeYK7ir3LN
   Yl1gKvlojm9PqznZiXq1Xs02/+3FY8EghoWiPLAZGLPQndDlMSo96pGGF
   mbX90ELgXMvovqY6l7WkUEzemS6wYkwgzNP/vWlo/0cno+7nvAo5C9hbf
   KoYE69rNTMmOAnWubuBFTU5EfP8rDwTdNGxn7QC+bNv1vGcQXr484nA5j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="370630876"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="370630876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724877891"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="724877891"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.78])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: hda/hdmi: Add Intel Lunar Lake support
Date: Fri, 21 Jul 2023 16:57:20 +0300
Message-ID: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJPXQH27OUE44YP7TY24JTQBPDUQTNGZ
X-Message-ID-Hash: MJPXQH27OUE44YP7TY24JTQBPDUQTNGZ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJPXQH27OUE44YP7TY24JTQBPDUQTNGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

after fixing the ordering, add the HDMI codec ID for LNL

Regards,
Peter
---
Kai Vehmanen (2):
  ALSA: hda/hdmi: keep codec entries in numerical order
  ALSA: hda: add HDMI codec ID for Intel LNL

 sound/pci/hda/patch_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.41.0

