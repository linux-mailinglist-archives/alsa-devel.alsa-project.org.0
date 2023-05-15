Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD10702581
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371A083A;
	Mon, 15 May 2023 08:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371A083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133790;
	bh=dP4H8fKlSakREtkAjsQMf+bbkPa/9U74r38JynphR7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RYmcbjj5AQAaReB51zd7NGHcRS3MiXRbGh/Wjvsf3ETN0fN1JyKSn2b22ezGYPG/q
	 h4TugNhHjRnRaU+vwcfQJw5s9qqHBRfiryh4w2dcOaX8WNKzkaczp1ApaPm4+s4X8H
	 IInhotXB0v3iX7DlQWdT67sB6tej7eI+1d9MwJZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F83AF8061E; Mon, 15 May 2023 08:51:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 621BBF8061E;
	Mon, 15 May 2023 08:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BC41F80604; Mon, 15 May 2023 08:51:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B25E4F805FF
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B25E4F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CjHClM5o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133472; x=1715669472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dP4H8fKlSakREtkAjsQMf+bbkPa/9U74r38JynphR7o=;
  b=CjHClM5or3SsiCU/oXGG08dhzHuKjLkjs6wqgER5IrZtW/dbYqcQSeS1
   PpWdK41RrnHl90kwE7d2YO5qoCnQ5ITjgA2CPnlraRROkhriR+4iHyvr5
   byrQwobPBx6o6BGqbtIJRMdqpOxt+k4Cu5GgIVwGthI2Z+ZTZtJHad/dc
   MgvM7i/lE2KJGrqFzLXhLK/x3eitcBRRp0MB9I1jCd92FAlCWazpBzZvU
   2RNDGhZCsyu8Ye9rqku7Uh/HHOSGvfPf85mVKdyApd3ZGnymrQnquRV8a
   TcjIyIgr7MEaPL8Qo1L7Zi3Snh0AQ63F9giPyPG9DlwQuH6RYXiC2FYJF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966537"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908779"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908779"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 21/26] soundwire: intel_ace2x: add pre/post bank switch
 callbacks
Date: Mon, 15 May 2023 15:10:37 +0800
Message-Id: <20230515071042.2038-22-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NVFL76PKGSB7YAIXIJ2L4ITOSOZJEV56
X-Message-ID-Hash: NVFL76PKGSB7YAIXIJ2L4ITOSOZJEV56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVFL76PKGSB7YAIXIJ2L4ITOSOZJEV56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The .pre_ and .post_switch callbacks are mandatory.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 65deb4345354..1be0bea5f40f 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -378,6 +378,9 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 	.shim_check_wake = intel_shim_check_wake,
 	.shim_wake = intel_shim_wake,
 
+	.pre_bank_switch = intel_pre_bank_switch,
+	.post_bank_switch = intel_post_bank_switch,
+
 	.sync_arm = intel_sync_arm,
 	.sync_go_unlocked = intel_sync_go_unlocked,
 	.sync_go = intel_sync_go,
-- 
2.25.1

