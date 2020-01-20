Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0C142D7E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 15:27:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC04167D;
	Mon, 20 Jan 2020 15:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC04167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579530430;
	bh=+vy2dwKRKfOHQ6spD0K/mEcDAPzMuDhBRqqIQdSEbkw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcAjb9s3nOKyN4HEU3GV7jjMrFCXXov7GLBzEWu+qWWdiNzUKFPPNVsvl50YfrhQ4
	 dhTPqnjnNqxdd4auWVQwYMM4d/aCbp5KqnRrssWnapORSTsMmoVEkZc3ztPCvc+0Cm
	 0baP+l2vvEQA7GI60iZ8X27T4TnRD/wzUmGpgfNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BBFF8028A;
	Mon, 20 Jan 2020 15:23:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F6EBF80276; Mon, 20 Jan 2020 15:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1174F8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 15:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1174F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="bjwndFt3"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e25b7cb0000>; Mon, 20 Jan 2020 06:23:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 20 Jan 2020 06:23:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 20 Jan 2020 06:23:49 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jan
 2020 14:23:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 20 Jan 2020 14:23:49 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e25b7f00000>; Mon, 20 Jan 2020 06:23:48 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Date: Mon, 20 Jan 2020 19:53:11 +0530
Message-ID: <1579530198-13431-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579530187; bh=TFMbQwN1GS/fpcDoEU+GzEHErtDw1EfDMO3rHnG66g0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=bjwndFt3UZmqBZjf/uCebqClvgLvoH2S6gJY08W22u0g/ezjdq8zEYEVsHZlnYq/U
 7XwYSlKOChtqsDR3X2g0k8WZYTXZn0JjjJQfH75kr0ZTUgfA74iICD+So2PWHSEloz
 9o0vq5n94P1SPW6lWD2IQrEEgbZ0Dk8p+Q98jX6SSd+6IIoGUKvuYOheqvl5yj06i5
 8JP3hyzJixQ3xxbuVNuZh8cgJZSRZtcQkkOdb6N/Dd3SkeJtbDt7+6MK43lvs4FJ+o
 jV3M4GRD3xNQeyjpA2AMgVoYhDEJI/xrZDhSpaAsU3dPFoTenXi5yn+vH1XO5sdLy0
 WpyYkkBWdEgvw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
	programming
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Audio Client Interface (CIF) is a proprietary interface employed to route
audio samples through Audio Hub (AHUB) components by inter connecting the
various modules. This patch exposes a helper function to program CIF
instance present in various modules. Update Makefile to build tegra_cif.c
and build dependency is added over config CONFIG_SND_SOC_TEGRA.

Tegra30 and Tegra124 have an identical CIF programming helper function.
Remove tegra30_ahub_set_cif(), tegra124_ahub_set_cif() and instead we can
rely on common exposed function tegra_set_cif(). Tegra30 and Tegra124 I2S
driver uses soc_data to reference different versions of set_audio_cif
function via callback function pointer. This is no more required with
current patch and hence remove soc_data from i2s driver.

Also update variable names for audio and client channels. This is required
to avoid wrapping in function tegra_set_cif().

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra30_ahub.c |  94 +++++-------------------------
 sound/soc/tegra/tegra30_ahub.h | 129 -----------------------------------------
 sound/soc/tegra/tegra30_i2s.c  |  35 ++++-------
 sound/soc/tegra/tegra30_i2s.h  |   7 ---
 sound/soc/tegra/tegra_cif.c    |  34 +++++++++++
 sound/soc/tegra/tegra_cif.h    |  50 ++++++++++++++++
 7 files changed, 111 insertions(+), 240 deletions(-)
 create mode 100644 sound/soc/tegra/tegra_cif.c
 create mode 100644 sound/soc/tegra/tegra_cif.h

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index c84f183..261aa21 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -8,9 +8,11 @@ snd-soc-tegra20-i2s-objs := tegra20_i2s.o
 snd-soc-tegra20-spdif-objs := tegra20_spdif.o
 snd-soc-tegra30-ahub-objs := tegra30_ahub.o
 snd-soc-tegra30-i2s-objs := tegra30_i2s.o
+snd-soc-tegra-cif-objs := tegra_cif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-cif.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
 obj-$(CONFIG_SND_SOC_TEGRA20_DAS) += snd-soc-tegra20-das.o
 obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 635eacb..8f95cff 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include "tegra30_ahub.h"
