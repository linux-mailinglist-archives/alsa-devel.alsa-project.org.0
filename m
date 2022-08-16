Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D60595970
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1625B1640;
	Tue, 16 Aug 2022 13:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1625B1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660648120;
	bh=x+LWaSuvGOZZ+vM5MW6iXqBf9TS7vTFiX2Fi75J4KAI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFU3BrgJI7ShhvzZWHmqxfs1eZw3gDsgch1sttj7LtnqcZPZ0xM5tBNqLfUaos409
	 cUxQtb0RKfxQ8TM84EGiCiGFKJ7iAU1TsMRHyw7XUzL6ZESYuGLK2UChqSuqai0rao
	 CSwNShaN83+jC0nJy/fcxNYy0UhMlvSNHkvxbNf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6996DF804AB;
	Tue, 16 Aug 2022 13:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0F90F80082; Tue, 16 Aug 2022 13:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8FCF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8FCF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TnnL3GHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660648058; x=1692184058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x+LWaSuvGOZZ+vM5MW6iXqBf9TS7vTFiX2Fi75J4KAI=;
 b=TnnL3GHuGpAbUrjW+Ukja/nRAYwy0dzy/jKeeAe9m2wT2pGSqN3TlrZ2
 51sGdAl8tPIjyFsnhlK3I1DT1ciRkAUh+jWnFmJTNs4b4o7v7yiBitLxx
 ayuMMXKIbPzmKUQLGxX7NO3dBEQGwB7LM9sPx3986xHMLmcuisasCtiXZ
 kZIQACDI+b5DJKEArXtburXi4Ue8I9HKDVLky3i+c4oYAHw41a86Zqe3j
 osM4eyJQ2PbveOjYxCZRAu9iXBGB7OosIwcfSq3OTRdqgEKgH2+Q+KGRM
 ghLsxor3ePDVoq8gcEViwW5pl2MbmOypXqmHOs5MjQzip1Vux10Qw3GGl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271960429"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="271960429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="782986136"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 04:07:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [RESEND PATCH v2 0/6] ALSA: hda: Unify codec construction
Date: Tue, 16 Aug 2022 13:17:21 +0200
Message-Id: <20220816111727.3218543-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A follow up to the recent HDAudio fixes series [1]. Given the recently
reported regression [2], before the page fault occurring on codec
shutdown can be fixed, codec construction procedure needs to be updated
for skylake and sof-intel drivers. Drivers: pci-hda and avs need no
changes - already making use of snd_hda_codec_device_init().

As subject touches code used by the sof-driver, additional review has
been conducted on thesofproject/linux [3].

Changes in v2:

- dropped snd_hda_ext_core <-> snd_hda_codec dependency by calling
  snd_hda_codec_device_init() directly in skylake and sof drivers probe
  enumeration routines, as suggested by Takashi
- skylake/sof portion of the change has been split into two separate
  patches

- new functions that aim to replace hdac_ext codec init & exit
  functionality are added first - for skylake and sof drivers both
- third patch in the series now combines the "field -> pointer" change
  for hdac_hda_priv->codec plus the codec-enumeration adjustments for
  skylake and sof drivers
  Both above are here to keep git bisect happy, as suggested by Pierre

[1]: https://lore.kernel.org/alsa-devel/20220706120230.427296-7-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/3c40df55-3aee-1e08-493b-7b30cd84dc00@linux.intel.com/
[3]: https://github.com/thesofproject/linux/pull/3775

Cezary Rojewski (6):
  ASoC: Intel: Skylake: Introduce HDA codec init and exit routines
  ASoC: SOF: Intel: Introduce HDA codec init and exit routines
  ASoC: Intel: Drop hdac_ext usage for codec device creation
  ALSA: hda: Always free codec on the device release
  ALSA: hda: Remove codec init and exit routines
  ALSA: hda: Fix page fault in snd_hda_codec_shutdown()

 include/sound/hda_codec.h                    |  2 -
 include/sound/hdaudio_ext.h                  |  3 --
 sound/hda/ext/hdac_ext_bus.c                 | 53 -------------------
 sound/pci/hda/hda_codec.c                    | 49 ++++++++---------
 sound/soc/codecs/hdac_hda.c                  | 26 ++++-----
 sound/soc/codecs/hdac_hda.h                  |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c      |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 +-
 sound/soc/intel/skylake/skl.c                | 53 ++++++++++++++-----
 sound/soc/sof/intel/hda-codec.c              | 55 ++++++++++++++------
 10 files changed, 113 insertions(+), 134 deletions(-)

-- 
2.25.1

