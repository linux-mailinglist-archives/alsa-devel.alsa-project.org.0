Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECF345D42
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 12:46:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82228166E;
	Tue, 23 Mar 2021 12:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82228166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616499977;
	bh=VqRiWm3HouHtSd1jBhQOtiX2oYBnJVaExMa2h5hJY10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clHWUbgVXcArWHRF5LJyFi2VSx+x49lIYbmEQQh/Nui99eOAyOHkwQKz7U7eojBYY
	 q/SSlZFdKJAN2Fiyhehj8u1nCqa2zQunFXKok4hU2Ekva/s1p1LGtt/cr+K17J51Aj
	 AmQlLLkU6Iw5l81u4lwZKCPfrx7FJXuQn6ciyXvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75FD4F8026D;
	Tue, 23 Mar 2021 12:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98AB0F8026D; Tue, 23 Mar 2021 12:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8C81F8026D
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 12:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C81F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="ytdk5bh2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616499837; x=1648035837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VqRiWm3HouHtSd1jBhQOtiX2oYBnJVaExMa2h5hJY10=;
 b=ytdk5bh2+Q0eOj2uLmSk554/DyJOdgUemKD0B6TFbMJr8frwyPyfXPAP
 XIvdAmQYTlWnXBl6h+yYeHr/xN3FruX7OVa3H1RjqwsqGtn7F5JAPYIAK
 +pOoDkmHfEYmuqbYpYQU1pdnzOVdWL/oixUGCcEJWJXqTDM2+3YnzBD4z
 TeAZmuxlwfAxFKxLa7w3mweuoAIs2eGfNliiWCauc7bFyq72we6FrdNzV
 +2VKYBbDLFD6OVsCl1zl9W8qxgbVhUxQ7DbMj7hgmHJQna5oMejvnK1GZ
 kiPG6CtN6dQpftm1Abjw5dgxu/KUz/YcKaOwdmCA4DHqcgGzGTJp5uB9Q A==;
IronPort-SDR: ylOJ7qzn9A8IIVbzWIDZ4en1Ti2omPD97WBTg7MtxSjphdSZ9Wjae2YD1Nv96z/ZYavhqUJgqm
 YGyGAf8DjIV0JYpDnXvl3zAH+INtfZv0XRYtLBHB6GnsL+ntFB5dprf1uXGiYLkXORLoTa3Nyh
 xQSb7LCebCL2Zw+e9KXNY4BSB++iGVX5d3NJNSMuxM9CUPUCMwcF+RQ/x31dikr/RZhC1sX1Nn
 hXv1wBsei20poFi8MO21My89uiCVTPFmFBZ4XVEyOiE49t7+mDE2aHfwcLjr/m53CZw+73JEbW
 hVQ=
X-IronPort-AV: E=Sophos;i="5.81,271,1610434800"; d="scan'208";a="120072617"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2021 04:43:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 23 Mar 2021 04:43:50 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 23 Mar 2021 04:43:47 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/3] pcm: use substream instead of runtime in
 snd_pcm_hw_rule_add()
Date: Tue, 23 Mar 2021 13:43:25 +0200
Message-ID: <20210323114327.3969072-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: gustavoars@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 mirq-linux@rere.qmqm.pl, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Replace struct snd_pcm_runtime *runtime with struct snd_pcm_substream
*substream in the header of snd_pcm_hw_rule_add(). This will allow us to
use a different struct snd_pcm_hw_constraints later, for BEs. The drivers
that call snd_pcm_hw_rule_add() and its wrappers are also updated.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
 include/sound/ac97_codec.h                    |  2 +-
 include/sound/pcm.h                           | 18 +++---
 include/sound/pcm_drm_eld.h                   |  2 +-
 sound/arm/aaci.c                              |  4 +-
 sound/arm/pxa2xx-pcm-lib.c                    |  4 +-
 sound/core/pcm_drm_eld.c                      |  6 +-
 sound/core/pcm_lib.c                          | 58 ++++++++++---------
 sound/core/pcm_native.c                       | 46 +++++++--------
 sound/drivers/aloop.c                         |  8 +--
 sound/drivers/vx/vx_pcm.c                     |  8 +--
 sound/firewire/amdtp-am824.c                  |  8 +--
 sound/firewire/amdtp-am824.h                  |  2 +-
 sound/firewire/amdtp-stream.c                 | 12 ++--
 sound/firewire/amdtp-stream.h                 |  2 +-
 sound/firewire/bebob/bebob_pcm.c              |  6 +-
 sound/firewire/dice/dice-pcm.c                |  6 +-
 sound/firewire/digi00x/amdtp-dot.c            |  6 +-
 sound/firewire/digi00x/digi00x-pcm.c          |  6 +-
 sound/firewire/digi00x/digi00x.h              |  2 +-
 sound/firewire/fireface/amdtp-ff.c            |  6 +-
 sound/firewire/fireface/ff-pcm.c              |  6 +-
 sound/firewire/fireface/ff.h                  |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c      |  6 +-
 sound/firewire/motu/amdtp-motu.c              |  6 +-
 sound/firewire/motu/motu-pcm.c                |  6 +-
 sound/firewire/motu/motu.h                    |  2 +-
 sound/firewire/oxfw/oxfw-pcm.c                |  6 +-
 sound/firewire/tascam/amdtp-tascam.c          |  6 +-
 sound/firewire/tascam/tascam-pcm.c            |  2 +-
 sound/firewire/tascam/tascam.h                |  2 +-
 sound/pci/ac97/ac97_pcm.c                     |  8 +--
 sound/pci/ali5451/ali5451.c                   |  2 +-
 sound/pci/atiixp.c                            |  2 +-
 sound/pci/atiixp_modem.c                      |  2 +-
 sound/pci/au88x0/au88x0_pcm.c                 |  6 +-
 sound/pci/azt3328.c                           |  2 +-
 sound/pci/bt87x.c                             |  8 +--
 sound/pci/ca0106/ca0106_main.c                |  4 +-
 sound/pci/cmipci.c                            | 14 ++---
 sound/pci/cs4281.c                            |  4 +-
 sound/pci/cs46xx/cs46xx_lib.c                 |  4 +-
 sound/pci/echoaudio/echoaudio.c               | 24 ++++----
 sound/pci/emu10k1/emu10k1x.c                  |  4 +-
 sound/pci/emu10k1/emupcm.c                    | 10 ++--
 sound/pci/ens1370.c                           | 12 ++--
 sound/pci/es1938.c                            |  4 +-
 sound/pci/es1968.c                            |  2 +-
 sound/pci/fm801.c                             |  6 +-
 sound/pci/hda/hda_codec.c                     |  2 +-
 sound/pci/hda/hda_controller.c                |  4 +-
 sound/pci/hda/patch_hdmi.c                    |  8 +--
 sound/pci/hda/patch_si3054.c                  |  2 +-
 sound/pci/ice1712/ice1712.c                   |  8 +--
 sound/pci/ice1712/ice1724.c                   | 30 +++++-----
 sound/pci/intel8x0.c                          | 10 ++--
 sound/pci/intel8x0m.c                         |  2 +-
 sound/pci/lola/lola_pcm.c                     |  4 +-
 sound/pci/mixart/mixart.c                     |  8 +--
 sound/pci/nm256/nm256.c                       |  2 +-
 sound/pci/oxygen/oxygen_pcm.c                 |  8 +--
 sound/pci/pcxhr/pcxhr.c                       |  4 +-
 sound/pci/rme32.c                             | 14 ++---
 sound/pci/rme96.c                             | 17 +++---
 sound/pci/rme9652/hdsp.c                      | 24 ++++----
 sound/pci/rme9652/hdspm.c                     | 12 ++--
 sound/pci/rme9652/rme9652.c                   | 20 +++----
 sound/pci/sonicvibes.c                        |  4 +-
 sound/pci/via82xx.c                           |  4 +-
 sound/pci/via82xx_modem.c                     |  2 +-
 sound/pci/ymfpci/ymfpci_main.c                |  4 +-
 sound/soc/adi/axi-i2s.c                       |  2 +-
 sound/soc/adi/axi-spdif.c                     |  2 +-
 sound/soc/amd/acp-da7219-max98357a.c          | 40 ++++++-------
 sound/soc/atmel/atmel_ssc_dai.c               |  2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c          |  4 +-
 sound/soc/bcm/cygnus-pcm.c                    |  5 +-
 sound/soc/bcm/cygnus-ssp.c                    |  2 +-
 sound/soc/codecs/ad193x.c                     |  2 +-
 sound/soc/codecs/adau1372.c                   |  2 +-
 sound/soc/codecs/ak4458.c                     |  2 +-
 sound/soc/codecs/ak4613.c                     |  6 +-
 sound/soc/codecs/ak5558.c                     |  2 +-
 sound/soc/codecs/cs35l33.c                    |  2 +-
 sound/soc/codecs/cs35l34.c                    |  2 +-
 sound/soc/codecs/cs35l35.c                    |  4 +-
 sound/soc/codecs/cs35l36.c                    |  2 +-
 sound/soc/codecs/cs4234.c                     |  4 +-
 sound/soc/codecs/cs42l73.c                    |  2 +-
 sound/soc/codecs/cs43130.c                    |  4 +-
 sound/soc/codecs/cs53l30.c                    |  2 +-
 sound/soc/codecs/es8316.c                     |  2 +-
 sound/soc/codecs/es8328.c                     |  2 +-
 sound/soc/codecs/hdmi-codec.c                 |  2 +-
 sound/soc/codecs/max98090.c                   |  2 +-
 sound/soc/codecs/max9867.c                    |  2 +-
 sound/soc/codecs/pcm512x.c                    |  6 +-
 sound/soc/codecs/sigmadsp.c                   |  2 +-
 sound/soc/codecs/ssm2602.c                    |  2 +-
 sound/soc/codecs/uda1334.c                    |  2 +-
 sound/soc/codecs/wm8523.c                     |  2 +-
 sound/soc/codecs/wm8524.c                     |  2 +-
 sound/soc/codecs/wm8731.c                     |  2 +-
 sound/soc/codecs/wm8741.c                     |  2 +-
 sound/soc/fsl/fsl_asrc.c                      |  4 +-
 sound/soc/fsl/fsl_easrc.c                     |  2 +-
 sound/soc/fsl/fsl_sai.c                       |  4 +-
 sound/soc/fsl/fsl_ssi.c                       |  2 +-
 sound/soc/fsl/fsl_xcvr.c                      |  9 ++-
 sound/soc/fsl/imx-audmix.c                    |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c             |  4 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  2 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 12 ++--
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 12 ++--
 sound/soc/meson/aiu-encoder-i2s.c             |  2 +-
 sound/soc/meson/aiu-fifo.c                    |  4 +-
 sound/soc/meson/axg-fifo.c                    |  4 +-
 sound/soc/sh/rcar/core.c                      |  6 +-
 sound/soc/soc-pcm.c                           |  2 +-
 sound/soc/sti/uniperif_player.c               |  4 +-
 sound/soc/sti/uniperif_reader.c               |  4 +-
 sound/soc/sunxi/sun4i-codec.c                 |  2 +-
 sound/soc/sunxi/sun8i-codec.c                 |  2 +-
 sound/soc/tegra/tegra_pcm.c                   |  2 +-
 sound/soc/ti/davinci-mcasp.c                  | 12 ++--
 sound/soc/ti/omap-mcbsp.c                     |  4 +-
 sound/soc/uniphier/aio-dma.c                  |  4 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c         |  2 +-
 sound/usb/hiface/pcm.c                        |  2 +-
 sound/usb/line6/capture.c                     |  2 +-
 sound/usb/line6/playback.c                    |  2 +-
 sound/usb/misc/ua101.c                        |  2 +-
 sound/usb/pcm.c                               | 24 ++++----
 134 files changed, 416 insertions(+), 417 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1fda574579af..c933427237cc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1084,7 +1084,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 				VC4_HDMI_RAM_PACKET_ENABLE))
 		return -ENODEV;
 
-	ret = snd_pcm_hw_constraint_eld(substream->runtime, connector->eld);
+	ret = snd_pcm_hw_constraint_eld(substream, connector->eld);
 	if (ret)
 		return ret;
 