+#include "tegra_cif.h"
 
 #define DRV_NAME "tegra30-ahub"
 
@@ -90,7 +91,7 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 {
 	int channel;
 	u32 reg, val;
-	struct tegra30_ahub_cif_conf cif_conf;
+	struct tegra_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->rx_usage,
 				      TEGRA30_AHUB_CHANNEL_CTRL_COUNT);
@@ -117,20 +118,19 @@ int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif,
 	tegra30_apbif_write(reg, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.audio_ch = 2;
+	cif_conf.client_ch = 2;
+	cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+	cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
-	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
 	cif_conf.truncate = 0;
 	cif_conf.mono_conv = 0;
 
 	reg = TEGRA30_AHUB_CIF_RX_CTRL +
 	      (channel * TEGRA30_AHUB_CIF_RX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
+	tegra_set_cif(ahub->regmap_apbif, reg, &cif_conf);
 
 	pm_runtime_put(ahub->dev);
 
@@ -192,7 +192,7 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 {
 	int channel;
 	u32 reg, val;
-	struct tegra30_ahub_cif_conf cif_conf;
+	struct tegra_cif_conf cif_conf;
 
 	channel = find_first_zero_bit(ahub->tx_usage,
 				      TEGRA30_AHUB_CHANNEL_CTRL_COUNT);
@@ -219,20 +219,19 @@ int tegra30_ahub_allocate_tx_fifo(enum tegra30_ahub_txcif *txcif,
 	tegra30_apbif_write(reg, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
-	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.audio_ch = 2;
+	cif_conf.client_ch = 2;
+	cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+	cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
-	cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
 	cif_conf.truncate = 0;
 	cif_conf.mono_conv = 0;
 
 	reg = TEGRA30_AHUB_CIF_TX_CTRL +
 	      (channel * TEGRA30_AHUB_CIF_TX_CTRL_STRIDE);
-	ahub->soc_data->set_audio_cif(ahub->regmap_apbif, reg, &cif_conf);
+	tegra_set_cif(ahub->regmap_apbif, reg, &cif_conf);
 
 	pm_runtime_put(ahub->dev);
 
@@ -485,17 +484,14 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA30,
-	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra114 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
-	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra124 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
-	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
 static const struct of_device_id tegra30_ahub_of_match[] = {
@@ -670,70 +666,6 @@ static struct platform_driver tegra30_ahub_driver = {
 };
 module_platform_driver(tegra30_ahub_driver);
 
-void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
-			  struct tegra30_ahub_cif_conf *conf)
-{
-	unsigned int value;
-
-	value = (conf->threshold <<
-			TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
-		((conf->audio_channels - 1) <<
-			TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
-		((conf->client_channels - 1) <<
-			TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
-		(conf->audio_bits <<
-			TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT) |
-		(conf->client_bits <<
-			TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT) |
-		(conf->expand <<
-			TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT) |
-		(conf->stereo_conv <<
-			TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT) |
-		(conf->replicate <<
-			TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT) |
-		(conf->direction <<
-			TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT) |
-		(conf->truncate <<
-			TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT) |
-		(conf->mono_conv <<
-			TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT);
-
-	regmap_write(regmap, reg, value);
-}
-EXPORT_SYMBOL_GPL(tegra30_ahub_set_cif);
-
-void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
-			   struct tegra30_ahub_cif_conf *conf)
-{
-	unsigned int value;
-
-	value = (conf->threshold <<
-			TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
-		((conf->audio_channels - 1) <<
-			TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
-		((conf->client_channels - 1) <<
-			TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
-		(conf->audio_bits <<
-			TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT) |
-		(conf->client_bits <<
-			TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT) |
-		(conf->expand <<
-			TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT) |
-		(conf->stereo_conv <<
-			TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT) |
-		(conf->replicate <<
-			TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT) |
-		(conf->direction <<
-			TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT) |
-		(conf->truncate <<
-			TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT) |
-		(conf->mono_conv <<
-			TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT);
-
-	regmap_write(regmap, reg, value);
-}
-EXPORT_SYMBOL_GPL(tegra124_ahub_set_cif);
-
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra30 AHUB driver");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 6889c5f..990d884 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -8,113 +8,6 @@
 #ifndef __TEGRA30_AHUB_H__
 #define __TEGRA30_AHUB_H__
 
-/* Fields in *_CIF_RX/TX_CTRL; used by AHUB FIFOs, and all other audio modules */
-
-#define TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT	28
-#define TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US	0xf
-#define TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK	(TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT)
-
-#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT	24
-#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US	0x3f
-#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK	(TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US << TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT)
-
-/* Channel count minus 1 */
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT	24
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US	7
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT)
-
-/* Channel count minus 1 */
-#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT	20
-#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US	0xf
-#define TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK	(TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US << TEGRA124_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT)
-
-/* Channel count minus 1 */
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT	16
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US	7
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT)
-
-/* Channel count minus 1 */
-#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT	16
-#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US	0xf
-#define TEGRA124_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK	(TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_MASK_US << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT)
-
-#define TEGRA30_AUDIOCIF_BITS_4				0
-#define TEGRA30_AUDIOCIF_BITS_8				1
-#define TEGRA30_AUDIOCIF_BITS_12			2
-#define TEGRA30_AUDIOCIF_BITS_16			3
-#define TEGRA30_AUDIOCIF_BITS_20			4
-#define TEGRA30_AUDIOCIF_BITS_24			5
-#define TEGRA30_AUDIOCIF_BITS_28			6
-#define TEGRA30_AUDIOCIF_BITS_32			7
-
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT		12
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_MASK		(7                        << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_4		(TEGRA30_AUDIOCIF_BITS_4  << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_8		(TEGRA30_AUDIOCIF_BITS_8  << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_12		(TEGRA30_AUDIOCIF_BITS_12 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_16		(TEGRA30_AUDIOCIF_BITS_16 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_20		(TEGRA30_AUDIOCIF_BITS_20 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_24		(TEGRA30_AUDIOCIF_BITS_24 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_28		(TEGRA30_AUDIOCIF_BITS_28 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_32		(TEGRA30_AUDIOCIF_BITS_32 << TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_SHIFT)
-
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT		8
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_MASK		(7                        << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_4		(TEGRA30_AUDIOCIF_BITS_4  << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_8		(TEGRA30_AUDIOCIF_BITS_8  << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_12		(TEGRA30_AUDIOCIF_BITS_12 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_16		(TEGRA30_AUDIOCIF_BITS_16 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_20		(TEGRA30_AUDIOCIF_BITS_20 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_24		(TEGRA30_AUDIOCIF_BITS_24 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_28		(TEGRA30_AUDIOCIF_BITS_28 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_32		(TEGRA30_AUDIOCIF_BITS_32 << TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_SHIFT)
-
-#define TEGRA30_AUDIOCIF_EXPAND_ZERO			0
-#define TEGRA30_AUDIOCIF_EXPAND_ONE			1
-#define TEGRA30_AUDIOCIF_EXPAND_LFSR			2
-
-#define TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT		6
-#define TEGRA30_AUDIOCIF_CTRL_EXPAND_MASK		(3                            << TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_EXPAND_ZERO		(TEGRA30_AUDIOCIF_EXPAND_ZERO << TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_EXPAND_ONE		(TEGRA30_AUDIOCIF_EXPAND_ONE  << TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_EXPAND_LFSR		(TEGRA30_AUDIOCIF_EXPAND_LFSR << TEGRA30_AUDIOCIF_CTRL_EXPAND_SHIFT)
-
-#define TEGRA30_AUDIOCIF_STEREO_CONV_CH0		0
-#define TEGRA30_AUDIOCIF_STEREO_CONV_CH1		1
-#define TEGRA30_AUDIOCIF_STEREO_CONV_AVG		2
-
-#define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT		4
-#define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_MASK		(3                                << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_CH0		(TEGRA30_AUDIOCIF_STEREO_CONV_CH0 << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_CH1		(TEGRA30_AUDIOCIF_STEREO_CONV_CH1 << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_AVG		(TEGRA30_AUDIOCIF_STEREO_CONV_AVG << TEGRA30_AUDIOCIF_CTRL_STEREO_CONV_SHIFT)
-
-#define TEGRA30_AUDIOCIF_CTRL_REPLICATE_SHIFT		3
-
-#define TEGRA30_AUDIOCIF_DIRECTION_TX			0
-#define TEGRA30_AUDIOCIF_DIRECTION_RX			1
-
-#define TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT		2
-#define TEGRA30_AUDIOCIF_CTRL_DIRECTION_MASK		(1                             << TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX		(TEGRA30_AUDIOCIF_DIRECTION_TX << TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_DIRECTION_RX		(TEGRA30_AUDIOCIF_DIRECTION_RX << TEGRA30_AUDIOCIF_CTRL_DIRECTION_SHIFT)
-
-#define TEGRA30_AUDIOCIF_TRUNCATE_ROUND			0
-#define TEGRA30_AUDIOCIF_TRUNCATE_CHOP			1
-
-#define TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT		1
-#define TEGRA30_AUDIOCIF_CTRL_TRUNCATE_MASK		(1                               << TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_TRUNCATE_ROUND		(TEGRA30_AUDIOCIF_TRUNCATE_ROUND << TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_TRUNCATE_CHOP		(TEGRA30_AUDIOCIF_TRUNCATE_CHOP  << TEGRA30_AUDIOCIF_CTRL_TRUNCATE_SHIFT)
-
-#define TEGRA30_AUDIOCIF_MONO_CONV_ZERO			0
-#define TEGRA30_AUDIOCIF_MONO_CONV_COPY			1
-
-#define TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT		0
-#define TEGRA30_AUDIOCIF_CTRL_MONO_CONV_MASK		(1                               << TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_MONO_CONV_ZERO		(TEGRA30_AUDIOCIF_MONO_CONV_ZERO << TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT)
-#define TEGRA30_AUDIOCIF_CTRL_MONO_CONV_COPY		(TEGRA30_AUDIOCIF_MONO_CONV_COPY << TEGRA30_AUDIOCIF_CTRL_MONO_CONV_SHIFT)
-
 /* Registers within TEGRA30_AUDIO_CLUSTER_BASE */
 
 /* TEGRA30_AHUB_CHANNEL_CTRL */
@@ -471,30 +364,8 @@ extern int tegra30_ahub_set_rx_cif_source(enum tegra30_ahub_rxcif rxcif,
 					  enum tegra30_ahub_txcif txcif);
 extern int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif);
 
-struct tegra30_ahub_cif_conf {
-	unsigned int threshold;
-	unsigned int audio_channels;
-	unsigned int client_channels;
-	unsigned int audio_bits;
-	unsigned int client_bits;
-	unsigned int expand;
-	unsigned int stereo_conv;
-	unsigned int replicate;
-	unsigned int direction;
-	unsigned int truncate;
-	unsigned int mono_conv;
-};
-
-void tegra30_ahub_set_cif(struct regmap *regmap, unsigned int reg,
-			  struct tegra30_ahub_cif_conf *conf);
-void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
-			   struct tegra30_ahub_cif_conf *conf);
-
 struct tegra30_ahub_soc_data {
 	u32 mod_list_mask;
-	void (*set_audio_cif)(struct regmap *regmap,
-			      unsigned int reg,
-			      struct tegra30_ahub_cif_conf *conf);
 	/*
 	 * FIXME: There are many more differences in HW, such as:
 	 * - More APBIF channels.
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index dbed3c5..36d7f4f 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -32,6 +32,7 @@
 
 #include "tegra30_ahub.h"
 #include "tegra30_i2s.h"
+#include "tegra_cif.h"
 
 #define DRV_NAME "tegra30-i2s"
 
@@ -128,7 +129,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
 	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
-	struct tegra30_ahub_cif_conf cif_conf;
+	struct tegra_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
 		return -EINVAL;
@@ -137,17 +138,17 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
+		audio_bits = TEGRA_ACIF_BITS_16;
 		sample_size = 16;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
+		audio_bits = TEGRA_ACIF_BITS_24;
 		sample_size = 24;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
+		audio_bits = TEGRA_ACIF_BITS_32;
 		sample_size = 32;
 		break;
 	default:
@@ -179,8 +180,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_write(i2s->regmap, TEGRA30_I2S_TIMING, val);
 
 	cif_conf.threshold = 0;
-	cif_conf.audio_channels = 2;
-	cif_conf.client_channels = 2;
+	cif_conf.audio_ch = 2;
+	cif_conf.client_ch = 2;
 	cif_conf.audio_bits = audio_bits;
 	cif_conf.client_bits = audio_bits;
 	cif_conf.expand = 0;
@@ -189,15 +190,12 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.truncate = 0;
 	cif_conf.mono_conv = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
-	} else {
-		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_TX;
+	else
 		reg = TEGRA30_I2S_CIF_TX_CTRL;
-	}
 
-	i2s->soc_data->set_audio_cif(i2s->regmap, reg, &cif_conf);
+	tegra_set_cif(i2s->regmap, reg, &cif_conf);
 
 	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
 	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
@@ -393,17 +391,9 @@ static const struct regmap_config tegra30_i2s_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-static const struct tegra30_i2s_soc_data tegra30_i2s_config = {
-	.set_audio_cif = tegra30_ahub_set_cif,
-};
-
-static const struct tegra30_i2s_soc_data tegra124_i2s_config = {
-	.set_audio_cif = tegra124_ahub_set_cif,
-};
-
 static const struct of_device_id tegra30_i2s_of_match[] = {
-	{ .compatible = "nvidia,tegra124-i2s", .data = &tegra124_i2s_config },
-	{ .compatible = "nvidia,tegra30-i2s", .data = &tegra30_i2s_config },
+	{ .compatible = "nvidia,tegra124-i2s", },
+	{ .compatible = "nvidia,tegra30-i2s", },
 	{},
 };
 
@@ -428,7 +418,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err;
 	}
-	i2s->soc_data = (struct tegra30_i2s_soc_data *)match->data;
 
 	i2s->dai = tegra30_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 0b1f312..e2f0d3f 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -214,14 +214,7 @@
 #define TEGRA30_I2S_LCOEF_COEF_MASK_US			0xffff
 #define TEGRA30_I2S_LCOEF_COEF_MASK			(TEGRA30_I2S_LCOEF_COEF_MASK_US << TEGRA30_I2S_LCOEF_COEF_SHIFT)
 
-struct tegra30_i2s_soc_data {
-	void (*set_audio_cif)(struct regmap *regmap,
-			      unsigned int reg,
-			      struct tegra30_ahub_cif_conf *conf);
-};
-
 struct tegra30_i2s {
-	const struct tegra30_i2s_soc_data *soc_data;
 	struct snd_soc_dai_driver dai;
 	int cif_id;
 	struct clk *clk_i2s;
diff --git a/sound/soc/tegra/tegra_cif.c b/sound/soc/tegra/tegra_cif.c
new file mode 100644
index 0000000..d9f288c
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_cif.c - Tegra Audio CIF Programming for AHUB modules
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include "tegra_cif.h"
+
+void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+		   struct tegra_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_THRESHOLD_SHIFT) |
+		((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
+		((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
+		(conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
+		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
+}
+EXPORT_SYMBOL_GPL(tegra_set_cif);
+
+MODULE_DESCRIPTION("Tegra Audio Client Interface (ACIF) driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
new file mode 100644
index 0000000..589e947
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra_cif.h - TEGRA Audio CIF Programming
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA_CIF_H__
+#define __TEGRA_CIF_H__
+
+/* Fields in CIF_RX/TX_CTRL; used by AHUB FIFOs, and all other audio modules */
+#define TEGRA_ACIF_CTRL_FIFO_THRESHOLD_SHIFT		24
+/* Channel count minus 1 */
+#define TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT			20
+/* Channel count minus 1 */
+#define TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT			16
+
+#define TEGRA_ACIF_BITS_8				1
+#define TEGRA_ACIF_BITS_16				3
+#define TEGRA_ACIF_BITS_24				5
+#define TEGRA_ACIF_BITS_32				7
+
+#define TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT		12
+#define TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT		8
+#define TEGRA_ACIF_CTRL_EXPAND_SHIFT			6
+#define TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT		4
+#define TEGRA_ACIF_CTRL_REPLICATE_SHIFT			3
+#define TEGRA_ACIF_CTRL_TRUNCATE_SHIFT			1
+#define TEGRA_ACIF_CTRL_MONO_CONV_SHIFT			0
+
+#define TEGRA_ACIF_UPDATE_MASK				0x3ffffffb
+
+struct tegra_cif_conf {
+	unsigned int threshold;
+	unsigned int audio_ch;
+	unsigned int client_ch;
+	unsigned int audio_bits;
+	unsigned int client_bits;
+	unsigned int expand;
+	unsigned int stereo_conv;
+	unsigned int replicate;
+	unsigned int truncate;
+	unsigned int mono_conv;
+};
+
+void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+		   struct tegra_cif_conf *conf);
+
+#endif
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
