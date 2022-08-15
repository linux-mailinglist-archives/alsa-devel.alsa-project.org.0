Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED2593411
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 19:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66E2839;
	Mon, 15 Aug 2022 19:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66E2839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660584867;
	bh=x+LWaSuvGOZZ+vM5MW6iXqBf9TS7vTFiX2Fi75J4KAI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FwyQSajUYErxyyCZaaxF0X/b5xKyHa4PfFKzROCVN8TQ5wt5j6xP9fYbB1sH6CoCu
	 Rq0XcSFIAu4XqF0rhl3A9Mv/4NXEy9QMyf/ghnp6equRu4A4nHXVveectfXUzu5Idx
	 7iB8any72QXSKdr/m0s7cTh1m8iKR4FgZ2rtM9+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32AE6F80271;
	Mon, 15 Aug 2022 19:33:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F2A5F80271; Mon, 15 Aug 2022 19:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F6D4F80095
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F6D4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dq7ppxHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584804; x=1692120804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x+LWaSuvGOZZ+vM5MW6iXqBf9TS7vTFiX2Fi75J4KAI=;
 b=Dq7ppxHDbfJluPwPhCe43RZBql2NtTAj4UN/3MSTDC+tL2hqIN20zA2K
 qsy0agpsLA1pMZCE41FJEPE8zIToFnBCNDoriDKa1HnkiRoRneH7tR0dd
 hTgG9q+RmTWG3uC3EpDjJXIxnh99yxyqLGX3gwOTP4EGDcLU9BGNlkYrb
 sfoIzH4Ovf/v+k0KrMtLjCMTCSnU3zzNQwsM1NCTBObAnTO58zG9Incl0
 Ow38dXmKcMknduMrHGf4fqej66F+muSPkm6LNSQs/MwoyMLvQ3CRjwJix
 ZRPb89eEKnbwmLDC+zosu+0t2XKOSfQ8Uvj2ybTLu5fotdL5esasK2o+E w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356024248"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="356024248"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="696049316"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2022 10:33:15 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 0/6] ALSA: hda: Unify codec construction
Date: Mon, 15 Aug 2022 19:42:21 +0200
Message-Id: <20220815174227.3071323-1-cezary.rojewski@intel.com>
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