diff --git a/include/sound/ac97_codec.h b/include/sound/ac97_codec.h
index 49200ec26dc4..d98130cc23dd 100644
--- a/include/sound/ac97_codec.h
+++ b/include/sound/ac97_codec.h
@@ -404,7 +404,7 @@ int snd_ac97_pcm_assign(struct snd_ac97_bus *ac97,
 int snd_ac97_pcm_open(struct ac97_pcm *pcm, unsigned int rate,
 		      enum ac97_pcm_cfg cfg, unsigned short slots);
 int snd_ac97_pcm_close(struct ac97_pcm *pcm);
-int snd_ac97_pcm_double_rate_rules(struct snd_pcm_runtime *runtime);
+int snd_ac97_pcm_double_rate_rules(struct snd_pcm_substream *substream);
 
 /* ad hoc AC97 device driver access */
 extern struct bus_type ac97_bus_type;
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2e1200d17d0c..af7fce2b574d 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -984,36 +984,36 @@ int snd_pcm_hw_constraint_mask64(struct snd_pcm_runtime *runtime, snd_pcm_hw_par
 int snd_pcm_hw_constraint_minmax(struct snd_pcm_runtime *runtime, snd_pcm_hw_param_t var,
 				 unsigned int min, unsigned int max);
 int snd_pcm_hw_constraint_integer(struct snd_pcm_runtime *runtime, snd_pcm_hw_param_t var);
-int snd_pcm_hw_constraint_list(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_list(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var,
 			       const struct snd_pcm_hw_constraint_list *l);
-int snd_pcm_hw_constraint_ranges(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_ranges(struct snd_pcm_substream *substream,
 				 unsigned int cond,
 				 snd_pcm_hw_param_t var,
 				 const struct snd_pcm_hw_constraint_ranges *r);
-int snd_pcm_hw_constraint_ratnums(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratnums(struct snd_pcm_substream *substream,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratnums *r);
-int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratdens(struct snd_pcm_substream *substream,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratdens *r);
-int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_msbits(struct snd_pcm_substream *substream,
 				 unsigned int cond,
 				 unsigned int width,
 				 unsigned int msbits);
-int snd_pcm_hw_constraint_step(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_step(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var,
 			       unsigned long step);
-int snd_pcm_hw_constraint_pow2(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_pow2(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var);
-int snd_pcm_hw_rule_noresample(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_rule_noresample(struct snd_pcm_substream *substream,
 			       unsigned int base_rate);
-int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_rule_add(struct snd_pcm_substream *substream,
 			unsigned int cond,
 			int var,
 			snd_pcm_hw_rule_func_t func, void *private,
diff --git a/include/sound/pcm_drm_eld.h b/include/sound/pcm_drm_eld.h
index 28a55a8beb28..d5590b12bfda 100644
--- a/include/sound/pcm_drm_eld.h
+++ b/include/sound/pcm_drm_eld.h
@@ -2,6 +2,6 @@
 #ifndef __SOUND_PCM_DRM_ELD_H
 #define __SOUND_PCM_DRM_ELD_H
 
-int snd_pcm_hw_constraint_eld(struct snd_pcm_runtime *runtime, void *eld);
+int snd_pcm_hw_constraint_eld(struct snd_pcm_substream *substream, void *eld);
 
 #endif
diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index 0817ad21af74..b2174db24682 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -419,7 +419,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 		runtime->hw.channels_max = 6;
 
 		/* Add rule describing channel dependency. */
-		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+		ret = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_CHANNELS,
 					  aaci_rule_channels, aaci,
 					  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
@@ -427,7 +427,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 			return ret;
 
 		if (aacirun->pcm->r[1].slots)
-			snd_ac97_pcm_double_rate_rules(runtime);
+			snd_ac97_pcm_double_rate_rules(substream);
 	}
 
 	/*
diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index e81083e1bc68..2ea3146061ae 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -104,12 +104,12 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	 * playback samples are lost if the DMA count is not a multiple
 	 * of the DMA burst size.  Let's add a rule to enforce that.
 	 */
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 		SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
 	if (ret)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
 	if (ret)
 		return ret;
diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 4b5faae5d16e..7988074b9c6f 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -77,17 +77,17 @@ static int eld_limit_channels(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(c, &t);
 }
 
-int snd_pcm_hw_constraint_eld(struct snd_pcm_runtime *runtime, void *eld)
+int snd_pcm_hw_constraint_eld(struct snd_pcm_substream *substream, void *eld)
 {
 	int ret;
 
-	ret = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  eld_limit_rates, eld,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	ret = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  eld_limit_channels, eld,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index b7e3d8f44511..582144f99045 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1107,7 +1107,7 @@ static int snd_interval_step(struct snd_interval *i, unsigned int step)
 
 /**
  * snd_pcm_hw_rule_add - add the hw-constraint rule
- * @runtime: the pcm runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: the variable to evaluate
  * @func: the evaluation function
@@ -1116,15 +1116,17 @@ static int snd_interval_step(struct snd_interval *i, unsigned int step)
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_rule_add(struct snd_pcm_runtime *runtime, unsigned int cond,
+int snd_pcm_hw_rule_add(struct snd_pcm_substream *substream, unsigned int cond,
 			int var,
 			snd_pcm_hw_rule_func_t func, void *private,
 			int dep, ...)
 {
-	struct snd_pcm_hw_constraints *constrs = &runtime->hw_constraints;
+	struct snd_pcm_hw_constraints *constrs =
+					&substream->runtime->hw_constraints;
 	struct snd_pcm_hw_rule *c;
 	unsigned int k;
 	va_list args;
+
 	va_start(args, dep);
 	if (constrs->rules_num >= constrs->rules_all) {
 		struct snd_pcm_hw_rule *new;
@@ -1258,21 +1260,21 @@ static int snd_pcm_hw_rule_list(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_list - apply a list of constraints to a parameter
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the list constraint
  * @l: list
- * 
+ *
  * Apply the list of constraints to an interval parameter.
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_list(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_list(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var,
 			       const struct snd_pcm_hw_constraint_list *l)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var,
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_list, (void *)l,
 				   var, -1);
 }
@@ -1289,7 +1291,7 @@ static int snd_pcm_hw_rule_ranges(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_ranges - apply list of range constraints to a parameter
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the list of range constraints
  * @r: ranges
@@ -1298,12 +1300,12 @@ static int snd_pcm_hw_rule_ranges(struct snd_pcm_hw_params *params,
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_ranges(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_ranges(struct snd_pcm_substream *substream,
 				 unsigned int cond,
 				 snd_pcm_hw_param_t var,
 				 const struct snd_pcm_hw_constraint_ranges *r)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var,
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_ranges, (void *)r,
 				   var, -1);
 }
@@ -1326,19 +1328,19 @@ static int snd_pcm_hw_rule_ratnums(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_ratnums - apply ratnums constraint to a parameter
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the ratnums constraint
  * @r: struct snd_ratnums constriants
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_ratnums(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratnums(struct snd_pcm_substream *substream,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratnums *r)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var,
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_ratnums, (void *)r,
 				   var, -1);
 }
@@ -1360,19 +1362,19 @@ static int snd_pcm_hw_rule_ratdens(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_ratdens - apply ratdens constraint to a parameter
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the ratdens constraint
  * @r: struct snd_ratdens constriants
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_ratdens(struct snd_pcm_substream *substream,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratdens *r)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var,
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_ratdens, (void *)r,
 				   var, -1);
 }
@@ -1399,7 +1401,7 @@ static int snd_pcm_hw_rule_msbits(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_msbits - add a hw constraint msbits rule
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @width: sample bits width
  * @msbits: msbits width
@@ -1411,13 +1413,13 @@ static int snd_pcm_hw_rule_msbits(struct snd_pcm_hw_params *params,
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime, 
+int snd_pcm_hw_constraint_msbits(struct snd_pcm_substream *substream,
 				 unsigned int cond,
 				 unsigned int width,
 				 unsigned int msbits)
 {
 	unsigned long l = (msbits << 16) | width;
-	return snd_pcm_hw_rule_add(runtime, cond, -1,
+	return snd_pcm_hw_rule_add(substream, cond, -1,
 				    snd_pcm_hw_rule_msbits,
 				    (void*) l,
 				    SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
@@ -1433,19 +1435,19 @@ static int snd_pcm_hw_rule_step(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_constraint_step - add a hw constraint step rule
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the step constraint
  * @step: step size
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_step(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_step(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var,
 			       unsigned long step)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var, 
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_step, (void *) step,
 				   var, -1);
 }
@@ -1465,17 +1467,17 @@ static int snd_pcm_hw_rule_pow2(struct snd_pcm_hw_params *params, struct snd_pcm
 
 /**
  * snd_pcm_hw_constraint_pow2 - add a hw constraint power-of-2 rule
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @cond: condition bits
  * @var: hw_params variable to apply the power-of-2 constraint
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_constraint_pow2(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_constraint_pow2(struct snd_pcm_substream *substream,
 			       unsigned int cond,
 			       snd_pcm_hw_param_t var)
 {
-	return snd_pcm_hw_rule_add(runtime, cond, var, 
+	return snd_pcm_hw_rule_add(substream, cond, var,
 				   snd_pcm_hw_rule_pow2, NULL,
 				   var, -1);
 }
@@ -1493,15 +1495,15 @@ static int snd_pcm_hw_rule_noresample_func(struct snd_pcm_hw_params *params,
 
 /**
  * snd_pcm_hw_rule_noresample - add a rule to allow disabling hw resampling
- * @runtime: PCM runtime instance
+ * @substream: the pcm substream
  * @base_rate: the rate at which the hardware does not resample
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_pcm_hw_rule_noresample(struct snd_pcm_runtime *runtime,
+int snd_pcm_hw_rule_noresample(struct snd_pcm_substream *substream,
 			       unsigned int base_rate)
 {
-	return snd_pcm_hw_rule_add(runtime, SNDRV_PCM_HW_PARAMS_NORESAMPLE,
+	return snd_pcm_hw_rule_add(substream, SNDRV_PCM_HW_PARAMS_NORESAMPLE,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   snd_pcm_hw_rule_noresample_func,
 				   (void *)(uintptr_t)base_rate,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..5feeef1b43f1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2420,103 +2420,103 @@ static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 	snd_interval_setinteger(constrs_interval(constrs, SNDRV_PCM_HW_PARAM_SAMPLE_BITS));
 	snd_interval_setinteger(constrs_interval(constrs, SNDRV_PCM_HW_PARAM_FRAME_BITS));
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				   snd_pcm_hw_rule_format, NULL,
 				   SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
 				  snd_pcm_hw_rule_sample_bits, NULL,
-				  SNDRV_PCM_HW_PARAM_FORMAT, 
+				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mul, NULL,
 				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_PERIOD_TIME, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_BUFFER_TIME, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIODS, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIODS,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_div, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  snd_pcm_hw_rule_muldivk, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_TIME, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_mul, NULL,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  snd_pcm_hw_rule_muldivk, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_TIME, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				  snd_pcm_hw_rule_muldivk, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				  snd_pcm_hw_rule_muldivk, (void*) 8,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_FRAME_BITS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_TIME, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_TIME,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
 				  snd_pcm_hw_rule_mulkdiv, (void*) 1000000,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE, SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
@@ -2581,7 +2581,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				  snd_pcm_hw_rule_buffer_bytes_max, substream,
 				  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, -1);
 	if (err < 0)
@@ -2595,7 +2595,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	}
 
 	if (!(hw->rates & (SNDRV_PCM_RATE_KNOT | SNDRV_PCM_RATE_CONTINUOUS))) {
-		err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, 
+		err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					  snd_pcm_hw_rule_rate, hw,
 					  SNDRV_PCM_HW_PARAM_RATE, -1);
 		if (err < 0)
diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 52637180af33..503845db7785 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1226,19 +1226,19 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	/* use dynamic rules based on actual runtime->hw values */
 	/* note that the default rules created in the PCM midlevel code */
 	/* are cached -> they do not reflect the actual state */
-	err = snd_pcm_hw_rule_add(runtime, 0,
+	err = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  rule_format, dpcm,
 				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 	if (err < 0)
 		goto unlock;
-	err = snd_pcm_hw_rule_add(runtime, 0,
+	err = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  rule_rate, dpcm,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto unlock;
-	err = snd_pcm_hw_rule_add(runtime, 0,
+	err = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  rule_channels, dpcm,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
@@ -1250,7 +1250,7 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	 * This rule only takes effect if a sound timer was chosen
 	 */
 	if (cable->snd_timer.instance) {
-		err = snd_pcm_hw_rule_add(runtime, 0,
+		err = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					  rule_period_bytes, dpcm,
 					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES, -1);
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index daffda99b4f7..12e9d53a5f48 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -541,8 +541,8 @@ static int vx_pcm_playback_open(struct snd_pcm_substream *subs)
 	runtime->private_data = pipe;
 
 	/* align to 4 bytes (otherwise will be problematic when 24bit is used) */ 
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 4);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 4);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
 
 	return 0;
 }
@@ -924,8 +924,8 @@ static int vx_pcm_capture_open(struct snd_pcm_substream *subs)
 	runtime->private_data = pipe;
 
 	/* align to 4 bytes (otherwise will be problematic when 24bit is used) */ 
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 4);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 4);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
 
 	return 0;
 }
diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index fea92e148790..08380824166c 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -224,20 +224,20 @@ static void write_pcm_silence(struct amdtp_stream *s,
 /**
  * amdtp_am824_add_pcm_hw_constraints - add hw constraints for PCM substream
  * @s:		the AMDTP stream for AM824 data block, must be initialized.
- * @runtime:	the PCM substream runtime
+ * @pcm:	the PCM substream
  *
  */
 int amdtp_am824_add_pcm_hw_constraints(struct amdtp_stream *s,
-				       struct snd_pcm_runtime *runtime)
+				       struct snd_pcm_substream *pcm)
 {
 	int err;
 
-	err = amdtp_stream_add_pcm_hw_constraints(s, runtime);
+	err = amdtp_stream_add_pcm_hw_constraints(s, pcm);
 	if (err < 0)
 		return err;
 
 	/* AM824 in IEC 61883-6 can deliver 24bit data. */
-	return snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	return snd_pcm_hw_constraint_msbits(pcm, 0, 32, 24);
 }
 EXPORT_SYMBOL_GPL(amdtp_am824_add_pcm_hw_constraints);
 
diff --git a/sound/firewire/amdtp-am824.h b/sound/firewire/amdtp-am824.h
index 06d280783581..13fea73639d6 100644
--- a/sound/firewire/amdtp-am824.h
+++ b/sound/firewire/amdtp-am824.h
@@ -39,7 +39,7 @@ void amdtp_am824_set_midi_position(struct amdtp_stream *s,
 				   unsigned int position);
 
 int amdtp_am824_add_pcm_hw_constraints(struct amdtp_stream *s,
-				       struct snd_pcm_runtime *runtime);
+				       struct snd_pcm_substream *pcm);
 
 void amdtp_am824_midi_trigger(struct amdtp_stream *s, unsigned int port,
 			      struct snd_rawmidi_substream *midi);
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 4e2f2bb7879f..eef5c3d90297 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -173,12 +173,12 @@ static int apply_constraint_to_size(struct snd_pcm_hw_params *params,
 /**
  * amdtp_stream_add_pcm_hw_constraints - add hw constraints for PCM substream
  * @s:		the AMDTP stream, which must be initialized.
- * @runtime:	the PCM substream runtime
+ * @pcm:	the PCM substream
  */
 int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
-					struct snd_pcm_runtime *runtime)
+					struct snd_pcm_substream *pcm)
 {
-	struct snd_pcm_hardware *hw = &runtime->hw;
+	struct snd_pcm_hardware *hw = &pcm->runtime->hw;
 	unsigned int ctx_header_size;
 	unsigned int maximum_usec_per_period;
 	int err;
@@ -228,7 +228,7 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	// Due to the above protocol design, the minimum PCM frames per
 	// interrupt should be double of the value of syt interval, thus it is
 	// 250 usec.
-	err = snd_pcm_hw_constraint_minmax(runtime,
+	err = snd_pcm_hw_constraint_minmax(pcm->runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_TIME,
 					   250, maximum_usec_per_period);
 	if (err < 0)
@@ -244,13 +244,13 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	 * depending on its sampling rate. For accurate period interrupt, it's
 	 * preferrable to align period/buffer sizes to current SYT_INTERVAL.
 	 */
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+	err = snd_pcm_hw_rule_add(pcm, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  apply_constraint_to_size, NULL,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto end;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+	err = snd_pcm_hw_rule_add(pcm, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  apply_constraint_to_size, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a3daa1f2c1c4..de2e9f0831d9 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -197,7 +197,7 @@ unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s);
 void amdtp_stream_update(struct amdtp_stream *s);
 
 int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
-					struct snd_pcm_runtime *runtime);
+					struct snd_pcm_substream *pcm);
 
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s);
 void amdtp_stream_pcm_abort(struct amdtp_stream *s);
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index f8d9a2041264..279264ce935c 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -112,19 +112,19 @@ pcm_init_hw_params(struct snd_bebob *bebob,
 
 	limit_channels_and_rates(&runtime->hw, formations);
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, formations,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto end;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, formations,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		goto end;
 
-	err = amdtp_am824_add_pcm_hw_constraints(s, runtime);
+	err = amdtp_am824_add_pcm_hw_constraints(s, substream);
 end:
 	return err;
 }
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index af8a90ee40f3..5e7e3ebd47b0 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -147,18 +147,18 @@ static int init_hw_info(struct snd_dice *dice,
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  dice_rate_constraint, substream,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  dice_channels_constraint, substream,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
 
-	return amdtp_am824_add_pcm_hw_constraints(stream, runtime);
+	return amdtp_am824_add_pcm_hw_constraints(stream, substream);
 }
 
 static int pcm_open(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index d613642a2ce3..2188434b8642 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -320,16 +320,16 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 }
 
 int amdtp_dot_add_pcm_hw_constraints(struct amdtp_stream *s,
-				     struct snd_pcm_runtime *runtime)
+				     struct snd_pcm_substream *pcm)
 {
 	int err;
 
 	/* This protocol delivers 24 bit data in 32bit data channel. */
-	err = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	err = snd_pcm_hw_constraint_msbits(pcm, 0, 32, 24);
 	if (err < 0)
 		return err;
 
-	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
+	return amdtp_stream_add_pcm_hw_constraints(s, pcm);
 }
 
 void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index b7f6eda09f9f..a30eda437cb7 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -80,21 +80,21 @@ static int pcm_init_hw_params(struct snd_dg00x *dg00x,
 		    SNDRV_PCM_RATE_96000;
 	snd_pcm_limit_hw_rates(runtime);
 
-	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	err = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, NULL,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	err = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, NULL,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
 
-	return amdtp_dot_add_pcm_hw_constraints(s, substream->runtime);
+	return amdtp_dot_add_pcm_hw_constraints(s, substream);
 }
 
 static int pcm_open(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 129de8edd5ea..da81bff07f70 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -121,7 +121,7 @@ int amdtp_dot_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			     unsigned int pcm_channels);
 void amdtp_dot_reset(struct amdtp_stream *s);
 int amdtp_dot_add_pcm_hw_constraints(struct amdtp_stream *s,
-				     struct snd_pcm_runtime *runtime);
+				     struct snd_pcm_substream *pcm);
 void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 			  struct snd_rawmidi_substream *midi);
 
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 119c0076b17a..345d6bcdc610 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -101,15 +101,15 @@ static void write_pcm_silence(struct amdtp_stream *s,
 }
 
 int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
-				    struct snd_pcm_runtime *runtime)
+				    struct snd_pcm_substream *pcm)
 {
 	int err;
 
-	err = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	err = snd_pcm_hw_constraint_msbits(pcm, 0, 32, 24);
 	if (err < 0)
 		return err;
 
-	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
+	return amdtp_stream_add_pcm_hw_constraints(s, pcm);
 }
 
 static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index f978cc2fed7d..89c4e3d52470 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -121,19 +121,19 @@ static int pcm_init_hw_params(struct snd_ff *ff,
 
 	limit_channels_and_rates(&runtime->hw, pcm_channels);
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, (void *)pcm_channels,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, (void *)pcm_channels,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
 
-	return amdtp_ff_add_pcm_hw_constraints(s, runtime);
+	return amdtp_ff_add_pcm_hw_constraints(s, substream);
 }
 
 static int pcm_open(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 705e7df4f929..99a2c06e3bb6 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -138,7 +138,7 @@ void snd_ff_transaction_unregister(struct snd_ff *ff);
 int amdtp_ff_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			    unsigned int pcm_channels);
 int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
