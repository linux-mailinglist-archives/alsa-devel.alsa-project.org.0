Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA560377D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 03:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8542DA92E;
	Wed, 19 Oct 2022 03:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8542DA92E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666142575;
	bh=lxVHG5K9JKyLR+GP9N9lxwSU7JN5L7TWNowOgV+EAy4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lyp/TyMg6zPouoEFYh1emlYJUxz97P447MIRhdZGGKEn/kzBQ9ym6S8/fwUVV6c9C
	 R46JtLX6gWqMCDr45cwuxSEDaNgSfVOKXcmzFwxm2W+faJMhEwj/3Ny7qHFhmoVnr+
	 xLNqLt/5JNKoaOcM0KOiLaZR+V2H3Zg3ewtSJ7MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 074FEF800E5;
	Wed, 19 Oct 2022 03:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE74F800E5; Wed, 19 Oct 2022 03:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C6D0F800E5
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 03:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C6D0F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SXTHeBRb"
Received: by mail-ed1-x529.google.com with SMTP id s30so23051302eds.1
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 18:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=joQnhqtEFh/++Hfsr6F88X2sakCVbgGmjSi4iezXjZk=;
 b=SXTHeBRbQaCse2EQb3Xix3D1HHeVIkNzlYb6qoAsl5+cgl4K2ZSGnKO+Jf6G9efaGT
 TXV5sA9ItCV31Vc3MwjVaaFZ3k5WrVeVDYuYRhx1aXU4OAlU1DgHMw6l/gTg2Na6+Ion
 5oHW8BfbHsO4B84l78qGEKHVPqeGbDlrfOm7yuzzcdT6/bHsgn8DOQ7QhFFaY9TQDwDo
 P/RBwWVPvHraVt9BVFrZRdRdG9MpjKzmZYKMFqaUePDuMoBAFqka7s/ZmQCDhTV3EAnN
 yRt27yzLHaVF06QSwTXlFRUUoJQuGYJZTPQCRDDifa0BtMmI5IiiYYrmJVS8wclxkcl8
 C2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=joQnhqtEFh/++Hfsr6F88X2sakCVbgGmjSi4iezXjZk=;
 b=mWjb/Jr5mSUtmOiM3VXj6M2K77k4+zdY8MeNBKF9HADqo2WJLSq2w3XlBnHiwoBiZJ
 wXx71dRC14xgeX/IvFSGFBts+pb33Hw2bZeleW06BnIU2pv6dABtLatkdJHeOiPOmPYw
 6RnfgLDqOa31xWPl0iQyrbVrYuKc4MrHrQRMOsHYyyD4jQ9LD1JaHx657ctqn7d/wvio
 tff5Z4BNdJ1nioEZ19WzyC7N6HH9JXkGmmpo2knZhAr0muxBkcdxXl/i4QBicwcQs4b7
 kfDUiL5wBD2pk4xIRfPW2BEPmhUWoXvr3JIWEc4jYYLEprZAtbnt2GpPxSoT5Qe9S5v5
 k5Tg==
X-Gm-Message-State: ACrzQf0W2MEOYQ4jDqZR8tNhCPxJok5/GjgflVkLdrEnqyo0arTyw/TG
 sdb6tY3nbyubrmliqQcHrCw=
X-Google-Smtp-Source: AMsMyM4G8UgBarnVBJ2XIHY5sfyMjX0We1JUyLDjtAAuaz3ODeXb8GuuWmgug2WsuUc76JpUCC71cw==
X-Received: by 2002:a05:6402:26d2:b0:45d:280b:5878 with SMTP id
 x18-20020a05640226d200b0045d280b5878mr5147683edd.385.1666142510303; 
 Tue, 18 Oct 2022 18:21:50 -0700 (PDT)
Received: from localhost (188.28.2.210.threembb.co.uk. [188.28.2.210])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b00770812e2394sm8268145ejy.160.2022.10.18.18.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 18:21:49 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: simple-card: Fix up checks for HW param fixups
Date: Wed, 19 Oct 2022 02:23:02 +0100
Message-Id: <20221019012302.633830-1-aidanmacdonald.0x0@gmail.com>
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
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
v2: Rename helper function to asoc_simple_is_convert_required() as
    suggested by Kuninori Morimoto.

 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/audio-graph-card.c  |  2 +-
 sound/soc/generic/simple-card-utils.c | 15 +++++++++++++++
 sound/soc/generic/simple-card.c       |  3 +--
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a0b827f0c2f6..25e049f44178 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -177,6 +177,7 @@ void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 				      struct snd_pcm_hw_params *params);
 void asoc_simple_parse_convert(struct device_node *np, char *prefix,
 			       struct asoc_simple_data *data);
+bool asoc_simple_is_convert_required(const struct asoc_simple_data *data);
 
 int asoc_simple_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index b327372f2e4a..fe7cf972d44c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -417,7 +417,7 @@ static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
 	 * or has convert-xxx property
 	 */
 	if ((of_get_child_count(codec_port) > 1) ||
-	    (adata->convert_rate || adata->convert_channels))
+	    asoc_simple_is_convert_required(adata))
 		return true;
 
 	return false;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bef16833c487..be69bbc47f81 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -85,6 +85,21 @@ void asoc_simple_parse_convert(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
 
+/**
+ * asoc_simple_is_convert_required() - Query if HW param conversion was requested
+ * @data: Link data.
+ *
+ * Returns true if any HW param conversion was requested for this DAI link with
+ * any "convert-xxx" properties.
+ */
+bool asoc_simple_is_convert_required(const struct asoc_simple_data *data)
+{
+	return data->convert_rate ||
+	       data->convert_channels ||
+	       data->convert_sample_format;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_is_convert_required);
+
 int asoc_simple_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 78419e18717d..feb55b66239b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -393,8 +393,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 			 * or has convert-xxx property
 			 */
 			if (dpcm_selectable &&
-			    (num > 2 ||
-			     adata.convert_rate || adata.convert_channels)) {
+			    (num > 2 || asoc_simple_is_convert_required(&adata))) {
 				/*
 				 * np
 				 *	 |1(CPU)|0(Codec)  li->cpu
-- 
2.38.0

