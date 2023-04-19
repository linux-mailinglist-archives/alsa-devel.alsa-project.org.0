Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E76E8204
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47EEEF2;
	Wed, 19 Apr 2023 21:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47EEEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681933341;
	bh=JcVxaAhKXqeFKAlVJRAQobWmzWFhzzs06X9prc0qlTo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bGewRg6dMky3exgWDySoXkdD0f4tN2i83qrannUPlqnO0xjRiuUJExvKLPW5fiCTd
	 kQJAmp5rTBXlb8gjIg+4Ix9yUNcnbRTXwncYuThkazL/1ObWLGtjerzrKGsGwZdjJQ
	 aQwvbs5W9w0FXFaTMg95szFP2g4DnbTS0eNY+K4o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 390CDF80155;
	Wed, 19 Apr 2023 21:41:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A291AF80212; Wed, 19 Apr 2023 21:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D9C4F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9C4F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cgo3Dz+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681933280; x=1713469280;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JcVxaAhKXqeFKAlVJRAQobWmzWFhzzs06X9prc0qlTo=;
  b=Cgo3Dz+e4CZ5S+Ejr2+Dn77xsbg65MqwxjNnL07p65BQbaTvSF/+4382
   24j+fJ/sY5prcKAVQvKUN2CajysRNiCYZLsEMpAcSMhi04KxLzCeBwsAj
   c/M/No2tsDWTsYzBPEDHg6f/aAZtFKb6oT4BrofttFtHj2qd1byZ0PD0W
   GUjV47SM7mQylLgxyO5nf71bM3hb2HnmKjSQhzGW25fd2D1Iki3Od6j1x
   diMbSNVpSowEyAwORmyI5BpZacIm0t00jzX8yzn35ivdvHEjsQPbbQMgk
   UVpG7BshXVUI6giuYEuOeFJ/libz6iqab4IN9BS4FGJwm5haKMB1bDYgk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431822098"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="431822098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694191218"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="694191218"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:41:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] ASoC: SOF: add no_reply IPC calls
Date: Wed, 19 Apr 2023 14:40:55 -0500
Message-Id: <20230419194057.42205-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DHAVP7YTTS2SBN3YKET26W4KA7WYUG2E
X-Message-ID-Hash: DHAVP7YTTS2SBN3YKET26W4KA7WYUG2E
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHAVP7YTTS2SBN3YKET26W4KA7WYUG2E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify IPC messages to avoid passing a reply structure that is not
used later.

Changes since v1: fixed rebase issue leading to allmodconfig
compilation error

Curtis Malainey (2):
  ASoC: SOF: ipc: Add no reply inline calls
  ASoC: SOF: Use no_reply calls for TX

 sound/soc/sof/compress.c                  |  8 ++----
 sound/soc/sof/intel/hda-loader.c          |  2 +-
 sound/soc/sof/ipc3-dtrace.c               | 12 +++------
 sound/soc/sof/ipc3-pcm.c                  |  6 ++---
 sound/soc/sof/ipc3-topology.c             | 33 +++++++----------------
 sound/soc/sof/ipc3.c                      | 12 +++------
 sound/soc/sof/ipc4-pcm.c                  |  6 ++---
 sound/soc/sof/ipc4-topology.c             | 10 +++----
 sound/soc/sof/sof-client-ipc-flood-test.c |  3 +--
 sound/soc/sof/sof-client-probes-ipc3.c    | 12 +++------
 sound/soc/sof/sof-client-probes-ipc4.c    |  4 +--
 sound/soc/sof/sof-client.h                |  4 +++
 sound/soc/sof/sof-priv.h                  | 10 +++++++
 13 files changed, 51 insertions(+), 71 deletions(-)

-- 
2.37.2

