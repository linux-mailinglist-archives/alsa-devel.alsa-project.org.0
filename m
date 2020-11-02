Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D82A2DD9
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 16:14:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B821748;
	Mon,  2 Nov 2020 16:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B821748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604330093;
	bh=CApja9/3i4SSZxCyu1S8rCuEjQ9eENWhYSW5FFnSQuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ny3fcoA9dt2AncyBjprlRrcZm9yuGCQ9VuVG1F4hcTdRgHE18IREojvfaMn81Jp9p
	 61KxaYKNzNXmapdgvr4GoSetG/1xHXBgUda4Vq5HINz2dyguYrW2EsoI+Uly+aPgBu
	 SjU/VJQaFn001Slmk1kt0n95rUSJl44wpGmaeYMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4FC2F804E6;
	Mon,  2 Nov 2020 16:11:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ABDEF804E5; Mon,  2 Nov 2020 16:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DACCAF804D2
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACCAF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qPxYRKPc"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa021b70000>; Mon, 02 Nov 2020 07:11:51 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 15:11:36 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Nov 2020 15:11:33 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH v5 5/7] ASoC: audio-graph: Support empty Codec endpoint
Date: Mon, 2 Nov 2020 20:40:12 +0530
Message-ID: <1604329814-24779-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604329911; bh=xesz+C4t0YPTEFk/rqoe+zcMPgDi6HPptJd7hjC0VQQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=qPxYRKPcTu4iRyAtYj/ydiyHZQ4dJ81Vp/LD1yP1sHbmH+zksJaPph+eZNe+R3xup
 maWGcfQReaoe7s7AgW7xolUdnG/tA9hxHTzvB+saBNE1fdFYug/ZvuxL/XaalEwegW
 rMZnSEs/82h0osg7Dp7HrGqwW45pn6hWetvegfWwf5fFPBlXUs077Dv6BG7vMmdyyV
 OA3oVcCI1nFA7iJ6YzdWPjoj3C5KSwDE3deGw5V2ZFRegFe04xVn87jB2lj3vinY7U
 daHj06u8DZe/DuIgZtzBtzKp7b5cEeK6gBTjjPrjktiZMkur1zhI05DKlzlKjgChL7
 eMNYNGWATpFcg==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 9b06841..0ba50be9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -229,6 +229,14 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
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
@@ -565,7 +573,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	li->link++; /* 1xCPU-dummy */
 	li->dais++; /* 1xCPU */
 
-	if (!dup_codec) {
+	if (!dup_codec && codec_ep) {
 		li->link++; /* 1xdummy-Codec */
 		li->conf++; /* 1xdummy-Codec */
 		li->dais++; /* 1xCodec */
-- 
2.7.4

