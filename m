Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C58D7FF3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715987F8;
	Mon,  3 Jun 2024 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715987F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717410505;
	bh=zBoxYI6e7jUZhIXNajNwuL7GZWLuUWbRagMWTsGHiYw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=urF2iLQQ63GG5OCtXECsJ+eu/hJnHrLVUbIiZ8qdJwgS9hAHheKpn3yNsLhlhKDES
	 biAJEEZEXtxHaIQET89ghLcPzLfzViudAsXufM6mYNOkvsOoWYECvncAW647ScN3p1
	 ZYuomazE3QQJ7hYr2cEtyhttGnVVKmwxZFpXmznk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7236BF8057A; Mon,  3 Jun 2024 12:27:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEEEF805A0;
	Mon,  3 Jun 2024 12:27:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A046F80496; Mon,  3 Jun 2024 12:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C87D7F800AC
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C87D7F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lpv3KZgv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410462; x=1748946462;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zBoxYI6e7jUZhIXNajNwuL7GZWLuUWbRagMWTsGHiYw=;
  b=lpv3KZgvNG5jXE0umhsW5zLXgcJsYL2xjmQ6EJDG7HSljyt/7FsXRUwh
   quxE8LXPToBtHI+fj3mXFt8GHzEVXOTSDe9DVe97G+q9X6GAztssbMT6r
   bZSNWGlItKre/atl/H3JROAvgdqRe2BKaQyrHGnSxLBeYHH/YluvJ72ED
   i6x9kHmkUkkh+943der92/sfKwP0f+j2i9Bt6h3+MRNorGawN8pggX+W7
   mpWZ+fQDhMRx+P/pjthyHSIzhE7rIcBmswZsU4GUwiBu1g91nEFsvRnKi
   irGHRZqgzhIUtH5TcA1D/0nLH5SRM9CnbIqMlrSM8agjptr3MpO1pXWqa
   g==;
X-CSE-ConnectionGUID: /EfOM6CrQrOodOkBZ+tiQA==
X-CSE-MsgGUID: IDCTp8c2QLCpguBE+wIg7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017207"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="14017207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:27:38 -0700
X-CSE-ConnectionGUID: rsOKqC1QT3+FO0PRqs5TDw==
X-CSE-MsgGUID: 7quXLN8ATrm7UcgR4JiezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000";
   d="scan'208";a="37430029"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:35 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/4] ASoC: topology: Fix route memory corruption
Date: Mon,  3 Jun 2024 12:28:14 +0200
Message-Id: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C4NBXKXADCMN2PB36XIMEJ3VUCY3QIFX
X-Message-ID-Hash: C4NBXKXADCMN2PB36XIMEJ3VUCY3QIFX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4NBXKXADCMN2PB36XIMEJ3VUCY3QIFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Originally reported here:
https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
There is various level of failure there, first of all when topology
loads routes, it points directly into FW file, but it may be freed after
topology load. After fixing the above, when avs driver parses topology
it should allocate its own memory, as target strings can be shorter than
needed. Also clean up soc_tplg_dapm_graph_elems_load() a bit.

Amadeusz Sławiński (4):
  ASoC: topology: Fix references to freed memory
  ASoC: Intel: avs: Fix route override
  ASoC: topology: Do not assign fields that are already set
  ASoC: topology: Clean up route loading

 sound/soc/intel/avs/topology.c | 19 ++++++++++++----
 sound/soc/soc-topology.c       | 41 ++++++++++++++++++----------------
 2 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.34.1

