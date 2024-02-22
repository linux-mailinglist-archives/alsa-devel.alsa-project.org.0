Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCF85FEAB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 18:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA6186F;
	Thu, 22 Feb 2024 18:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA6186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708621592;
	bh=qBm5r8A0dH4nQsycHwkzWtzHdWmHKHLuX/nwo8bX8Dk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Hg8uiC+sIG5d0/sJRihoaKGfemX7cYJVWeA4D2yj8T2ICta+T6QmHPpqoTZFNRY0o
	 SjGLxpLFQUFfTadz6JaQ2Ecud15wFo9wRbwp4sN34rHM5Aty+J9jUOgmdWGcX794o2
	 3z/HAZYmOP1F9qoVGEVFpVGWMWFy7sGVdFAq8/e4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 417ACF805AB; Thu, 22 Feb 2024 18:06:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77383F80568;
	Thu, 22 Feb 2024 18:05:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A65EEF80496; Thu, 22 Feb 2024 18:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35145F8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 18:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35145F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S/dHdEVi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621552; x=1740157552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qBm5r8A0dH4nQsycHwkzWtzHdWmHKHLuX/nwo8bX8Dk=;
  b=S/dHdEVi8ZEh3iNy+wfprmZgosXw5UtopGyxPvy/DxF++gauaTLXAYAs
   EtwoeeoqqrLOC7WuMdxKFFAVemMrkKD9Uy1NdJrD2roCBE5p4rg7nBXoE
   fCgJQ5EB+UgYEWZyYqLKFiICwd4sYZU7EU4wU0T/UoMoScRVuVPyJXSii
   bbq2gO+iitDlXKyQw61ELNB3w/zqPA/zFxGzeWBpTnTqO6tHrIj4A/iqH
   TKZliLIunnJFFesoeC/kB/AFha0lRTUgWGoE1YrvJmhTp9+Hq9o2YZzKv
   lXT5kJ8Dl8cpUF4X2rZ9l9WxOi5cHYJhhoQeaQ8kj8M3VmDqPBw0UUvAd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299172"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="20299172"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575230"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="827575230"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:04:50 -0800
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
Subject: [PATCH 0/4] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Thu, 22 Feb 2024 18:06:10 +0100
Message-Id: <20240222170614.884413-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6PIF3OYV22VVVA2J5BYSWYS6T4RNJVFA
X-Message-ID-Hash: 6PIF3OYV22VVVA2J5BYSWYS6T4RNJVFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PIF3OYV22VVVA2J5BYSWYS6T4RNJVFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A small set of changes to improve initialization of the audio stack on
HDAudio devices and pair of cleanups. While I did touch i915_pciids.h
header which is part of drm, I'd like the changes to go through Mark's
tree entirely - being cohesive with the rest of the code by adding LKF
IDs where they belong rather than hiding them within the sound tree.

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

Cezary Rojewski (4):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 include/drm/i915_pciids.h |  4 ++++
 sound/hda/hdac_i915.c     | 18 +++++++++++++++---
 sound/pci/hda/hda_codec.c |  2 +-
 sound/soc/codecs/hda.c    | 15 ++++++++++-----
 4 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.25.1