-				    struct snd_pcm_runtime *runtime);
+				    struct snd_pcm_substream *substream);
 int amdtp_ff_init(struct amdtp_stream *s, struct fw_unit *unit,
 		  enum amdtp_stream_direction dir);
 
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index a0d5db1d8eb2..f6f611cb3a09 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -153,19 +153,19 @@ pcm_init_hw_params(struct snd_efw *efw,
 
 	limit_channels(&runtime->hw, pcm_channels);
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, pcm_channels,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto end;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, pcm_channels,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		goto end;
 
-	err = amdtp_am824_add_pcm_hw_constraints(s, runtime);
+	err = amdtp_am824_add_pcm_hw_constraints(s, substream);
 end:
 	return err;
 }
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index edb31ac26868..17827a3948d0 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -210,16 +210,16 @@ static void write_pcm_silence(struct amdtp_stream *s, __be32 *buffer,
 }
 
 int amdtp_motu_add_pcm_hw_constraints(struct amdtp_stream *s,
-				      struct snd_pcm_runtime *runtime)
+				      struct snd_pcm_substream *pcm)
 {
 	int err;
 
 	/* TODO: how to set an constraint for exactly 24bit PCM sample? */
-	err = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	err = snd_pcm_hw_constraint_msbits(pcm, 0, 32, 24);
 	if (err < 0)
 		return err;
 
-	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
+	return amdtp_stream_add_pcm_hw_constraints(s, pcm);
 }
 
 void amdtp_motu_midi_trigger(struct amdtp_stream *s, unsigned int port,
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 8e1437371263..b481097ec5f3 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -113,18 +113,18 @@ static int init_hw_info(struct snd_motu *motu,
 
 	limit_channels_and_rates(motu, runtime, formats);
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  motu_rate_constraint, formats,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  motu_channels_constraint, formats,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
 
-	return amdtp_motu_add_pcm_hw_constraints(stream, runtime);
+	return amdtp_motu_add_pcm_hw_constraints(stream, substream);
 }
 
 static int pcm_open(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 3d0236ee6716..c5f5552f5fc8 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -129,7 +129,7 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 			      unsigned int midi_ports,
 			      struct snd_motu_packet_format *formats);
 int amdtp_motu_add_pcm_hw_constraints(struct amdtp_stream *s,
-				      struct snd_pcm_runtime *runtime);
+				      struct snd_pcm_substream *pcm);
 void amdtp_motu_midi_trigger(struct amdtp_stream *s, unsigned int port,
 			     struct snd_rawmidi_substream *midi);
 
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 2dfa7e179cb6..4a014593296b 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -126,19 +126,19 @@ static int init_hw_params(struct snd_oxfw *oxfw,
 
 	limit_channels_and_rates(&runtime->hw, formats);
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, formats,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto end;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, formats,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		goto end;
 
-	err = amdtp_am824_add_pcm_hw_constraints(stream, runtime);
+	err = amdtp_am824_add_pcm_hw_constraints(stream, substream);
 end:
 	return err;
 }
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index f823a2ab3544..820d2daa800a 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -111,7 +111,7 @@ static void write_pcm_silence(struct amdtp_stream *s, __be32 *buffer,
 }
 
 int amdtp_tscm_add_pcm_hw_constraints(struct amdtp_stream *s,
-				      struct snd_pcm_runtime *runtime)
+				      struct snd_pcm_substream *pcm)
 {
 	int err;
 
@@ -119,11 +119,11 @@ int amdtp_tscm_add_pcm_hw_constraints(struct amdtp_stream *s,
 	 * Our implementation allows this protocol to deliver 24 bit sample in
 	 * 32bit data channel.
 	 */
-	err = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	err = snd_pcm_hw_constraint_msbits(pcm, 0, 32, 24);
 	if (err < 0)
 		return err;
 
-	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
+	return amdtp_stream_add_pcm_hw_constraints(s, pcm);
 }
 
 static void read_status_messages(struct amdtp_stream *s,
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 36c1353f2494..a36cda1438d2 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -37,7 +37,7 @@ static int pcm_init_hw_params(struct snd_tscm *tscm,
 		    SNDRV_PCM_RATE_96000;
 	snd_pcm_limit_hw_rates(runtime);
 
-	return amdtp_tscm_add_pcm_hw_constraints(stream, runtime);
+	return amdtp_tscm_add_pcm_hw_constraints(stream, substream);
 }
 
 static int pcm_open(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 78b7a08986a1..afbab9329d20 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -160,7 +160,7 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 		  enum amdtp_stream_direction dir, unsigned int pcm_channels);
 int amdtp_tscm_set_parameters(struct amdtp_stream *s, unsigned int rate);
 int amdtp_tscm_add_pcm_hw_constraints(struct amdtp_stream *s,
-				      struct snd_pcm_runtime *runtime);
+				      struct snd_pcm_substream *pcm);
 
 int snd_tscm_stream_get_rate(struct snd_tscm *tscm, unsigned int *rate);
 int snd_tscm_stream_get_clock(struct snd_tscm *tscm,
diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 491de1a623cb..002d68b8952c 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -712,23 +712,23 @@ static int double_rate_hw_constraint_channels(struct snd_pcm_hw_params *params,
 
 /**
  * snd_ac97_pcm_double_rate_rules - set double rate constraints
- * @runtime: the runtime of the ac97 front playback pcm
+ * @substream: the substream of the ac97 front playback pcm
  *
  * Installs the hardware constraint rules to prevent using double rates and
  * more than two channels at the same time.
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-int snd_ac97_pcm_double_rate_rules(struct snd_pcm_runtime *runtime)
+int snd_ac97_pcm_double_rate_rules(struct snd_pcm_substream *substream)
 {
 	int err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  double_rate_hw_constraint_rate, NULL,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  double_rate_hw_constraint_channels, NULL,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	return err;
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 0d66b92466d5..9d19b5ff0607 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1569,7 +1569,7 @@ static int snd_ali_modem_open(struct snd_pcm_substream *substream, int rec,
 
 	if (err)
 		return err;
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &hw_constraint_rates);
 }
 
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 579425ccbb6a..32aca93254e7 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1082,7 +1082,7 @@ static int snd_atiixp_playback_open(struct snd_pcm_substream *substream)
 	substream->runtime->hw.channels_max = chip->max_channels;
 	if (chip->max_channels > 2)
 		/* channels must be even */
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 	return 0;
 }
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 45e75afec7a0..cfc0edcd60e2 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -856,7 +856,7 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 	dma->substream = substream;
 	runtime->hw = snd_atiixp_pcm_hw;
 	dma->ac97_pcm_type = pcm_type;
-	if ((err = snd_pcm_hw_constraint_list(runtime, 0,
+	if ((err = snd_pcm_hw_constraint_list(substream, 0,
 					      SNDRV_PCM_HW_PARAM_RATE,
 					      &hw_constraints_rates)) < 0)
 		return err;
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index d019aa566de3..d072366ee67f 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -136,11 +136,11 @@ static int snd_vortex_pcm_open(struct snd_pcm_substream *substream)
 		return err;
 	/* Avoid PAGE_SIZE boundary to fall inside of a period. */
 	if ((err =
-	     snd_pcm_hw_constraint_pow2(runtime, 0,
+	     snd_pcm_hw_constraint_pow2(substream, 0,
 					SNDRV_PCM_HW_PARAM_PERIOD_BYTES)) < 0)
 		return err;
 
-	snd_pcm_hw_constraint_step(runtime, 0,
+	snd_pcm_hw_constraint_step(substream, 0,
 					SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 64);
 
 	if (VORTEX_PCM_TYPE(substream->pcm) != VORTEX_PCM_WT) {
@@ -171,7 +171,7 @@ static int snd_vortex_pcm_open(struct snd_pcm_substream *substream)
 			VORTEX_IS_QUAD(vortex) &&
 			VORTEX_PCM_TYPE(substream->pcm) == VORTEX_PCM_ADB) {
 			runtime->hw.channels_max = 4;
-			snd_pcm_hw_constraint_list(runtime, 0,
+			snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_CHANNELS,
 				&hw_constraints_au8830_channels);
 		}
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 51dcf1bc4c0c..40d2021ed46f 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2024,7 +2024,7 @@ snd_azf3328_pcm_open(struct snd_pcm_substream *substream,
 	/* same parameters for all our codecs - at least we think so... */
 	runtime->hw = snd_azf3328_hardware;
 
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &snd_azf3328_hw_constraints_rates);
 	runtime->private_data = codec;
 	return 0;
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 91512b345d19..e6fd99a9145d 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -379,7 +379,7 @@ static int snd_bt87x_set_digital_hw(struct snd_bt87x *chip, struct snd_pcm_runti
 	return 0;
 }
 
-static int snd_bt87x_set_analog_hw(struct snd_bt87x *chip, struct snd_pcm_runtime *runtime)
+static int snd_bt87x_set_analog_hw(struct snd_bt87x *chip, struct snd_pcm_substream *substream)
 {
 	static const struct snd_ratnum analog_clock = {
 		.num = ANALOG_CLOCK,
@@ -393,8 +393,8 @@ static int snd_bt87x_set_analog_hw(struct snd_bt87x *chip, struct snd_pcm_runtim
 	};
 
 	chip->reg_control &= ~(CTL_DA_IOM_DA | CTL_A_PWRDN);
-	runtime->hw = snd_bt87x_analog_hw;
-	return snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	substream->runtime->hw = snd_bt87x_analog_hw;
+	return snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					     &constraint_rates);
 }
 
@@ -410,7 +410,7 @@ static int snd_bt87x_pcm_open(struct snd_pcm_substream *substream)
 	if (substream->pcm->device == DEVICE_DIGITAL)
 		err = snd_bt87x_set_digital_hw(chip, runtime);
 	else
-		err = snd_bt87x_set_analog_hw(chip, runtime);
+		err = snd_bt87x_set_analog_hw(chip, substream);
 	if (err < 0)
 		goto _error;
 
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index bee4710916c4..5563cfed12fa 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -577,7 +577,7 @@ static int snd_ca0106_pcm_open_playback_channel(struct snd_pcm_substream *substr
 	channel->epcm = epcm;
 	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
                 return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	if ((err = snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
                 return err;
 	snd_pcm_set_sync(substream);
 
@@ -671,7 +671,7 @@ static int snd_ca0106_pcm_open_capture_channel(struct snd_pcm_substream *substre
 	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
                 return err;
 	//snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_capture_period_sizes);
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	if ((err = snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
                 return err;
 	return 0;
 }
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 598446348da6..55a1e137456c 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1647,7 +1647,7 @@ static int snd_cmipci_playback_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
+		err = snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 		if (err < 0)
 			return err;
@@ -1672,7 +1672,7 @@ static int snd_cmipci_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_min = 41000;
 		runtime->hw.rates = SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
+		err = snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 		if (err < 0)
 			return err;
@@ -1697,11 +1697,11 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 		if (cm->can_multi_ch) {
 			runtime->hw.channels_max = cm->max_channels;
 			if (cm->max_channels == 4)
-				snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_4);
+				snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_4);
 			else if (cm->max_channels == 6)
-				snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_6);
+				snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_6);
 			else if (cm->max_channels == 8)
-				snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_8);
+				snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_8);
 		}
 	}
 	mutex_unlock(&cm->open_mutex);
@@ -1710,7 +1710,7 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_RATE_96000;
 		runtime->hw.rate_max = 96000;
 	} else if (cm->chip_version == 55) {
-		err = snd_pcm_hw_constraint_list(runtime, 0,
+		err = snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 		if (err < 0)
 			return err;
@@ -1733,7 +1733,7 @@ static int snd_cmipci_playback_spdif_open(struct snd_pcm_substream *substream)
 		runtime->hw = snd_cmipci_playback_spdif;
 		if (cm->chip_version >= 37) {
 			runtime->hw.formats |= SNDRV_PCM_FMTBIT_S32_LE;
-			snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+			snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 		}
 		if (cm->can_96k) {
 			runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index bf3bb70ffaf9..8053ec410ff7 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -884,7 +884,7 @@ static int snd_cs4281_playback_open(struct snd_pcm_substream *substream)
 	/* should be detected from the AC'97 layer, but it seems
 	   that although CS4297A rev B reports 18-bit ADC resolution,
 	   samples are 20-bit */
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 20);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 20);
 	return 0;
 }
 
@@ -903,7 +903,7 @@ static int snd_cs4281_capture_open(struct snd_pcm_substream *substream)
 	/* should be detected from the AC'97 layer, but it seems
 	   that although CS4297A rev B reports 18-bit ADC resolution,
 	   samples are 20-bit */
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 20);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 20);
 	return 0;
 }
 
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 37f516e6a5c2..c7375c9b47b8 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1511,7 +1511,7 @@ static int _cs46xx_playback_open_channel (struct snd_pcm_substream *substream,in
 	cpcm->pcm_channel_id = pcm_channel_id;
 
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 
 				   &hw_constraints_period_sizes);
 
@@ -1594,7 +1594,7 @@ static int snd_cs46xx_capture_open(struct snd_pcm_substream *substream)
 	chip->active_ctrl(chip, 1);
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 
 				   &hw_constraints_period_sizes);
 #endif
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 9bd67ac33657..ae0d864aed5d 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -301,7 +301,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 
 	/* Only mono and any even number of channels are allowed */
