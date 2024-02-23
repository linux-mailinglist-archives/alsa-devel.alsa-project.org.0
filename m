Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165E8610B0
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 12:45:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536DAA4D;
	Fri, 23 Feb 2024 12:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536DAA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708688737;
	bh=5M53J19YnQsDTZHCO/RGLH/1wCJSKBF2s0sCAjtorsM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A+bEZ8QUWS8htwW02Cml+og4DDaYmI1oT/k9dj3UHV/0191fVelABlAyKRwN2lDGG
	 jbBAUJahNZQABC3qlErMSzvWrQrqlEjl8eryNc4mya7Zb0EJ/GcdXvcYUna+WMbgrS
	 FYcNmEdebMxuQdDz1YaMpTmiRXuOPeCGDaTbOk5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79B2EF80578; Fri, 23 Feb 2024 12:45:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF552F8059F;
	Fri, 23 Feb 2024 12:45:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F186F804B0; Fri, 23 Feb 2024 12:44:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D1C9F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 12:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1C9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=liqaB4XE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688694; x=1740224694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5M53J19YnQsDTZHCO/RGLH/1wCJSKBF2s0sCAjtorsM=;
  b=liqaB4XECckyFAOjEUWd0R3fV3pf5feyH71jGLyanN9xlXh0Sfz12kjJ
   1UQ6s0W9Z3yDftvw++v1S/rmaqO/jUJINevF29XOMCM0xU0uSwNHHVnLl
   D/aoQvk6Z8aIDvGr0BnwamszFJv+55yeEJKKJ4GLDTqNO0B+2UO/MtTtd
   +cKZU0Ea7DnDyC9a67kIw2bdtfKzGGnkhPylPrabOJAXETKqGLm4j7/dz
   gairfq7Fxx41UnLXXQ/vcsH0lqkRr2S/QOeWqP+xRpHePdgdwh7+Ox6Ri
   oRmwhHsWWB7q9segpjM39YoqQUqI/Wios2yN5hlgkj6eevCT45pEjsADE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504592"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="3504592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 03:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="6092883"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/4] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Fri, 23 Feb 2024 12:46:22 +0100
Message-Id: <20240223114626.1052784-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AILFCTEPOK65ATIGCZCS7VXD6E5BZUDM
X-Message-ID-Hash: AILFCTEPOK65ATIGCZCS7VXD6E5BZUDM
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AILFCTEPOK65ATIGCZCS7VXD6E5BZUDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A small set of changes to improve initialization of the audio stack on
HDAudio devices and pair of cleanups.

As the first change is the most important one here, following is the
technical background for it:

Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
removed support for i915 for all CNL-based platforms. HDAudio library,
however, still treats such platforms as valid candidates for i915
binding. Update query mechanism to reflect changes made in drm tree.

At the same time, i915 support for LKF-based platforms has not been
provided so remove them from valid binding candidates.

The snd_soc_hda change is a follow up for the above and the cleanup
patches do not bring any functional changes.

Changes in v2:
- list of problematic VGA devices is now declared locally, no more
  touching drm stuff

Cezary Rojewski (4):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 sound/hda/hdac_i915.c     | 32 +++++++++++++++++++++++++++++---
 sound/pci/hda/hda_codec.c |  2 +-
 sound/soc/codecs/hda.c    | 15 ++++++++++-----
 3 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.25.1

