Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835883DD12B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9361773;
	Mon,  2 Aug 2021 09:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9361773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889471;
	bh=ZaOpVjhPP2p3OS1WT2K6NOnw9dVOEoE/rKrK/fI2Xtw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YCVuwir8xToNnIAcg0YbRB0rsH2Sxmv5Br3tJ3oamJEzIzt72ExKuxkogPTlP88Dg
	 hOzeXHLaGngmiTUEtrvYzId1gSlKN7KmnYw6adb8GZYBu/53VsHhviiHXLUX89xsFF
	 1Yz+s+AEZTqDrpdQCmj+HjmcYr4szrTwaWcsD18Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE38F804EB;
	Mon,  2 Aug 2021 09:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B7EF804E7; Mon,  2 Aug 2021 09:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8731FF80268
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8731FF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rjZPib5z"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WoOj+F3V"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B3D5F21FB6;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MLt9hWM/aWAAzoIXQKnea2DoJBhKXeFzq8jPIgaX2i4=;
 b=rjZPib5zP4TQCYudBWClQZlo4QCURAxsxnMqaIFgqlmxEGgWr3fenIA9qddtiKkYsPzk+8
 EebGeNLl0u7v3mh80T0fNoZyEeV8Bw2kBa1MvAK2NY4T1FZ0zSPpeZUlozFK5SBuvejTol
 7bGzcmBlqxiGWwZbttohvP8wTDURS38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MLt9hWM/aWAAzoIXQKnea2DoJBhKXeFzq8jPIgaX2i4=;
 b=WoOj+F3VHm59LOWshaTCKPm8bQiYpqyW8Shs/wgci3f8+6MQk411a2wiqUoHt2gpaDmALq
 trm4AOOUBc3dcgDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8F634A3B83;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/15] ALSA: Improved WC memory handling
Date: Mon,  2 Aug 2021 09:28:00 +0200
Message-Id: <20210802072815.13551-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Banajit Goswami <bgoswami@codeaurora.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>
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

Hi,

this is a patchset to enhance the ALSA memory allocation helper to
support the allocation of WC pages more generically as well as
supporting the fixed size buffer allocation.  It allows us to reduce
lots of redundant code in various ASoC drivers that still haven't used
the standard preallocation.

Takashi

===

Takashi Iwai (15):
  ALSA: memalloc: Minor refactoring
  ALSA: memalloc: Correctly name as WC
  ALSA: pcm: Allow exact buffer preallocation
  ALSA: memalloc: Support WC allocation on all architectures
  ALSA: pxa2xx: Use managed PCM buffer allocation
  ASoC: bcm: Use managed PCM buffer allocation
  ASoC: fsl: imx-pcm-fiq: Use managed buffer allocation
  ASoC: fsl: imx-pcm-rpmsg: Use managed buffer allocation
  ASoC: tegra: Use managed buffer allocation
  ASoC: fsl_asrc_dma: Use managed buffer allocation
  ASoC: fsl_dma: Use managed buffer allocation
  ASoC: mpc5200: Use managed buffer allocation
  ASoC: qcom: lpass: Use managed buffer allocation
  ASoC: qcom: qdsp6: Use managed buffer allocation
  ASoC: sprd: Use managed buffer allocation

 include/sound/memalloc.h             |  6 +-
 include/sound/pcm.h                  | 47 ++++++++++++--
 include/sound/pxa2xx-lib.h           | 13 +---
 sound/arm/pxa2xx-ac97.c              | 18 ++----
 sound/arm/pxa2xx-pcm-lib.c           | 90 ++------------------------
 sound/core/memalloc.c                | 94 +++++++++++++++++-----------
 sound/core/memalloc_local.h          |  2 +-
 sound/core/pcm_memory.c              | 67 +++++++++++++++-----
 sound/core/sgbuf.c                   | 21 ++++---
 sound/pci/hda/hda_controller.c       |  2 +-
 sound/pci/hda/hda_intel.c            |  2 +-
 sound/pci/intel8x0.c                 |  2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 82 ++----------------------
 sound/soc/fsl/fsl_asrc_dma.c         | 47 +-------------
 sound/soc/fsl/fsl_dma.c              | 50 +--------------
 sound/soc/fsl/imx-pcm-fiq.c          | 75 +---------------------
 sound/soc/fsl/imx-pcm-rpmsg.c        | 89 +-------------------------
 sound/soc/fsl/mpc5200_dma.c          | 63 +------------------
 sound/soc/pxa/pxa-ssp.c              |  3 -
 sound/soc/pxa/pxa2xx-ac97.c          |  3 -
 sound/soc/pxa/pxa2xx-i2s.c           |  3 -
 sound/soc/pxa/pxa2xx-pcm.c           |  3 -
 sound/soc/qcom/lpass-platform.c      | 60 +-----------------
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 63 +------------------
 sound/soc/sprd/sprd-pcm-dma.c        | 67 +-------------------
 sound/soc/tegra/tegra210_admaif.c    |  6 --
 sound/soc/tegra/tegra_pcm.c          | 93 +--------------------------
 sound/soc/tegra/tegra_pcm.h          |  7 ---
 sound/x86/intel_hdmi_audio.c         |  2 +-
 29 files changed, 209 insertions(+), 871 deletions(-)

===

Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>

-- 
2.26.2

