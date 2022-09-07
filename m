Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A25B066E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9AB1692;
	Wed,  7 Sep 2022 16:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9AB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560656;
	bh=KRASiHquA6p3sWtJ/NUy4nyW7vA3uR9sXVrEpwF0zmM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWiR0MsDYS+Os8ZTnUD3a+0HwQxhAkgf/8GMzrL6QZ/oTccB0WyL60NNNXq761lCQ
	 EDeTUp8lz3ft6SPZhAOB7sJzmecmDv9ND1D0ohPN5vcjg1F7Cvq8QhIudXjaG8QTM0
	 /uiCy/EMvz3i6GzPmrJJCiS1hXyVz0FQmFO/G0U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A8EF80559;
	Wed,  7 Sep 2022 16:22:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7A1F80552; Wed,  7 Sep 2022 16:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B95F804CA
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B95F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="CCM0A87K"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0E4D3200019;
 Wed,  7 Sep 2022 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0x0N8xdASNNGJim+/6TTRqaoE75eCBfHEEUyRn2uUTs=;
 b=CCM0A87KExaQlKFFsYRXly065FI86fsGob/0RhItQzNDnScAjh7sOUNNcoL5Adu/N/ZzgI
 N/5BYEhHZkPJy/sMG6DhmtT/qWCVKqd4CUMg/HihWZbDmguNpAQssSgPfMQdld0kC3ObrO
 B16fCiUAayyyd9DMA3D1obcNhpb59k0sKKzsoBQDnPZgfDXwzfDaFu2a/djAo6l0i948er
 Mv5ZTZNVYQXYg4DMpGb/itY7Zcf81HWGALFdVvZANTuw20isR5VsyPoEgfVwtwOr8j43J2
 iIKLpa/jg/hGDAB0G1iw/ijnXPVfHdQTnYQd27Lu+p5QwMApGb9PvZKrqgP5Iw==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 6/8] ASoC: audio-graph: let dai_link->init be overridable
Date: Wed,  7 Sep 2022 16:21:22 +0200
Message-Id: <20220907142124.2532620-7-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

We can already override dai_link->ops via a custom pointer in
asoc_simple_priv. Do the same for dai_link->init.

This is needed for a card that need to call .set_sysclk multiple times to
initialize more than one clock. The current code does not allow to do it
cleanly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/sound/simple_card_utils.h    | 1 +
 sound/soc/generic/audio-graph-card.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a0b827f0c2f6..60dab5f68f5e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -75,6 +75,7 @@ struct asoc_simple_priv {
 	struct snd_soc_dai_link_component dummy;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
+	int (*init)(struct snd_soc_pcm_runtime *rtd);
 	const struct snd_soc_ops *ops;
 	unsigned int dpcm_selectable:1;
 	unsigned int force_dpcm:1;
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index b327372f2e4a..38c05eb1c650 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -263,6 +263,8 @@ static int graph_link_init(struct asoc_simple_priv *priv,
 
 	dai_link->init		= asoc_simple_dai_init;
 	dai_link->ops		= &graph_ops;
+	if (priv->init)
+		dai_link->init	= priv->init;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-- 
2.34.1

