Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F33364871
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEA5167B;
	Mon, 19 Apr 2021 18:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEA5167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618850533;
	bh=NIaMFLmvbmqDcrOJhA/cS7ucnANIs+PS4vVTkpLYCAM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dGfbx+Spp0UAS3co5Kt3XLI6LnJg2dEViReoceuDWrgNG/mBwbpxfhX5n2elNAfFU
	 b1aup4ZnIABmfiTZ0PnvQ5y95BKKfY8o2VghDG5QC+kuH0aYTgkpapi+DKj2P7iN7n
	 jbExxAMgrr3i8opXAt7bS3WUpOJ4YFSNKqTONkuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBC3F80256;
	Mon, 19 Apr 2021 18:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24656F80227; Mon, 19 Apr 2021 18:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CCC7F8019B
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 18:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CCC7F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RjEialUZ"
Received: by mail-ej1-x635.google.com with SMTP id g5so47230336ejx.0
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYD7iKUGDbvQ7xhqvcEek4tJrzFRX/ATvZrSVpamY0s=;
 b=RjEialUZD7kChrGxyPKEsP5Wr+y6NEFyQeHB8YTaoLNZYKDy8PW92VlHFOyn8a6HcQ
 ZErNSMibeYa3TEC/oKk1qi2tLPPGnX8FMa3NM5y2jslqCQOoJUWI6RWPc6Rnr8J1GHWx
 hUZxQqI8xy4a2uCC+nqTT+96LmhMZL9ZU6iJXZElrccMkWUCads5Tl+OGcnxax1vvHs/
 E09OosP8NiQiseq8CLaVUSVchSe0/yhPcBlM4O1v2j3HwQugD7sIaRliHnbVSGFdr17E
 EZSRDjvyudg7EVztTAnWMobS3Yk5ZZPUuwGxXErc/6JRa54OUgezJwjevjj+Ve/p5KzY
 C6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYD7iKUGDbvQ7xhqvcEek4tJrzFRX/ATvZrSVpamY0s=;
 b=nuKOKihIyQC9lmmVhEER4Xm/J8ajk2dnlCFBhWU8oVFCpSJTZozOnAAFag5FxiS3d7
 FC6qyKm6fGF+VqsGp/JiL9GBbUjwZAagu45R+BBedW7Gq9UDUQ6etqQvC58RbM49Zuml
 MtuM/Vg/sFiTzY3mlP6nPCA+RoK56KbOC+dLBWqsaR42Rgp36WyIN5u0MGdoIlPjy8Hc
 18KhVjTh0oicsmhz4LPwMsbwx2RDwwskd7VxiUS5QpmQP/2XvbSFGPrcPUZ2ktmy5WmL
 j3nAJhsHVTc7Avvm6SQ1+n57wtnAIJH7kdA6vB5qZdWUc9b7uMSRBwU7wzZgv+jp+jqh
 kkcg==
X-Gm-Message-State: AOAM533D+d+DJSZ0JOOMiCiXFZQ9U787acVXP6e7/XFSI1xaWu8uN6zX
 AsfD/zXzauOnUYJKcx/Yh8c=
X-Google-Smtp-Source: ABdhPJyT0QKTkuCiONsSK1Um/TdKUMfW6JX+g+qt12SXzsljY/kZWhtWBDRG4qIu3OYC/9nFgFtCfQ==
X-Received: by 2002:a17:906:90b:: with SMTP id
 i11mr23136383ejd.168.1618850436277; 
 Mon, 19 Apr 2021 09:40:36 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
 by smtp.gmail.com with ESMTPSA id u1sm13253974edv.90.2021.04.19.09.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 09:40:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: simple-card-utils: Allocate link info structure on heap
Date: Mon, 19 Apr 2021 18:41:17 +0200
Message-Id: <20210419164117.1422242-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
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

struct link_info can grow fairly large and may cause the stack frame
size to be exceeded when allocated on the stack. Some architectures
such as 32-bit ARM, RISC-V or PowerPC have small stack frames where
this causes a compiler warning, so allocate these structures on the
heap instead of the stack.

Fixes: 343e55e71877 ("ASoC: simple-card-utils: Increase maximum number of links to 128")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 18 +++++++++++-------
 sound/soc/generic/simple-card.c      | 23 +++++++++++++----------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c7369beee805..e45a560aa9b0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -548,21 +548,24 @@ static int graph_get_dais_count(struct asoc_simple_priv *priv,
 int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info li;
+	struct link_info *li;
 	int ret;
 
+	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 
-	memset(&li, 0, sizeof(li));
-	ret = graph_get_dais_count(priv, &li);
+	ret = graph_get_dais_count(priv, li);
 	if (ret < 0)
 		return ret;
 
-	if (!li.link)
+	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, &li);
+	ret = asoc_simple_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
@@ -581,8 +584,8 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	memset(&li, 0, sizeof(li));
-	ret = graph_for_each_link(priv, &li,
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
 				  graph_dai_link_of_dpcm);
 	if (ret < 0)
@@ -600,6 +603,7 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
+	devm_kfree(dev, li);
 	return 0;
 
 err:
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 8b9964d25757..ca27cb9ff9e1 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -442,10 +442,9 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_parse_of(struct asoc_simple_priv *priv)
+static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info li;
 	int ret;
 
 	ret = asoc_simple_parse_widgets(card, PREFIX);
@@ -461,8 +460,8 @@ static int simple_parse_of(struct asoc_simple_priv *priv)
 		return ret;
 
 	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(&li, 0, sizeof(li));
-	ret = simple_for_each_link(priv, &li,
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
 				   simple_dai_link_of,
 				   simple_dai_link_of_dpcm);
 	if (ret < 0)
@@ -612,7 +611,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card;
-	struct link_info li;
+	struct link_info *li;
 	int ret;
 
 	/* Allocate the private data and the DAI link array */
@@ -625,21 +624,24 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
 
-	memset(&li, 0, sizeof(li));
-	ret = simple_get_dais_count(priv, &li);
+	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
+	ret = simple_get_dais_count(priv, li);
 	if (ret < 0)
 		return ret;
 
-	if (!li.link)
+	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, &li);
+	ret = asoc_simple_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
 	if (np && of_device_is_available(np)) {
 
-		ret = simple_parse_of(priv);
+		ret = simple_parse_of(priv, li);
 		if (ret < 0) {
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "parse error %d\n", ret);
@@ -698,6 +700,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
+	devm_kfree(dev, li);
 	return 0;
 err:
 	asoc_simple_clean_reference(card);
-- 
2.30.2

