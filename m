Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDC7AD762
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A393AEA;
	Mon, 25 Sep 2023 13:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A393AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695643232;
	bh=urEx1w2gcPymBdnp2qIcjzqdQ6nVZTJcKJJDQpWrEEo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s0XoJllD7SvUtPiDzSQDcDHKuAvbCdGhcGdwFwl9tMBnlmh1WcLesDVhNkX6Vtc8j
	 b3kCT2ezmz45FPE7DZaakqqPc89bO53VRUNtU4cDLCPZQIJzM9jTpa+snPfYlsNL0K
	 K+q9m4e61N00QW89785UtZSbeoyXNZHbwWdi6BMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F60F8055A; Mon, 25 Sep 2023 13:59:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D37ECF8016A;
	Mon, 25 Sep 2023 13:59:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11D68F80552; Mon, 25 Sep 2023 13:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 663DFF8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 13:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 663DFF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gvMgs/U7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695643169; x=1727179169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=urEx1w2gcPymBdnp2qIcjzqdQ6nVZTJcKJJDQpWrEEo=;
  b=gvMgs/U7qPFaVxmPUDKn6SEjPYEd0VYf/tqZySM2eSEoOfmEakfyIHjV
   LpwfVVMVsa5JgOU4GM1fa7e8lej1Yh8v0YPcpstWVGxzq62XNi/6zCo7w
   cAnWERNjiulsdtsUJZdD6LixjNwoPlOz7GlsOU+FpwSvAXFTDBa/O7xkO
   WmbjoFEhua5mLp5GFc3q5usVFNebA1yPJ9HoEWzFS+AzUP3gaxnKWUbbX
   6HJLNpZ+9/2a84hrYOkcGRcyolJ/G0/8SniPmeWlIQ2osIkzfBkd2Irha
   8addKFWQXfxXAsBmvQWU5B3k/quz9RW4FTmXTxxjMdK98nUXlPSJCA9ai
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383992986"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="383992986"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813938073"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200";
   d="scan'208";a="813938073"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 04:59:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
Date: Mon, 25 Sep 2023 13:58:40 +0200
Message-Id: <20230925115844.18795-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YXPF54RXAD6MZCOQBJXCNVQINJ6CHGJ6
X-Message-ID-Hash: YXPF54RXAD6MZCOQBJXCNVQINJ6CHGJ6
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXPF54RXAD6MZCOQBJXCNVQINJ6CHGJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patchset targets two intertwined topics:

The driver shall poll SDxFIFOS to ensure a valid value is set by the
controller after programming SDxFMT. Due to amount of users and
limited-number of configuration available in our CI when compared to
overall possibilities on the market, the check is non-blocking.

Second topic relates to stream setup procedure. The procedure differs
between HDAudio controller device revisions. Right now those differences
are handled directly by a platform driver. Existing top-level
'if (pci->device == APL)' could be replaced by a abstraction in lower
parts of the code instead.

With that done, the two users are updated accordingly. In avs-driver
case, this updates the flow to the recommended one.

Cezary Rojewski (4):
  ALSA: hda: Poll SDxFIFOS after programming SDxFMT
  ALSA: hda: Introduce HOST stream setup mechanism
  ASoC: Intel: avs: Use helper to setup HOST stream
  ASoC: Intel: Skylake: Use helper to setup HOST stream

 include/sound/hda_register.h      |  2 ++
 include/sound/hdaudio.h           |  3 +++
 include/sound/hdaudio_ext.h       |  3 +++
 sound/hda/ext/hdac_ext_stream.c   | 41 +++++++++++++++++++++++++++++++
 sound/hda/hdac_stream.c           |  8 ++++++
 sound/soc/intel/avs/pcm.c         |  2 +-
 sound/soc/intel/skylake/skl-pcm.c | 14 +----------
 7 files changed, 59 insertions(+), 14 deletions(-)

-- 
2.25.1

