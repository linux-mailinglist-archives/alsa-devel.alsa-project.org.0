Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA4523855
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3458173E;
	Wed, 11 May 2022 18:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3458173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285732;
	bh=hU7OYJ+Rk2Cj6LVXIJ9Gq9rqJjLgauw2fpSplAQ70m4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MnP+7K/sbL7/lvgz1X331F3FDLkiyGGl9yI9NxzwvHUsgp+m4sdg45hgcRjzqqT7Z
	 jSc6jC7Cm1vmfl9JcNm2VGXDEeunscq0ih7OxJ5QUndHglfBGdxHsEhDLbbJgdGmjP
	 meJSLW/8AapKMgIm1r5CCP4wkHioqH0mDG+vf6rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C5BF804CA;
	Wed, 11 May 2022 18:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11734F8011C; Wed, 11 May 2022 18:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC630F8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC630F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OYRAo4aP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285670; x=1683821670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hU7OYJ+Rk2Cj6LVXIJ9Gq9rqJjLgauw2fpSplAQ70m4=;
 b=OYRAo4aPb1rEqKHAmYvgCUf9fYUk62X8VHgH5JFuBfAlFW9Rh/OMKHok
 CM7cdncZRlxG8vbo1fkduGYp5FqXki9Piv6q3S0m/DQVcbb42pvS0zBCg
 1sraeFm9J527kQOUT9aSOYrhhpuWoPFoliZ/cAt1iFh+GIleN2KIUoHVz
 3Q5hHt+whnHbjiB1OQP00QXKnNoY2yIE+7INCp4tUmoz6JKXLuOpZm5X1
 SPnh9PTdl+pxjU1Kad6iOitY9HrIrhT+X2RqMXlCH/S24zBeX40GXrT05
 Yoj8UmTDSx82LBFjcxll9uvwfcOOFzIpQoAYnVktDCjP5cf2On7UrNoT7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269679926"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269679926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594209596"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:14:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 00/14] ASoC: Intel: avs: Machine boards and HDA codec
 support
Date: Wed, 11 May 2022 18:23:49 +0200
Message-Id: <20220511162403.3987658-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com, rad@semihalf.com,
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


Changes in v2:
- 'link_mask' usage replaced with 'i2s_link_mask' as requested by
  Pierre
- 'ssp_test' board renamed to 'i2s_test' to match naming convention used
  for other i2s machine boards
- enriched commit message and Kconfig for the 'HD-Audio codec driver'
  patch as requested by Kai


[1]: https://lore.kernel.org/all/20220426172346.3508411-1-cezary.rojewski@intel.com/


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Add max98373 machine board

Cezary Rojewski (13):
  ALSA: Add snd_pcm_direction_name() helper
  ASoC: codecs: Add HD-Audio codec driver
  ASoC: Intel: avs: Add HDAudio machine board
  ASoC: Intel: avs: Add DMIC machine board
  ASoC: Intel: avs: Add I2S-test machine board
  ASoC: Intel: avs: Add rt274 machine board
  ASoC: Intel: avs: Add rt286 machine board
  ASoC: Intel: avs: Add rt298 machine board
  ASoC: Intel: avs: Add rt5682 machine board
  ASoC: Intel: avs: Add nau8825 machine board
  ASoC: Intel: avs: Add ssm4567 machine board
  ASoC: Intel: avs: Add max98357a machine board
  ASoC: Intel: avs: Add da7219 machine board

 include/sound/pcm.h                    |  19 +-
 sound/soc/codecs/Kconfig               |  10 +
 sound/soc/codecs/Makefile              |   2 +
 sound/soc/codecs/hda-dai.c             | 102 +++++++
 sound/soc/codecs/hda.c                 | 395 +++++++++++++++++++++++++
 sound/soc/codecs/hda.h                 |  19 ++
 sound/soc/intel/Kconfig                |   3 +
 sound/soc/intel/avs/Makefile           |   3 +
 sound/soc/intel/avs/boards/Kconfig     | 121 ++++++++
 sound/soc/intel/avs/boards/Makefile    |  27 ++
 sound/soc/intel/avs/boards/da7219.c    | 282 ++++++++++++++++++
 sound/soc/intel/avs/boards/dmic.c      |  93 ++++++
 sound/soc/intel/avs/boards/hdaudio.c   | 294 ++++++++++++++++++
 sound/soc/intel/avs/boards/i2s_test.c  | 180 +++++++++++
 sound/soc/intel/avs/boards/max98357a.c | 154 ++++++++++
 sound/soc/intel/avs/boards/max98373.c  | 239 +++++++++++++++
 sound/soc/intel/avs/boards/nau8825.c   | 353 ++++++++++++++++++++++
 sound/soc/intel/avs/boards/rt274.c     | 310 +++++++++++++++++++
 sound/soc/intel/avs/boards/rt286.c     | 281 ++++++++++++++++++
 sound/soc/intel/avs/boards/rt298.c     | 281 ++++++++++++++++++
 sound/soc/intel/avs/boards/rt5682.c    | 340 +++++++++++++++++++++
 sound/soc/intel/avs/boards/ssm4567.c   | 271 +++++++++++++++++
 22 files changed, 3775 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/codecs/hda-dai.c
 create mode 100644 sound/soc/codecs/hda.c
 create mode 100644 sound/soc/codecs/hda.h
 create mode 100644 sound/soc/intel/avs/boards/Kconfig
 create mode 100644 sound/soc/intel/avs/boards/Makefile
 create mode 100644 sound/soc/intel/avs/boards/da7219.c
 create mode 100644 sound/soc/intel/avs/boards/dmic.c
 create mode 100644 sound/soc/intel/avs/boards/hdaudio.c
 create mode 100644 sound/soc/intel/avs/boards/i2s_test.c
 create mode 100644 sound/soc/intel/avs/boards/max98357a.c
 create mode 100644 sound/soc/intel/avs/boards/max98373.c
 create mode 100644 sound/soc/intel/avs/boards/nau8825.c
 create mode 100644 sound/soc/intel/avs/boards/rt274.c
 create mode 100644 sound/soc/intel/avs/boards/rt286.c
 create mode 100644 sound/soc/intel/avs/boards/rt298.c
 create mode 100644 sound/soc/intel/avs/boards/rt5682.c
 create mode 100644 sound/soc/intel/avs/boards/ssm4567.c

-- 
2.25.1

