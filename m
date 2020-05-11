Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B291CE770
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03631886;
	Mon, 11 May 2020 23:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03631886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232524;
	bh=IYwWV2dDGl3mXZju5E9dZYNeos0WztVBOIRH6EphVAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYwx17/xn0WaKCtu3GXeH/um/4tdE63npcJAFbY8iCYjmN87geOPcCiUaPlWvosBy
	 jfgwmzU+1XmvNUUKfnVfI6qmnpw/DBZCBISgJ/vYPUkttA9ebigOFAhuvzv2BW9KlB
	 iL7YrnbqtjSCZCpNfV7uLCdabfjKHFJ2Xp+mtSiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0D40F80328;
	Mon, 11 May 2020 23:21:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FC6CF802A8; Mon, 11 May 2020 23:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC653F8014C
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC653F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PFnxp1/j"
Received: by mail-qv1-xf42.google.com with SMTP id ee19so1884979qvb.11
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mOhmgwFwpfsy182LTdptBQdnrj6KEUVh7v0sY+ZhwE=;
 b=PFnxp1/jMlW7aCeiYMDMpOjBwVyljkmmtJNOn0tpShlzwcM6TtF8BkSIXJcEROrAOy
 bARU1KcpHxF0ovdjcNxTkvJq4be8EFVC/fM17TwE7PcarxmYWbt5VDMo5BH34QN1ssph
 sXt6LnA+KbUHdzLv12N8plhKdH88owczW2PUcgU/wNtUKCFmjtgrg/MIMQY6OUUsC2WL
 0g/0ligkIU/1NI245ZTnd/iSiaabrfRFeu6dqiUj8WKmPwVdV2EgIM50VLTOXqP0y0gX
 0Sb3y2i+E0j6VuNNUEzriqL+xmUpIQoZ8MSaMpBmcqwAvtmhUKiYIG5wzNW6tLSaYnD+
 TrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mOhmgwFwpfsy182LTdptBQdnrj6KEUVh7v0sY+ZhwE=;
 b=ouba1JZ7qlipX2vrpc0oNcLTLr33VBsIs1EluH1MFHa4xHTfW2OSLsCbhec6s5lEUv
 4ttT12qqPMv4uOoTOuL7FUO102Dbpyi0lepwaEVBp8f1EjTuv3TXYWm4zGqpj/jE+4Jm
 LWVr0kQ/sLPdrKEtFcwKeuQ+qAqrA1u6c3cY2GSPghQ/rrnx94VHQzXpIotPvPgCT7H5
 wUSvcmB5f+eFbRdyge9yhzg6emwWGtTYBS7Yoo6gi+uuGej3R0ZSNi3JPIGrzec6tN8k
 ggxF0vNBPAmFRUmk8G64UYFVusVUSqOzm9cGO+2nIlfOF9zEBvuadUn7w/crEJU7mA5L
 PNfw==
X-Gm-Message-State: AGi0PuYpcYfgG2AkvbQJPR4aitbeAF2lzcmSGBF9Jkpc0kxaj5ejR6+A
 0MLTvH9hgPAAOO9BLzTO9mcCvzn+
X-Google-Smtp-Source: APiQypLWft9a8GS8Bk3lrA6HzM7W8ZzHWOpr4xDZrw9frYi1/yoAevgHb+0hApiLJo7B7UmsyBgHMQ==
X-Received: by 2002:a05:6214:7a7:: with SMTP id
 v7mr17796764qvz.27.1589232039537; 
 Mon, 11 May 2020 14:20:39 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 13/14] ASoC: amd: RN machine driver using dmic
Date: Mon, 11 May 2020 17:20:13 -0400
Message-Id: <20200511212014.2359225-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
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

v2:
- Removed redundant code

 sound/soc/amd/renoir/acp3x-rn.c | 106 ++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
new file mode 100644
index 000000000000..069714035e95
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -0,0 +1,106 @@
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

