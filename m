Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6480955F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F6FDED;
	Thu,  7 Dec 2023 23:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F6FDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988281;
	bh=I6zZMG+IpPw2s8Sw0iLkg1F5rzsOKtGLZz9ge2ZVzVw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dTOoJ+0Sxphg3ta4rB/hOJvWC3u2yg/M8e/CGVeFFPblean1uWzwFsXvfarM9LecQ
	 OZesPjZoXOh70eodEcYe2XCM63bSCFiCMg+RUMa2FJGDvHKuG3c0xeIp4HQ8o6JOFr
	 z8/IDCXjEiBX7nNO11rp9JUbcKpy1YQ9OhPINPGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C758F805F4; Thu,  7 Dec 2023 23:30:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD835F805CB;
	Thu,  7 Dec 2023 23:30:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0190DF8056F; Thu,  7 Dec 2023 23:30:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52F63F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52F63F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nVeR+Y+D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988213; x=1733524213;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I6zZMG+IpPw2s8Sw0iLkg1F5rzsOKtGLZz9ge2ZVzVw=;
  b=nVeR+Y+DR3U8D9osrk7c8pOUIN4qaiCz0dps7lhkIeQ95INKLiYMvZDQ
   TM/H440QrZ9QnuEo1ns0R2PddUbqZ2r0EoxU6t3oeJKmyG2U3ZarTKcRq
   HAzsN7o1SO2KHOi52OxCndgHA2dRFMepJaPIHGiyWd9Bw7tsonmgEZH3b
   ATbvhNg7GeXyCXjuo5k4C1DBs44GFQJF196N0n/h6rRdoYGNdX3uul++w
   a3K5t5QvyDCQtQZWJSIyfrpjE5ckvrvo3WWXE0toucp2oGijrNcYJZeyk
   sRZstuBrdmj19e+Mc/rc87R9xKIAgvGfUCvoXmg3ip9KorVLGHVHmrBK9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516563"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307458"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307458"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 00/16] soundwire/ASoC: speed-up downloads with BTP/BRA
 protocol
Date: Thu,  7 Dec 2023 16:29:28 -0600
Message-Id: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JWSG6NWRVENVRPPPMOUDJLYVRBN7XOPG
X-Message-ID-Hash: JWSG6NWRVENVRPPPMOUDJLYVRBN7XOPG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWSG6NWRVENVRPPPMOUDJLYVRBN7XOPG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This RFC patchset suggests a new API for ASoC codec drivers to use for
firmware/table downloads.

Problem statement:

All existing transfers initiated by codec drivers rely on SoundWire
read/write commands, which can only support ONE byte per frame. With
the typical 48kHz frame rate, this means 384 kbits/s.

In addition, the command/control is typically handled with a FIFO and
interrupts which adds more software overhead. To give a practical
reference, sending 32Kb takes 2.5s on Intel platforms, which means
about 105kbit/s only. Additional non-audio activity is likely to
adversely impact interrupt scheduling and further decrease the
transfer speeds.

New SDCA-based codecs have a need to download tables and DSP firmware
which are typically between 20 and 256 Kb. The slow bus operation has
a direct impact on boot/resume times, and clearly having to wait more
than 300ms is a showstopper in terms of latency requirements and
user-experience.

Suggested solution:

The MIPI specification and most of the new codecs support the Bulk
Transfer Protocol (BTP) and specifically the Bulk Register Access
(BRA) configuration. This mode reclaims the 'audio' data space of the
SoundWire frame to send firmware/coefficients over the DataPort 0
(DP0).

The API suggested is rather simple, with the following sequence
expected:
open(): reserve resources and prepare hardware
send_async(): trigger DMAs and perform SoundWire bank switch
wait(): wait for DMA completion and disable DMAs
close(): release resources

Benefits:

Even after accounting for the protocol overhead, the data can be sent
8x or 16x faster on the link than with the regular commands.

With the use of DMAs, the software overhead becomes limited to the
initialization. Measured results show that transferring the same 32Kb
takes about 100ms, a 25x improvement on the baseline write() commands
with an actual bitrate of 2.6 Mbits/s. These results are a measure of
bus/hardware performance mainly, and will typically not be too
modified by the CPU activity and scheduling.

