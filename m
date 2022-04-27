Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED49511344
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55BE51798;
	Wed, 27 Apr 2022 10:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55BE51798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047010;
	bh=PMUPP+MOdjXg2Ss8aIwBLLzxbmFDXmm/DxoTvMFpCeE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NrgSwadTPZ0EpUyabZmJZK3RRMauWjGrClzZc60UnEGsojQwlEXUGK0bFs4kuqIHg
	 P+oiQqIkmN5q0OYtC7bTPMzldG6Ab26Wr3li2aJQ0XZP2SlG6W9zJSzYKLWHdyHwcp
	 xfgsjzKeqBhUIBoQoVyHdjLFtjGMa+s66b3otwe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0584F80155;
	Wed, 27 Apr 2022 10:09:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 335A7F80256; Wed, 27 Apr 2022 10:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA40EF800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA40EF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X851DOI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046948; x=1682582948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PMUPP+MOdjXg2Ss8aIwBLLzxbmFDXmm/DxoTvMFpCeE=;
 b=X851DOI9cRP+mN/VxV1aazz0hNjk7DQkCKCUsTmHLRz+/zFuVVVfTUzn
 S7+Bb5VHkhZdeMKSjgNwtzl+pnXGJke5LVkJMxe6z2JxBCuIFOglyBYuU
 EFBHrhZDRLbLiL6R5Ttg1Jt3PUXT3wYOPuBtKlJrNgXaHXTxOH0fueU1l
 wFALqoVMrux8U0B5MHIE+epx6g9Klr0eC4mQihWZRIb+wk2j1UmDI5Ryw
 0qdvgpDdLF8czJIL7NkcxITVT4eR+9YzgklF0ayHc3F7o18GlnfmGhuc+
 X+jl1Xi4VjpVuJgU2oGSB5jhn0bKyzWMmoM4T0xdCYx1ri5MESu5hCSF3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006145"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006145"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437310"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:08:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/14] ASoC: Intel: avs: Machine boards and HDA codec support
Date: Wed, 27 Apr 2022 10:18:48 +0200
Message-Id: <20220427081902.3525183-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

This series focuses on populating boards/ subdirectory with supported
configurations by the avs-driver. Note: it is independent of recently
provided "Driver code and PCM operations" series [1], that is, code
found here should not collide with it.

Series starts with a small change that adds a helper to sound pcm
header, allowing for retrieving string naming a direction without the
need of substream pointer. Said helper is used by codec driver code that
follows it but I believe it's generic and helpful enough that it can be
called an independent addition to the sound core.

Code for generic HD-Audio codec driver follows. It is a ASoC wrapper for
existing HD-Audio codec code found in sound/pci/hda/. There is basically
no custom logic involved up to the point that driver follows
HDA_DEV_LEGACY convention, rather than the HDA_DEV_ASOC one. Commit
message for the given patch iterates on this and explains crucial parts
of the implementation.

From there on is a range of boards appended. All of them follow the same
scheme:

- define avs_create_dai_link() so DAI-LINKs can be created dynamically,
  based on the link_mask (I2S) or the number of entries in the
  ->pcm_list_head list (HDA)
- define avs_create_dapm_routes() so DAPM routes can be created
  dynamically, same rules as above apply
- define probe() function that creates new ASoC card, assign all
  required operations and resources along with calling the two above


[1]: https://lore.kernel.org/all/20220426172346.3508411-1-cezary.rojewski@intel.com/

Amadeusz Sławiński (1):
  ASoC: Intel: avs: Add max98373 machine board

Cezary Rojewski (13):
  ALSA: Add snd_pcm_direction_name() helper
  ASoC: codecs: Add HD-Audio codec driver
  ASoC: Intel: avs: Add HDAudio machine board
  ASoC: Intel: avs: Add DMIC machine board
  ASoC: Intel: avs: Add ssp-test machine board
  ASoC: Intel: avs: Add rt274 machine board
  ASoC: Intel: avs: Add rt286 machine board
  ASoC: Intel: avs: Add rt298 machine board
  ASoC: Intel: avs: Add rt5682 machine board
  ASoC: Intel: avs: Add nau8825 machine board
  ASoC: Intel: avs: Add ssm4567 machine board
  ASoC: Intel: avs: Add max98357a machine board
  ASoC: Intel: avs: Add da7219 machine board

 include/sound/pcm.h                    |  19 +-
 sound/soc/codecs/Kconfig               |   5 +
 sound/soc/codecs/Makefile              |   2 +
 sound/soc/codecs/hda-dai.c             | 102 +++++++
 sound/soc/codecs/hda.c                 | 395 +++++++++++++++++++++++++
 sound/soc/codecs/hda.h                 |  19 ++
 sound/soc/intel/Kconfig                |   3 +
 sound/soc/intel/avs/Makefile           |   3 +
 sound/soc/intel/avs/boards/Kconfig     | 121 ++++++++
 sound/soc/intel/avs/boards/Makefile    |  27 ++
 sound/soc/intel/avs/boards/da7219.c    | 281 ++++++++++++++++++
 sound/soc/intel/avs/boards/dmic.c      |  93 ++++++
 sound/soc/intel/avs/boards/hdaudio.c   | 294 ++++++++++++++++++
 sound/soc/intel/avs/boards/max98357a.c | 153 ++++++++++
 sound/soc/intel/avs/boards/max98373.c  | 238 +++++++++++++++
 sound/soc/intel/avs/boards/nau8825.c   | 352 ++++++++++++++++++++++
 sound/soc/intel/avs/boards/rt274.c     | 309 +++++++++++++++++++
 sound/soc/intel/avs/boards/rt286.c     | 280 ++++++++++++++++++
 sound/soc/intel/avs/boards/rt298.c     | 280 ++++++++++++++++++
 sound/soc/intel/avs/boards/rt5682.c    | 339 +++++++++++++++++++++
 sound/soc/intel/avs/boards/ssm4567.c   | 270 +++++++++++++++++
 sound/soc/intel/avs/boards/ssp_test.c  | 178 +++++++++++
 22 files changed, 3759 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/codecs/hda-dai.c
 create mode 100644 sound/soc/codecs/hda.c
 create mode 100644 sound/soc/codecs/hda.h
 create mode 100644 sound/soc/intel/avs/boards/Kconfig
 create mode 100644 sound/soc/intel/avs/boards/Makefile
 create mode 100644 sound/soc/intel/avs/boards/da7219.c
 create mode 100644 sound/soc/intel/avs/boards/dmic.c
 create mode 100644 sound/soc/intel/avs/boards/hdaudio.c
 create mode 100644 sound/soc/intel/avs/boards/max98357a.c
 create mode 100644 sound/soc/intel/avs/boards/max98373.c
 create mode 100644 sound/soc/intel/avs/boards/nau8825.c
 create mode 100644 sound/soc/intel/avs/boards/rt274.c
 create mode 100644 sound/soc/intel/avs/boards/rt286.c
 create mode 100644 sound/soc/intel/avs/boards/rt298.c
 create mode 100644 sound/soc/intel/avs/boards/rt5682.c
 create mode 100644 sound/soc/intel/avs/boards/ssm4567.c
 create mode 100644 sound/soc/intel/avs/boards/ssp_test.c


base-commit: fa96ec9fa9f8f0c80e8a0129a819f592a39b1044
-- 
2.25.1

