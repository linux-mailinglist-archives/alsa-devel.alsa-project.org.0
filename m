Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB425608E83
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D99F787B;
	Sat, 22 Oct 2022 18:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D99F787B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666456135;
	bh=6p4eEXg83yIDAGM8xySBXPY0ojda1VHoJPXL8c4QIEA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GAtIRRHvzzheqqTBwFg9a9EfuYRu7ZONC6nO7MhNwD+pqeNbqGMuQqa8HP6CHEzxt
	 EQgUL9pMMU95HJ9GWskK+YMKm2ZFjilh7btok/Tf7dkYR1N7OYb32n/emqnAiZlUcC
	 w0Ic2hFE9IRjdSxOOS/umf40+/hIRJzYBOkVJKAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F51F802DB;
	Sat, 22 Oct 2022 18:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDDB1F80290; Sat, 22 Oct 2022 18:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21390F80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21390F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kxWSvkr4"
Received: by mail-wr1-x431.google.com with SMTP id bp11so8930344wrb.9
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ktkNejLf5LU86KvYGlX282kufTNr47TRhHJaTddj0/Y=;
 b=kxWSvkr4ZOGssABhmV4JWeqGJPQM9aKQZQmbQYexW7JPTaBwh9ZYKPQuHAfWeFWPgD
 JIgXQ/SuMLfVpB+nn3zxnjNMro5vxhLmdGdZj3LaAJ17pHjaeatcLQ6PO8DZbrMjGADE
 nRcWXHS2LHxoXJnO838vP4dVTuBVz77hDE71zZKFRZD6llC3QR1cEdryfUXc0fEXayTH
 p4iH2QaBeiEPrcFU9FPPQHaPOj67bf4outShJbWtj6ICbMChTPjuqCNK1J+GUml2nv+s
 CDeYswtfxTLFQCi0QcpyIgsnCJvegj62wWoTa0SvYBOmjQjWVJmuyjjmX/OUGHWMWiWc
 YoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ktkNejLf5LU86KvYGlX282kufTNr47TRhHJaTddj0/Y=;
 b=U0juigf7x2fvxF6bDph/F1M1sBEIXoXIkiucy+C6eUFwgQaL2jvY4ER7W2/5SlYPeC
 ominLVBsEQCcki6+0cWAVlE9Gz18OVm6Vm8NLh3ZBlJLW+7SEC2Y4K4iO4aO4svXk6Ve
 gteKbD4ZwGZtc0Rvvf1OdhIR7p/2I1liaxJohEhH4FOWTYgqMyJoRCCRplztUT0IusMN
 y+BXWZBaDeOB+nS1YkEvZuGgbnKpfQ2XSgAHujNtelYs/aLJAnympgEDpXIDTNfiiySj
 P+UAZ0tGJMTgDhGVDX9/Aleni+d2xD5mKyr3/Xt90BqyGqWeDXMiiK6R7ydB5zQWrhgi
 XVAQ==
X-Gm-Message-State: ACrzQf0H7eSB2723NHXQ/YcSUuX3wpiD4d8WuFcEUtxYQeQsnae7hK/a
 hy6KJq85QU7aOryIm6T1iQI=
X-Google-Smtp-Source: AMsMyM5pJJuwPjRKj6P8P4nUqOnixt9lCmG0gQ7Zju6LnYGjzPLoWiCaVEzp4J6jVj/JRk3SKA7OBA==
X-Received: by 2002:a05:6000:1acb:b0:231:faaa:8976 with SMTP id
 i11-20020a0560001acb00b00231faaa8976mr15583292wry.426.1666456075308; 
 Sat, 22 Oct 2022 09:27:55 -0700 (PDT)
Received: from localhost (94.197.3.61.threembb.co.uk. [94.197.3.61])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003b95ed78275sm5583279wmo.20.2022.10.22.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 09:27:54 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuninori.morimoto.gx@renesas.com
Subject: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system clock IDs
Date: Sat, 22 Oct 2022 17:27:41 +0100
Message-Id: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

