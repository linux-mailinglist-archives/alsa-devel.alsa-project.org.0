Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34F4514C2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 21:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D3F1696;
	Mon, 15 Nov 2021 21:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D3F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637007007;
	bh=+WIdbIHUMTXiu6h+lszXUBNfqmt9BcfqEXGWZTqi37U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L26xHKHIxpfWcAvGwrQF0GQikC+ediTMGbb9/jFtlR0sSsW3yWfeXl1emuJFwRTFK
	 Phft3PY1hCLw/RuS5q/7w60sKyyip2Mt3x3mnJJzPNRzklK0Uia+0v9fQV1YN03u8X
	 akdOOAR3QA/o+S7t7l6nmjWGeFC1hbqnrye8i/OE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39A5F80163;
	Mon, 15 Nov 2021 21:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0920F8027D; Mon, 15 Nov 2021 21:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6FD6F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 21:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6FD6F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ETdHq22i"
Received: by mail-wr1-x436.google.com with SMTP id d5so33004535wrc.1
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vv3++EAvq4bz+YuG3ou53n/DT6vcjuuoVxgm/bXL6Vw=;
 b=ETdHq22ic93KuqD21fistzxz9DwapDxVE5IFlchvdlZLMZVkDkdQdtI0XfWM0TkRMo
 7owXz/jTpVlQoqmO+nXOnmpKpkYm0l5uFLvT8Qobk+ks9yiZAscigvn/wu+20NFYsXsz
 p+Zwq5DBi561IUJfq0Me8tBsFvjsxuiNVzw3DwofnZysI0e0XvegFAETn/Bad0dhhC0p
 NrhzFo4UBQFQMxWbL0eDEAfrPHNfgX5VBDQmbs2NZ/avjNMU/5vcBiudHr+7SivjuCct
 GcURA9tHOs9rXQi/w7PtVzwMCSMuUCDG2AlLExJ/TKtfJqjCgkofIaG2xyBX69GAK2h0
 nV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vv3++EAvq4bz+YuG3ou53n/DT6vcjuuoVxgm/bXL6Vw=;
 b=B6RytaWbY/+qe4GVWKGh6BF+vpded8Nos7bHqG+H4PvUCOsttUhXrNmqydBeJlNnc1
 u7ZRDEIx4V0P16r21ZNYIjB6+zDt8PbOAY6v4ICocBI5zgpRhefs53R8xJbjAi6KWY70
 7VORtyfZ18/NoObHm3QYqN4ox/ICO1IkFWorT/qDlV0e5tjGY9QvVfNzAppymnRWc+Mo
 pO3tKQOyJbYg7p2gGF+NYVYGMJY6bydQtcsphBBuEeNP1PrhsIzyXM/R4uiIL1QfCGaD
 KePX9JIv/gCIPD+oxLVJgwF7rlrWl8tgl+IMOC5c+bppYaOjBAkeq3FWaE8TtpkZUOsj
 Tr8g==
X-Gm-Message-State: AOAM530VA7rYVADGJeSNHxeXmEOF4Z+7E3fcmtdmx99yPxHr+zVOR2FM
 4tMbKCNZYDimkTVpRM/Af6o=
X-Google-Smtp-Source: ABdhPJzJcHuXy3LPbIo21wm3J2OBVA00Rxd1RPMy7rqvNd62ZvgeaLU5H2MB62p4KuUsBnAXDoedPg==
X-Received: by 2002:adf:f947:: with SMTP id q7mr2120309wrr.260.1637006917995; 
 Mon, 15 Nov 2021 12:08:37 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id h13sm15645389wrx.82.2021.11.15.12.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:08:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Date: Mon, 15 Nov 2021 21:08:33 +0100
Message-Id: <20211115200833.452559-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 sound/soc/sunxi/sun4i-spdif.c | 99 +++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index a10949bf0ca1..f7438e3ece65 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <sound/asoundef.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -385,11 +386,109 @@ static int sun4i_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
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
+	unsigned int reg;
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
+	return 0;
+}
+
+static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
+	u8 *status = ucontrol->value.iec958.status;
+	unsigned int reg;
+
+	reg = (u32)status[3] << 24;
+	reg |= (u32)status[2] << 16;
+	reg |= (u32)status[1] << 8;
+	reg |= (u32)status[0];
+
+	regmap_write(host->regmap, SUN4I_SPDIF_TXCHSTA0, reg);
+
+	reg = (u32)(status[5] & 3) << 8;
+	reg |= (u32)status[4];
+
+	regmap_write(host->regmap, SUN4I_SPDIF_TXCHSTA1, reg);
+
+	reg = SUN4I_SPDIF_TXCFG_CHSTMODE;
+	if (status[0] & IEC958_AES0_NONAUDIO)
+		reg |= SUN4I_SPDIF_TXCFG_NONAUDIO;
+
+	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
+			   SUN4I_SPDIF_TXCFG_CHSTMODE |
+			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
+
+	return 0;
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
 
-- 
2.33.1

