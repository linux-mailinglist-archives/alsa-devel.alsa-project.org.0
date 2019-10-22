Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54EE0C0E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 20:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAFD166E;
	Tue, 22 Oct 2019 20:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAFD166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571770626;
	bh=PMMyjyfeg2Eug4VwyMRc2Qw7yZ5FmXCWl4jASQ2ZsY4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oYDhD9QH0N8AHuGuNXrIOiZR4LEmmGmkWJtyREOnQELXWw1FxiNk2FxQ0iEFvjA54
	 ECehBbXC5hz629n4SuMyDK4l/8nZ6OBj+XlCtNrJfUChmgTzK4kvGjrJN01JdeW9q2
	 gMF1ynntASuJFmXMBz5AXqpJWaQTxxBUWRVTZ3UA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1DE3F80367;
	Tue, 22 Oct 2019 20:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7400F8031A; Tue, 22 Oct 2019 20:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2622EF80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 20:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2622EF80112
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2FDD13C04C1;
 Tue, 22 Oct 2019 20:55:10 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Mi11-ba1-B3; Tue, 22 Oct 2019 20:55:04 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 4517C3C009D;
 Tue, 22 Oct 2019 20:55:04 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 22 Oct 2019 20:55:03 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 22 Oct 2019 20:54:29 +0200
Message-ID: <20191022185429.12769-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.72.93.184]
Cc: Timo Wischer <twischer@de.adit-jv.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 stable@vger.kernel.org, Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] [RESEND PATCH] ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif
	dma address
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

Currently each SSI unit's busif dma address is calculated by
following calculation formula:
0xec540000 + 0x1000 * id + busif / 4 * 0xA000 + busif % 4 * 0x400

But according to R-Car3 HW manual 41.1.4 Register Configuration,
ssi9 4/5/6/7 busif data register address
(SSI9_4_BUSIF/SSI9_5_BUSIF/SSI9_6_BUSIF/SSI9_7_BUSIF)
are out of this rule.

This patch updates the calculation formula to correct
ssi9 4/5/6/7 busif data register address.

Fixes: 5e45a6fab3b9 ("ASoc: rsnd: dma: Calculate dma address with consider of BUSIF")
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
[erosca: minor improvements in commit description]
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc: stable@vger.kernel.org # v4.20+
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---

Originally submitted as https://patchwork.kernel.org/patch/10825513/
("ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif dma address")

---
 sound/soc/sh/rcar/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 0324a5c39619..28f65eba2bb4 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -508,10 +508,10 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
 #define RDMA_SSI_I_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0x8)
 #define RDMA_SSI_O_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0xc)
 
-#define RDMA_SSIU_I_N(addr, i, j) (addr ##_reg - 0x00441000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400))
+#define RDMA_SSIU_I_N(addr, i, j) (addr ##_reg - 0x00441000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
 #define RDMA_SSIU_O_N(addr, i, j) RDMA_SSIU_I_N(addr, i, j)
 
-#define RDMA_SSIU_I_P(addr, i, j) (addr ##_reg - 0x00141000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400))
+#define RDMA_SSIU_I_P(addr, i, j) (addr ##_reg - 0x00141000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
 #define RDMA_SSIU_O_P(addr, i, j) RDMA_SSIU_I_P(addr, i, j)
 
 #define RDMA_SRC_I_N(addr, i)	(addr ##_reg - 0x00500000 + (0x400 * i))
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