The performance for reads is similar, with a 25x speedup measured.

Limitations:

Setting up the transfers over DP0 takes time, and the reliance on DMAs
on the host side brings alignment restrictions. The BTP/BRA protocol
is really only relevant for "large" transfers done during boot/resume
*before* audio transfers take place. Mixing BTP/BRA and audio is a
nightmare, this patchset suggests a mutual-exclusion between two
usages.

Scope:

This patchset only exposes the API and a debugfs interface to initiate
commands, validate results and measure performance. The actual use of
the API is left as an exercise for codec driver developers.

This patchset depends on a number of pre-requisite patches and will
not build on top of any for-next branches. The main intent of this RFC
is to gather comments on the usage, API, benefits and restrictions.

The code and functionality was tested on an Intel LunarLake RVP platform
connected to a Realtek RT711-SDCA device.

Acknowledgements:

Thanks to Zeek Tsai at Realtek for providing test sequences that
helped reconcile the data formatted by the host driver with the
expected results on the code side.

Pierre-Louis Bossart (16):
  Documentation: driver: add SoundWire BRA description
  soundwire: cadence: add BTP support for DP0
  soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
  soundwire: extend sdw_stream_type to BPT
  soundwire: stream: special-case the bus compute_params() routine
  soundwire: stream: reuse existing code for BPT stream
  soundwire: bus: add API for BPT protocol
  soundwire: bus: add bpt_stream pointer
  soundwire: crc8: add constant table
  soundwire: cadence: add BTP/BRA helpers to format data
  soundwire: intel_auxdevice: add indirection for BPT
    open/close/send_async/wait
  ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire BPT DMA
  soundwire: intel: add BPT context definition
  soundwire: intel_ace2x: add BPT open/close/send_async/wait
  soundwire: debugfs: add interface for BPT/BRA transfers
  ASoC: rt711-sdca: add DP0 support

 Documentation/driver-api/soundwire/bra.rst    | 478 +++++++++++++
 Documentation/driver-api/soundwire/index.rst  |   1 +
 Documentation/driver-api/soundwire/stream.rst |   2 +-
 .../driver-api/soundwire/summary.rst          |   5 +-
 drivers/soundwire/Kconfig                     |   1 +
 drivers/soundwire/Makefile                    |   4 +-
 drivers/soundwire/amd_manager.c               |   2 +-
 drivers/soundwire/bus.c                       |  77 +++
 drivers/soundwire/bus.h                       |  18 +
 drivers/soundwire/cadence_master.c            | 646 +++++++++++++++++-
 drivers/soundwire/cadence_master.h            |  30 +
 drivers/soundwire/crc8.c                      | 277 ++++++++
 drivers/soundwire/crc8.h                      |  11 +
 drivers/soundwire/debugfs.c                   | 122 +++-
 .../soundwire/generic_bandwidth_allocation.c  |  84 ++-
 drivers/soundwire/intel.h                     |  12 +
 drivers/soundwire/intel_ace2x.c               | 377 ++++++++++
 drivers/soundwire/intel_auxdevice.c           |  55 ++
 drivers/soundwire/qcom.c                      |   2 +-
 drivers/soundwire/stream.c                    | 137 +++-
 include/linux/soundwire/sdw.h                 |  91 ++-
 include/linux/soundwire/sdw_intel.h           |  16 +
 include/sound/hda-sdw-bpt.h                   |  76 +++
 sound/soc/codecs/rt711-sdca-sdw.c             |   8 +
 sound/soc/qcom/sdw.c                          |   2 +-
 sound/soc/sof/intel/Kconfig                   |   8 +-
 sound/soc/sof/intel/Makefile                  |   4 +
 sound/soc/sof/intel/hda-sdw-bpt.c             | 328 +++++++++
 28 files changed, 2810 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/driver-api/soundwire/bra.rst
 create mode 100644 drivers/soundwire/crc8.c
 create mode 100644 drivers/soundwire/crc8.h
 create mode 100644 include/sound/hda-sdw-bpt.h
 create mode 100644 sound/soc/sof/intel/hda-sdw-bpt.c

-- 
2.39.2