-	if ((err = snd_pcm_hw_constraint_list(runtime, 0,
+	if ((err = snd_pcm_hw_constraint_list(substream, 0,
 					      SNDRV_PCM_HW_PARAM_CHANNELS,
 					      &pipe->constr)) < 0)
 		return err;
@@ -314,16 +314,16 @@ static int pcm_open(struct snd_pcm_substream *substream,
 	/* The hw accesses memory in chunks 32 frames long and they should be
 	32-bytes-aligned. It's not a requirement, but it seems that IRQs are
 	generated with a resolution of 32 frames. Thus we need the following */
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0,
+	if ((err = snd_pcm_hw_constraint_step(substream, 0,
 					      SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 					      32)) < 0)
 		return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0,
+	if ((err = snd_pcm_hw_constraint_step(substream, 0,
 					      SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 					      32)) < 0)
 		return err;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_RATE,
 					hw_rule_sample_rate, chip,
 				       SNDRV_PCM_HW_PARAM_RATE, -1)) < 0)
@@ -361,12 +361,12 @@ static int pcm_analog_in_open(struct snd_pcm_substream *substream)
 	if ((err = pcm_open(substream, num_analog_busses_in(chip) -
 			    substream->number)) < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_CHANNELS,
 				       hw_rule_capture_channels_by_format, NULL,
 				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_FORMAT,
 				       hw_rule_capture_format_by_channels, NULL,
 				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
@@ -389,13 +389,13 @@ static int pcm_analog_out_open(struct snd_pcm_substream *substream)
 #endif
 	if ((err = pcm_open(substream, max_channels - substream->number)) < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_CHANNELS,
 				       hw_rule_playback_channels_by_format,
 				       NULL,
 				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_FORMAT,
 				       hw_rule_playback_format_by_channels,
 				       NULL,
@@ -426,12 +426,12 @@ static int pcm_digital_in_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto din_exit;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_CHANNELS,
 				       hw_rule_capture_channels_by_format, NULL,
 				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
 		goto din_exit;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_FORMAT,
 				       hw_rule_capture_format_by_channels, NULL,
 				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
@@ -463,13 +463,13 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto dout_exit;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_CHANNELS,
 				       hw_rule_playback_channels_by_format,
 				       NULL, SNDRV_PCM_HW_PARAM_FORMAT,
 				       -1)) < 0)
 		goto dout_exit;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
+	if ((err = snd_pcm_hw_rule_add(substream, 0,
 				       SNDRV_PCM_HW_PARAM_FORMAT,
 				       hw_rule_playback_format_by_channels,
 				       NULL, SNDRV_PCM_HW_PARAM_CHANNELS,
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index d9a12cd01647..a223f3ae3c58 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -374,7 +374,7 @@ static int snd_emu10k1x_playback_open(struct snd_pcm_substream *substream)
 	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0) {
 		return err;
 	}
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	if ((err = snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
                 return err;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
@@ -552,7 +552,7 @@ static int snd_emu10k1x_pcm_open_capture(struct snd_pcm_substream *substream)
 
 	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
                 return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	if ((err = snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
                 return err;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b2ddabb99438..8eea793adec3 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1136,7 +1136,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 		sample_rate = 44100;
 	else
 		sample_rate = 48000;
-	err = snd_pcm_hw_rule_noresample(runtime, sample_rate);
+	err = snd_pcm_hw_rule_noresample(substream, sample_rate);
 	if (err < 0) {
 		kfree(epcm);
 		return err;
@@ -1185,8 +1185,8 @@ static int snd_emu10k1_capture_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_emu10k1_capture;
 	emu->capture_interrupt = snd_emu10k1_pcm_ac97adc_interrupt;
 	emu->pcm_capture_substream = substream;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_capture_rates);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_capture_rates);
 	return 0;
 }
 
@@ -1224,7 +1224,7 @@ static int snd_emu10k1_capture_mic_open(struct snd_pcm_substream *substream)
 	runtime->hw.channels_min = 1;
 	emu->capture_mic_interrupt = snd_emu10k1_pcm_ac97mic_interrupt;
 	emu->pcm_capture_mic_substream = substream;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
 	return 0;
 }
 
@@ -1332,7 +1332,7 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	spin_unlock_irq(&emu->reg_lock);
 	emu->capture_efx_interrupt = snd_emu10k1_pcm_efx_interrupt;
 	emu->pcm_capture_efx_substream = substream;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, &hw_constraints_capture_period_sizes);
 	return 0;
 }
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 3ccccdbc0029..4fe8fc2f77d3 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1105,10 +1105,10 @@ static int snd_ensoniq_playback1_open(struct snd_pcm_substream *substream)
 		ensoniq->spdif_stream = ensoniq->spdif_default;
 	spin_unlock_irq(&ensoniq->reg_lock);
 #ifdef CHIP1370
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &snd_es1370_hw_constraints_rates);
 #else
-	snd_pcm_hw_constraint_ratdens(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratdens(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1371_hw_constraints_dac_clock);
 #endif
 	return 0;
@@ -1128,10 +1128,10 @@ static int snd_ensoniq_playback2_open(struct snd_pcm_substream *substream)
 		ensoniq->spdif_stream = ensoniq->spdif_default;
 	spin_unlock_irq(&ensoniq->reg_lock);
 #ifdef CHIP1370
-	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1370_hw_constraints_clock);
 #else
-	snd_pcm_hw_constraint_ratdens(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratdens(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1371_hw_constraints_dac_clock);
 #endif
 	return 0;
@@ -1147,10 +1147,10 @@ static int snd_ensoniq_capture_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_ensoniq_capture;
 	snd_pcm_set_sync(substream);
 #ifdef CHIP1370
-	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1370_hw_constraints_clock);
 #else
