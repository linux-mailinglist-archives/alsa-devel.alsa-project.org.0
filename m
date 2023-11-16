Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C47EDF99
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9C8A4D;
	Thu, 16 Nov 2023 12:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9C8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133821;
	bh=2nvSNwiqsTo9gFmjcl5IwChdttQhho1stat0eORAMsw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U39wJor480PjICvPVQMgCqgiQycxH57DHrJDsY0HgHE3hY/05PC7NWpx7LLPCbS6u
	 GH4UvmbUGo0G2UXdkUVWEnmkXbPzOazZQlabXt8P8zvk+WE9PIv1/bhFpvA7Temc7Z
	 iKrv3oZqdVVDefYR3FDM8Ig0Nv0+q89ONm4jz70c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF10F80578; Thu, 16 Nov 2023 12:22:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BE0F80166;
	Thu, 16 Nov 2023 12:22:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A289F80571; Thu, 16 Nov 2023 12:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26AFBF800ED
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AFBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MRAdxAWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133703; x=1731669703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2nvSNwiqsTo9gFmjcl5IwChdttQhho1stat0eORAMsw=;
  b=MRAdxAWlYohQjYXTwGrcYUBm4h9/bGF4Ki6WNebfKTpqdhEkMHEFZwwd
   6K+3HIInZU4SIk4o7/pm2t3k0usgCE96K5Hm5i91VNevoe4alISq5nOZX
   O/qVPgc3WtZ3I5iiIbiLSOAObWo9AQwZm48sTbs5/I/IxC1TeG13xi+oQ
   MEij4CxwiixN9Iz7xaSHQYGjCIbV72OSbSpuACU3/CasF0LbC+QyPoNb3
   zQBZjihni8MKZbET1o7wB3d+hcGl/J4sinsPfr3aYBLjIydc3+nf3VxBl
   g0uptxsyGnRDLOZ4RP0cbWAuxQb35hMbBBTH7D9+jKANz7GNYgkWLJ59Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457561935"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="457561935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698207"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:21:29 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 00/16] ALSA/ASoC: hda: Address format selection limitations
 and ambiguity
Date: Thu, 16 Nov 2023 12:22:39 +0100
Message-Id: <20231116112255.1584795-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UMYJPB3E5AMG7LKIU53RTA5GDLJHSB64
X-Message-ID-Hash: UMYJPB3E5AMG7LKIU53RTA5GDLJHSB64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMYJPB3E5AMG7LKIU53RTA5GDLJHSB64/>
List-Archive: <>
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
20/32, 24/32 and 32/32 format selection. The next two make sure
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
RVPs. PR filed on SOF github shows promising results too [4].


Changes in v4:
- fixed compilation issues in sof-driver, patch 12/16, reported by ikp
- fixed sparse warnings in patch 01/16, reported by ikp
- updated commit message for patch 03: "ASoC pcm: Honor subformat when
  configuring runtime", as snd_pcm_hw_copy() is gone since revision v3.

Changes in v3:
- merged the first two patches as suggested by Jaroslav
- re-authored patch 01 to Jaroslav, added my Co-developed-by.
- added Jaroslav' Co-developed-by to patch 02.
- 'subformats' field now S32_LE-specific. Given the fact that it is the
  only format currently requiring subformat-intervention, functionality
  is narrowed to reduce amount of memory allocations and cleanup.
  Suggested by Jaroslav.
- note to the above: the hdaudio part converted 1:1 as requested, patch
  02/16
- note #2: alsa part converted to S32_LE-specific yet without addition
  of the chicken bit. Instead, struct snd_pcm_hardware is updated with
  u32 subformat mask to do the job.
- ALSA-core additions in form of snd_pcm_subformat_width() and
  snd_pcm_hw_params_bps() relocated from 01/16 to the user, patch 05.

Changes in v2:
- patch 01/17, introduced struct snd_pcm_subformat which task is to
  represent subformat-mask on per format basis. Expectation is that
  manipulated arrays of subformats always end with a sentinel entry
- patch 01/17, added snd_pcm_hw_copy() as the copying snd_pcm_hardware
  becomes non-trivial
- patch 02/17, added hw_rule that produces final subformat mask
  based on provided formats as suggested by Jaroslav
- patch 04/17, soc_pcm_hw_update_subformat() refactored as the subformat
  intersection becomes non-trivial
- relevant functions releasing resources occupied by hda_pcm and
  snd_pcm_runtime updated to also kfree() subformats
- except for 16/17, no changes to patches past 04/17, retaining acks for
  these

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

Cezary Rojewski (15):
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
  ASoC: Intel: avs: Kill S24_LE format
  ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description

Jaroslav Kysela (1):
  ALSA: pcm: Introduce MSBITS subformat interface

 include/sound/hda_codec.h         |   5 +-
 include/sound/hdaudio.h           |  13 +--
 include/sound/pcm.h               |   8 ++
 include/sound/pcm_params.h        |   2 +
 include/sound/soc.h               |   1 +
 include/uapi/sound/asound.h       |   7 +-
 sound/core/pcm.c                  |   3 +
 sound/core/pcm_lib.c              |  28 ++++++
 sound/core/pcm_misc.c             |  22 +++++
 sound/core/pcm_native.c           |  55 ++++++++++-
 sound/hda/hdac_device.c           | 156 +++++++++++++++++++++---------
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
 sound/soc/intel/avs/pcm.c         |  58 +++++++++--
 sound/soc/intel/avs/probes.c      |   3 +-
 sound/soc/intel/avs/topology.c    |  13 ++-
 sound/soc/intel/skylake/skl-pcm.c |  11 ++-
 sound/soc/soc-pcm.c               |  10 ++
 sound/soc/sof/intel/hda-dai-ops.c |  20 ++--
 tools/include/uapi/sound/asound.h |   7 +-
 28 files changed, 365 insertions(+), 110 deletions(-)


-- 
2.25.1

