Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7397AD9E8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2503DDEB;
	Mon, 25 Sep 2023 16:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2503DDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651441;
	bh=LUR+AKiVlZrZhSGF0QYevS0GzPlQ4jsivIMXOtUxibk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W+Hjd4pN65Vh5UHSvGvOg0Bdq5NBXV1acXKaiyNClZLKtjCsQItMarc0/bQ/XH9Hq
	 KgmrFeKOcq8Qahqh+y4GWEBTOLVRtLRjsxvqNqQWh2B9CR+HgL3ep36+POTdVcH7ye
	 fN9fbVY23o7PWpIwI84v0BxoLKYcXxjF7GVshbRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F048F8001D; Mon, 25 Sep 2023 16:16:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EC8F80166;
	Mon, 25 Sep 2023 16:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E75F80552; Mon, 25 Sep 2023 16:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 764F9F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 764F9F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RKMRcujq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651379; x=1727187379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LUR+AKiVlZrZhSGF0QYevS0GzPlQ4jsivIMXOtUxibk=;
  b=RKMRcujqpGjOtdbllAGv7yqQG3f85wB7QzdXU2H7w3ZgwwPDOXTb7GVR
   D+rRFLyNpgbzlnVkP+1KgenR+YQcJjdpBcng3O5jO4orK9vLBCjge592Y
   GBlbB2gu0n+qTCazEfhpxUTkKtteU4WPuIguNWmMqe0guY3vSq2YAaLqh
   jlyDQxsi/JRNwsAJ4Qt1ZF35qglU1ZJKBRSQllHUPV+Qkl8y7xtJeFFHY
   bnCQaZTYGCbDE/zaKBVpTuk6OFDd0+iZ4QEbJeRwgw9uVGNy02atg+2S2
   6mi96BhQ1lU5Uv0iErxR5h/wtM35oJEsdMPBJqFKFvWbTKPeyraQpXMaa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361514113"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="361514113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783508140"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="783508140"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 07:07:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
Date: Mon, 25 Sep 2023 16:06:12 +0200
Message-Id: <20230925140616.26892-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RNCVZ4CVF5PBJOXFLIAIBQVBPHKEP7NR
X-Message-ID-Hash: RNCVZ4CVF5PBJOXFLIAIBQVBPHKEP7NR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNCVZ4CVF5PBJOXFLIAIBQVBPHKEP7NR/>
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

Changes in v2:
- fixed ->host_setup assignment in patch 02/04

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

