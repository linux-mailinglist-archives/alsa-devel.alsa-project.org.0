Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B92361A5F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 09:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0EF21680;
	Fri, 16 Apr 2021 09:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0EF21680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618557172;
	bh=foMF+NQfph4EFZWhY1VhJA3sDIAx0VdgWIiEHFnEPGw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SVanxC8DyHg+OCvLbpLc4ssIYW3HkMqDRwgyWa5lp5PnNJ0Be3d0dgSHDtxTltL5R
	 bfGpZZhY/3fTSe08lxElXLCCdVlyhmNYH0rUTNc8vZH9XhvUrylbMoDeJo47599Uhe
	 9NDFO6kxKuvfVRD35JmTQXSK0UvQfwO2a8qjJftY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F2DF800B9;
	Fri, 16 Apr 2021 09:11:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9522AF80269; Fri, 16 Apr 2021 09:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C9AF800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 09:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C9AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UGYqfc5X"
Received: by mail-ej1-x633.google.com with SMTP id n2so40583632ejy.7
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OaqrHj95z02mUJg5I8GmywTZZPXMCAVkBh62//UPOA=;
 b=UGYqfc5Xo3+IrByEO5c0PrV2EvT8svx3aGBdPL1lIp891q42vgBo1AyHIf6L/wB4HZ
 KewVTuL9XgeYSj76hRocuaKivTWleXDSgq1ayDk2CM5YlwW3tuS+dPngoKZ+Zwt6hzy4
 zuwEPjeFe2eoNCS59Wrd1MpP+Xld8N1Ot/ZzXSg4d73I+mLLNEzPOdAYl8EbMpqIndKB
 FdkYBsNWzkDX1t3Zuyuejt86aK4E3eIt/UitSlZDKulQ6zbWyo9jC5+T4En3ILGnQW0o
 PV0sKkVog132Xgu6JdoXVOH4yf7Aci9JmOrXK8uKwD9ZR31bxqhiu0RrWz1JGbVJtdZ/
 SBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OaqrHj95z02mUJg5I8GmywTZZPXMCAVkBh62//UPOA=;
 b=rxgUn1uqM/OvU3oglEn+nZ2ylrsso0AUz9MdU7mMrYBKbR52TCV5oiayZfZJxmCZuj
 fgLjSbSfsBT1UIqzNgvbHSNf4vQvcD18yPET3yrteU2mxNJWBU6C3DMoCOyu1iOqJsVb
 Z7syTMSulX6NkJOMpUsK2rPOj5ssTc63YQzPJVTIcExWU2KS5sEyT++M35S2qoi3vbJl
 fB/g7osEUAKoOYZtO61zvzvpqDzkeCBb6mE4Pw0wjlJ7/XSs23uw57IY5Qr9WwVjQMAL
 gJ6NxS1lf9vZY6iUDt9oOG8Rf0+Ab5YsUPuOY7Yu7kQ90lZTp4oF0qCAeSFOpNOoeXev
 4b8Q==
X-Gm-Message-State: AOAM530C0yXX82m1ovnPK7ySg699+5IrrnoKmABeyEIuJ1WnzqdG5Mca
 SWVDzQdBnOiGRMIsqpv4JLw=
X-Google-Smtp-Source: ABdhPJzA9XroXjTUkZpBMQqDnrJBdNTCik88OkIpZFkcHXsn9PvgoKbFEW45Uf/H4WUs2ORq8+DG2w==
X-Received: by 2002:a17:906:51da:: with SMTP id
 v26mr6978466ejk.212.1618557072680; 
 Fri, 16 Apr 2021 00:11:12 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
 by smtp.gmail.com with ESMTPSA id w13sm3692224edx.80.2021.04.16.00.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 00:11:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too many
 links
Date: Fri, 16 Apr 2021 09:11:46 +0200
Message-Id: <20210416071147.2149109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
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

From: Thierry Reding <treding@nvidia.com>

The DAI counting code doesn't propagate errors when the number of
maximum links is exceeded, which causes subsequent initialization code
to continue to run and that eventually leads to memory corruption with
the code trying to access memory that is out of bounds.

Fix this by propgating errors when the maximum number of links is
reached, which ensures that the driver fails to load and prevents the
memory corruption.

Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Platform")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 19 +++++++++++--------
 sound/soc/generic/simple-card.c      | 17 ++++++++++-------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0582fe296471..2401212281c2 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -539,8 +539,8 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static void graph_get_dais_count(struct asoc_simple_priv *priv,
-				 struct link_info *li);
+static int graph_get_dais_count(struct asoc_simple_priv *priv,
+				struct link_info *li);
 
 int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
@@ -552,7 +552,10 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	card->dev = dev;
 
 	memset(&li, 0, sizeof(li));
-	graph_get_dais_count(priv, &li);
+	ret = graph_get_dais_count(priv, &li);
+	if (ret < 0)
+		return ret;
+
 	if (!li.link)
 		return -EINVAL;
 
@@ -657,8 +660,8 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static void graph_get_dais_count(struct asoc_simple_priv *priv,
-				 struct link_info *li)
+static int graph_get_dais_count(struct asoc_simple_priv *priv,
+				struct link_info *li)
 {
 	/*
 	 * link_num :	number of links.
@@ -706,9 +709,9 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 	 *	=> 4 DAIs  = 2xCPU + 2xCodec
 	 *	=> 1 ccnf  = 1xdummy-Codec
 	 */
-	graph_for_each_link(priv, li,
-			    graph_count_noml,
-			    graph_count_dpcm);
+	return graph_for_each_link(priv, li,
+				   graph_count_noml,
+				   graph_count_dpcm);
 }
 
 int audio_graph_card_probe(struct snd_soc_card *card)
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index bf5ddf1ea65f..1d1c4309b582 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -526,8 +526,8 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static void simple_get_dais_count(struct asoc_simple_priv *priv,
-				  struct link_info *li)
+static int simple_get_dais_count(struct asoc_simple_priv *priv,
+				 struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
@@ -584,12 +584,12 @@ static void simple_get_dais_count(struct asoc_simple_priv *priv,
 		li->num[0].platforms	= 1;
 
 		li->link = 1;
-		return;
+		return 0;
 	}
 
-	simple_for_each_link(priv, li,
-			     simple_count_noml,
-			     simple_count_dpcm);
+	return simple_for_each_link(priv, li,
+				    simple_count_noml,
+				    simple_count_dpcm);
 }
 
 static int simple_soc_probe(struct snd_soc_card *card)
@@ -628,7 +628,10 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 
 	memset(&li, 0, sizeof(li));
-	simple_get_dais_count(priv, &li);
+	ret = simple_get_dais_count(priv, &li);
+	if (ret < 0)
+		return ret;
+
 	if (!li.link)
 		return -EINVAL;
 
-- 
2.30.2

