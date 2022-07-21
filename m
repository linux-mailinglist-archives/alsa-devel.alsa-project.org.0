Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6857CDF7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 16:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348C4181C;
	Thu, 21 Jul 2022 16:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348C4181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658414652;
	bh=/OyDrgbz3hO7dv2QxV24GvZuoa+m8SDw/R4QwX6KL+w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JlgWWT3sPBCnzos7P5EIDp3YsgAqlg2NNlZohotW8TCNw63N9QP93JwAaHgG/VrZ0
	 A3Hldow+CfKMrbphAqy9VqyPiEyqRySpbypHFieUj05FzH+wzX/d4MNh+96PFPA705
	 EyKhLdp1Yg2Z5x7DHKOe5zRUHsmw9HN4MuqUyXvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94747F80528;
	Thu, 21 Jul 2022 16:43:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABD47F80527; Thu, 21 Jul 2022 16:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by alsa1.perex.cz (Postfix) with ESMTP id A3FA5F80169
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 16:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3FA5F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="Q+O/D9sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Z5PtN
 1kHcISuOf1nFu5ActQZEVYPQ2YKp1UhFggOWzA=; b=Q+O/D9sdJOsep9vbV7CcK
 PrM5StoS5rmdHEgwUjl1iXMA4QSYiZPEaFuNFNqRZrFRFPtfRwMxfxZuzZU2ch+b
 0BknbNNckpiJwIg8JHuxm2HUO3nxZiD7JpUCViRbnK+P6zgo/wRQXLYlUkBDAkkH
 v5nl6/SC2k51lSFvV9hbAU=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp9 (Coremail) with SMTP id NeRpCgC3Q9z8Zdli417TGw--.14730S2;
 Thu, 21 Jul 2022 22:43:10 +0800 (CST)
From: Liang He <windhl@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, windhl@126.com
Subject: [PATCH] ASoC: audio-graph-card: Add of_node_put() in fail path
Date: Thu, 21 Jul 2022 22:43:08 +0800
Message-Id: <20220721144308.1301587-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgC3Q9z8Zdli417TGw--.14730S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr48KF4kAr4rGr1xury5twb_yoWfWFcEya
 y8u39rXF48KrWIkrsxWay3Gw1I9F18WFyxCFWSgF17CayDKF1Sy3Z8Jr93Cr97u3y5CFWx
 W34DZ3yvvrWayjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuHq73UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2h5FF1uwMcZ1OwAAsE
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

Fixes: ae30a694da4c ("ASoC: simple-card-utils: add asoc_simple_card_parse_dai()")
Signed-off-by: Liang He <windhl@126.com>
---
 sound/soc/generic/audio-graph-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 2b598af8feef..b327372f2e4a 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -158,8 +158,10 @@ static int asoc_simple_parse_dai(struct device_node *ep,
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

