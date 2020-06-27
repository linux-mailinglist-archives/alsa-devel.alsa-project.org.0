Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932D20BEBA
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF3A1692;
	Sat, 27 Jun 2020 07:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF3A1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234313;
	bh=qKv8bCvX2FEQcn7KriJuPNUtvWACV76lhgyEAM1/+4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Br4VEpHmCPt43+tPbl837yh/kdWX2EH1K54EYt9mlgNnFkjxuvSj/KuCeofilQZ9t
	 iW0TZABUly+C5ztes0vIQo+6QHZsS7wVC5tk7TTWfUO2CPzlWZttxtENe4cUvOtqTR
	 fphzLwhdNNRmQv2IB3URrbcJriXFlVOpZyLpxEv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCEFF80361;
	Sat, 27 Jun 2020 06:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F9EF80361; Sat, 27 Jun 2020 06:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 759E5F8034F
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759E5F8034F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kCYw7XDv"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d11a0000>; Fri, 26 Jun 2020 21:54:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:37 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:37 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:37 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1440000>; Fri, 26 Jun 2020 21:55:37 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for DPCM
Date: Sat, 27 Jun 2020 10:23:37 +0530
Message-ID: <1593233625-14961-16-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233690; bh=Te4jUznXki9FHbpY9jdroP0lQAJV5bmFZUw3joZLRMA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=kCYw7XDvF9dzytYUHEXZKGa52HviuHaMxranP6e94A7JmVFBugO2SPj2QK6xUzD2A
 O3zOhTqS5jCuWLKFb/eXWBi38tSigO9GJr4893PP/e5zFKnfossemXHHJ3S1HhbXyV
 R6JQY0QuMiB8dEKBQ82nYDXDgTVjv3PxiSBOrAru1yeKpf4+SVOeqcEoSYcXBPWT5z
 GjTCEd7Kl24JxZzq+/0s4wdlImKqWXxesIK33GcxRAAss/mTQAaZy4P3osEMkGKBc/
 te+bw6/FqoKnoHDEnh5C1aSiGAeyQkkIGRlAIwzexg4P94i0q3qjDv8LezjMaDxNjX
 I9aNromwY3aZQ==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

PCM devices are created for dai links with 'no-pcm' flag as '0'.
Such DAI links have CPU component which implement pcm_construct()
and pcm_destruct() callbacks. Based on this, current patch exposes
a helper function to identify such components and populate 'no_pcm'
flag for DPCM DAI link.

This helps to have BE<->BE component links where PCM devices need
not be created for CPU components involved in the links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/soc.h             |  2 ++
 sound/soc/generic/simple-card.c |  3 +++
 sound/soc/soc-core.c            | 25 +++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33acead..1e0376f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -397,6 +397,7 @@ struct snd_soc_dai_driver;
 struct snd_soc_dai_link;
 struct snd_soc_component;
 struct snd_soc_component_driver;
+struct snd_soc_dai_link_component;
 struct soc_enum;
 struct snd_soc_jack;
 struct snd_soc_jack_zone;
@@ -437,6 +438,7 @@ int snd_soc_add_component(struct device *dev,
 		const struct snd_soc_component_driver *component_driver,
 		struct snd_soc_dai_driver *dai_drv,
 		int num_dai);
+bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc);
 int snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 62f2978..f19030b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -188,6 +188,9 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		if (ret)
 			goto out_put_node;
 
+		if (!soc_component_is_pcm(cpus))
+			dai_link->no_pcm = 1;
+
 		ret = asoc_simple_parse_clk_cpu(dev, np, dai_link, dai);
 		if (ret < 0)
 			goto out_put_node;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9041a03..d2a47c3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -259,6 +259,31 @@ static inline void snd_soc_debugfs_exit(void)
 
 #endif
 
+bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_dai *dai;
+
+	for_each_component(component) {
+		if (!component->driver)
+			continue;
+
+		for_each_component_dais(component, dai) {
+			if (!dai->name || !dlc->dai_name)
+				continue;
+
+			if (strcmp(dai->name, dlc->dai_name))
+				continue;
+
+			if (component->driver->pcm_construct)
+				return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(soc_component_is_pcm);
+
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
-- 
2.7.4

