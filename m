Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134959FF21
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 18:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AB515C2;
	Wed, 24 Aug 2022 18:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AB515C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661357355;
	bh=Wm/adu6xjbz51kq2laJgj6EkvU0AxmsJM1gyMjEOpyA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+DBwLcNT2vi+qOHhXNm7Krsmb/r2NERZVAoyJeqTV0000FeMPCkJhnzBpsQ0DUQq
	 /gdtDBcgPLHjGIaQnvvUs7PAE2pOHS2BGitdJOwhZGAIYEOxHdGeijZMV5DM/8aoog
	 AtYibuFDoKK9wzDeKPnEeiSlTxb2zALpHtjHsq3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 635B5F80537;
	Wed, 24 Aug 2022 18:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3966BF80528; Wed, 24 Aug 2022 18:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E547AF804BD
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 18:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E547AF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Bxm61ZEy"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661357240; bh=aO38GJDIP/5aJG6S0vIu2Re6vO0yDujEU8aBKTpUOoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Bxm61ZEynvpzn8cGD8yFgOWSblB7WYZYp8swzU6lksYgeFKL2Psl7tZMrQrQOgrEo
 o3qi86pna0Z+tnErdiyTmXsRMS6yaSjPN4brbS0SN8OLPzluwbGpU2uGRLSkfoeim0
 6HGwKNyD5af9aDowtXFhKbnpOaCQnNKr6itIwkgM=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 4/4] ASoC: apple: mca: Add locking
Date: Wed, 24 Aug 2022 18:07:15 +0200
Message-Id: <20220824160715.95779-5-povik+lin@cutebit.org>
In-Reply-To: <20220824160715.95779-1-povik+lin@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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

In DAI ops, accesses to the native cluster (of the DAI), and to data of
clusters related to it by a DPCM frontend-backend link, should have
been synchronized by the 'pcm_mutex' lock at ASoC level.

What is not covered are the 'port_driver' accesses on foreign clusters
to which the current cluster has no a priori relation, so fill in
locking for that. (This should only matter in bizarre configurations of
sharing one MCA peripheral between ASoC cards.)

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 807b85469408..aa67d57c9a9b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -158,6 +158,9 @@ struct mca_data {
 	struct reset_control *rstc;
 	struct device_link *pd_link;
 
+	/* Mutex for accessing port_driver of foreign clusters */
+	struct mutex port_mutex;
+
 	int nclusters;
 	struct mca_cluster clusters[];
 };
@@ -296,16 +299,21 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	struct mca_cluster *be_cl;
 	int stream, i;
 
+	mutex_lock(&mca->port_mutex);
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
 		if (be_cl->port_driver != cl->no)
 			continue;
 
-		for_each_pcm_streams(stream)
-			if (be_cl->clocks_in_use[stream])
+		for_each_pcm_streams(stream) {
+			if (be_cl->clocks_in_use[stream]) {
+				mutex_unlock(&mca->port_mutex);
 				return true;
+			}
+		}
 	}
+	mutex_unlock(&mca->port_mutex);
 	return false;
 }
 
@@ -349,6 +357,11 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	if (cl->port_driver < 0)
 		return -EINVAL;
 
+	/*
+	 * We are operating on a foreign cluster here, but since we
+	 * belong to the same PCM, accesses should have been
+	 * synchronized at ASoC level.
+	 */
 	fe_cl = &mca->clusters[cl->port_driver];
 	if (!mca_fe_clocks_in_use(fe_cl))
 		return 0; /* Nothing to do */
@@ -721,7 +734,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 		       cl->base + REG_PORT_CLOCK_SEL);
 	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
 		       cl->base + REG_PORT_DATA_SEL);
+	mutex_lock(&mca->port_mutex);
 	cl->port_driver = fe_cl->no;
+	mutex_unlock(&mca->port_mutex);
 	cl->port_started[substream->stream] = true;
 
 	return 0;
@@ -731,6 +746,7 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
 
 	cl->port_started[substream->stream] = false;
 
@@ -741,7 +757,9 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 		 */
 		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+		mutex_lock(&mca->port_mutex);
 		cl->port_driver = -1;
+		mutex_unlock(&mca->port_mutex);
 	}
 }
 
@@ -962,6 +980,7 @@ static int apple_mca_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	mca->dev = &pdev->dev;
 	mca->nclusters = nclusters;
+	mutex_init(&mca->port_mutex);
 	platform_set_drvdata(pdev, mca);
 	clusters = mca->clusters;
 
-- 
2.33.0

