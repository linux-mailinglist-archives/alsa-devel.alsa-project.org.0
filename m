Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62867B314D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CBE7A4A;
	Fri, 29 Sep 2023 13:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CBE7A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986748;
	bh=vN0YpWhvFadGhFnYHYZLvTr/VtQq8Y2lza7Xb2m0tNU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HQdxD5LM6ITTLbGKrd8P8jwrG52d9JMv2H/kV9JHB1dc1eVxug8wSpgMkDZr27RzT
	 URFWeZ3GEhXQMnpeoZ1KYeFYN77S5k1Venqbf6TR1pItFRoCsP/CChxOa4uoCmh3ty
	 MKP6lN8BuZbKwbfVzCt2QfyTmjFerxj7/tjuC42k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2464DF80552; Fri, 29 Sep 2023 13:24:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7D6F801D5;
	Fri, 29 Sep 2023 13:24:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3022EF80553; Fri, 29 Sep 2023 13:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E16F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E16F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j5V9n1Zf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986679; x=1727522679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vN0YpWhvFadGhFnYHYZLvTr/VtQq8Y2lza7Xb2m0tNU=;
  b=j5V9n1Zfe2yUJaUOLJ8yTUlC239BQ9uUbpAeOI0L1O6J+piviY9qZIry
   U+LhDH6XVc5CkwHqqWHPgscCEM+3WP5hl/ovTXNjpqIrAHRf9hZtJHuhH
   OgsFgper05ei9N5SJugrwtGKLcJ1XSgAhEWtoSYAyTHpWMRRhtap2yNlC
   AwWrjXiybCF5MarNQYTREnjJXFM8yNrpJyIdMgj81dN1dwZfssAwqzMXj
   jnp1BKueR9kZpBcFzuwiiL/FTpgRlU1jUMIKQGUpJfRGYCBpwdm96Bivh
   dHgRDjxLR64rUwFopQXH3J6JFvPtozvsWZakABtjgVoMM+nTINCNZQdga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880231"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880231"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353605"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353605"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:26 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/6] ASoC: Intel: avs: QoL fixes
Date: Fri, 29 Sep 2023 13:24:30 +0200
Message-Id: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P5NUQJ5EMT4IWB6Q2VDHGUNVUFPPNCBA
X-Message-ID-Hash: P5NUQJ5EMT4IWB6Q2VDHGUNVUFPPNCBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5NUQJ5EMT4IWB6Q2VDHGUNVUFPPNCBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set of fixes mainly cleaning up code, but also correcting some minor HW
assumptions.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Use generic size defines
  ASoC: Intel: avs: Preallocate memory for module configuration

Cezary Rojewski (3):
  ASoC: Intel: avs: Move IPC error messages one level down
  ASoC: Intel: avs: Keep module refcount up when gathering traces
  ASoC: Intel: avs: Drop superfluous stream decoupling

Wu Zhou (1):
  ASoC: Intel: avs: Disable DSP before loading basefw

 sound/soc/intel/avs/avs.h       |  38 ++++-------
 sound/soc/intel/avs/cldma.h     |   4 +-
 sound/soc/intel/avs/core.c      |   5 ++
 sound/soc/intel/avs/debugfs.c   |   4 ++
 sound/soc/intel/avs/ipc.c       |  52 ++++++++++-----
 sound/soc/intel/avs/loader.c    |   4 ++
 sound/soc/intel/avs/messages.c  | 112 ++++++--------------------------
 sound/soc/intel/avs/messages.h  |   4 +-
 sound/soc/intel/avs/path.c      |  31 +++++----
 sound/soc/intel/avs/pcm.c       |   2 -
 sound/soc/intel/avs/registers.h |   4 +-
 11 files changed, 103 insertions(+), 157 deletions(-)

-- 
2.34.1

