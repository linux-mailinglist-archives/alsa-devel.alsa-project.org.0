Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD3949B505
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 14:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7D4164D;
	Tue, 25 Jan 2022 14:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7D4164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643117227;
	bh=AKVbRJY0NNn7WOb3C4XfOXDfuSM7Ou+mlykA5qMWVA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tN8DTMji3ZX/1N7FikkexaZLa0bGwKG8b92XMQV/IZ/lCCxrcsRgG6ef8cIyB/sBP
	 TGdhyNjGG3RqNAsW6kCncu1WdVYRz4O9HeTQF5DL8UPIIHuNPCMddzb5euyDT+HbVq
	 A41vSEJkh/iYO5AJbtasB7LccIAbffsCGRzrvUs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A9F9F804C3;
	Tue, 25 Jan 2022 14:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B6B6F80506; Tue, 25 Jan 2022 14:25:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id ED391F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 14:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED391F800D1
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; d="scan'208";a="107606147"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2022 22:25:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 486034295951;
 Tue, 25 Jan 2022 22:25:12 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Pavel Machek <pavel@denx.de>
Subject: [PATCH 1/3] ASoC: sh: rz-ssi: Use a do-while loop in rz_ssi_pio_recv()
Date: Tue, 25 Jan 2022 13:24:55 +0000
Message-Id: <20220125132457.14984-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220125132457.14984-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use a do-while loop while reading the samples from RX FIFO. The "done"
flag was only changed as an outcome of the last if-statement (last step)
in this entire procedure. This patch moves the condition from if
statement to while and drops the "done" variable for readability.

While at it, also drop the unneeded parentheses around runtime->dma_area.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,

This change was part of patch [0], as v1 series was applied I am just
sending the cosmetic changes from v2 for readability.

[0] https://patchwork.kernel.org/project/alsa-devel/patch/
20220115012303.29651-6-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
---
 sound/soc/sh/rz-ssi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 81e1786b827d..2c8775d37f50 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -408,7 +408,6 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	struct snd_pcm_substream *substream = strm->substream;
 	struct snd_pcm_runtime *runtime;
-	bool done = false;
 	u16 *buf;
 	int fifo_samples;
 	int frames_left;
@@ -420,7 +419,7 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 	runtime = substream->runtime;
 
-	while (!done) {
+	do {
 		/* frames left in this period */
 		frames_left = runtime->period_size -
 			      (strm->buffer_pos % runtime->period_size);
@@ -444,7 +443,7 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 			break;
 
 		/* calculate new buffer index */
-		buf = (u16 *)(runtime->dma_area);
+		buf = (u16 *)runtime->dma_area;
 		buf += strm->buffer_pos * runtime->channels;
 
 		/* Note, only supports 16-bit samples */
@@ -453,11 +452,7 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 		rz_ssi_pointer_update(strm, samples / runtime->channels);
-
-		/* check if there are no more samples in the RX FIFO */
-		if (!(!frames_left && fifo_samples >= runtime->channels))
-			done = true;
-	}
+	} while (!frames_left && fifo_samples >= runtime->channels);
 
 	return 0;
 }
-- 
2.17.1

