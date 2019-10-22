Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135EE0C13
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 20:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8BDD1674;
	Tue, 22 Oct 2019 20:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8BDD1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571770673;
	bh=akFbFB+s9CJEsit0hSt0GywJVIEf0D+mSQrP/Ojra0Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rDp7XYo+NHQ+GAJZa7kZv+tjnlyknke1fW7cTktX8hgWFuR0RgkMJEkNTg1hyrgGm
	 NaMmZ36yFweMVstmgJOytvdGb0Jvv/n4olSbBJQWFYzAXqntQX8aqKq+IWi32XaWgh
	 HcIHyHZJsRZG5996cHFBJBPoQYv6MHIxi09vj/IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D6ECF8058C;
	Tue, 22 Oct 2019 20:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C78DDF80390; Tue, 22 Oct 2019 20:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D088F80322
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 20:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D088F80322
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 710263C0579;
 Tue, 22 Oct 2019 20:55:32 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq_DkLNWpUpD; Tue, 22 Oct 2019 20:55:27 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 354CC3C009D;
 Tue, 22 Oct 2019 20:55:27 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 22 Oct 2019 20:55:26 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 22 Oct 2019 20:55:18 +0200
Message-ID: <20191022185518.12838-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.72.93.184]
Cc: Jiada Wang <jiada_wang@mentor.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Timo Wischer <twischer@de.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: rsnd: dma: set bus width to data width
	for monaural data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jiada Wang <jiada_wang@mentor.com>

According to R-Car3 HW manual 40.3.3 (Data Format on Audio Local Bus),
in case of monaural data writing or reading through Audio-DMAC,
it's always in Left Justified format, so both src and dst
DMA Bus width should be equal to physical data width.

Therefore set src and dst's DMA bus width to:
 - [monaural case] data width
 - [non-monaural case] 32bits (as prior applying the patch)

Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 sound/soc/sh/rcar/dma.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 28f65eba2bb4..95aa26d62e4f 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -165,14 +165,40 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct dma_async_tx_descriptor *desc;
 	struct dma_slave_config cfg = {};
+	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	int is_play = rsnd_io_is_play(io);
 	int ret;
 
+	/*
+	 * in case of monaural data writing or reading through Audio-DMAC
+	 * data is always in Left Justified format, so both src and dst
+	 * DMA Bus width need to be set equal to physical data width.
+	 */
+	if (rsnd_runtime_channel_original(io) == 1) {
+		struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+		int bits = snd_pcm_format_physical_width(runtime->format);
+
+		switch (bits) {
+		case 8:
+			buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+			break;
+		case 16:
+			buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+			break;
+		case 32:
+			buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+			break;
+		default:
+			dev_err(dev, "invalid format width %d\n", bits);
+			return -EINVAL;
+		}
+	}
+
 	cfg.direction	= is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 	cfg.src_addr	= dma->src_addr;
 	cfg.dst_addr	= dma->dst_addr;
-	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	cfg.src_addr_width = buswidth;
+	cfg.dst_addr_width = buswidth;
 
 	dev_dbg(dev, "%s %pad -> %pad\n",
 		rsnd_mod_name(mod),
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
