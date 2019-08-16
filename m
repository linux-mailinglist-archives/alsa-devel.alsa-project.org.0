Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CE90138
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E64166D;
	Fri, 16 Aug 2019 14:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E64166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565957926;
	bh=r+VhlDhMoNDWS/Ho3sieu9aHnhnGXrpzlDF3pHzy9qQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Gy80FA8cNYrTHL3jyh59gK65hw2H0NXoRHPYzZr5/8jHeM9uw4n9zalpyGehnZg7R
	 gCwx9+Y1e7pYVllubEZhMuiar3qUXAWTCodmyoybqe8dq51/ccuz6uczlIuAy59IOJ
	 ct1MYpYzs2UVuMbR9LG9y0R6XJKd1nqo8SGdQENM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 765D0F805FD;
	Fri, 16 Aug 2019 14:15:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F1D1F805A9; Fri, 16 Aug 2019 14:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com
 [209.85.208.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB579F80213
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB579F80213
Received: by mail-ed1-f100.google.com with SMTP id r12so4960059edo.5
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=bIOgsIG66FKLqsPtbNT6Z/IbToG+/Uy8s9mYtCuZOlI=;
 b=eCYTEVfpzhvcWhYU1bwsgsbewkPltMHyiBT/Rs7DXQgr6srFxvK8bLPlmF1kHUHRTK
 vzQlF2eaYxJZte9RwlZFUy5LdecZeyVGFWo6IhwiBy7mAMFHHGJWGKrLycTcmSErw1wK
 DuCxa3PVtNnLY8aIZYsRtBQA1mgnvQ/cQuS214jaqi23IaN6JddgWlv4G7m++crtHGA6
 t9rUTxqw9F4CY7iedhiyUgI0183CGqbUi7qUzLk9q9WMQ5MibU3ON46k65U3uQHMHcjw
 qkHUi/FDuf6WeoN6GsaGEEQdXhlxlrhIgH0R81kYnLyw5FduBGV1aLc7m5pD2jSFjhaV
 0zCQ==
X-Gm-Message-State: APjAAAXoIhr2ZvvaX8ha3d7fgc+cVV5JVCoA4H6NleZUqx3D5594mWBh
 PMUl/+BqlXeBlF7Qtt40d8ET7nIgm4FMONLQxHr7Gn5RU+spgRVbL186CI3ZMwdAdQ==
X-Google-Smtp-Source: APXvYqz7Eflvrjtl8TUVvyMYmZCzSwxIFvbvSM1ggX/APG8ZgpS5gv+VDsOP3qpcy/RM7Zi5XsCJ9G0ucmXe
X-Received: by 2002:a50:ac1a:: with SMTP id v26mr10508139edc.131.1565957693849; 
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id r3sm98867eds.40.2019.08.16.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:53 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003L2-HO; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D96402743123; Fri, 16 Aug 2019 13:14:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190815192018.30570-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121452.D96402743123@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:52 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: Add dummy support for
	i.MX8 DAIs" to the asoc tree
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

   ASoC: SOF: topology: Add dummy support for i.MX8 DAIs

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

From f59b16ef4ccea1b52f1c4e4c60ce507dc0bcc0ad Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Thu, 15 Aug 2019 14:20:15 -0500
Subject: [PATCH] ASoC: SOF: topology: Add dummy support for i.MX8 DAIs

Add dummy support for SAI/ESAI digital audio interface
IPs found on i.MX8 boards.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815192018.30570-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  8 ++++++++
 sound/soc/sof/topology.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index da9825ad41d4..86494294274e 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -50,6 +50,8 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
 	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
 	SOF_DAI_INTEL_SOUNDWIRE,	/**< Intel SoundWire */
+	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
+	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
 };
 
 /* general purpose DAI configuration */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 6435240cef13..8f996857fb24 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -106,4 +106,12 @@
 /* for backward compatibility */
 #define SOF_TKN_EFFECT_TYPE	SOF_TKN_PROCESS_TYPE
 
+/* SAI */
+#define SOF_TKN_IMX_SAI_FIRST_TOKEN		1000
+/* TODO: Add SAI tokens */
+
+/* ESAI */
+#define SOF_TKN_IMX_ESAI_FIRST_TOKEN		1100
+/* TODO: Add ESAI tokens */
+
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9cffea142395..a215bf58b138 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -346,6 +346,8 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SSP", SOF_DAI_INTEL_SSP},
 	{"HDA", SOF_DAI_INTEL_HDA},
 	{"DMIC", SOF_DAI_INTEL_DMIC},
+	{"SAI", SOF_DAI_IMX_SAI},
+	{"ESAI", SOF_DAI_IMX_ESAI},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -2513,6 +2515,26 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
+static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
+			      struct snd_soc_dai_link *link,
+			      struct snd_soc_tplg_link_config *cfg,
+			      struct snd_soc_tplg_hw_config *hw_config,
+			      struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -2837,6 +2859,14 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
 					&config);
 		break;
+	case SOF_DAI_IMX_SAI:
+		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
+					&config);
+		break;
+	case SOF_DAI_IMX_ESAI:
+		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config,
+					 &config);
+		break;
 	default:
 		dev_err(sdev->dev, "error: invalid DAI type %d\n", config.type);
 		ret = -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