-	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1371_hw_constraints_adc_clock);
 #endif
 	return 0;
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index afc66347d162..f1e95e38388c 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -913,7 +913,7 @@ static int snd_es1938_capture_open(struct snd_pcm_substream *substream)
 		return -EAGAIN;
 	chip->capture_substream = substream;
 	runtime->hw = snd_es1938_capture;
-	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &hw_constraints_clocks);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 0, 0xff00);
 	return 0;
@@ -938,7 +938,7 @@ static int snd_es1938_playback_open(struct snd_pcm_substream *substream)
 		return -EINVAL;
 	}
 	runtime->hw = snd_es1938_playback;
-	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratnums(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &hw_constraints_clocks);
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 0, 0xff00);
 	return 0;
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 5fa1861236f5..e6446bf66be9 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1612,7 +1612,7 @@ static int snd_es1968_capture_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_es1968_capture;
 	runtime->hw.buffer_bytes_max = runtime->hw.period_bytes_max =
 		calc_available_memory_size(chip) - 1024; /* keep MIXBUF size */
-	snd_pcm_hw_constraint_pow2(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES);
+	snd_pcm_hw_constraint_pow2(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES);
 
 	spin_lock_irq(&chip->substream_lock);
 	list_add(&es->list, &chip->substream_list);
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 6279eb156e36..e3128a3448a1 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -651,11 +651,11 @@ static int snd_fm801_playback_open(struct snd_pcm_substream *substream)
 
 	chip->playback_substream = substream;
 	runtime->hw = snd_fm801_playback;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &hw_constraints_rates);
 	if (chip->multichannel) {
 		runtime->hw.channels_max = 6;
-		snd_pcm_hw_constraint_list(runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &hw_constraints_channels);
 	}
@@ -672,7 +672,7 @@ static int snd_fm801_capture_open(struct snd_pcm_substream *substream)
 
 	chip->capture_substream = substream;
 	runtime->hw = snd_fm801_capture;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &hw_constraints_rates);
 	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
 		return err;
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 2026f1ccaf5a..d8995b3b1e3d 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3735,7 +3735,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 		}
 		mutex_unlock(&codec->spdif_mutex);
 	}
-	return snd_pcm_hw_constraint_step(substream->runtime, 0,
+	return snd_pcm_hw_constraint_step(substream, 0,
 					  SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_open);
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index ca2f2ecd1488..8fc7fd6ce1d8 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -624,9 +624,9 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 		   option needs to be disabled */
 		buff_step = 4;
 
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   buff_step);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   buff_step);
 	snd_hda_power_up(apcm->codec);
 	if (hinfo->ops.open)
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 45ae845e82df..561492e98547 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1202,7 +1202,7 @@ static int hdmi_pcm_open_no_pin(struct hda_pcm_stream *hinfo,
 	runtime->hw.formats = hinfo->formats;
 	runtime->hw.rates = hinfo->rates;
 
-	snd_pcm_hw_constraint_step(substream->runtime, 0,
+	snd_pcm_hw_constraint_step(substream, 0,
 				   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 	return 0;
 }
@@ -1298,7 +1298,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	runtime->hw.formats = hinfo->formats;
 	runtime->hw.rates = hinfo->rates;
 
-	snd_pcm_hw_constraint_step(substream->runtime, 0,
+	snd_pcm_hw_constraint_step(substream, 0,
 				   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
  unlock:
 	mutex_unlock(&spec->pcm_lock);
@@ -3244,11 +3244,11 @@ static int simple_playback_pcm_open(struct hda_pcm_stream *hinfo,
 	}
 
 	if (hw_constraints_channels != NULL) {
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_CHANNELS,
 				hw_constraints_channels);
 	} else {
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 	}
 
diff --git a/sound/pci/hda/patch_si3054.c b/sound/pci/hda/patch_si3054.c
index 763eae80a148..df70ae48cae0 100644
--- a/sound/pci/hda/patch_si3054.c
+++ b/sound/pci/hda/patch_si3054.c
@@ -162,7 +162,7 @@ static int si3054_pcm_open(struct hda_pcm_stream *hinfo,
 		.mask = 0,
 	};
 	substream->runtime->hw.period_bytes_min = 80;
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 }
 
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index d54cd5143e9f..fc3f90c644f4 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -1130,8 +1130,8 @@ static int snd_ice1712_playback_pro_open(struct snd_pcm_substream *substream)
 	ice->playback_pro_substream = substream;
 	runtime->hw = snd_ice1712_playback_pro;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 	if (is_pro_rate_locked(ice)) {
 		runtime->hw.rate_min = PRO_RATE_DEFAULT;
 		runtime->hw.rate_max = PRO_RATE_DEFAULT;
@@ -1151,8 +1151,8 @@ static int snd_ice1712_capture_pro_open(struct snd_pcm_substream *substream)
 	ice->capture_pro_substream = substream;
 	runtime->hw = snd_ice1712_capture_pro;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_constraints_rates);
 	if (is_pro_rate_locked(ice)) {
 		runtime->hw.rate_min = PRO_RATE_DEFAULT;
 		runtime->hw.rate_max = PRO_RATE_DEFAULT;
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index ef2367d86148..5f31cd58e4bc 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -972,7 +972,7 @@ static int set_rate_constraints(struct snd_ice1712 *ice,
 	runtime->hw.rate_min = ice->hw_rates->list[0];
 	runtime->hw.rate_max = ice->hw_rates->list[ice->hw_rates->count - 1];
 	runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-	return snd_pcm_hw_constraint_list(runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  ice->hw_rates);
 }
@@ -1011,7 +1011,7 @@ static int snd_vt1724_playback_pro_open(struct snd_pcm_substream *substream)
 	ice->playback_pro_substream = substream;
 	runtime->hw = snd_vt1724_playback_pro;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 	set_rate_constraints(ice, substream);
 	mutex_lock(&ice->open_mutex);
 	/* calculate the currently available channels */
@@ -1023,11 +1023,11 @@ static int snd_vt1724_playback_pro_open(struct snd_pcm_substream *substream)
 	chs = (chs + 1) * 2;
 	runtime->hw.channels_max = chs;
 	if (chs > 2) /* channels must be even */
-		snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
+		snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 	mutex_unlock(&ice->open_mutex);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   VT1724_BUFFER_ALIGN);
 	constrain_rate_if_locked(substream);
 	if (ice->pro_open)
@@ -1044,11 +1044,11 @@ static int snd_vt1724_capture_pro_open(struct snd_pcm_substream *substream)
 	ice->capture_pro_substream = substream;
 	runtime->hw = snd_vt1724_2ch_stereo;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 	set_rate_constraints(ice, substream);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   VT1724_BUFFER_ALIGN);
 	constrain_rate_if_locked(substream);
 	if (ice->pro_open)
@@ -1192,10 +1192,10 @@ static int snd_vt1724_playback_spdif_open(struct snd_pcm_substream *substream)
 	} else
 		runtime->hw = snd_vt1724_spdif;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   VT1724_BUFFER_ALIGN);
 	constrain_rate_if_locked(substream);
 	if (ice->spdif.ops.open)
@@ -1229,10 +1229,10 @@ static int snd_vt1724_capture_spdif_open(struct snd_pcm_substream *substream)
 	} else
 		runtime->hw = snd_vt1724_spdif;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 				   VT1724_BUFFER_ALIGN);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				   VT1724_BUFFER_ALIGN);
 	constrain_rate_if_locked(substream);
 	if (ice->spdif.ops.open)
@@ -1378,7 +1378,7 @@ static int snd_vt1724_playback_indep_open(struct snd_pcm_substream *substream)
 	ice->playback_con_substream_ds[substream->number] = substream;
 	runtime->hw = snd_vt1724_2ch_stereo;
 	snd_pcm_set_sync(substream);
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 	set_rate_constraints(ice, substream);
 	return 0;
 }
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 35903d1a1cbd..6b926a526be6 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -1116,24 +1116,24 @@ static int snd_intel8x0_playback_open(struct snd_pcm_substream *substream)
 
 	if (chip->multi8) {
 		runtime->hw.channels_max = 8;
-		snd_pcm_hw_constraint_list(runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 						SNDRV_PCM_HW_PARAM_CHANNELS,
 						&hw_constraints_channels8);
 	} else if (chip->multi6) {
 		runtime->hw.channels_max = 6;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+		snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &hw_constraints_channels6);
 	} else if (chip->multi4) {
 		runtime->hw.channels_max = 4;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+		snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &hw_constraints_channels4);
 	}
 	if (chip->dra) {
-		snd_ac97_pcm_double_rate_rules(runtime);
+		snd_ac97_pcm_double_rate_rules(substream);
 	}
 	if (chip->smp20bit) {
 		runtime->hw.formats |= SNDRV_PCM_FMTBIT_S32_LE;
-		snd_pcm_hw_constraint_msbits(runtime, 0, 32, 20);
+		snd_pcm_hw_constraint_msbits(substream, 0, 32, 20);
 	}
 	return 0;
 }
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 13ef838b26c1..59df4e29d91c 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -605,7 +605,7 @@ static int snd_intel8x0m_pcm_open(struct snd_pcm_substream *substream, struct ic
 
 	ichdev->substream = substream;
 	runtime->hw = snd_intel8x0m_stream;
-	err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					 &hw_constraints_rates);
 	if ( err < 0 )
 		return err;
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 684faaf40f31..1c3b352f007e 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -235,9 +235,9 @@ static int lola_pcm_open(struct snd_pcm_substream *substream)
 	chip->ref_count_rate++;
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	/* period size = multiple of chip->granularity (8, 16 or 32 frames)*/
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				   chip->granularity);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+	snd_pcm_hw_constraint_step(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				   chip->granularity);
 	mutex_unlock(&chip->open_mutex);
 	return 0;
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index a0bbb386dc25..96d856f2032c 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -763,8 +763,8 @@ static int snd_mixart_playback_open(struct snd_pcm_substream *subs)
 
 	runtime->private_data = stream;
 
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 64);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 64);
 
 	/* if a sample rate is already used, another stream cannot change */
 	if(mgr->ref_count_rate++) {
@@ -844,8 +844,8 @@ static int snd_mixart_capture_open(struct snd_pcm_substream *subs)
 
 	runtime->private_data = stream;
 
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 64);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	snd_pcm_hw_constraint_step(subs, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 64);
 
 	/* if a sample rate is already used, another stream cannot change */
 	if(mgr->ref_count_rate++) {
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 6cb689aa28c2..6a0263a09bdb 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -850,7 +850,7 @@ static void snd_nm256_setup_stream(struct nm256 *chip, struct nm256_stream *s,
 	runtime->private_data = s;
 	s->substream = substream;
 
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 }
 
diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index b2a3fcfe31d4..09dfb805c7de 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -148,21 +148,21 @@ static int oxygen_open(struct snd_pcm_substream *substream,
 	}
 	if (chip->model.pcm_hardware_filter)
 		chip->model.pcm_hardware_filter(channel, &runtime->hw);
-	err = snd_pcm_hw_constraint_step(runtime, 0,
+	err = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_constraint_step(runtime, 0,
+	err = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
 	if (err < 0)
 		return err;
 	if (runtime->hw.formats & SNDRV_PCM_FMTBIT_S32_LE) {
-		err = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+		err = snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 		if (err < 0)
 			return err;
 	}
 	if (runtime->hw.channels_max > 2) {
-		err = snd_pcm_hw_constraint_step(runtime, 0,
+		err = snd_pcm_hw_constraint_step(substream, 0,
 						 SNDRV_PCM_HW_PARAM_CHANNELS,
 						 2);
 		if (err < 0)
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 751f9744b089..9418ea63c661 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1056,9 +1056,9 @@ static int pcxhr_open(struct snd_pcm_substream *subs)
 	runtime->private_data = stream;
 
 	/* better get a divisor of granularity values (96 or 192) */
-	snd_pcm_hw_constraint_step(runtime, 0,
+	snd_pcm_hw_constraint_step(subs, 0,
 				   SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 32);
-	snd_pcm_hw_constraint_step(runtime, 0,
+	snd_pcm_hw_constraint_step(subs, 0,
 				   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 32);
 	snd_pcm_set_sync(subs);
 
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 54f3e39f97f5..527e64bbbef3 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -816,13 +816,13 @@ static const struct snd_pcm_hw_constraint_list hw_constraints_period_bytes = {
 	.mask = 0
 };
 
-static void snd_rme32_set_buffer_constraint(struct rme32 *rme32, struct snd_pcm_runtime *runtime)
+static void snd_rme32_set_buffer_constraint(struct rme32 *rme32, struct snd_pcm_substream *substream)
 {
 	if (! rme32->fullduplex_mode) {
-		snd_pcm_hw_constraint_single(runtime,
+		snd_pcm_hw_constraint_single(substream->runtime,
 					     SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 					     RME32_BUFFER_SIZE);
-		snd_pcm_hw_constraint_list(runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					   &hw_constraints_period_bytes);
 	}
@@ -862,7 +862,7 @@ static int snd_rme32_playback_spdif_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_max = rate;
 	}       
 
-	snd_rme32_set_buffer_constraint(rme32, runtime);
+	snd_rme32_set_buffer_constraint(rme32, substream);
 
 	rme32->wcreg_spdif_stream = rme32->wcreg_spdif;
 	rme32->spdif_ctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
@@ -904,7 +904,7 @@ static int snd_rme32_capture_spdif_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_max = rate;
 	}
 
-	snd_rme32_set_buffer_constraint(rme32, runtime);
+	snd_rme32_set_buffer_constraint(rme32, substream);
 
 	return 0;
 }
@@ -940,7 +940,7 @@ snd_rme32_playback_adat_open(struct snd_pcm_substream *substream)
                 runtime->hw.rate_max = rate;
 	}        
 
-	snd_rme32_set_buffer_constraint(rme32, runtime);
+	snd_rme32_set_buffer_constraint(rme32, substream);
 	return 0;
 }
 
@@ -974,7 +974,7 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
 	rme32->capture_substream = substream;
 	spin_unlock_irq(&rme32->lock);
 
-	snd_rme32_set_buffer_constraint(rme32, runtime);
+	snd_rme32_set_buffer_constraint(rme32, substream);
 	return 0;
 }
 
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 66082e9f526d..61bb8220e740 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1154,19 +1154,20 @@ static const struct snd_pcm_hw_constraint_list hw_constraints_period_bytes = {
 
 static void
 rme96_set_buffer_size_constraint(struct rme96 *rme96,
-				 struct snd_pcm_runtime *runtime)
+				 struct snd_pcm_substream *substream)
 {
 	unsigned int size;
 
-	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+	snd_pcm_hw_constraint_single(substream->runtime,
+				     SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 				     RME96_BUFFER_SIZE);
 	if ((size = rme96->playback_periodsize) != 0 ||
 	    (size = rme96->capture_periodsize) != 0)
-		snd_pcm_hw_constraint_single(runtime,
+		snd_pcm_hw_constraint_single(substream->runtime,
 					     SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					     size);
 	else
-		snd_pcm_hw_constraint_list(runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					   &hw_constraints_period_bytes);
 }
@@ -1199,7 +1200,7 @@ snd_rme96_playback_spdif_open(struct snd_pcm_substream *substream)
                 runtime->hw.rate_min = rate;
                 runtime->hw.rate_max = rate;
 	}        
-	rme96_set_buffer_size_constraint(rme96, runtime);
+	rme96_set_buffer_size_constraint(rme96, substream);
 
 	rme96->wcreg_spdif_stream = rme96->wcreg_spdif;
 	rme96->spdif_ctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
@@ -1236,7 +1237,7 @@ snd_rme96_capture_spdif_open(struct snd_pcm_substream *substream)
 	rme96->capture_substream = substream;
 	spin_unlock_irq(&rme96->lock);
 	
-	rme96_set_buffer_size_constraint(rme96, runtime);
+	rme96_set_buffer_size_constraint(rme96, substream);
 	return 0;
 }
 
@@ -1268,7 +1269,7 @@ snd_rme96_playback_adat_open(struct snd_pcm_substream *substream)
                 runtime->hw.rate_min = rate;
                 runtime->hw.rate_max = rate;
 	}        
-	rme96_set_buffer_size_constraint(rme96, runtime);
+	rme96_set_buffer_size_constraint(rme96, substream);
 	return 0;
 }
 
