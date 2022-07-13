Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643E573404
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8234C16F8;
	Wed, 13 Jul 2022 12:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8234C16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657707689;
	bh=xC0UnU3sYTBVcf5sZMf0JT6x+gaaTY/cOrWh9TqMhjI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sWGqc3NKQsYLPjKWgsRGa9f3HMubZHthUylVGUx1dwaZdbTVsgoK0p8tKkA7gDS1p
	 JE+ZgOWu66zzTu0mq/1JmJHv1mZVnl+ycb7Ux8K4umGmOCNY8cMlpEQYo4yfNyfJE5
	 bg6YD7YiXlnGtotmAt5WlyQIaRhYdUnxRnZ+JY/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EA6F800AA;
	Wed, 13 Jul 2022 12:20:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35088F80249; Wed, 13 Jul 2022 12:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by alsa1.perex.cz (Postfix) with ESMTP id C750AF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C750AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="E/4RxUA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vpow4
 Qg2uMBdphczFyfvmw/t3kRu4IX5MUjH3cfYqTI=; b=E/4RxUA1o2/dbFEXwQYqB
 czY7RZk5hysugPHg53SF0PJ+juXj22C3oS/fm3hTI5z9XgM37xWFDmPbVi2gNGTl
 uo+B5jzI8oMlCWVALasY25JZpu1dU3lxpxKgNM1e1PpgbxoTjiZcpN2b0bXY7uDl
 m3Gc+ZXegv0VbIcM5q1UQA=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp1 (Coremail) with SMTP id C8mowADXtN1dnM5iMiJIGg--.40617S2;
 Wed, 13 Jul 2022 18:20:15 +0800 (CST)
From: Liang He <windhl@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, windhl@126.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: mt6359: Fix refcount leak bug
Date: Wed, 13 Jul 2022 18:20:13 +0800
Message-Id: <20220713102013.367336-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADXtN1dnM5iMiJIGg--.40617S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1xCF4rGr45KFy8Kw13CFg_yoW8Gw48pr
 s8CrWfJa43tw4UAFsYyw1Yq3Z2y347u3y7Ca48t345Ar15JF1UXFn2kr1j9FW8JF9YkFZx
 XrWavFy8uF1Du3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziEkskUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizh89F18RPfGoJgAAs3
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

In mt6359_parse_dt() and mt6359_accdet_parse_dt(), we should call
of_node_put() for the reference returned by of_get_child_by_name()
which has increased the refcount.

Fixes: 683530285316 ("ASoC: mt6359: fix failed to parse DT properties")
Fixes: eef07b9e0925 ("ASoC: mediatek: mt6359: add MT6359 accdet jack driver")
Signed-off-by: Liang He <windhl@126.com>
---
 sound/soc/codecs/mt6359-accdet.c | 1 +
 sound/soc/codecs/mt6359.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6d3d170144a0..c190628e2905 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -675,6 +675,7 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 			       sizeof(struct three_key_threshold));
 	}
 
+	of_node_put(node);
 	dev_warn(priv->dev, "accdet caps=%x\n", priv->caps);
 
 	return 0;
diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 23709b180409..c9a453ce8a2a 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2778,6 +2778,7 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 
 	ret = of_property_read_u32(np, "mediatek,mic-type-2",
 				   &priv->mux_select[MUX_MIC_TYPE_2]);
+	of_node_put(np);
 	if (ret) {
 		dev_info(priv->dev,
 			 "%s() failed to read mic-type-2, use default (%d)\n",
-- 
2.25.1

