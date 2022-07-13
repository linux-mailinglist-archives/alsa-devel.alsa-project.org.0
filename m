Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D31A572EE1
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 09:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5420FA;
	Wed, 13 Jul 2022 09:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5420FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657696452;
	bh=WcBxOWSKMRQPry2xWoDnuvNMbAlsImjNkF2XjuPX0vk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dxhRbIjzkeTMtymPCRbxNX8yf7RMT3yppd0A1W05SfOpVxvG54cCykLRU9tVRLITA
	 jpcJEK5SHDLRPqT2r6Im4PEcN9QQpw5F4AqYRv8WMALhbur6BWxcrGsTFI2vUFSKP6
	 EGsuZR/FKu+KAYboMnIS1wUiLaDXhFEqZJeU14WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF96F8019B;
	Wed, 13 Jul 2022 09:13:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56AFEF80249; Wed, 13 Jul 2022 09:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from proxy25211.mail.163.com (proxy25211.mail.163.com
 [103.129.252.11])
 by alsa1.perex.cz (Postfix) with ESMTP id E620FF8019B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 09:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E620FF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="aykH146m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3PTJn
 DMajL+w8B2EUG19mkox/FNIzUCi8ROq3A2Ingc=; b=aykH146maDWp9Uk5lomR8
 8kWZRhIUAgmsH1hskZ0OumQdRQu2umtYLnjJYmrvKMzOPxnthppO2SxX7RztyHOb
 i0ReTy33RM5S4FMaOjJok4BWH4gcpvgXnqmtez91GcVduh68QgutWtgCcCSkjZzN
 9bLD2bEUXtc6RYlBF/zG1U=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp3 (Coremail) with SMTP id DcmowADHZZdCcM5i9HyHEw--.62737S2;
 Wed, 13 Jul 2022 15:12:03 +0800 (CST)
From: Liang He <windhl@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 windhl@126.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoc: audio-graph-card2: Fix refcount leak bug in
 __graph_get_type()
Date: Wed, 13 Jul 2022 15:12:00 +0800
Message-Id: <20220713071200.366729-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADHZZdCcM5i9HyHEw--.62737S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWkAFWDCw4UWw4xKrWktFb_yoW8Cw13p3
 WSgayYvry8Grs5Wr4SvrWDtrZ0yr4xXrWrXrs7u39ayFs7ta18WF1DtF1DuF4FyFZ5urZ3
 JFZ8t3WUGa4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z__MakUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizg89F18RPfBW1gABsp
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

We should call of_node_put() for the reference before its replacement
as it returned by of_get_parent() which has increased the refcount.
Besides, we should also call of_node_put() before return.

Fixes: c8c74939f791 ("ASoC: audio-graph-card2: add Multi CPU/Codec support")
Signed-off-by: Liang He <windhl@126.com>
---
 sound/soc/generic/audio-graph-card2.c | 35 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 77ac4051b827..4f6bae73bd5e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -229,7 +229,8 @@ enum graph_type {
 
 static enum graph_type __graph_get_type(struct device_node *lnk)
 {
-	struct device_node *np;
+	struct device_node *np, *parent_np;
+	enum graph_type ret;
 
 	/*
 	 * target {
@@ -240,19 +241,33 @@ static enum graph_type __graph_get_type(struct device_node *lnk)
 	 * };
 	 */
 	np = of_get_parent(lnk);
-	if (of_node_name_eq(np, "ports"))
-		np = of_get_parent(np);
+	if (of_node_name_eq(np, "ports")) {
+		parent_np = of_get_parent(np);
+		of_node_put(np);
+		np = parent_np;
+	}
 
-	if (of_node_name_eq(np, GRAPH_NODENAME_MULTI))
-		return GRAPH_MULTI;
+	if (of_node_name_eq(np, GRAPH_NODENAME_MULTI)) {
+		ret = GRAPH_MULTI;
+		goto out_put;
+	}
 
-	if (of_node_name_eq(np, GRAPH_NODENAME_DPCM))
-		return GRAPH_DPCM;
+	if (of_node_name_eq(np, GRAPH_NODENAME_DPCM)) {
+		ret = GRAPH_DPCM;
+		goto out_put;
+	}
 
-	if (of_node_name_eq(np, GRAPH_NODENAME_C2C))
-		return GRAPH_C2C;
+	if (of_node_name_eq(np, GRAPH_NODENAME_C2C)) {
+		ret = GRAPH_C2C;
+		goto out_put;
+	}
+
+	ret = GRAPH_NORMAL;
+
+out_put:
+	of_node_put(np);
+	return ret;
 
-	return GRAPH_NORMAL;
 }
 
 static enum graph_type graph_get_type(struct asoc_simple_priv *priv,
-- 
2.25.1

