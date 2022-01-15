Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F5C48F421
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 02:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860362061;
	Sat, 15 Jan 2022 02:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860362061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642209952;
	bh=WC1H1I1T9U2owRoxa9c4TueFytMdUJy5Fwdu3+crg9k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0wOyRao5Oi875aJXfRjk0qvt/O5G2b213YJBQH3x/DXId1RP7gBZh/omSAGdG2iZ
	 RNCmFxghyoUOtJapCLB6sFxKiq9ev4V4Q6fLfhXHFjrbmJfkvsJFp860VvNoreuCG+
	 TQH2ChYI31QWBHUU434p//bSZIJ0aUPeh+NdBAmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054F8F8051E;
	Sat, 15 Jan 2022 02:23:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27976F80519; Sat, 15 Jan 2022 02:23:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 34D4AF8050F
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 02:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D4AF8050F
X-IronPort-AV: E=Sophos;i="5.88,290,1635174000"; d="scan'208";a="107116855"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 15 Jan 2022 10:23:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6473D417EAC4;
 Sat, 15 Jan 2022 10:23:28 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 5/5] ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper
 function
Date: Sat, 15 Jan 2022 01:23:03 +0000
Message-Id: <20220115012303.29651-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
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

A copy of substream pointer is stored in priv structure during
rz_ssi_dai_trigger() callback ie in SNDRV_PCM_TRIGGER_START case
and the pointer is assigned to NULL in case of SNDRV_PCM_TRIGGER_STOP.

The driver used the locks only in rz_ssi_stream_is_valid() and assigned
the local substream pointer to NULL in rz_ssi_dai_trigger() callback but
never locked it while making a local copy.

This patch adds the rz_ssi_set_substream() helper function to set the
substream pointer with locks acquired and replaces the instances of
setting the local substream pointer with the rz_ssi_set_substream()
function.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2
* Dropped rz_ssi_get_substream() helper.
---
 sound/soc/sh/rz-ssi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 2da43eecfb3e..07fdbcfa5b63 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -188,6 +188,17 @@ static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
 	return (ssi->playback.dma_ch && (ssi->dma_rt || ssi->capture.dma_ch));
 }
 
+static void rz_ssi_set_substream(struct rz_ssi_stream *strm,
+				 struct snd_pcm_substream *substream)
+{
+	struct rz_ssi_priv *ssi = strm->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ssi->lock, flags);
+	strm->substream = substream;
+	spin_unlock_irqrestore(&ssi->lock, flags);
+}
+
 static bool rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 				   struct rz_ssi_stream *strm)
 {
@@ -206,7 +217,7 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	strm->substream = substream;
+	rz_ssi_set_substream(strm, substream);
 	strm->sample_width = samples_to_bytes(runtime, 1);
 	strm->dma_buffer_pos = 0;
 	strm->period_counter = 0;
@@ -224,11 +235,8 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
 	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ssi->lock, flags);
-	strm->substream = NULL;
-	spin_unlock_irqrestore(&ssi->lock, flags);
+	rz_ssi_set_substream(strm, NULL);
 
 	if (strm->oerr_num > 0)
 		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
-- 
2.17.1

