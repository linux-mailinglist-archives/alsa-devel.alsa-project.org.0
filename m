Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27978524C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74B4112;
	Wed, 23 Aug 2023 10:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74B4112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778126;
	bh=rI5MPgy1wg1Zs8L7azEeeLJeSitRt1R9hj6i3PJ6QSU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E1h76LRzppVlCsz4VBFHFfdfzgmxJ9unEdyg3Uk8MPBKs062KL6Mtcbp90xXznCh4
	 i6/8FwAEtXQYWSMnNfNvDyiFv54PL4ILCYJwYALEq5kchnPDurSSZ281CKyjBFKRxL
	 leTCHSsip2YBby2sRlGZkMjDxy//obAXACQT8nos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B272EF80551; Wed, 23 Aug 2023 10:07:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC21F80549;
	Wed, 23 Aug 2023 10:07:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2366F80022; Wed, 23 Aug 2023 10:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27AAFF800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AAFF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ba0p4q+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777969; x=1724313969;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rI5MPgy1wg1Zs8L7azEeeLJeSitRt1R9hj6i3PJ6QSU=;
  b=Ba0p4q+BY2lY81JnelMna0DIhvK/F59DVZ1qMKUgyrY/fA2Yrxa3966N
   526x0vBCxtb2/f1O/oHtyUlxAkAzC0kP/nA4c+Cvbh0pH5mPOB1ZPBxgE
   CHWQPAWlJ3YP1EWtK9p7eTqoXdrx+BDmHBYJGLrTQfFEMeYu8HrjZaBnz
   igOuVEYOI72tqy9lxaSP5jkKaJeaLAVTfDhcWVY3z27f6l0AHJDawsUlu
   8SkN/Bzpdkpy9XmVxisP1S4VDny0vSO7XJ83DTunoPRdlZhWrJVAlxttB
   R0ixEPTcj/j72MNQ0aY1GtGGZM8MA6Q8AVzIYzOUzItYr9depesu0tQYg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372987969"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372987969"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042612"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042612"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/17] ALSA/ASoC: hda: Address format selection limitations
 and ambiguity
Date: Wed, 23 Aug 2023 10:05:29 +0200
Message-Id: <20230823080546.2224713-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IZBGLPDXRBKI2XPIKD2KA7XVF32JAKFC
X-Message-ID-Hash: IZBGLPDXRBKI2XPIKD2KA7XVF32JAKFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZBGLPDXRBKI2XPIKD2KA7XVF32JAKFC/>
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

Results with skylake-driver and snd_hda_intel show status quo on our
RVPs. PR filed on SOF github shows promissing results too [4].

Changes in v1:
- fixed UBSAN due to missing snd_pcm_subformat_names[] entries for new
  subformats
- as HDMI stream capabilities are assigned on PCM open, patch 16/17 has
  been updated to ignore such codecs for now. A separate patchset will
  take care of this case
- params_bps() reworded to snd_pcm_hw_params_bps()
- fixed compilation issues in sof-driver, patch 13/17


[1]: https://lore.kernel.org/alsa-devel/20190905053302.9262-1-pawel.harlozinski@linux.intel.com/
[2]: https://github.com/alsa-project/alsa-utils/pull/228
[3]: https://github.com/alsa-project/alsa-lib/pull/342
[4]: https://github.com/thesofproject/linux/pull/4539

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
  ASoC: Intel: avs: Kill S24_LE in HDAudio streaming
  ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description

 include/sound/hda_codec.h         |   5 +-
 include/sound/hdaudio.h           |  12 +--
 include/sound/pcm.h               |   8 ++
 include/sound/pcm_params.h        |   2 +
 include/sound/soc.h               |   1 +
 include/uapi/sound/asound.h       |   5 +-
 sound/core/pcm.c                  |   3 +
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
 sound/soc/intel/avs/pcm.c         |  50 ++++++++--
 sound/soc/intel/avs/probes.c      |   3 +-
 sound/soc/intel/avs/topology.c    |   9 +-
 sound/soc/intel/skylake/skl-pcm.c |  11 ++-
 sound/soc/soc-pcm.c               |  17 ++++
 sound/soc/sof/intel/hda-dai-ops.c |  20 ++--
 tools/include/uapi/sound/asound.h |   5 +-
 28 files changed, 310 insertions(+), 105 deletions(-)


base-commit: e69dadf638e625a950b2b91591a47c9ae32a9d5e
-- 
2.25.1

