Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5E30DF4D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 17:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F581773;
	Wed,  3 Feb 2021 17:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F581773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612368709;
	bh=fyqnNdbbaRG1KK3rRkTCpDtK6YlKCgSYBZu/ax8xlwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjCldk2uIK3VSqb43/FRVCGA9J1tnUMbazG3ncEWWsIHVC9QT9xsmZR1gzt3AzL/o
	 IU6rshOlKqGIwOVljcYFgRi0GU5xStehiEY8KqL2DKXlv9DDqhJtboBsK77yECXo1g
	 Hs/08QJCGUnyFvxZONJnC+ppIEfdsOBPlXOEDmsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B75F8023A;
	Wed,  3 Feb 2021 17:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2E05F80224; Wed,  3 Feb 2021 17:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22CC2F80156
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 17:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CC2F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Z2qdRg10"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601acad60000>; Wed, 03 Feb 2021 08:09:58 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 16:09:58 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 3 Feb 2021 16:09:55 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
Date: Wed, 3 Feb 2021 21:39:34 +0530
Message-ID: <1612368575-25991-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612368598; bh=SdJlxnAHDjMLxiQMLKNnQgJIuXfMEd/CIAOFoyE3phQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=Z2qdRg10P5gHc1yhUu3P9R6yT9NCdU1w9y8wAIt+ZVmTyiDEChdmkwoj5shJKurDE
 JzWB8ECZG2YR+9GbHxdj+I9c8AZws4CehRdkNyFMd31BJxaTxnBTCVKlypzRMUQOyY
 eD/ABHJoq8Dw5G4smYfufNJAOD1EyPRmj8Hg6pvh+R5GCDP4upQ6/Gr0Plz5RUshMp
 J44x0B2qti83BPgZzU5GDFgq0gWCIZfVNE1cx1x0Zh7YCu3UciVTxrkR1L2fAHDTPo
 4sS20fWxbJf+SrvEq2oerhShI3byPpIXk2HDCRLUbJBTFOOwEH49D+FsuorKKWuGKz
 UN0zTR+x3BM9g==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
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

Audio graph based sound card drivers can call graph_remove() function
for cleanups during driver removal. To facilitate this export above
mentioned function.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h           | 2 ++
 sound/soc/generic/audio-graph-card.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
index bbb5a13..dfa8e56 100644
--- a/include/sound/graph_card.h
+++ b/include/sound/graph_card.h
@@ -13,4 +13,6 @@ int graph_card_probe(struct snd_soc_card *card);
 
 int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
 
+int graph_remove(struct platform_device *pdev);
+
 #endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 16a04a6..93f6d57f 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -744,12 +744,13 @@ static int graph_probe(struct platform_device *pdev)
 	return graph_parse_of(priv, dev);
 }
 
-static int graph_remove(struct platform_device *pdev)
+int graph_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	return asoc_simple_clean_reference(card);
 }
+EXPORT_SYMBOL_GPL(graph_remove);
 
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
-- 
2.7.4

