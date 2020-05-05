Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8831C6291
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4CA1757;
	Tue,  5 May 2020 23:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4CA1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712556;
	bh=x0/rjaKOAQdhKFeTgB1qrNISoDNfmOSbicSilrasUk8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAgjLUgw4CuN0mQZZNYnHyVQaOWZxmmKN+/gTxx2i1Ef841ho1GRChUmqxGCYNBvX
	 SECdHaaGRN7MF60X+gFAJ9e0vleY2kS4i+cE9L9vxX0v+W9Q4xgnInGNmn8p9TwKiX
	 iiXG2Ejj8OeYwdjH5MVDL1dABhmPOnl65RGjREMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36CE6F80332;
	Tue,  5 May 2020 22:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB95FF802DC; Tue,  5 May 2020 22:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E31F800AD
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E31F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QHBIuMVR"
Received: by mail-qt1-x844.google.com with SMTP id g16so3259707qtp.11
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbOTZKdDiTz4nkjpMFToxDcldOrzAggMFpLZjtp9ltE=;
 b=QHBIuMVRxo7pjGzu7yin/cUqpwHU5tvo1tnOXXwrxx4lV3yUEDz5lDPM0ykeZApnK5
 0swopjegKDgiK4Hxww2kIVUXpBoDGlX+ddDHzFv6BuqBqRTItXQmM8kXqfbdYvzZQUAf
 VLQNXOa6jgrdGgrRCLn2gePFwD3qWc8iIPEK/MXd8RRbPfFEyeSmnTNU1dKg9/R6+zj6
 hlIAKP3cSzPCYmev5g+L6jGp+c5t2eXVwGDwgcKAkC7wQIQeeqNUa/G3V6i2qlhMyX67
 cgaYhXV1eAjaib+d1+LgEDg0Yg8Y7T4q/rSd1J++PPKRIsKrlkkRMefiBCCF3nfpryCl
 86zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbOTZKdDiTz4nkjpMFToxDcldOrzAggMFpLZjtp9ltE=;
 b=FpeVbQJuKckLFv/LaS/56Z9d7SXbWmjmOMJ3+CTEDT7r7fAYa1j0GKLQXQ/L18pYFu
 rUJ9O8tLoQoNDhJBxYPqXRP62dRfXnfZXY6yGylCo3V7QZdl4wSfPRG0xhJZFgpo4eHJ
 o6QjLoXmO8X4EwjhRmTT6Dcss/64IeSWw2nHM+l8HclxSaAKmz1WNUbshL7tizNjpAk7
 RymFW+cuQ8wRTO/kuWYWEON2TTEoYaXlXi8AHUU9lLi21hDcwxrVcTpFXZ7wFndDssbM
 DozS2EN1dXz8cE2/prezXsot0gpurME5+FarpXAj1MQ90835puS7JrTWOfHhC5v1vUvs
 mBzg==
X-Gm-Message-State: AGi0PubR4F+2Qc5CAigpInDrViqWb+OYL21/XExMcjh4pJAhCtsptK4F
 Bt01hq6hRuCtbq6pDAkDXvD/0LKR
X-Google-Smtp-Source: APiQypKa9jlbxDvZac6TgaLgMiVGCdXHD+KvJ0LGOxn6ICx3OW2NgCKhT61xIkmdzm8YE0P63w3sTQ==
X-Received: by 2002:ac8:4c9d:: with SMTP id j29mr5059317qtv.297.1588712035148; 
 Tue, 05 May 2020 13:53:55 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 13/14] ASoC: amd: RN machine driver using dmic
Date: Tue,  5 May 2020 16:53:26 -0400
Message-Id: <20200505205327.642282-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200505205327.642282-1-alexander.deucher@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

This patch adds Renoir Machine driver for dmic support.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/acp3x-rn.c | 112 ++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
new file mode 100644
index 000000000000..8556446637dc
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Machine driver for AMD Renoir platform using DMIC
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/io.h>
+
+#include "rn_acp3x.h"
+
+#define DRV_NAME "acp_pdm_mach"
+
+static int acp_pdm_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hw_params)
+{
+	return 0;
+}
+
+static struct snd_soc_ops acp_pdm_ops = {
+	.hw_params = acp_pdm_hw_params,
+};
+
+static int acp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	return 0;
+}
+
+SND_SOC_DAILINK_DEF(acp_pdm,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp_rn_pdm_dma.0")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec.0",
+						  "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_rn_pdm_dma.0")));
+
+static struct snd_soc_dai_link acp_dai_pdm[] = {
+	{
+		.name = "acp3x-dmic-capture",
+		.stream_name = "DMIC capture",
+		.ops = &acp_pdm_ops,
+		.init = acp_init,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(acp_pdm, dmic_codec, platform),
+	},
+};
+
+static struct snd_soc_card acp_card = {
+	.name = "acp",
+	.owner = THIS_MODULE,
+	.dai_link = acp_dai_pdm,
+	.num_links = 1,
+};
+
+static int acp_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct acp_pdm *machine = NULL;
+	struct snd_soc_card *card;
+
+	card = &acp_card;
+	acp_card.dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"snd_soc_register_card(%s) failed: %d\n",
+			acp_card.name, ret);
+		return ret;
+	}
+	if (ret) {
+		dev_err(&pdev->dev,
+			"snd_soc_register_card(%s) failed: %d\n",
+			acp_card.name, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static struct platform_driver acp_mach_driver = {
+	.driver = {
+		.name = "acp_pdm_mach",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp_probe,
+};
+
+static int __init acp_audio_init(void)
+{
+	platform_driver_register(&acp_mach_driver);
+	return 0;
+}
+
+static void __exit acp_audio_exit(void)
+{
+	platform_driver_unregister(&acp_mach_driver);
+}
+
+module_init(acp_audio_init);
+module_exit(acp_audio_exit);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.4

