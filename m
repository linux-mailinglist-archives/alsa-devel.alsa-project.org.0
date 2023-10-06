Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191687BB539
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58BA5112;
	Fri,  6 Oct 2023 12:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58BA5112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696588238;
	bh=17KTJtSwvYsUaZO7LumR/SpkSCd61m93jswSeKYSSzs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oKvBTmcQB6oekYokwGXCYL0KSNoYfcsDwTK0WI7vh5K1pEC3oCrgQGQWP3s4IIMqO
	 oeMCDa9v8Qx+5reI5s6OCRqAZzdOnthk1JwhJQyUsvy4zjVBpCYr1RN/coUjpNRJLn
	 B6TwsIPcm12qJzEhqkiRlxVC7pYHqZ3A5GvIC1Cg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB5F4F8055C; Fri,  6 Oct 2023 12:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A11F80310;
	Fri,  6 Oct 2023 12:29:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C7BF80551; Fri,  6 Oct 2023 12:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D807F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D807F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KwFQTbPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588177; x=1728124177;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=17KTJtSwvYsUaZO7LumR/SpkSCd61m93jswSeKYSSzs=;
  b=KwFQTbPKQHgL9D8g65eq6GCKL2HlPkPgLf6aMRrA2HCvkzSYUFqhQtMk
   uTzoNfbsa1/EwaHXifZ0v5zK1gACAQ1qNw3vBh2Tvm6BIK8yD2Ce0bXEW
   uFEtE6sIZ1Q5seUQWAsinWIZHh1tzbTIQSryvcZktjO7q8FNBnmHcFNVE
   9w+3cxfUSosmUD/kMONQjJArCaVdJ+DTTZHuz8iAyspLDmbBg4fOXugub
   UWjyLy037s4phYVykDG3sDogF2m9MvoQIzkMr8oVE7nbLdWMySIi+nCAE
   XxG2oCrHob02nfZU5tTqWQPQ0fljqP/nXX59PIFc0PAPjguFn+I/KhTw+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="364002747"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="364002747"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925928883"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="925928883"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 03:29:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ALSA: hda: Stream setup fixes
Date: Fri,  6 Oct 2023 12:28:54 +0200
Message-Id: <20231006102857.749143-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFMWON24WFJJDS3EFTM3AHGT7HPW4BA6
X-Message-ID-Hash: ZFMWON24WFJJDS3EFTM3AHGT7HPW4BA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFMWON24WFJJDS3EFTM3AHGT7HPW4BA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Follow up to the recent hdac_stream-related series of mine [1].
Addresses three topics:

- false-positive timeout (-110) messages that appear during firmware
  loading procedure
- null-ptr-deref when assigning stub substream of COUPLED type. 'Stub'
  as precisely those kind of substreams are utilized for code-loading
  procedure
- hstream->fifo_size initialization, superfluous '+1'

The two fixes lead the way, there is no dependency of patch 3/3 on
either of them.


[1]: https://lore.kernel.org/alsa-devel/20230926080623.43927-1-cezary.rojewski@intel.com/

Cezary Rojewski (3):
  ALSA: hda: Fix possible null-ptr-deref when assigning a stream
  ALSA: hda: Fix stream fifo_size initialization
  ALSA: hda: Add code_loading parameter to stream setup

 include/sound/hdaudio.h           |  2 +-
 include/sound/hdaudio_ext.h       |  4 ++--
 sound/hda/ext/hdac_ext_stream.c   | 12 +++++++-----
 sound/hda/hdac_stream.c           | 27 ++++++++++++++++-----------
 sound/pci/hda/hda_controller.c    |  2 +-
 sound/pci/hda/hda_intel.c         |  2 +-
 sound/soc/intel/avs/pcm.c         |  2 +-
 sound/soc/intel/avs/probes.c      |  2 +-
 sound/soc/intel/skylake/skl-pcm.c |  2 +-
 9 files changed, 31 insertions(+), 24 deletions(-)

-- 
2.25.1

