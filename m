Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF287096E9
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74352208;
	Fri, 19 May 2023 13:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74352208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684497381;
	bh=A8K2XBww0D1RGauwWboUB5sBHSTpiKch0bvCIXJ0u+s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JV1wp50GG4Nf2gTfKWFLjb8h7xIFY1hyN7hkC3s7tI062lACFmaYLtb2sWW6j2dpt
	 RPlg/Cj3lyPXyaRuJnZGyMe3tZ2XBw6Yub2ctwOHWP+NEnPlKsoPlWcHRqOGqT81CF
	 il5driHNJcr/UtzxShPpScjUBw69ioPQQqu4Lz+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 869AEF80272; Fri, 19 May 2023 13:55:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFD5F802E8;
	Fri, 19 May 2023 13:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77FBFF80087; Fri, 19 May 2023 13:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33BE9F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33BE9F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JpCJfnvt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497299; x=1716033299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8K2XBww0D1RGauwWboUB5sBHSTpiKch0bvCIXJ0u+s=;
  b=JpCJfnvtmZmvdsU5nQ1B0CkOczthg4H038ph0E9Z0+Bg9KcGKsMoHD+f
   OZAD+aEAmvStvTzaL9hnK5/3k20lkJS0B6o0J/v1p3ibA8WhM37EF9anH
   ulzL45+j++dAvWq+GLWwfKdVRxSNob9grRSJwscIe9YvE3I4aLk+SEOhj
   mwDghVbfvnvTpzjJteyCV5B4J29kTiunmnskeZxvXQS/j2mDHfmxqqSCa
   X8fQ2C4uvzMucg91iDW3zGULaWfPOQiwrdSX6p1BX0VTPgqw1iBHJGrmc
   IM0Uy0yVwGu4eDJCPWAd3NEDjEgzb9y8ARA8o1m4luxSbH7bo6n6up9Fr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336946010"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="336946010"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 04:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705593773"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="705593773"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 04:54:51 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/5] ASoC: topology: Clean up error messages handling
Date: Fri, 19 May 2023 21:56:06 +0200
Message-Id: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GXNEFZ74FN4F7VIPJRJITGXIYG4KP3DP
X-Message-ID-Hash: GXNEFZ74FN4F7VIPJRJITGXIYG4KP3DP
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXNEFZ74FN4F7VIPJRJITGXIYG4KP3DP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Series of patches cleaning up error messages when loading topology. In
few places instead of logging in place of failure message is logged in
caller. Additionally there are places where both caller and failing
function log error, leading to unnecessary logs. Clean all of the above
up.

Amadeusz Sławiński (5):
  ASoC: topology: Log control load errors in soc_tplg_control_load()
  ASoC: topology: Remove redundant logs
  ASoC: topology: Do not split message string on multiple lines
  ASoC: topology: Remove redundant log
  ASoC: topology: Remove redundant log

 sound/soc/soc-topology.c | 63 ++++++++++++----------------------------
 1 file changed, 19 insertions(+), 44 deletions(-)

-- 
2.34.1