@@ -1303,7 +1304,7 @@ snd_rme96_capture_adat_open(struct snd_pcm_substream *substream)
 	rme96->capture_substream = substream;
 	spin_unlock_irq(&rme96->lock);
 
-	rme96_set_buffer_size_constraint(rme96, runtime);
+	rme96_set_buffer_size_constraint(rme96, substream);
 	return 0;
 }
 
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 4cf879c42dc4..7677bcdc9142 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4510,27 +4510,27 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 
 	spin_unlock_irq(&hdsp->lock);
 
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
 	if (hdsp->clock_source_locked) {
 		runtime->hw.rate_min = runtime->hw.rate_max = hdsp->system_sample_rate;
 	} else if (hdsp->io_type == H9632) {
 		runtime->hw.rate_max = 192000;
 		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
 	}
 	if (hdsp->io_type == H9632) {
 		runtime->hw.channels_min = hdsp->qs_out_channels;
 		runtime->hw.channels_max = hdsp->ss_out_channels;
 	}
 
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_out_channels, hdsp,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_out_channels_rate, hdsp,
 			     SNDRV_PCM_HW_PARAM_RATE, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 			     snd_hdsp_hw_rule_rate_out_channels, hdsp,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 
@@ -4587,22 +4587,22 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 
 	spin_unlock_irq(&hdsp->lock);
 
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
 	if (hdsp->io_type == H9632) {
 		runtime->hw.channels_min = hdsp->qs_in_channels;
 		runtime->hw.channels_max = hdsp->ss_in_channels;
 		runtime->hw.rate_max = 192000;
 		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
 	}
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_in_channels, hdsp,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_in_channels_rate, hdsp,
 			     SNDRV_PCM_HW_PARAM_RATE, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 			     snd_hdsp_hw_rule_rate_in_channels, hdsp,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	return 0;
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 8d900c132f0f..e6ed2c1ee598 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6071,8 +6071,8 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 
 	spin_unlock_irq(&hdspm->lock);
 
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_pow2(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_pow2(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 
 	switch (hdspm->io_type) {
 	case AIO:
@@ -6097,22 +6097,22 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 
 	if (AES32 == hdspm->io_type) {
 		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+		snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				&hdspm_hw_constraints_aes32_sample_rates);
 	} else {
-		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+		snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				(playback ?
 				 snd_hdspm_hw_rule_rate_out_channels :
 				 snd_hdspm_hw_rule_rate_in_channels), hdspm,
 				SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	}
 
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			(playback ? snd_hdspm_hw_rule_out_channels :
 			 snd_hdspm_hw_rule_in_channels), hdspm,
 			SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			(playback ? snd_hdspm_hw_rule_out_channels_rate :
 			 snd_hdspm_hw_rule_in_channels_rate), hdspm,
 			SNDRV_PCM_HW_PARAM_RATE, -1);
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 4df992e846f2..0f88e9381325 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2287,15 +2287,15 @@ static int snd_rme9652_playback_open(struct snd_pcm_substream *substream)
 
 	spin_unlock_irq(&rme9652->lock);
 
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_rme9652_hw_rule_channels, rme9652,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_rme9652_hw_rule_channels_rate, rme9652,
 			     SNDRV_PCM_HW_PARAM_RATE, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 			     snd_rme9652_hw_rule_rate_channels, rme9652,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 
@@ -2347,15 +2347,15 @@ static int snd_rme9652_capture_open(struct snd_pcm_substream *substream)
 
 	spin_unlock_irq(&rme9652->lock);
 
-	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_rme9652_hw_rule_channels, rme9652,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_rme9652_hw_rule_channels_rate, rme9652,
 			     SNDRV_PCM_HW_PARAM_RATE, -1);
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 			     snd_rme9652_hw_rule_rate_channels, rme9652,
 			     SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	return 0;
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index 7de10997775f..3fc098edde47 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -796,7 +796,7 @@ static int snd_sonicvibes_playback_open(struct snd_pcm_substream *substream)
 	sonic->mode |= SV_MODE_PLAY;
 	sonic->playback_substream = substream;
 	runtime->hw = snd_sonicvibes_playback;
-	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, snd_sonicvibes_hw_constraint_dac_rate, NULL, SNDRV_PCM_HW_PARAM_RATE, -1);
+	snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE, snd_sonicvibes_hw_constraint_dac_rate, NULL, SNDRV_PCM_HW_PARAM_RATE, -1);
 	return 0;
 }
 
@@ -808,7 +808,7 @@ static int snd_sonicvibes_capture_open(struct snd_pcm_substream *substream)
 	sonic->mode |= SV_MODE_CAPTURE;
 	sonic->capture_substream = substream;
 	runtime->hw = snd_sonicvibes_capture;
