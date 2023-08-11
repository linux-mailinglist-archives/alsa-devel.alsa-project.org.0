Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA177951F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B66C828;
	Fri, 11 Aug 2023 18:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B66C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772637;
	bh=qaPMJwHqU4v/OZtqCj0U7il61guY3ckqtq9KuaoiYKc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OPZzii6m8YQuRQVMBoRUgDMTu/jXcNBBADivcze3ak1bYjyPkCBCR40iaFA/21jWf
	 TyfrmepTlkDdE6pusjvXiJj0gjpyYHw+wJKB3og5GOjC4+r7Xt4PuEeSpk21UelrF7
	 AwB1H0MGnX+DxQPlknSFz8c6PSCMQPUeNItc/DOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22F55F8016E; Fri, 11 Aug 2023 18:49:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD89F8016E;
	Fri, 11 Aug 2023 18:49:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 375AFF80510; Fri, 11 Aug 2023 18:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E06A3F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06A3F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PA6LPAAo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772555; x=1723308555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qaPMJwHqU4v/OZtqCj0U7il61guY3ckqtq9KuaoiYKc=;
  b=PA6LPAAoE1qBOERGnZwAc6YlXc34uLnoNQa18M/j8ZRtauO39hC3R3br
   c5uUCOJ+bKKJOc+X4e190qo9jos8ogRRmkNdaNcHv3Tkx9dN6wyRBLH4G
   aaXwBpQ1ahlay5IOp+HOXqhWSqnqAifAUvLes1ytQcFegOCU+EBCwLYfd
   rX2qNbVQBXYsB35BmOtuXAW1FNaFG/yEb//gkBJuL6oX/5KtqNVgzioQ5
   sL4rz1tI0PH9ayx96CNxzp4o76Z8IxULhX9Xl6uJZhXjqwcC35iwQ0r11
   nUb8jHeMPS4zov7o9uE8hkrDdurOtDlv7y0nRUb//qP+kaS2Y652Ase3i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725003"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725003"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842722"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842722"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 00/17] ALSA/ASoC: hda: Address format selection
 limitations and ambiguity
Date: Fri, 11 Aug 2023 18:48:36 +0200
Message-Id: <20230811164853.1797547-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QGZ4NGSUMCQHBY23VUUPFPWEWCJIMLXB
X-Message-ID-Hash: QGZ4NGSUMCQHBY23VUUPFPWEWCJIMLXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGZ4NGSUMCQHBY23VUUPFPWEWCJIMLXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Patchset aims to address format selection restrictions present currently
in the HDAudio library. Formats which we are concerned about are 20 and
24 valid bits per sample within 32 bit depth container. One may identify
them as S20_LE and S24_LE except that those, according to comments found
in include/uapi/sound/asound.h, are for LSB-aligned scenarios. HDAudio
streams expect MSB-aligned data, no matter if we are speaking of HOST
(SDxFMT) or LINK (PPLCxFMT) side - chapter 4.5.1 of the public HDAudio
specification. In short, S20_LE and S24_LE are invalid options.

Right now, given the implementation of snd_hdac_query_supported_pcm() 
within sound/hda/hdac_device.c, even if a codec responds with: "I
support all possible formats specified within HDAudio specification",
there will be no option to open a 20/32 or 24/32 stream. The kernel will
force the stream to be opened using the highest available bit depth.

After discussing subject initially with Jaroslav and Takashi, suggestion
was made to utilize 'subformat' option to address the problem. The
eye-opening discussion begun much earlier though, in 2019 [1].

Paired with PRs for alsa-utils [2] and alsa-lib [3].


Flow of changes:

The very first patch adds MSBITS subformat options to allow for granular
20/32, 24/32 and 32/32 format selection. The next three make sure
subformat is actually honored during runtime. Most of that code is based
on format-related API.

Follow up is upgrade to the hda stream-format interface - several
functions are added to make the granular format selection simple in the
HDAudio world. Core of the implementation is based on the existing
snd_hdac_calc_stream_format(). The next ten patches are straightforward
switch from one interface to another with cleanup of now-unsed function
as a finishing touch.

Last but not least - the avs-driver, on which the problem analyzed and
debugged, is updated to no longer acknowledge S24_LE as a valid format
option.

Note: No testing done on other drivers yet. First results from
snd_hda_intel and snd_soc_skl will be here on Monday. Will trigger SOF
cycle through github PR.


[1]: https://lore.kernel.org/alsa-devel/20190905053302.9262-1-pawel.harlozinski@linux.intel.com/
[2]: https://github.com/alsa-project/alsa-utils/pull/228
[3]: https://github.com/alsa-project/alsa-lib/pull/342

Cezary Rojewski (17):
  ALSA: pcm: Introduce MSBITS subformat interface
  ALSA: pcm: Honor subformat when configuring substream
  ALSA: hda: Honor subformat when querying PCMs
  ASoC: pcm: Honor subformat when configuring runtime
  ALSA: hda: Upgrade stream-format infrastructure
  ALSA: hda: Switch to new stream-format interface
  ALSA: hda/hdmi: Switch to new stream-format interface
  ALSA: hda/ca0132: Switch to new stream-format interface
  ASoC: codecs: hda: Switch to new stream-format interface
  ASoC: codecs: hdac_hda: Switch to new stream-format interface
  ASoC: codecs: hdac_hdmi: Switch to new stream-format interface
  ASoC: Intel Skylake: Switch to new stream-format interface
  ASoC: SOF: Intel: Switch to new stream-format interface
  ASoC: Intel: avs: Switch to new stream-format interface
  ALSA: hda: Drop snd_hdac_calc_stream_format()
  ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description
  ASoC: Intel: avs: Kill S24_LE in HDAudio streaming

 include/sound/hda_codec.h         |   5 +-
 include/sound/hdaudio.h           |  12 +--
 include/sound/pcm.h               |   8 ++
 include/sound/pcm_params.h        |   2 +
 include/sound/soc.h               |   1 +
 include/uapi/sound/asound.h       |   5 +-
 sound/core/pcm_lib.c              |  30 ++++++
 sound/core/pcm_misc.c             |  23 +++++
 sound/core/pcm_native.c           |   5 +-
 sound/hda/hdac_device.c           | 153 +++++++++++++++++++++---------
 sound/pci/hda/hda_codec.c         |   2 +
 sound/pci/hda/hda_controller.c    |  10 +-
 sound/pci/hda/patch_ca0132.c      |   3 +-
 sound/pci/hda/patch_hdmi.c        |   6 +-
 sound/soc/codecs/hda-dai.c        |   6 +-
 sound/soc/codecs/hda.c            |   2 +
 sound/soc/codecs/hdac_hda.c       |   8 +-
 sound/soc/codecs/hdac_hdmi.c      |  10 +-
 sound/soc/intel/avs/loader.c      |   4 +-
 sound/soc/intel/avs/path.c        |   2 +-
 sound/soc/intel/avs/pcm.c         |  60 ++++++------
 sound/soc/intel/avs/probes.c      |   3 +-
 sound/soc/intel/avs/topology.c    |   9 +-
 sound/soc/intel/skylake/skl-pcm.c |  11 ++-
 sound/soc/soc-pcm.c               |  17 ++++
 sound/soc/sof/intel/hda-dai-ops.c |   5 +-
 tools/include/uapi/sound/asound.h |   5 +-
 27 files changed, 290 insertions(+), 117 deletions(-)

-- 
2.25.1

