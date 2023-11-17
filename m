Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409B7EF238
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7A8950;
	Fri, 17 Nov 2023 13:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7A8950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222748;
	bh=o1Clj0wfmtvRTRMztmEpRpWTvJKzJXSertPqRGYxMss=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K7wBNygFSYtInRoo1wKdorr7TC0kvM/e1bplloUHWTKrnHameR33CKeAzd4Lx0/1U
	 hjTCNmcs8cpaip1qzSRB8QeD5kywWsZU3MDezEaAQnXSK5K9BUPKIH01X98me5l9n8
	 lGbQMWSpeXgU+pueKD/xd5fdPcy6vRdct0u/JA24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D32B8F8057E; Fri, 17 Nov 2023 13:04:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D00F80549;
	Fri, 17 Nov 2023 13:04:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9AFDF8057F; Fri, 17 Nov 2023 13:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D755F8016E
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D755F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KVgn4VXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222653; x=1731758653;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o1Clj0wfmtvRTRMztmEpRpWTvJKzJXSertPqRGYxMss=;
  b=KVgn4VXaHeaYWr2WxXSe9KFQvtuCvA2jrkPTtqqboQUU9oQmsuQplK6J
   /ohDpeEhSZCcQAXuZr8IVemup1nP/WaE1xyvpcFaw42o23PZSheLCh6Vo
   1tSeQsOM4yUSuWnJpxA7L5KKD+SeRvf+nQWvJA0RNuLBBgFDa40BmBl9w
   UPbtRc9bAkA4FmbuydQtTmbSyFjTIEviv8vKTEXi0rwDbvza6zOvgkUWM
   K3wK5RYnb/KJRzJ8//ZO4gTT+vmlVdRzxIaU1RfTH1vEc4T/IqOa+DJTW
   vTjeoxbDN1z0Xrcf341EUsi9au1WW9SbUTfOPRzsp4lgslQAB+eDyNoDe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675156"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675156"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110143"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110143"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:01 -0800
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
Subject: [PATCH v5 00/16] ALSA/ASoC: hda: Address format selection limitations
 and ambiguity
Date: Fri, 17 Nov 2023 13:05:54 +0100
Message-Id: <20231117120610.1755254-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MX5X5YHKJRTQVQUM2762ZYMRGJZN6V4Z
X-Message-ID-Hash: MX5X5YHKJRTQVQUM2762ZYMRGJZN6V4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MX5X5YHKJRTQVQUM2762ZYMRGJZN6V4Z/>
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


Changes in v5:
- reworded 'bps' to 'bits' in all occurrences.
- fixed an issue of MSBITS_MAX not being reported for S32_LE as reported
  by Jaroslav
- snd_pcm_subformat_width() has been inlined into its only user:
  snd_pcm_hw_params_bits() as suggested by Jaroslav.
- updated commit messege for patch 01 as it was out of date given the
  recent updates.

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
 include/sound/pcm.h               |   7 ++
 include/sound/pcm_params.h        |   2 +
 include/sound/soc.h               |   1 +
 include/uapi/sound/asound.h       |   7 +-
 sound/core/pcm.c                  |   3 +
 sound/core/pcm_lib.c              |  34 +++++++
 sound/core/pcm_native.c           |  55 ++++++++++-
 sound/hda/hdac_device.c           | 156 +++++++++++++++++++++---------
 sound/pci/hda/hda_codec.c         |   2 +
 sound/pci/hda/hda_controller.c    |  10 +-
 sound/pci/hda/patch_ca0132.c      |   3 +-
 sound/pci/hda/patch_hdmi.c        |   6 +-
 sound/soc/codecs/hda-dai.c        |   7 +-
 sound/soc/codecs/hda.c            |   2 +
 sound/soc/codecs/hdac_hda.c       |   8 +-
 sound/soc/codecs/hdac_hdmi.c      |  10 +-
 sound/soc/intel/avs/loader.c      |   4 +-
 sound/soc/intel/avs/path.c        |   2 +-
 sound/soc/intel/avs/pcm.c         |  58 +++++++++--
 sound/soc/intel/avs/probes.c      |   3 +-
 sound/soc/intel/avs/topology.c    |  13 ++-
 sound/soc/intel/skylake/skl-pcm.c |  13 ++-
 sound/soc/soc-pcm.c               |  10 ++
 sound/soc/sof/intel/hda-dai-ops.c |  21 ++--
 tools/include/uapi/sound/asound.h |   7 +-
 27 files changed, 352 insertions(+), 110 deletions(-)


-- 
2.25.1

