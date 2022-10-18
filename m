Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183E60364A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 01:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223CBA6BD;
	Wed, 19 Oct 2022 01:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223CBA6BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666134242;
	bh=pGg8hI8bcUF4qiTCVNMBlk1xUpKRktwZ+Puinaid6U4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VteEh1c87GgyiSK4w7HdJ/0YiWpilZ7+widr5iA6+5cTpiahCI6UoSodjeyOsIpJK
	 VTA0tqGh4qzSwypCXPwNSp6uZ11VlyzbLqHiFjxsfAi5WX6z1DZYfsqzlSvtiKzSND
	 pmDscs5GxwFRdY+hnnx9KV3R5zC8aXt9Rg+5ksSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAD9F800E5;
	Wed, 19 Oct 2022 01:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B19F800E5; Wed, 19 Oct 2022 01:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58A4AF800AB
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 01:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58A4AF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C/U2QxOq"
Received: by mail-ed1-x534.google.com with SMTP id m15so22678426edb.13
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5PU7hPEIqMrr7mHQR+by2rxkaknzANGyzbduzUJ57MQ=;
 b=C/U2QxOqKuFQw6hfJdYnYcqQvR/y2e6tiQAND7kPLzGadV4LgukBu6YEvAOMpIl9s7
 8Xq8tWyKVz2nFeU2nlamoBkmq/bWbvl2taaogoiHTB7fq25IZ1F8xVDUA+hcYmlO4T9I
 eouOChWSDcNbMfKJo8N/SJLX6DOzycmRofhkKM26QpqZPgMGHEUcv/cyL40AXYh87Bhi
 F/PJpG1jP4dCVQaq0p6Dp2eqGxoFLINcIKDFmkGSONYGZauiyE/zabK9nUViZ8/mamTs
 NirhB6899kjetW3Pz2k1S51/c+qDIh3j0EryVbrMt46zNxJ8OYZjfzgSCpiLPOL7uIAk
 0YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5PU7hPEIqMrr7mHQR+by2rxkaknzANGyzbduzUJ57MQ=;
 b=pPTm3dhin4EC5NJ2h5VYJZ5HXnIhVwsYo5xb1btLTTLFyhkCErgsDrjelfyE9phGdS
 lXKIBwzBm48ib7/6/4vfG6StZxD4/985y/cAMo9j+pilXaomR5Y7b/hqZxmypR3nHX1t
 zYgiKfnLk+n377hvKnbUhrYdggWEV6VIIxSpYeMa1DBb839+wcTUn170tqlAZKnFiaWq
 0Bgc4qs3VllOTuJgfquH3GmTc3uUsXQKkpRNP68oxkyEXyL4duNZb7wkR7xI9Hhc8h7W
 0R52LaHe6wl9r+ZdUJvu13/tL9HSzkPC3wyVVL3WOdBbILq+0Bgef0krz2hCozql29XA
 OO/g==
X-Gm-Message-State: ACrzQf2x/mj782+1EbIjoJLEpnud/c+1Z1t1SBGMgdQMlcMqZhmRmvrc
 wXhmz8iUOFHUhVycTeDQ6Rw=
X-Google-Smtp-Source: AMsMyM5tKkRA+5+GaUxKMmnE5vtiiKScjjT/cObwVa/r9Sq8PoVpcyibBB4YUY9g3ZK6TCfLzMv4Iw==
X-Received: by 2002:a05:6402:400d:b0:45c:9a5c:444a with SMTP id
 d13-20020a056402400d00b0045c9a5c444amr4609636eda.283.1666134181473; 
 Tue, 18 Oct 2022 16:03:01 -0700 (PDT)
Received: from localhost (188.28.2.110.threembb.co.uk. [188.28.2.110])
 by smtp.gmail.com with ESMTPSA id
 gc37-20020a1709072b2500b0077d6f628e14sm8119188ejc.83.2022.10.18.16.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 16:03:00 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v1] ASoC: simple-card: Fix up checks for HW param fixups
Date: Wed, 19 Oct 2022 00:04:09 +0100
Message-Id: <20221018230409.610538-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 spujar@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com
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

The "convert-xxx" properties only have an effect for DPCM DAI links.
A DAI link is only created as DPCM if the device tree requires it;
part of this involves checking for the use of "convert-xxx" properties.

When the convert-sample-format property was added, the checks got out
of sync. A DAI link that specified only convert-sample-format but did
not pass any of the other DPCM checks would not go into DPCM mode and
the convert-sample-format property would be silently ignored.

Fix this by adding a function to do the "convert-xxx" property checks,
instead of open-coding it in simple-card and audio-graph-card. And add
"convert-sample-format" to the check function so that DAI links using
it will be initialized correctly.

Fixes: 047a05366f4b ("ASoC: simple-card-utils: Fixup DAI sample format")
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/audio-graph-card.c  |  2 +-
 sound/soc/generic/simple-card-utils.c | 15 +++++++++++++++
 sound/soc/generic/simple-card.c       |  3 +--
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a0b827f0c2f6..cfed741e0181 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -177,6 +177,7 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 				      struct snd_pcm_hw_params *params);
 void asoc_simple_parse_convert(struct device_node *np, char *prefix,
 			       struct asoc_simple_data *data);
+bool asoc_simple_convert_is_required(const struct asoc_simple_data *data);
 
 int asoc_simple_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index b327372f2e4a..7804625b131e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -417,7 +417,7 @@ static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
 	 * or has convert-xxx property
 	 */
 	if ((of_get_child_count(codec_port) > 1) ||
-	    (adata->convert_rate || adata->convert_channels))
+	    asoc_simple_convert_is_required(adata))
 		return true;
 
 	return false;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bef16833c487..7a708be24656 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -85,6 +85,21 @@ void asoc_simple_parse_convert(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
+/**
+ * asoc_simple_convert_is_required() - Query if HW param conversion was requested
+ * @data: Link data.
+ *
+ * Returns true if any HW param conversion was requested for this DAI link with
+ * any "convert-xxx" properties.
+ */
+bool asoc_simple_convert_is_required(const struct asoc_simple_data *data)
+{
+	return data->convert_rate ||
+	       data->convert_channels ||
+	       data->convert_sample_format;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_convert_is_required);
+
 int asoc_simple_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 78419e18717d..675991cdee87 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -393,8 +393,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 			 * or has convert-xxx property
 			 */
 			if (dpcm_selectable &&
-			    (num > 2 ||
-			     adata.convert_rate || adata.convert_channels)) {
+			    (num > 2 || asoc_simple_convert_is_required(&adata))) {
 				/*
 				 * np
 				 *	 |1(CPU)|0(Codec)  li->cpu
-- 
2.38.0

