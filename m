Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB340325539
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A59D167B;
	Thu, 25 Feb 2021 19:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A59D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276591;
	bh=e1F4ec6E26xk15wCTJhl2iA7eqh6+JfUCu69v74hnYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dl6XSUKTaRi+U8WE0QWbFuQ+U3S/O75WTk49S9pjm6QzaY5fqjJZCv3QKgoF/3Q6t
	 FaBltKsrpzOsMYyvz6ufVIyNN4NHTHQYXduGfV4Pg7tvNAyP+E08JYRxd1Oei3CEUZ
	 EJ8gqkMJbHkWbBq+l1iimpbiTzlMQ2RBVSXpP3nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E77A7F8032D;
	Thu, 25 Feb 2021 19:07:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B60F802E7; Thu, 25 Feb 2021 19:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B797DF8016A
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B797DF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="PYB4WA43"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6037e7370003>; Thu, 25 Feb 2021 10:06:47 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb
 2021 18:06:47 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 18:06:44 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>
Subject: [RFC PATCH 4/5] ASoC: simple-card-utils: Parse sysclk id and source
Date: Thu, 25 Feb 2021 23:36:03 +0530
Message-ID: <1614276364-13655-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614276407; bh=mwv0iL7wxpU7XlL//gwVHh4+2YApnc4XsJirHhkJNpA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=PYB4WA43q0qnaPr4aU3hMpHrLKKLwajNV2ZlsKUXj+/3ZSnrnkCfjjONNXbe8n5wm
 XDepulfmUviXMo/ZuCDmDgoP8X93+V2eFe3CZ7bj8NHe723zUuTu0UZoFalQEvVqdC
 NQJLqBUDFA+QkySXkgdP2sHVtOpHn4xTnNALu2PlR3GOOPC47yXVOxgEUiWqyICzJC
 n32gp1ghcRKuuJhLo1FT3HfZiWXhNJ0dd9hNIKOLA7Dm4NZtMMlM1bgYmL2+lu4jZz
 qk+tnSQpkWfoZn5Wud9sy+bprZGTcuD48+m4LnN1DcgOHzjkqoQWKM8HYP+xFGXynL
 25S3GT2X97PkQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

Currently a default value of 0 is used for system clock (sysclk) source
and id. This may not be the case always when a DAI supports multiple
clocks and multiple sources for sysclk. A specific configuration may be
needed depending on the platform.

Use DT properties "system-clock-id" and "system-clock-source" from
CPU/Codec DAI or endpoint subnode to explicitly mention about the sysclk
id and source. The DAI callback can take necessary action depending on
this. In doing so expose a helper function asoc_simple_set_sysclk() to
setup the sysclk. This way configuration can be driven from DT and driver
need not program specific values explicitly.

For example, RT5658 Codec has multiple sources for MCLK. The exact source
can be specified in Codec DAI or endpoint subnode in DT.

  codec-subnode {
      ...
      system-clock-id = <...>;
      system-clock-source = <...>;
      ...
  };

The default sysclk id and source are 0 in the driver and hence nothing
needs to be specified if default values are good enough.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/simple-card-utils.c | 59 +++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ba4a3e1..e026bf2 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -19,6 +19,8 @@
 struct asoc_simple_dai {
 	const char *name;
 	unsigned int sysclk;
+	int sysclk_id;
+	int sysclk_source;
 	int clk_direction;
 	int slots;
 	int slot_width;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index f1012e9..bbbf891 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -186,10 +186,37 @@ int asoc_simple_parse_clk(struct device *dev,
 	if (of_property_read_bool(node, "system-clock-direction-out"))
 		simple_dai->clk_direction = SND_SOC_CLOCK_OUT;
 
+	of_property_read_u32(node, "system-clock-id", &simple_dai->sysclk_id);
+
+	of_property_read_u32(node, "system-clock-source", &simple_dai->sysclk_source);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_clk);
 
+static int asoc_simple_set_sysclk(struct snd_soc_dai *dai,
+				  struct asoc_simple_dai *simple_dai,
+				  unsigned int sysclk,
+				  int dir)
+{
+	int sysclk_id = 0, sysclk_source = 0;
+	int ret;
+
+	if (simple_dai) {
+		sysclk_id = simple_dai->sysclk_id;
+		sysclk_source = simple_dai->sysclk_source;
+	}
+
+	ret = snd_soc_dai_set_sysclk(dai, sysclk_id, sysclk_source, sysclk,
+				     dir);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dai->dev, "set_sysclk error\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 int asoc_simple_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -219,8 +246,10 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 		simple_priv_to_props(priv, rtd->num);
 
 	if (dai_props->mclk_fs) {
-		snd_soc_dai_set_sysclk(codec_dai, 0, 0, 0, SND_SOC_CLOCK_IN);
-		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, 0, SND_SOC_CLOCK_OUT);
+		asoc_simple_set_sysclk(codec_dai, dai_props->codec_dai, 0,
+				       SND_SOC_CLOCK_IN);
+		asoc_simple_set_sysclk(cpu_dai, dai_props->cpu_dai, 0,
+				       SND_SOC_CLOCK_OUT);
 	}
 
 	asoc_simple_clk_disable(dai_props->cpu_dai);
@@ -270,19 +299,18 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, 0, mclk,
-					     SND_SOC_CLOCK_IN);
-		if (ret && ret != -ENOTSUPP)
-			goto err;
+		ret = asoc_simple_set_sysclk(codec_dai, dai_props->codec_dai,
+					     mclk, SND_SOC_CLOCK_IN);
+		if (ret)
+			return ret;
 
-		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, 0, mclk,
-					     SND_SOC_CLOCK_OUT);
-		if (ret && ret != -ENOTSUPP)
-			goto err;
+		ret = asoc_simple_set_sysclk(cpu_dai, dai_props->cpu_dai,
+					     mclk, SND_SOC_CLOCK_OUT);
+		if (ret)
+			return ret;
 	}
+
 	return 0;
-err:
-	return ret;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_hw_params);
 
@@ -307,12 +335,11 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 		return 0;
 
 	if (simple_dai->sysclk) {
-		ret = snd_soc_dai_set_sysclk(dai, 0, 0, simple_dai->sysclk,
+		ret = asoc_simple_set_sysclk(dai, simple_dai,
+					     simple_dai->sysclk,
 					     simple_dai->clk_direction);
-		if (ret && ret != -ENOTSUPP) {
-			dev_err(dai->dev, "simple-card: set_sysclk error\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	if (simple_dai->slots) {
-- 
2.7.4

