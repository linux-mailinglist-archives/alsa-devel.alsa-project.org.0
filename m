Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA1F23C519
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 07:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0141663;
	Wed,  5 Aug 2020 07:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0141663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596605452;
	bh=ynpTVbTQpHqjKbPDnb4dlItsVrPzL+B9SqodJ1Ha/LE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ellQ9Lhcvl8RtyLH81AVQkyiQJYe+t/1dNOIATEoeSpyKhjdFgj3zXQDQq5G/wsu0
	 S6Fez324rGQfBJFKOvFzohOb28AkQY6yGgK4MBHyEwGPJhQmcs2le0r/OXo9SsJrv4
	 vy9M+M+oMEqBRNoTj/C9fUvIcrYleP3u1+E4CAz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F2DF80304;
	Wed,  5 Aug 2020 07:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C01F802FF; Wed,  5 Aug 2020 07:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1692CF802E8
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 07:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1692CF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="US2DUDJY"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a42b20000>; Tue, 04 Aug 2020 22:25:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 04 Aug 2020 22:25:20 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 04 Aug 2020 22:25:20 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 05:25:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 05:25:19 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a42ba0002>; Tue, 04 Aug 2020 22:25:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 7/9] ASoC: audio-graph: Support empty Codec endpoint
Date: Wed, 5 Aug 2020 10:54:22 +0530
Message-ID: <1596605064-27748-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596605106; bh=Y8EjTjeAGHWWpgexO+chZ7CAL/AqaaNtj6HVpJ675RM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=US2DUDJYr69thvIhwoY2zDJ4BZ4OwkXx1UUmOLvNdWL5VYb/mfQjJvf3RGAs3oiEJ
 zKyYvNH5V2Hl5AeXjv3l/JoTSrCMdDsLArK12QuF9lyhKvDJY/z++sIOl5hlCsMUk/
 ffQA5KiMp+I5UrpqSxue85bRNe7VlIDzjSCJ5hQsvR/GjFk6xpIldIWe9EA6Mix3jL
 5Tv8CVFcVR4lUqzGlJChu5Oj9zWb5kDdUmL0/XYQgXegtC9Gf49ULlC0xNJc1ltSz5
 O+pQFGkJ1A2ILnSRsKNZQmiRgwl2ZqieVeLh/0Ik1O0bsgUk0/QQMrUNjGTSpNGdOn
 FwI2LbL6H6qqg==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

For open platforms, which can support pluggable audio cards, Codec
endpoint is not fixed always. It actually depends on the compatible
HW module that is going to be connected. From SoC side the given I/O
interface is always available. Hence such links have fixed CPU endpoint
but no Codec endpoint. This patch helps to support such links where
user can populate Codec endpoint only and its fields in Platform DT
depending on the plugged HW.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/audio-graph-card.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 4a0a345..b588be9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -231,6 +231,14 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link_component *codecs = dai_link->codecs;
 	int ret;
 
+	/*
+	 * Codec endpoint can be NULL for pluggable audio HW.
+	 * Platform DT can populate the Codec endpoint depending on the
+	 * plugged HW.
+	 */
+	if (!li->cpu && !codec_ep)
+		return 0;
+
 	/* Do it all CPU endpoint, and 1st Codec endpoint */
 	if (!li->cpu && dup_codec)
 		return 0;
@@ -566,7 +574,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	li->link++; /* 1xCPU-dummy */
 	li->dais++; /* 1xCPU */
 
-	if (!dup_codec) {
+	if (!dup_codec && codec_ep) {
 		li->link++; /* 1xdummy-Codec */
 		li->conf++; /* 1xdummy-Codec */
 		li->dais++; /* 1xCodec */
-- 
2.7.4

