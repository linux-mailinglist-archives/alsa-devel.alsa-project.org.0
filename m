Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082457E2F2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 16:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F4F18B1;
	Fri, 22 Jul 2022 16:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F4F18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658499559;
	bh=EXj9suLKcJrlgTImsoqc0L5OvJQ6myDHh52JBM2WvDM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qJkPRsUG2xWf4MaFqiS4nROO8DWSQK5rRQkBH5aInymFP379R6ECFyct+EQxiIxK2
	 l/YWZ6cDmAeJkEbRJ3MYdsZau02vUAxG3lQIOu0R50VaiCHJHR8tFpJytcCQ9MIXvk
	 L/7rPdkBVMk6/phgSD48kvF6HyK/yXwsefvdDY+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E6B4F8012A;
	Fri, 22 Jul 2022 16:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3CEFF8012A; Fri, 22 Jul 2022 16:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 by alsa1.perex.cz (Postfix) with ESMTP id 01EFFF8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 16:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01EFFF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="VJklRjW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Mo1PZ
 mt0SmctO8CA+XTiyck872uRBs7wDvn0TIRm9kY=; b=VJklRjW9BPLI7BHzfsU8q
 ugjjVgBVL8d/F4Nu9REaOavEJnWFpu0MdTs/gUPSj+z/H1xLCnPp/ml4qeNeIHmJ
 mjIh+U15CqbikiUK5HUarofMaFL+2hJQpdnXvxkYfynvS+TJgL5S3qaMVLDrNGp+
 zQw+xG+Qn03PzGQ1Q7sdAM=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp8 (Coremail) with SMTP id NORpCgA32paesdpiQiA7IQ--.27888S2;
 Fri, 22 Jul 2022 22:18:08 +0800 (CST)
From: Liang He <windhl@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org, windhl@126.com
Subject: [PATCH] ASoC: audio-graph-card2: Add of_node_put() in fail path
Date: Fri, 22 Jul 2022 22:18:01 +0800
Message-Id: <20220722141801.1304854-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgA32paesdpiQiA7IQ--.27888S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4UKF1fZFWrWF1rWFy5CFg_yoWfGFcEya
 yku3yDXF48K3yIkrs8W3y5Aw1IgF18Wr1DCFW2gF17C3WUKF1Syw15JrZ3C34kurW5W3yU
 W34DZw1vvrWayjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtSoG7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgBGF18RPifaFAAAsG
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

In asoc_simple_parse_dai(), we should call of_node_put() for the
reference returned by of_graph_get_port_parent() in fail path.

Fixes: 6e5f68fe3f2d ("ASoC: add Audio Graph Card2 driver")
Signed-off-by: Liang He <windhl@126.com>
---
 sound/soc/generic/audio-graph-card2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 18d053a0d05c..8ac6df645ee6 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -445,8 +445,10 @@ static int asoc_simple_parse_dai(struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
-	if (ret < 0)
+	if (ret < 0) {
+		of_node_put(node);
 		return ret;
+	}
 
 	dlc->of_node = node;
 
-- 
2.25.1