Some DAIs have multiple system clock sources, which can be chosen
using the "clk_id" argument to snd_soc_dai_set_sysclk(). Currently
this is hardcoded to 0 when using simple cards, but that choice is
not always suitable.

Add the "system-clock-id" property to allow selecting a different
clock ID on a per-DAI basis.

To simplify the logic on DPCM cards, add a dummy "asoc_simple_dai"
instance and use that for the dummy components on DPCM links. This
ensures that when we're iterating over DAIs in the PCM runtime there
is always a matching "asoc_simple_dai" we can dereference.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a0b827f0c2f6..9f9a72299637 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -26,6 +26,7 @@ struct asoc_simple_dai {
 	const char *name;
 	unsigned int sysclk;
 	int clk_direction;
+	int sysclk_id;
 	int slots;
 	int slot_width;
 	unsigned int tx_slot_mask;
@@ -67,6 +68,7 @@ struct asoc_simple_priv {
 		struct prop_nums num;
 		unsigned int mclk_fs;
 	} *dai_props;
+	struct asoc_simple_dai dummy_dai;
 	struct asoc_simple_jack hp_jack;
 	struct asoc_simple_jack mic_jack;
 	struct snd_soc_dai_link *dai_link;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bef16833c487..d4d898e06e76 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -262,6 +262,9 @@ int asoc_simple_parse_clk(struct device *dev,
 	if (of_property_read_bool(node, "system-clock-direction-out"))
 		simple_dai->clk_direction = SND_SOC_CLOCK_OUT;
 
+	if (!of_property_read_u32(node, "system-clock-id", &val))
+		simple_dai->sysclk_id = val;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_clk);
@@ -355,7 +358,7 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
 			snd_soc_dai_set_sysclk(cpu_dai,
-					       0, 0, SND_SOC_CLOCK_OUT);
+					       dai->sysclk_id, 0, SND_SOC_CLOCK_OUT);
 
 		asoc_simple_clk_disable(dai);
 	}
@@ -364,7 +367,7 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
 			snd_soc_dai_set_sysclk(codec_dai,
-					       0, 0, SND_SOC_CLOCK_IN);
+					       dai->sysclk_id, 0, SND_SOC_CLOCK_IN);
 
 		asoc_simple_clk_disable(dai);
 	}
@@ -439,7 +442,7 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	unsigned int mclk, mclk_fs = 0;
-	int i, ret;
+	int i, ret, sysclk_id;
 
 	if (props->mclk_fs)
 		mclk_fs = props->mclk_fs;
@@ -472,13 +475,21 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		for_each_rtd_codec_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
+			pdai = simple_props_to_dai_codec(props, i);
+			sysclk_id = pdai->sysclk_id;
+
+			ret = snd_soc_dai_set_sysclk(sdai, sysclk_id, mclk,
+						     SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_OUT);
+			pdai = simple_props_to_dai_cpu(props, i);
+			sysclk_id = pdai->sysclk_id;
+
+			ret = snd_soc_dai_set_sysclk(sdai, pdai->sysclk_id, mclk,
+						     SND_SOC_CLOCK_OUT);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
@@ -523,7 +534,8 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 		return 0;
 
 	if (simple_dai->sysclk) {
-		ret = snd_soc_dai_set_sysclk(dai, 0, simple_dai->sysclk,
+		ret = snd_soc_dai_set_sysclk(dai, simple_dai->sysclk_id,
+					     simple_dai->sysclk,
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
@@ -858,6 +870,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			dai_link[i].cpus	= &priv->dummy;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
+			dai_props[i].cpu_dai	= &priv->dummy_dai;
 		}
 
 		if (li->num[i].codecs) {
@@ -882,6 +895,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			dai_link[i].codecs	= &priv->dummy;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
+			dai_props[i].codec_dai	= &priv->dummy_dai;
 		}
 
 		if (li->num[i].platforms) {
-- 
2.38.1

