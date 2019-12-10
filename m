Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F101118AD7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A641698;
	Tue, 10 Dec 2019 15:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A641698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988187;
	bh=ScF1lMIuyoR1neTpyqTbl/Da+4GJePLaGCiLFDG9LsA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YVlMzJsvi41BmHsO6y4DIrGpqkATm1gSngvUJ/eNriw9mZND81ZzcCrgHiFD4bY26
	 vfGS6GS2ntLcrCY0CCq7EtisHjyxst/RlEpoRVVAVIT5VCH0YW7HGXBJP8SwKNhJMH
	 m/fOs1T+bhqO3S9oj9ZGmrmf4ZyWbgSsWqEd18ME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD34FF801D8;
	Tue, 10 Dec 2019 15:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E7B6F80278; Tue, 10 Dec 2019 15:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6464FF80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6464FF80217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E985ABC6;
 Tue, 10 Dec 2019 14:26:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:51 +0100
Message-Id: <20191210142614.19405-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@st.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Benson Leung <bleung@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH for-5.6 00/23] ASoC: PCM API updates (part I)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is a patch set to adapt the recent PCM API updates to ASoC
drivers.  This is the first half of the whole changes, just for
updating the buffer allocation code with the new API.  There should be
no functional changes.

The ASoC core changes are already found in 5.5-rc1, so please merge
these onto 5.5-rc1 or later branch.  Or I can merge through my tree,
too, just let me know.


thanks,

Takashi

===

Takashi Iwai (23):
  ASoC: amd: Use managed buffer allocation
  ASoC: au1x: Use managed buffer allocation
  ASoC: dwc: Use managed buffer allocation
  ASoC: mediatek: Use managed buffer allocation
  ASoC: meson: Use managed buffer allocation
  ASoC: dma-sh7760: Use managed buffer allocation
  ASoC: fsi: Use managed buffer allocation
  ASoC: rcar: Use managed buffer allocation
  ASoC: siu_pcm: Use managed buffer allocation
  ASoC: generic-dmaengine-pcm: Use managed buffer allocation
  ASoC: SOF: Use managed buffer allocation
  ASoC: stm32: Use managed buffer allocation
  ASoC: txx9: Use managed buffer allocation
  ASoC: uniphier: Use managed buffer allocation
  ASoC: xilinx: Use managed buffer allocation
  ASoC: xtensa: Use managed buffer allocation
  ASoC: cros_ec_codec: Use managed buffer allocation
  ASoC: rt5514-spi: Use managed buffer allocation
  ASoC: rt5677-spi: Use managed buffer allocation
  ASoC: intel: atom: Use managed buffer allocation
  ASoC: intel: baytrail: Use managed buffer allocation
  ASoC: intel: haswell: Use managed buffer allocation
  ASoC: intel: skylake: Use managed buffer allocation

 sound/soc/amd/acp-pcm-dma.c                        | 58 ++++++++--------------
 sound/soc/amd/raven/acp3x-pcm-dma.c                | 30 +++--------
 sound/soc/au1x/dbdma2.c                            | 14 +-----
 sound/soc/au1x/dma.c                               | 21 +++-----
 sound/soc/codecs/cros_ec_codec.c                   |  8 +--
 sound/soc/codecs/rt5514-spi.c                      | 10 ++--
 sound/soc/codecs/rt5677-spi.c                      | 10 ++--
 sound/soc/dwc/dwc-pcm.c                            | 24 +--------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       | 25 +---------
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        | 19 +------
 sound/soc/intel/haswell/sst-haswell-pcm.c          | 17 +------
 sound/soc/intel/skylake/skl-pcm.c                  | 26 +++-------
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         | 14 +-----
 sound/soc/mediatek/common/mtk-afe-fe-dai.h         |  2 -
 .../soc/mediatek/common/mtk-afe-platform-driver.c  | 12 +----
 .../soc/mediatek/common/mtk-afe-platform-driver.h  |  2 -
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |  2 -
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |  1 -
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |  1 -
 sound/soc/meson/axg-fifo.c                         | 13 ++---
 sound/soc/sh/dma-sh7760.c                          | 14 +-----
 sound/soc/sh/fsi.c                                 | 18 +------
 sound/soc/sh/rcar/core.c                           | 23 +++------
 sound/soc/sh/siu_pcm.c                             | 39 +--------------
 sound/soc/soc-generic-dmaengine-pcm.c              | 12 +----
 sound/soc/sof/pcm.c                                | 34 ++++---------
 sound/soc/stm/stm32_adfsdm.c                       | 29 +----------
 sound/soc/txx9/txx9aclc.c                          | 14 +-----
 sound/soc/uniphier/aio-dma.c                       | 30 +----------
 sound/soc/xilinx/xlnx_formatter_pcm.c              | 13 +----
 sound/soc/xtensa/xtfpga-i2s.c                      |  9 ++--
 31 files changed, 93 insertions(+), 451 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
