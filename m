Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33F29E56D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B360F169D;
	Thu, 29 Oct 2020 08:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B360F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958240;
	bh=3cF/gfTmHvryxal5L9QbPQcLKdAuATrowdzZuHrZgCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOVIcOk7avqfzxwfnQkrFxyqQ7fX/NAhbcoLgH9rzHa2Al3Zz+E0ss11XgUtItPSw
	 PPU24qOMFbImNnWvx4iitcmEZd0xC2Gmn6sRGFeAj7ZZTcYQy/X5xbx4cl+gx5YJt4
	 cCak70vM0HFJQRPXNkPkTsN/RvkME63dOiilSKis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 408AFF80537;
	Thu, 29 Oct 2020 08:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C572DF8020D; Thu, 29 Oct 2020 08:45:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41EB0F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41EB0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GcBbyaVp"
Received: by mail-pl1-x641.google.com with SMTP id b19so916575pld.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rg5J52NuyGCmmE1mtIcXPCwKs4Dspg6yOxJ+mqzq0jI=;
 b=GcBbyaVpviEKwJ5P+78y2ZosN9hkzhWGP4CYU5Eqo4qFc1b8GP0n1pmTj9W600GgYd
 +lp3Ubkqsyd7xVHssjHeZSkLaI/ap1lvsq6kOvDp5HchCO6sn1WsiXjqvwXEgpCySx7u
 AiT9YMXUmTzjGKZ1udDSXYBtk0lVmSH3/96Kx4fhDb737u+lduYuqqmDUZ/q40lvbrxZ
 vuKBGhRM3OhoB8+V3WF7+Jbh3BGT/dnx4H6LaJOPMNcWi9agRtfU4Hj9fLhiCI7u1Xiw
 cvQV4awVQzrUTcQ2HpV5calW5w0js2lzWvwwLjFAQCHLEA6RRfAmGNqLmWUYZWiETZms
 Umig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rg5J52NuyGCmmE1mtIcXPCwKs4Dspg6yOxJ+mqzq0jI=;
 b=oYLXnZlNxFVZAk0quYmMySJg4/aT+NMQbk2bBfBNzup8jbjpOs4KnLDKPtGJzn1zcj
 MFOtYhUeHbxT7WScAGuX/0B9JqZGcUTqMLxshk4Kf2yEfXGknlLnWR3TQSmSh5NG0b3g
 zjqekgRrkToA55cefVDePon2RlG1oiMqjlwOT/EaWJo0K3HmXk6+/PApU5oZYcpqXrVz
 Lq/McO5fcVNnf+G7s7x9imSoSORbYe+pkdoOLYfX1sQQTTnW4NDxqsezKhwDnd/dCfYR
 hnXyJG+8E77LS0kpFgPP3p8/8Ee7wl9b+yHn855URLP/air8U/jPkBw9IcWqDS1coFq5
 baiA==
X-Gm-Message-State: AOAM531Ps9Z47tzRSmnDyvN8jlm2CVdp8eOp76p1HKzfUr0hz3uIC3Jp
 8FvneX03/oz5vZZQMaCfP/U=
X-Google-Smtp-Source: ABdhPJxyHGcIIytk0HselO54m4ginY9+7Q4ekyHRdxzBx8YVFup8tCHFE3TtzL04LqRyU9DN8M3ICA==
X-Received: by 2002:a17:902:7882:b029:d6:38a2:8dee with SMTP id
 q2-20020a1709027882b02900d638a28deemr2791341pll.58.1603957527452; 
 Thu, 29 Oct 2020 00:45:27 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id v3sm1709965pju.38.2020.10.29.00.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:45:27 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 17/25] ASoC: hdac_hdmi: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:53 +0800
Message-Id: <20201029074301.226644-17-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/codecs/hdac_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 2c1305bf0572..92111561a041 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2026,7 +2026,6 @@ static void hdmi_codec_remove(struct snd_soc_component *component)
 	pm_runtime_disable(&hdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hdmi_codec_resume(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
@@ -2049,9 +2048,6 @@ static int hdmi_codec_resume(struct device *dev)
 	hdac_hdmi_present_sense_all_pins(hdev, hdmi, false);
 	return 0;
 }
-#else
-#define hdmi_codec_resume NULL
-#endif
 
 static const struct snd_soc_component_driver hdmi_hda_codec = {
 	.probe			= hdmi_codec_probe,
-- 
2.28.0

