Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA87D95F9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 13:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAC8A4D;
	Fri, 27 Oct 2023 13:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAC8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698404790;
	bh=5WhEmsKf7FralyoMJxUWZggzvDbNaA86yLnvkXMcEow=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SLPQpSbzqokhzGNhqETG5OpNqQiX1SPD9nMULHAg8eabp408FZ/tOUCQGAFQFGZF+
	 pHLqxipmy+0pkoEsiEKea6z70ZoU/gh98ikp61aTCNmtVVhxub/f0Xam+Q+/3fuhuM
	 r0rzUcVEunR6jweCCDP++tlsnBYxAxMWdwb8UHIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DCAF80224; Fri, 27 Oct 2023 13:05:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB72DF8019B;
	Fri, 27 Oct 2023 13:05:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30FB5F8020D; Fri, 27 Oct 2023 13:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2311AF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 13:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2311AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fOC75Y9u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404732; x=1729940732;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5WhEmsKf7FralyoMJxUWZggzvDbNaA86yLnvkXMcEow=;
  b=fOC75Y9uzHwoNj1Zj2EYjkB20CC7eZ5OEEmZeKFOwGB2gMo0ZJt88LCG
   /Cy003mrXMrlldu8FMrzdJeT18SLQD5cEXZqlFfYuqKX343+8pZ1tZddM
   jzOMmW5U+bbewT27/7hU70bH87vhsryU3bpEVMToZHXIKLSas/9p6Yr6S
   uEe5OlOYYmYhtcaZHeqaQFYfdXNwDG+oL/UsMU5Iuy5gqUa/CGrqxTME2
   Px+hx86uv7d2iVErhNqyxoqO17BQRk1rXK2SnSqUinCVJdf/3onYWWIhX
   F11k9mB3nCzSGNaxy/8y2dCdpVtK8gVSEHrfGj6kuN1FVS/ARzp9vIkjx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418866463"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="418866463"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 04:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736054979"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="736054979"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 04:05:26 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/2] ASoC: Intel: avs: Add support for rt5514 codec
Date: Fri, 27 Oct 2023 13:05:35 +0200
Message-Id: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 56O5NTFQZM6XDB2MNJYDZYRKWP4BBCMP
X-Message-ID-Hash: 56O5NTFQZM6XDB2MNJYDZYRKWP4BBCMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56O5NTFQZM6XDB2MNJYDZYRKWP4BBCMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are machines which use codec rt5514 as DMIC, add support for them.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Add rt5514 machine board
  ASoC: Intel: avs: Add rt5514 machine board

 sound/soc/intel/avs/board_selection.c |   9 ++
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/rt5514.c   | 187 ++++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/rt5514.c


base-commit: 00236a89602f7b67016bd1d9bc63079f2c0f0a8d
-- 
2.34.1

