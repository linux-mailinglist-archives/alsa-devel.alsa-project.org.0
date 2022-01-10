Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FF4895A5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 10:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8470617A3;
	Mon, 10 Jan 2022 10:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8470617A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641808189;
	bh=OYzp/+MX59Oko0XJJi29+jScJae8cDDkTzIiwwiN93A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otfEIhIhGiXyzd1AG1veCOH30GVtuhXHOkI+KeoFFr+NQ+n7S2a1t9eCxw+wo4ZRs
	 DvWCfQp2yty2TnTpYjm31mw4VpsOFB8Z3X1EH/re4YurhdQQinPPKPojMEOsiAmaH4
	 1KyKRWpgRFFfbr7XJus3xDpAubn+2+GXXc6MXmec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDD9F80507;
	Mon, 10 Jan 2022 10:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C836CF804BC; Mon, 10 Jan 2022 10:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id DF03BF800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 10:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF03BF800B6
X-IronPort-AV: E=Sophos;i="5.88,276,1635174000"; d="scan'208";a="106003028"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 10 Jan 2022 18:47:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1380D4238CA4;
 Mon, 10 Jan 2022 18:47:54 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/5] ASoC: sh: rz-ssi: Drop ssi parameter from
 rz_ssi_stream_init()
Date: Mon, 10 Jan 2022 09:47:09 +0000
Message-Id: <20220110094711.8574-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Pavel Machek <pavel@denx.de>,
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

ssi parameter is unused in rz_ssi_stream_init() so just drop it.

While at it, change the return type of rz_ssi_stream_init() to void
instead of int.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 16de2633a873..fa68d3a0bd62 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -201,9 +201,8 @@ static int rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 	return ret;
 }
 
-static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
-			      struct rz_ssi_stream *strm,
-			      struct snd_pcm_substream *substream)
+static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
+			       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -219,8 +218,6 @@ static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
 
 	/* fifo init */
 	strm->fifo_sample_size = SSI_FIFO_DEPTH;
-
-	return 0;
 }
 
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
@@ -728,9 +725,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
 		udelay(5);
 
-		ret = rz_ssi_stream_init(ssi, strm, substream);
-		if (ret)
-			goto done;
+		rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
 			bool is_playback;
-- 
2.17.1