-	snd_pcm_hw_constraint_ratdens(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_ratdens(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_sonicvibes_hw_constraints_adc_clock);
 	return 0;
 }
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index fd1f2f9cfbc3..143cfaf17449 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1201,7 +1201,7 @@ static int snd_via82xx_pcm_open(struct via82xx *chip, struct viadev *viadev,
 		return err;
 
 	if (use_src) {
-		err = snd_pcm_hw_rule_noresample(runtime, 48000);
+		err = snd_pcm_hw_rule_noresample(substream, 48000);
 		if (err < 0)
 			return err;
 	}
@@ -1279,7 +1279,7 @@ static int snd_via8233_multi_open(struct snd_pcm_substream *substream)
 		return err;
 	substream->runtime->hw.channels_max = 6;
 	if (chip->revision == VIA_REV_8233A)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &hw_constraints_channels);
 	return 0;
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 30253306f67c..2c8d9902bf75 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -738,7 +738,7 @@ static int snd_via82xx_modem_pcm_open(struct via82xx_modem *chip, struct viadev
 
 	runtime->hw = snd_via82xx_hw;
 	
-        if ((err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	if ((err = snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					      &hw_constraints_rates)) < 0)
                 return err;
 
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index cacc6a9d14c8..ea5e7aeba44f 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -885,7 +885,7 @@ static int snd_ymfpci_playback_open_1(struct snd_pcm_substream *substream)
 					   5334, UINT_MAX);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_noresample(runtime, 48000);
+	err = snd_pcm_hw_rule_noresample(substream, 48000);
 	if (err < 0)
 		return err;
 
@@ -1010,7 +1010,7 @@ static int snd_ymfpci_capture_open(struct snd_pcm_substream *substream,
 					   5334, UINT_MAX);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_noresample(runtime, 48000);
+	err = snd_pcm_hw_rule_noresample(substream, 48000);
 	if (err < 0)
 		return err;
 
diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index aa082131fb90..c39f6963fb4e 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -117,7 +117,7 @@ static int axi_i2s_startup(struct snd_pcm_substream *substream,
 
 	regmap_write(i2s->regmap, AXI_I2S_REG_RESET, mask);
 
-	ret = snd_pcm_hw_constraint_ratnums(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_ratnums(substream, 0,
 			   SNDRV_PCM_HW_PARAM_RATE,
 			   &i2s->rate_constraints);
 	if (ret)
diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index 9b3d81c41c8c..710adaaae3dd 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -120,7 +120,7 @@ static int axi_spdif_startup(struct snd_pcm_substream *substream,
 	struct axi_spdif *spdif = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	ret = snd_pcm_hw_constraint_ratnums(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_ratnums(substream, 0,
 			   SNDRV_PCM_HW_PARAM_RATE,
 			   &spdif->rate_constraints);
 	if (ret)
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index e65e007fc604..2d50fa3a039d 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -255,9 +255,9 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
@@ -276,9 +276,9 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
@@ -298,9 +298,9 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_BT_INSTANCE;
@@ -319,9 +319,9 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
@@ -340,9 +340,9 @@ static int cz_dmic1_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
@@ -367,9 +367,9 @@ static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
@@ -388,9 +388,9 @@ static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
@@ -410,9 +410,9 @@ static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_BT_INSTANCE;
@@ -431,9 +431,9 @@ static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
@@ -452,9 +452,9 @@ static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 6a63e8797a0b..bd117faa7dc6 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -295,7 +295,7 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
 		dir_mask = SSC_DIR_MASK_CAPTURE;
 	}
 
-	ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+	ret = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  atmel_ssc_hw_rule_rate,
 				  ssc_p,
diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index 7ec8559d53a2..eb05bdf0f640 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -211,12 +211,12 @@ static int bcm63xx_pcm_open(struct snd_soc_component *component,
 	struct bcm63xx_runtime_data *prtd;
 
 	runtime->hw = bcm63xx_pcm_hardware;
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
 	if (ret)
 		goto out;
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
 	if (ret)
 		goto out;
diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 56b71b965624..8117be6b98b4 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -582,7 +582,6 @@ static int cygnus_pcm_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct cygnus_aio_port *aio;
 	int ret;
 
@@ -594,12 +593,12 @@ static int cygnus_pcm_open(struct snd_soc_component *component,
 
 	snd_soc_set_runtime_hwparams(substream, &cygnus_pcm_hw);
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 		SNDRV_PCM_HW_PARAM_PERIOD_BYTES, PERIOD_BYTES_MIN);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, PERIOD_BYTES_MIN);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 6e634b448293..db425c72891f 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -754,7 +754,7 @@ static int cygnus_ssp_startup(struct snd_pcm_substream *substream,
 	substream->runtime->hw.rate_min = CYGNUS_RATE_MIN;
 	substream->runtime->hw.rate_max = CYGNUS_RATE_MAX;
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &cygnus_rate_constraint);
 	return 0;
 }
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index f37ab7eda615..efb46ca4dc6d 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -363,7 +363,7 @@ static int ad193x_hw_params(struct snd_pcm_substream *substream,
 static int ad193x_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
 				   &constr);
 }
diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 6811a8b3866d..54ec744b95e6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -755,7 +755,7 @@ static int adau1372_startup(struct snd_pcm_substream *substream, struct snd_soc_
 {
 	struct adau1372 *adau1372 = snd_soc_dai_get_drvdata(dai);
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &adau1372->rate_constraints);
 
 	return 0;
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 85a1d00894a9..574a2ce1b900 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -555,7 +555,7 @@ static int ak4458_startup(struct snd_pcm_substream *substream,
 {
 	int ret;
 
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_list(substream, 0,
 					 SNDRV_PCM_HW_PARAM_RATE,
 					 &ak4458_rate_constraints);
 
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index fe208cfdd3ba..ee67c7aa8284 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -255,7 +255,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
-				  struct snd_pcm_runtime *runtime)
+				  struct snd_pcm_substream *substream)
 {
 	static const unsigned int ak4613_rates[] = {
 		 32000,
@@ -294,7 +294,7 @@ static void ak4613_hw_constraints(struct ak4613_priv *priv,
 			constraint->count = i + 1;
 	}
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE, constraint);
 }
 
@@ -306,7 +306,7 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 
 	priv->cnt++;
 
-	ak4613_hw_constraints(priv, substream->runtime);
+	ak4613_hw_constraints(priv, substream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 85bdd0534180..a7630218d11a 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -242,7 +242,7 @@ static const struct snd_pcm_hw_constraint_list ak5558_rate_constraints = {
 static int ak5558_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &ak5558_rate_constraints);
 }
diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 7ad7b733af9b..45449746e5c4 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -520,7 +520,7 @@ static const struct snd_pcm_hw_constraint_list cs35l33_constraints = {
 static int cs35l33_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 					SNDRV_PCM_HW_PARAM_RATE,
 					&cs35l33_constraints);
 	return 0;
diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 110ee2d06358..fe90dabf97d8 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -577,7 +577,7 @@ static int cs35l34_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE, &cs35l34_constraints);
 	return 0;
 }
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 55d529aa0011..e06bafcbd068 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -609,7 +609,7 @@ static int cs35l35_pcm_startup(struct snd_pcm_substream *substream,
 	if (!substream->runtime)
 		return 0;
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE, &cs35l35_constraints);
 
 	regmap_update_bits(cs35l35->regmap, CS35L35_AMP_INP_DRV_CTL,
@@ -637,7 +637,7 @@ static int cs35l35_pdm_startup(struct snd_pcm_substream *substream,
 	if (!substream->runtime)
 		return 0;
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE,
 				&cs35l35_pdm_constraints);
 
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 4451ca9f4916..2e8f06e0193d 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -963,7 +963,7 @@ static const struct snd_pcm_hw_constraint_list cs35l36_constraints = {
 static int cs35l36_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE, &cs35l36_constraints);
 
 	return 0;
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index 20126cc675b1..d95bf52cc2b6 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -505,7 +505,7 @@ static int cs4234_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	for (i = 0; i < cs4234->rate_constraint.nrats; i++)
 		cs4234->rate_dividers[i].num = cs4234->mclk_rate / CS4234_MCLK_SCALE;
 
-	ret = snd_pcm_hw_constraint_ratnums(sub->runtime, 0,
+	ret = snd_pcm_hw_constraint_ratnums(sub, 0,
 					    SNDRV_PCM_HW_PARAM_RATE,
 					    &cs4234->rate_constraint);
 	if (ret < 0)
@@ -515,7 +515,7 @@ static int cs4234_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	 * MCLK/rate may be a valid ratio but out-of-spec (e.g. 24576000/64000)
 	 * so this rule limits the range of sample rate for given MCLK.
 	 */
-	return snd_pcm_hw_rule_add(sub->runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	return snd_pcm_hw_rule_add(sub, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   cs4234_dai_rule_rate, cs4234, -1);
 }
 
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index c3f974ec78e5..7d9109884e86 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1144,7 +1144,7 @@ static const struct snd_pcm_hw_constraint_list constraints_12_24 = {
 static int cs42l73_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 					SNDRV_PCM_HW_PARAM_RATE,
 					&constraints_12_24);
 	return 0;
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 80bc7c10ed75..add2808ded06 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1444,7 +1444,7 @@ static const struct snd_pcm_hw_constraint_list cs43130_asp_constraints = {
 static int cs43130_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &cs43130_asp_constraints);
 }
@@ -1461,7 +1461,7 @@ static const struct snd_pcm_hw_constraint_list cs43130_dop_constraints = {
 static int cs43130_dop_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &cs43130_dop_constraints);
 }
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 3d67cbf9eaaa..3868394e969b 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -751,7 +751,7 @@ static const struct snd_pcm_hw_constraint_list src_constraints = {
 static int cs53l30_pcm_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE, &src_constraints);
 
 	return 0;
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 067757d1d70a..caf197915060 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -450,7 +450,7 @@ static int es8316_pcm_startup(struct snd_pcm_substream *substream,
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 
 	if (es8316->sysclk_constraints.list)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_RATE,
 					   &es8316->sysclk_constraints);
 
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9632afc2d4d6..500614a6b979 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -463,7 +463,7 @@ static int es8328_startup(struct snd_pcm_substream *substream,
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 
 	if (es8328->master && es8328->sysclk_constraints)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE,
 				es8328->sysclk_constraints);
 
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 1567ba196ab9..1ac1f55bbff4 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -411,7 +411,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (ret)
 			goto err;
 
-		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
+		ret = snd_pcm_hw_constraint_eld(substream, hcp->eld);
 		if (ret)
 			goto err;
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index bc30a1dc7530..41effa498eef 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1916,7 +1916,7 @@ static int max98090_dai_startup(struct snd_pcm_substream *substream,
 	/* Remove 24-bit format support if it is not in right justified mode. */
 	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
 		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
+		snd_pcm_hw_constraint_msbits(substream, 0, 16, 16);
 	}
 	return 0;
 }
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 09b2d730e9fd..51aebac49595 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -314,7 +314,7 @@ static int max9867_startup(struct snd_pcm_substream *substream,
 		snd_soc_component_get_drvdata(dai->component);
 
 	if (max9867->constraints)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, max9867->constraints);
 
 	return 0;
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4dc844f3c1fc..d1168759e60e 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -592,7 +592,7 @@ static int pcm512x_dai_startup_master(struct snd_pcm_substream *substream,
 	}
 
 	if (pcm512x->pll_out)
-		return snd_pcm_hw_rule_add(substream->runtime, 0,
+		return snd_pcm_hw_rule_add(substream, 0,
 					   SNDRV_PCM_HW_PARAM_RATE,
 					   pcm512x_hw_rule_rate,
 					   pcm512x,
@@ -613,7 +613,7 @@ static int pcm512x_dai_startup_master(struct snd_pcm_substream *substream,
 	rats_no_pll->den_max = 128;
 	rats_no_pll->den_step = 1;
 
-	return snd_pcm_hw_constraint_ratnums(substream->runtime, 0,
+	return snd_pcm_hw_constraint_ratnums(substream, 0,
 					     SNDRV_PCM_HW_PARAM_RATE,
 					     constraints_no_pll);
 }
@@ -639,7 +639,7 @@ static int pcm512x_dai_startup_slave(struct snd_pcm_substream *substream,
 				   PCM512x_SREF, PCM512x_SREF_BCK);
 	}
 
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &constraints_slave);
 }
diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 76c77dc8ecf7..64df463c091a 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -804,7 +804,7 @@ int sigmadsp_restrict_params(struct sigmadsp *sigmadsp,
 	if (sigmadsp->rate_constraints.count == 0)
 		return 0;
 
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 		SNDRV_PCM_HW_PARAM_RATE, &sigmadsp->rate_constraints);
 }
 EXPORT_SYMBOL_GPL(sigmadsp_restrict_params);
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 7964e922b07f..827c47487b50 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -330,7 +330,7 @@ static int ssm2602_startup(struct snd_pcm_substream *substream,
 	struct ssm2602_priv *ssm2602 = snd_soc_component_get_drvdata(component);
 
 	if (ssm2602->sysclk_constraints) {
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   ssm2602->sysclk_constraints);
 	}
diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 21ab8c5487ba..0a00f6bd58f3 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -103,7 +103,7 @@ static int uda1334_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   &uda1334->rate_constraint);
 
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index c8b50aac6c18..f32a40a0737d 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -133,7 +133,7 @@ static int wm8523_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   &wm8523->rate_constraint);
 
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 81f858f6bd67..95d6030fa9a5 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -71,7 +71,7 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   &wm8524->rate_constraint);
 
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index dcee7b2bd3d7..c1a8bc1f8048 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -531,7 +531,7 @@ static int wm8731_startup(struct snd_pcm_substream *substream,
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(dai->component);
 
 	if (wm8731->constraints)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 					   SNDRV_PCM_HW_PARAM_RATE,
 					   wm8731->constraints);
 
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 0e3994326936..800f073417fa 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -179,7 +179,7 @@ static int wm8741_startup(struct snd_pcm_substream *substream,
 	struct wm8741_priv *wm8741 = snd_soc_component_get_drvdata(component);
 
 	if (wm8741->sysclk)
-		snd_pcm_hw_constraint_list(substream->runtime, 0,
+		snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE,
 				wm8741->sysclk_constraints);
 
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 63d236ef5c4d..623b6521d62a 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -592,11 +592,11 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
 	if (asrc_priv->soc->channel_bits == 3)
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
 
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
 
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 600e0d670ca6..66e569e1d8b6 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1400,7 +1400,7 @@ static const struct snd_pcm_hw_constraint_list easrc_rate_constraints = {
 static int fsl_easrc_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &easrc_rate_constraints);
 }
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 407a45e48eee..cbebd5e4b982 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -684,12 +684,12 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	 * tx/rx maxburst
 	 */
 	if (sai->soc_data->use_edma)
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 					   tx ? sai->dma_params_tx.maxburst :
 					   sai->dma_params_rx.maxburst);
 
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
 
 	return ret;
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 2b57b60431bb..12beb4b20d77 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -644,7 +644,7 @@ static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 	 * period. But SSI would still access fifo1 with an invalid data.
 	 */
 	if (ssi->use_dual_fifo)
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 2);
 
 	return 0;
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6cb558165848..fe22ca177fbc 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -498,19 +498,18 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int fsl_xcvr_constr(const struct snd_pcm_substream *substream,
+static int fsl_xcvr_constr(struct snd_pcm_substream *substream,
 			   const struct snd_pcm_hw_constraint_list *channels,
 			   const struct snd_pcm_hw_constraint_list *rates)
 {
-	struct snd_pcm_runtime *rt = substream->runtime;
 	int ret;
 
-	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-					 channels);
+	ret = snd_pcm_hw_constraint_list(substream, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS, channels);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_list(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					 rates);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index cbdc0a2c09c5..3e66e59f37e9 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -52,7 +52,7 @@ static int imx_audmix_fe_startup(struct snd_pcm_substream *substream)
 	int ret;
 
 	if (clk_rate % 24576000 == 0) {
-		ret = snd_pcm_hw_constraint_list(runtime, 0,
+		ret = snd_pcm_hw_constraint_list(substream, 0,
 						 SNDRV_PCM_HW_PARAM_RATE,
 						 &imx_audmix_rate_constraints);
 		if (ret < 0)
diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index c2a5933bfcfc..1e8d3a1800af 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -117,13 +117,13 @@ static int kirkwood_dma_open(struct snd_soc_component *component,
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_step(runtime, 0,
+	err = snd_pcm_hw_constraint_step(substream, 0,
 			SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 			priv->burst);
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_step(substream->runtime, 0,
+	err = snd_pcm_hw_constraint_step(substream, 0,
 			 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 			 priv->burst);
 	if (err < 0)
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3cb2adf420bb..11a75a84e3d0 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -47,7 +47,7 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	memif->substream = substream;
 
-	snd_pcm_hw_constraint_step(substream->runtime, 0,
+	snd_pcm_hw_constraint_step(substream, 0,
 				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
 	/* enable agent */
 	mtk_regmap_update_bits(afe->regmap, memif->data->agent_disable_reg,
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 44a8d5cfb0aa..76e61d089657 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -108,7 +108,7 @@ static int mt2701_cs42448_fe_ops_startup(struct snd_pcm_substream *substream)
 {
 	int err;
 
-	err = snd_pcm_hw_constraint_list(substream->runtime, 0,
+	err = snd_pcm_hw_constraint_list(substream, 0,
 					 SNDRV_PCM_HW_PARAM_RATE,
 					 &mt2701_cs42448_constraints_rates);
 	if (err < 0) {
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a4d26a6fc849..f9ce6f6f22ab 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -199,15 +199,15 @@ mt8183_da7219_max98357_startup(
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 	runtime->hw.channels_max = 2;
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_CHANNELS,
 			&constraints_channels);
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+	snd_pcm_hw_constraint_msbits(substream, 0, 16, 16);
 
 	return 0;
 }
@@ -239,15 +239,15 @@ mt8183_da7219_max98357_bt_sco_startup(
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 	runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_CHANNELS,
 			&constraints_channels);
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+	snd_pcm_hw_constraint_msbits(substream, 0, 16, 16);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 94dcbd36c869..21d0264d75d3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -139,15 +139,15 @@ mt8183_mt6358_startup(struct snd_pcm_substream *substream)
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 	runtime->hw.channels_max = 2;
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &constraints_channels);
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+	snd_pcm_hw_constraint_msbits(substream, 0, 16, 16);
 
 	return 0;
 }
@@ -179,15 +179,15 @@ mt8183_mt6358_ts3a227_max98357_bt_sco_startup(
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 	runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 			SNDRV_PCM_HW_PARAM_CHANNELS,
 			&constraints_channels);
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+	snd_pcm_hw_constraint_msbits(substream, 0, 16, 16);
 
 	return 0;
 }
diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 932224552146..43c3cb695fa5 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -329,7 +329,7 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* Make sure the encoder gets either 2 or 8 channels */
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_list(substream, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &hw_channel_constraints);
 	if (ret) {
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4ad23267cace..04cfe68bf0de 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -140,13 +140,13 @@ int aiu_fifo_startup(struct snd_pcm_substream *substream,
 	 * Make sure the buffer and period size are multiple of the fifo burst
 	 * size
 	 */
-	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 					 fifo->fifo_block);
 	if (ret)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					 fifo->fifo_block);
 	if (ret)
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b2e867113226..90b00df0fd11 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -229,13 +229,13 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	 * Make sure the buffer and period size are multiple of the FIFO
 	 * burst
 	 */
-	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
+	ret = snd_pcm_hw_constraint_step(ss, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
 					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
-	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
+	ret = snd_pcm_hw_constraint_step(ss, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
 					 AXG_FIFO_BURST);
 	if (ret)
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 8696a993c478..bb2cb135917e 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -992,7 +992,7 @@ static int rsnd_soc_dai_startup(struct snd_pcm_substream *substream,
 
 	snd_soc_set_runtime_hwparams(substream, &rsnd_pcm_hardware);
 
-	snd_pcm_hw_constraint_list(runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				   SNDRV_PCM_HW_PARAM_CHANNELS, constraint);
 
 	snd_pcm_hw_constraint_integer(runtime,
@@ -1005,11 +1005,11 @@ static int rsnd_soc_dai_startup(struct snd_pcm_substream *substream,
 	if (rsnd_rdai_is_clk_master(rdai)) {
 		int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
-		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+		snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				    rsnd_soc_hw_rule_rate,
 				    is_play ? &rdai->playback : &rdai->capture,
 				    SNDRV_PCM_HW_PARAM_CHANNELS, -1);
-		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+		snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				    rsnd_soc_hw_rule_channels,
 				    is_play ? &rdai->playback : &rdai->capture,
 				    SNDRV_PCM_HW_PARAM_RATE, -1);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2df70ab851ea..65f8ea73bae7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -436,7 +436,7 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 	if (!bits)
 		return;
 
-	ret = snd_pcm_hw_constraint_msbits(substream->runtime, 0, 0, bits);
+	ret = snd_pcm_hw_constraint_msbits(substream, 0, 0, bits);
 	if (ret != 0)
 		dev_warn(rtd->dev, "ASoC: Failed to set MSB %d: %d\n",
 				 bits, ret);
diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 2ed92c990b97..f7a1d5b8da9e 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -706,7 +706,7 @@ static int uni_player_startup(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* refine hw constraint in tdm mode */
-	ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+	ret = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  sti_uniperiph_fix_tdm_chan,
 				  player, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -714,7 +714,7 @@ static int uni_player_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	return snd_pcm_hw_rule_add(substream->runtime, 0,
+	return snd_pcm_hw_rule_add(substream, 0,
 				   SNDRV_PCM_HW_PARAM_FORMAT,
 				   sti_uniperiph_fix_tdm_format,
 				   player, SNDRV_PCM_HW_PARAM_FORMAT,
diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 136059331211..7d14d4c011e8 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -366,7 +366,7 @@ static int uni_reader_startup(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* refine hw constraint in tdm mode */
-	ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+	ret = snd_pcm_hw_rule_add(substream, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  sti_uniperiph_fix_tdm_chan,
 				  reader, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -374,7 +374,7 @@ static int uni_reader_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	return snd_pcm_hw_rule_add(substream->runtime, 0,
+	return snd_pcm_hw_rule_add(substream, 0,
 				   SNDRV_PCM_HW_PARAM_FORMAT,
 				   sti_uniperiph_fix_tdm_format,
 				   reader, SNDRV_PCM_HW_PARAM_FORMAT,
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 6c13cc84b3fb..48436ab771e3 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -617,7 +617,7 @@ static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
+	snd_pcm_hw_constraint_list(substream, 0,
 				SNDRV_PCM_HW_PARAM_RATE, &sun4i_codec_constraints);
 
 	/*
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 460924fc173f..c3abba92aabe 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -429,7 +429,7 @@ static int sun8i_codec_startup(struct snd_pcm_substream *substream,
 	else
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+	return snd_pcm_hw_constraint_list(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE, list);
 }
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 573374b89b10..b49794e1d9f6 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -85,7 +85,7 @@ int tegra_pcm_open(struct snd_soc_component *component,
 	snd_soc_set_runtime_hwparams(substream, &tegra_pcm_hardware);
 
 	/* Ensure period size is multiple of 8 */
-	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+	ret = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 0x8);
 	if (ret) {
 		dev_err(rtd->dev, "failed to set constraint %d\n", ret);
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b94220306d1a..33549c94e6bd 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1512,7 +1512,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 				     SNDRV_PCM_HW_PARAM_CHANNELS,
 				     0, max_channels);
 
-	snd_pcm_hw_constraint_list(substream->runtime,
+	snd_pcm_hw_constraint_list(substream,
 				   0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &mcasp->chconstr[substream->stream]);
 
@@ -1521,7 +1521,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 		 * Only allow formats which require same amount of bits on the
 		 * bus as the currently running stream
 		 */
-		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+		ret = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
 					  davinci_mcasp_hw_rule_format_width,
 					  ruledata,
@@ -1531,7 +1531,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	}
 	else if (mcasp->slot_width) {
 		/* Only allow formats require <= slot_width bits on the bus */
-		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+		ret = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
 					  davinci_mcasp_hw_rule_slot_width,
 					  ruledata,
@@ -1545,14 +1545,14 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	 * set constraints based on what we can provide.
 	 */
 	if (mcasp->bclk_master && mcasp->bclk_div == 0 && mcasp->sysclk_freq) {
-		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+		ret = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  davinci_mcasp_hw_rule_rate,
 					  ruledata,
 					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 		if (ret)
 			return ret;
-		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+		ret = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
 					  davinci_mcasp_hw_rule_format,
 					  ruledata,
@@ -1561,7 +1561,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	snd_pcm_hw_rule_add(substream->runtime, 0,
+	snd_pcm_hw_rule_add(substream, 0,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 			    davinci_mcasp_hw_rule_min_periodsize, NULL,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6025b30bbe77..b65c00ccfcdb 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -808,14 +808,14 @@ static int omap_mcbsp_dai_startup(struct snd_pcm_substream *substream,
 		* This applies only for the playback stream.
 		*/
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			snd_pcm_hw_rule_add(substream->runtime, 0,
+			snd_pcm_hw_rule_add(substream, 0,
 					    SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 					    omap_mcbsp_hwrule_min_buffersize,
 					    mcbsp,
 					    SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 
 		/* Make sure, that the period size is always even */
-		snd_pcm_hw_constraint_step(substream->runtime, 0,
+		snd_pcm_hw_constraint_step(substream, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 2);
 	}
 
diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 3c1628a3a1ac..b659d09343d8 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -96,11 +96,9 @@ static irqreturn_t aiodma_irq(int irq, void *p)
 static int uniphier_aiodma_open(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
 	snd_soc_set_runtime_hwparams(substream, &uniphier_aiodma_hw);
 
-	return snd_pcm_hw_constraint_step(runtime, 0,
+	return snd_pcm_hw_constraint_step(substream, 0,
 		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256);
 }
 
diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 1d59fb668c77..300f47984f5a 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -369,7 +369,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	runtime->private_data = stream_data;
 
 	/* Resize the period size divisible by 64 */
-	err = snd_pcm_hw_constraint_step(runtime, 0,
+	err = snd_pcm_hw_constraint_step(substream, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
 	if (err) {
 		dev_err(component->dev,
diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index 71f17f02f341..74997ff3e5c3 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -374,7 +374,7 @@ static int hiface_pcm_open(struct snd_pcm_substream *alsa_sub)
 		alsa_rt->hw.rate_max = 384000;
 
 		/* explicit constraints needed as we added SNDRV_PCM_RATE_KNOT */
-		ret = snd_pcm_hw_constraint_list(alsa_sub->runtime, 0,
+		ret = snd_pcm_hw_constraint_list(alsa_sub, 0,
 						 SNDRV_PCM_HW_PARAM_RATE,
 						 &constraints_extra_rates);
 		if (ret < 0) {
diff --git a/sound/usb/line6/capture.c b/sound/usb/line6/capture.c
index 970c9bdce0b2..6161dd638729 100644
--- a/sound/usb/line6/capture.c
+++ b/sound/usb/line6/capture.c
@@ -222,7 +222,7 @@ static int snd_line6_capture_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_line6_pcm *line6pcm = snd_pcm_substream_chip(substream);
 
-	err = snd_pcm_hw_constraint_ratdens(runtime, 0,
+	err = snd_pcm_hw_constraint_ratdens(substream, 0,
 					    SNDRV_PCM_HW_PARAM_RATE,
 					    &line6pcm->properties->rates);
 	if (err < 0)
diff --git a/sound/usb/line6/playback.c b/sound/usb/line6/playback.c
index 8233c61e23f1..1965395e9a2d 100644
--- a/sound/usb/line6/playback.c
+++ b/sound/usb/line6/playback.c
@@ -373,7 +373,7 @@ static int snd_line6_playback_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_line6_pcm *line6pcm = snd_pcm_substream_chip(substream);
 
-	err = snd_pcm_hw_constraint_ratdens(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_constraint_ratdens(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 					    &line6pcm->properties->rates);
 	if (err < 0)
 		return err;
diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 5834d1dc317e..a8a2f9011e52 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -641,7 +641,7 @@ static int set_stream_hw(struct ua101 *ua, struct snd_pcm_substream *substream,
 					   UINT_MAX);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_constraint_msbits(substream->runtime, 0, 32, 24);
+	err = snd_pcm_hw_constraint_msbits(substream, 0, 32, 24);
 	return err;
 }
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e5311b6bb3f6..a213a5d590e2 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -933,9 +933,10 @@ static int hw_rule_periods_implicit_fb(struct snd_pcm_hw_params *params,
  * set up the runtime hardware information.
  */
 
-static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substream *subs)
+static int setup_hw_info(struct snd_pcm_substream *substream, struct snd_usb_substream *subs)
 {
-	const struct audioformat *fp;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct audioformat *fp;
 	unsigned int pt, ptmin;
 	int param_period_time_if_needed = -1;
 	int err;
@@ -982,7 +983,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, subs,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -991,8 +992,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 				  -1);
 	if (err < 0)
 		return err;
-
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, subs,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -1001,7 +1001,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 				  -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_format, subs,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_RATE,
@@ -1011,7 +1011,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	if (err < 0)
 		return err;
 	if (param_period_time_if_needed >= 0) {
-		err = snd_pcm_hw_rule_add(runtime, 0,
+		err = snd_pcm_hw_rule_add(substream, 0,
 					  SNDRV_PCM_HW_PARAM_PERIOD_TIME,
 					  hw_rule_period_time, subs,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -1023,22 +1023,22 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	}
 
 	/* additional hw constraints for implicit fb */
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_format_implicit_fb, subs,
 				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate_implicit_fb, subs,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				  hw_rule_period_size_implicit_fb, subs,
 				  SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 	if (err < 0)
 		return err;
-	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIODS,
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_PERIODS,
 				  hw_rule_periods_implicit_fb, subs,
 				  SNDRV_PCM_HW_PARAM_PERIODS, -1);
 	if (err < 0)
@@ -1065,7 +1065,7 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	subs->dsd_dop.channel = 0;
 	subs->dsd_dop.marker = 1;
 
-	ret = setup_hw_info(runtime, subs);
+	ret = setup_hw_info(substream, subs);
 	if (ret < 0)
 		return ret;
 	ret = snd_usb_autoresume(subs->stream->chip);
-- 
2.27.0

