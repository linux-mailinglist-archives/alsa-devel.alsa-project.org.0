Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E625867564
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:43:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3FE825;
	Mon, 26 Feb 2024 13:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3FE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708951423;
	bh=2KdsoRdBQn0vAvJ3VTzz+IQEwwTyje5sOboncMJlplo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A0v+TRwCMaRj1xeNZXQm/0rHWCIxmPVhSJahXGRCD8DY6SyaOnH3vxqEHDI+UULNZ
	 AUfZzWBP4S/UFZ6134UnzjY+GIwk+jbDaaJGd8RDznkk6MCvqv0nw5x+tQbzp8JD49
	 dYqyU1FiJZTPxdkhoF3RHMCa3qGbwfziXuNxe95I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B707BF80571; Mon, 26 Feb 2024 13:43:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB5AF805A9;
	Mon, 26 Feb 2024 13:43:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFC3F800EE; Mon, 26 Feb 2024 13:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0477EF800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0477EF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X1JKXhno
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951383; x=1740487383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2KdsoRdBQn0vAvJ3VTzz+IQEwwTyje5sOboncMJlplo=;
  b=X1JKXhno5VWXDf4M9dZLNX/BHyDVcO+cRXfKKf+fnph1Irc/Fn0jjOPe
   FpEke4PKswqvzyM0BKeVBEMRsuBks1R3gVC+Hfvtb67dle0fDEAYdQ5Jf
   UfnXE2pSF9xInGBJd/hwLm0eQfT9ewYqpDoNAa6SuK4bY/7yTzaAVxC/U
   8dtKVjDKTrbtNYydPSCgd2AZLtmCUBZJt8ahQTAGOEVaN1oNlXNImDwON
   HvKGVi2G+8ub5ZTO94hs2sDUt3j6jD2TfgyyTEl0fjfiOM7UXHPMXUxB1
   F5blDem4v5Fy+0JXzJW+K6//kAuJxfGxQkOR6rO1SvRUFjmW0oIuEoYTj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658218"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="28658218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="6688605"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:42:54 -0800
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
Subject: [PATCH v3 0/5] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Mon, 26 Feb 2024 13:44:27 +0100
Message-Id: <20240226124432.1203798-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXBOZBEZJB235LVYFY6J5EDHNB65U6I5
X-Message-ID-Hash: OXBOZBEZJB235LVYFY6J5EDHNB65U6I5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXBOZBEZJB235LVYFY6J5EDHNB65U6I5/>
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

Changes in v3:
- snd_soc_hda_codec now returns -ENODEV on attach() if i915 is not
  present
- denylist now const
- added new patch for the avs-driver to address -ENODEV during
  probe_codec()
- note: retained reviewed-by for patch 1/4 as changes are minimal

Changes in v2:
- list of problematic VGA devices is now declared locally, no more
  touching drm stuff

Cezary Rojewski (5):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: Intel: avs: Ignore codecs with no suppoting driver
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 sound/hda/hdac_i915.c      | 32 +++++++++++++++++++++++++++++---
 sound/pci/hda/hda_codec.c  |  2 +-
 sound/soc/codecs/hda.c     | 15 ++++++++++-----
 sound/soc/intel/avs/core.c |  9 +++++----
 4 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.25.1

