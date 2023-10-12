Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4E7C768C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3677BE85;
	Thu, 12 Oct 2023 21:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3677BE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138219;
	bh=eWhx52dvj7ErNOhpIj4kABCScCV6M6c1kHfOvaM9i3M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SKkkKT1kMOAkewjehmPUl3FuFVjqJtWNKU3cA+E+Kb4K2s13HyN4jYDE6qzl7RnzF
	 LcYWo1kgWJXhnG20xM4b8IuMb1SkQGrDuSGVSA1lw6UwxhpemY1JGNhP1v/HiQpCxA
	 uSQ3wEYbzHee7x/Lkh73+zZDei5GemRmxIy4fZoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4336DF80571; Thu, 12 Oct 2023 21:13:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2993F8055A;
	Thu, 12 Oct 2023 21:13:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C76EF80536; Thu, 12 Oct 2023 21:13:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF4CBF8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4CBF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BXSv7YH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138010; x=1728674010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eWhx52dvj7ErNOhpIj4kABCScCV6M6c1kHfOvaM9i3M=;
  b=BXSv7YH0qDZAHuZSHdnjnrP30WBmCIBB/5SmuHxTXFQwNhfc5epNdhUO
   do0l++hZoYrx0nKEkj09c1mQaSYO72D8eKXbGR1pOHHqR6OjKE/FCfs/r
   LfRD4SkQG6IYwX2v/zMOlk243zZIjU+WZTQdarv1DYL41YsS4FAmdZs77
   H8G/yFzaRbj/g+VAjp76rnttnPgkdB0Y/dl+7dm72RxhKoinG3WUm9GZo
   lqcr6vpo6lRKTsrO5dWWMSKiqKth6LuvWY70t1GpYsATNmAasEH34Nsft
   X9NgyB4darfSjYRzp9s1iTq70XM57EpeY09fP9b15Q2jGFCNUEaWN11R/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382249207"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="382249207"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704295148"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="704295148"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:13:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/2] ASoC: codecs: rt715*: update misleading error log
Date: Thu, 12 Oct 2023 15:13:13 -0400
Message-Id: <20231012191315.145411-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JVZEMZMYRVUTHJL4L6HYHE6SLBCQPUXO
X-Message-ID-Hash: JVZEMZMYRVUTHJL4L6HYHE6SLBCQPUXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVZEMZMYRVUTHJL4L6HYHE6SLBCQPUXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve two errors logs which report bad information.

Bard Liao (2):
  ASoC: rt715-sdca: reorder the argument in error log
  ASoC: rt715: reorder the argument in error log

 sound/soc/codecs/rt715-sdca.c | 4 ++--
 sound/soc/codecs/rt715.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.2

