Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE1454E26
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 20:46:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30086190A;
	Wed, 17 Nov 2021 20:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30086190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637178389;
	bh=RL8zXBW5KPv2HowpBpRsiNdRpyzXUW86MSQZdhbdV1Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GwDALJMl2/S/tFWNHAs0KPs+e/NzxBf+aedN4r0M2JifhmFIGVxMlwikynarR6wKV
	 or625W7qgju0yoB2Fo6AxLJJB6jLDuOTz8EMajw7uLaGSubSm7cV/HslJpIKyX0pNM
	 4dUHDnstNH9MEk9T4tupgE2t/FBoJcx1CdSk64XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81114F80134;
	Wed, 17 Nov 2021 20:45:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B9EF8027D; Wed, 17 Nov 2021 20:45:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69BA6F80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 20:45:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BA6F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FqUXYaL8"
Received: by mail-wr1-x435.google.com with SMTP id d27so6841461wrb.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 11:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=944R6VkEBj9im8jiA+ivAeCJ/qxWRZNjJgR3j1HHJsI=;
 b=FqUXYaL8OmqBwrutkMC4FUcb8GQLxJQhrs2IZACoWWYJT5i2lMRi84N8GZYnqtuXi/
 5GQmAO+GCAH77andbguKDbha8P1jUGAdx5/Z6BCNar9LMvTDaWQnjRkB+8dom7rZT+oA
 GjvaV4+Q+0fE/0EyxVjzd1/zuRceH9bxbN7a+ZflzoAER51Lmtc9UjHYC7+5tS9uDrwT
 akSqVBxgEfwLCANkL+F4UlMXgGI9PnvZMht7BTc1+tdWs5Tr9pU2DCiPM6vY1bAsCVYG
 qCKYAdMSGQH9tZrJ2QfjikBNQs0czpdfFQU7Rfms7x+qgD5VQdUJBd3+xjVDebuFoqyD
 UWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=944R6VkEBj9im8jiA+ivAeCJ/qxWRZNjJgR3j1HHJsI=;
 b=EJ5Fsvu3NAJmVYiiOXVUtqG3O2721nOFGQyo2CuOGLNrd/wKlPHShqQP4UVRhYpkph
 4YQOSMuXDLX5LNDb94shsypn82qs1/WHViO0EoeB458j/Ad+XM18uRGl5KwscG9l4zjU
 08MzWQdIFwZJyECcGHOCGh0r4ycHt+Tn50LoHUSRcBwVn7FOUE9UQNoo8ZC88Kw5B5N0
 OvGGuPCq+m1sNeotYpN3+Cn+XiBQdsK9hke8PLcn3H4i2wMNowA3FMT6PwSm5RAoN7Dm
 rzy7M7c2Wty0mEMV5sMw7BQ3K1DzYuDuRMo4Qk3rCaBYo3+jQmtIGq8cWLUMxDYp6ulB
 vhxw==
X-Gm-Message-State: AOAM531WWEhhqOhB+maeekJcEjrU3j8Rzs942cR3XI5+KpcWwdMJpISD
 Dgwgk81h3zTXidXnt+N1EQo=
X-Google-Smtp-Source: ABdhPJzk26xdBnc/SuVaoCsMCFhCY+mkLSr/cpJ1B4mSZ/wAFinxM5dmhULQy/yAq6xfFjdSrrSG5w==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr23974817wrc.130.1637178301973; 
 Wed, 17 Nov 2021 11:45:01 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id g198sm712529wme.23.2021.11.17.11.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 11:45:01 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v2] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Date: Wed, 17 Nov 2021 20:44:58 +0100
Message-Id: <20211117194458.2249643-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

SPDIF core is capable of sending custom status.

Implement IEC958 control handling.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- return 1 if there was a change in sun4i_spdif_set_status()
- added locking for reading and writing status

 sound/soc/sunxi/sun4i-spdif.c | 115 ++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index a10949bf0ca1..17090f43150e 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -21,6 +21,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
+#include <sound/asoundef.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -186,6 +188,7 @@ struct sun4i_spdif_dev {
 	struct regmap *regmap;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 	const struct sun4i_spdif_quirks *quirks;
+	spinlock_t lock;
 };
 
 static void sun4i_spdif_configure(struct sun4i_spdif_dev *host)
@@ -385,11 +388,122 @@ static int sun4i_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
+static int sun4i_spdif_info(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int sun4i_spdif_get_status_mask(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	u8 *status = ucontrol->value.iec958.status;
+
+	status[0] = 0xff;
+	status[1] = 0xff;
+	status[2] = 0xff;
+	status[3] = 0xff;
+	status[4] = 0xff;
+	status[5] = 0x03;
+
+	return 0;
+}
+
+static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+	u8 *status = ucontrol->value.iec958.status;
+	unsigned long flags;
+	unsigned int reg;
+
+	spin_lock_irqsave(&host->lock, flags);
+
+	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
+
+	status[0] = reg & 0xff;
+	status[1] = (reg >> 8) & 0xff;
+	status[2] = (reg >> 16) & 0xff;
+	status[3] = (reg >> 24) & 0xff;
+
+	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA1, &reg);
+
+	status[4] = reg & 0xff;
+	status[5] = (reg >> 8) & 0x3;
+
+	spin_unlock_irqrestore(&host->lock, flags);
+
+	return 0;
+}
+
+static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+	u8 *status = ucontrol->value.iec958.status;
+	unsigned long flags;
+	unsigned int reg;
+	bool chg0, chg1;
+
+	spin_lock_irqsave(&host->lock, flags);
+
+	reg = (u32)status[3] << 24;
+	reg |= (u32)status[2] << 16;
+	reg |= (u32)status[1] << 8;
+	reg |= (u32)status[0];
+
+	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA0,
+				 GENMASK(31,0), reg, &chg0);
+
+	reg = (u32)status[5] << 8;
+	reg |= (u32)status[4];
+
+	regmap_update_bits_check(host->regmap, SUN4I_SPDIF_TXCHSTA1,
+				 GENMASK(9,0), reg, &chg1);
+
+	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+	if (status[0] & IEC958_AES0_NONAUDIO)
+		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+
+	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+			   SUN4I_SPDIF_TXCFG_CHSTMODE |
+			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+
+	spin_unlock_irqrestore(&host->lock, flags);
+
+	return chg0 || chg1;
+}
+
+static struct snd_kcontrol_new sun4i_spdif_controls[] = {
+	{
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, MASK),
+		.info = sun4i_spdif_info,
+		.get = sun4i_spdif_get_status_mask
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = sun4i_spdif_info,
+		.get = sun4i_spdif_get_status,
+		.put = sun4i_spdif_set_status
+	}
+};
+
 static int sun4i_spdif_soc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	snd_soc_dai_init_dma_data(dai, &host->dma_params_tx, NULL);
+	snd_soc_add_dai_controls(dai, sun4i_spdif_controls,
+				 ARRAY_SIZE(sun4i_spdif_controls));
+
 	return 0;
 }
 
@@ -512,6 +626,7 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->pdev = pdev;
+	spin_lock_init(&host->lock);
 
 	/* Initialize this copy of the CPU DAI driver structure */
 	memcpy(&host->cpu_dai_drv, &sun4i_spdif_dai, sizeof(sun4i_spdif_dai));
-- 
2.34.0

