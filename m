Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C79012C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E56F1660;
	Fri, 16 Aug 2019 14:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E56F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565957804;
	bh=nU9G1DZS727kVnLmimUwTt+X/t7yKd3a1kkpJqJDZbU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NaJrDUbi4s1umsne0DXNjBcPg+lOF32pxO+SNt1mdchYOU/JvyFc6nf2AegQyr34P
	 rZVL18VaeHcEma47Mda8IDyBUz39lnZEKyo5X+MnXCZ5GXiHhvc0WfjUKshxds9qoi
	 wgSuFumVIXtUKMxaivddpGC+FsEmEcwzBEF7y5S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 359C7F80213;
	Fri, 16 Aug 2019 14:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE0BF8048D; Fri, 16 Aug 2019 14:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com
 [209.85.208.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74266F8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74266F8011F
Received: by mail-ed1-f100.google.com with SMTP id s15so4973711edx.0
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=zba8ftk77hMWyfqN26TaVr6Md6HQ+X+p2yySK9PTUzg=;
 b=cr0nj8vZt9wL+v662/oIy4RAW5FLF/SJZrIQxoun/fcRpcdCj+aIt2G6pFCaHlFJwR
 ZFKRWnolhdDf0VoX+HwvLkhr8LRLCrh8K9WZLUsungGwW3UoIQ5O5QyonHsNlekHFghw
 vSsEdUma3vYyY363RqI/zO8RKwhvj3dLafG4WYjJ7Uyrk4wvNDJDuExaVa9XLdpsDaGk
 KlNlZIZLG7N7E5pNZEx3sUGVE91Jhp8Y8Dagnhm58fAfPSwxMxqIEILbSh6ZWmGix5V8
 Ck8t6LYsKFmWJweK2iRm+8JgIYMpMB4ecFDHn7bARKB3BsQwRh4V+fhuMdpIT24TyBy6
 SRng==
X-Gm-Message-State: APjAAAVuYTgqcFxSd2mOCjfXbU8ApdIZWE/8pJAF65eAh9VpuexVa9ql
 kVjY5x3UM1TrE2ByD5ZuFZoZiLWw9fXdN6LXH3m1Zv7wxpdhttCg0fNSEdqeRjZSXA==
X-Google-Smtp-Source: APXvYqz+O+VuooXs/e8zr9YfVRizmU4UODbEBqLLNbKMl+PddZX7AnaLL2Q/DIEanGW7cSalI4cSd06VN0+J
X-Received: by 2002:a17:906:4ad8:: with SMTP id
 u24mr9011808ejt.166.1565957693507; 
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id c7sm102028edq.46.2019.08.16.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003L0-4V; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7971627430F0; Fri, 16 Aug 2019 13:14:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190815192018.30570-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121452.7971627430F0@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:52 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: initial support for
	Intel ALH DAI type" to the asoc tree
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

The patch

   ASoC: SOF: topology: initial support for Intel ALH DAI type

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4d6bbf1a015c84ba05af9d8c59dd9c55cad4e668 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 15 Aug 2019 14:20:17 -0500
Subject: [PATCH] ASoC: SOF: topology: initial support for Intel ALH DAI type

The Audio Link Hub DAI does not require any static configuration from
topology for now. We still need to pass the frame rate and format to
firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815192018.30570-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a215bf58b138..28a7a6e06a53 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -346,6 +346,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SSP", SOF_DAI_INTEL_SSP},
 	{"HDA", SOF_DAI_INTEL_HDA},
 	{"DMIC", SOF_DAI_INTEL_DMIC},
+	{"ALH", SOF_DAI_INTEL_ALH},
 	{"SAI", SOF_DAI_IMX_SAI},
 	{"ESAI", SOF_DAI_IMX_ESAI},
 };
@@ -2763,6 +2764,40 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_reply reply;
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* init IPC */
+	config->hdr.size = size;
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config->hdr.cmd, config, size, &reply,
+				 sizeof(reply));
+
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to set DAI config for ALH %d\n",
+			config->dai_index);
+		return ret;
+	}
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to save DAI config for ALH %d\n",
+			config->dai_index);
+
+	return ret;
+}
+
 /* DAI link - used for any driver specific init */
 static int sof_link_load(struct snd_soc_component *scomp, int index,
 			 struct snd_soc_dai_link *link,
@@ -2859,6 +2894,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
 					&config);
 		break;
+	case SOF_DAI_INTEL_ALH:
+		ret = sof_link_alh_load(scomp, index, link, cfg, hw_config,
+					&config);
+		break;
 	case SOF_DAI_IMX_SAI:
 		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
 					&config);
@@ -2924,7 +2963,8 @@ static int sof_link_unload(struct snd_soc_component *scomp,
 	switch (sof_dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
 	case SOF_DAI_INTEL_DMIC:
-		/* no resource needs to be released for SSP and DMIC */
+	case SOF_DAI_INTEL_ALH:
+		/* no resource needs to be released for SSP, DMIC and ALH */
 		break;
 	case SOF_DAI_INTEL_HDA:
 		ret = sof_link_hda_unload(sdev, link);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
