Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B1537CC9
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC8A1EEB;
	Mon, 30 May 2022 15:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC8A1EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918085;
	bh=z4wDMbAV2RS1G7aP/5ULZccvzCp/6WBnP3rMRzqLcME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auJsyj0mYKm5g611UZSfCNpwrtQtMlO/2t+Zt7FTZ3zAyvy3ZBBjB41SrodV5rZtr
	 vFQQbL6RGrIyPOjzDij0Frsou0UkMMwvm8JNJeB6pw3hZi5l0FRQvBu+C6tjVxnHYR
	 G0jnJOtaTbPwa1OtCjdBpEW95XcRCRY5N8vJIMGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 667C9F8051C;
	Mon, 30 May 2022 15:40:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 892C9F8051F; Mon, 30 May 2022 15:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 868D8F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 868D8F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NNV2g7UO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4484260F74;
 Mon, 30 May 2022 13:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171C4C3411A;
 Mon, 30 May 2022 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918009;
 bh=z4wDMbAV2RS1G7aP/5ULZccvzCp/6WBnP3rMRzqLcME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NNV2g7UOgjFjDTTdmjeqoktnyl2WfHIL2NjxdHS5xJKfFfRXvy98ijkK7ajooK52T
 CMe/xS2yvZ5zqy4nK9kv2xBXQNK8y9aVV8ZJAr4ewuuu6cepM3YQPFR3fs9NMsSbN6
 xWWjYGAGOlQEGJ8c8AN3dJ4Gg0obcZj/D2UlvB/C/+Rw/eJTZHlpdwM4/USdiiDr9D
 7rH7xTMcRDbodDnfDqAQV59POEcZveHtc8BxWO4kKqOne6f6GdxHHmT1rj475TvF06
 xBVyGjSgYfoRg4ZHvOqnhBw3hehXkL4sYSxqI9CFnL8LLaGM21Vx0GgzWq6rhoL13x
 iymwVS/9RR0BQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 030/109] ASoC: rsnd: care return value from
 rsnd_node_fixed_index()
Date: Mon, 30 May 2022 09:37:06 -0400
Message-Id: <20220530133825.1933431-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.com,
 lgirdwood@gmail.com, wsa+renesas@sang-engineering.com,
 Mark Brown <broonie@kernel.org>, christophe.jaillet@wanadoo.fr,
 colin.king@intel.com, Dan Carpenter <dan.carpenter@oracle.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit d09a7db431c65aaa8303eb456439d1831ca2e6b4 ]

Renesas Sound is very complex, and thus it needs to use
rsnd_node_fixed_index() to know enabled pin index.

It returns error if strange pin was selected,
but some codes didn't check it.

This patch 1) indicates error message, 2) check return
value.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pmlbgn5t.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/core.c | 15 ++++++++++-----
 sound/soc/sh/rcar/dma.c  |  9 ++++++++-
 sound/soc/sh/rcar/rsnd.h |  2 +-
 sound/soc/sh/rcar/src.c  |  7 ++++++-
 sound/soc/sh/rcar/ssi.c  | 14 ++++++++++++--
 sound/soc/sh/rcar/ssiu.c |  7 ++++++-
 6 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6a8fe0da7670..af8ef2a27d34 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1159,6 +1159,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 		struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np;
 	int i;
 
@@ -1169,7 +1170,11 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 	for_each_child_of_node(node, np) {
 		struct rsnd_mod *mod;
 
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
+		if (i < 0) {
+			of_node_put(np);
+			break;
+		}
 
 		mod = mod_get(priv, i);
 
@@ -1183,7 +1188,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 	of_node_put(node);
 }
 
-int rsnd_node_fixed_index(struct device_node *node, char *name, int idx)
+int rsnd_node_fixed_index(struct device *dev, struct device_node *node, char *name, int idx)
 {
 	char node_name[16];
 
@@ -1210,6 +1215,8 @@ int rsnd_node_fixed_index(struct device_node *node, char *name, int idx)
 			return idx;
 	}
 
+	dev_err(dev, "strange node numbering (%s)",
+		of_node_full_name(node));
 	return -EINVAL;
 }
 
@@ -1221,10 +1228,8 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 
 	i = 0;
 	for_each_child_of_node(node, np) {
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
 		if (i < 0) {
-			dev_err(dev, "strange node numbering (%s)",
-				of_node_full_name(node));
 			of_node_put(np);
 			return 0;
 		}
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 03e0d4eca781..463ab237d7bd 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -240,12 +240,19 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
 					  struct rsnd_mod *mod, char *x)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct dma_chan *chan = NULL;
 	struct device_node *np;
 	int i = 0;
 
 	for_each_child_of_node(of_node, np) {
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
+		if (i < 0) {
+			chan = NULL;
+			of_node_put(np);
+			break;
+		}
 
 		if (i == rsnd_mod_id_raw(mod) && (!chan))
 			chan = of_dma_request_slave_channel(np, x);
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 6580bab0e229..d9cd190d7e19 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -460,7 +460,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 		struct device_node *playback,
 		struct device_node *capture);
 int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name);
-int rsnd_node_fixed_index(struct device_node *node, char *name, int idx);
+int rsnd_node_fixed_index(struct device *dev, struct device_node *node, char *name, int idx);
 
 int rsnd_channel_normalization(int chan);
 #define rsnd_runtime_channel_original(io) \
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index 42a100c6303d..0ea84ae57c6a 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -676,7 +676,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		if (!of_device_is_available(np))
 			goto skip;
 
-		i = rsnd_node_fixed_index(np, SRC_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SRC_NAME, i);
+		if (i < 0) {
+			ret = -EINVAL;
+			of_node_put(np);
+			goto rsnd_src_probe_done;
+		}
 
 		src = rsnd_src_get(priv, i);
 
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 87e606f688d3..43c5e27dc5c8 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -1105,6 +1105,7 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 			    struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node;
 	struct device_node *np;
 	int i;
@@ -1117,7 +1118,11 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 	for_each_child_of_node(node, np) {
 		struct rsnd_mod *mod;
 
-		i = rsnd_node_fixed_index(np, SSI_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SSI_NAME, i);
+		if (i < 0) {
+			of_node_put(np);
+			break;
+		}
 
 		mod = rsnd_ssi_mod_get(priv, i);
 
@@ -1182,7 +1187,12 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 		if (!of_device_is_available(np))
 			goto skip;
 
-		i = rsnd_node_fixed_index(np, SSI_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SSI_NAME, i);
+		if (i < 0) {
+			ret = -EINVAL;
+			of_node_put(np);
+			goto rsnd_ssi_probe_done;
+		}
 
 		ssi = rsnd_ssi_get(priv, i);
 
diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 138f95dd9f4a..4b8a63e336c7 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -462,6 +462,7 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node = rsnd_ssiu_of_node(priv);
 	struct rsnd_dai_stream *io_p = &rdai->playback;
 	struct rsnd_dai_stream *io_c = &rdai->capture;
@@ -474,7 +475,11 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 		for_each_child_of_node(node, np) {
 			struct rsnd_mod *mod;
 
-			i = rsnd_node_fixed_index(np, SSIU_NAME, i);
+			i = rsnd_node_fixed_index(dev, np, SSIU_NAME, i);
+			if (i < 0) {
+				of_node_put(np);
+				break;
+			}
 
 			mod = rsnd_ssiu_mod_get(priv, i);
 
-- 
2.35.1

