Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0D4C876A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 10:08:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA221B38;
	Tue,  1 Mar 2022 10:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA221B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646125680;
	bh=uR8fTwhG0L8PXMuzqpONdNCLpLxwDNb3QiAHtuzdPSE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VLq6/4sDzoKWT/dVIlXsWYjQXtzYom1dLki7/2O+B8vybNhNmAbGuqF66lO9Y+WCF
	 PpSecCSNQEOQmqA3j5a2FFgxttUcjGRBEII8wmku11U8p4QXcko6j4RoeBoWIXFjQa
	 t1tWUfiVxJqY8sV6nf/Cheqg7jCIp0/41qhWOQb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ACDAF802D2;
	Tue,  1 Mar 2022 10:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C62C1F80054; Tue,  1 Mar 2022 10:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by alsa1.perex.cz (Postfix) with ESMTP id E3B86F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 10:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3B86F80054
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-01 (Coremail) with SMTP id qwCowAC3V8Ue4h1iFBzxAQ--.26163S2;
 Tue, 01 Mar 2022 17:06:38 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: codrin.ciubotariu@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com
Subject: [PATCH] ASoC: atmel_ssc_dai: Handle errors for clk_enable
Date: Tue,  1 Mar 2022 17:06:37 +0800
Message-Id: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3V8Ue4h1iFBzxAQ--.26163S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr47trWfJF4UZr4UZw4xZwb_yoWDGFg_Wa
 n7Ww1DXrW5CrWFy3WDur45ArWj9ry7ZrW3tw18tF15tFWUAF1akrW5Janxur17ur4ava4f
 GrnFqryfAFW7WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUhNVgUUUUU=
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

As the potential failure of the clk_enable(),
it should be better to check it and return error if fals.

Fixes: cbaadf0f90d6 ("ASoC: atmel_ssc_dai: refactor the startup and shutdown")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/atmel/atmel_ssc_dai.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 26e2bc690d86..c1dea8d62416 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -280,7 +280,10 @@ static int atmel_ssc_startup(struct snd_pcm_substream *substream,
 
 	/* Enable PMC peripheral clock for this SSC */
 	pr_debug("atmel_ssc_dai: Starting clock\n");
-	clk_enable(ssc_p->ssc->clk);
+	ret = clk_enable(ssc_p->ssc->clk);
+	if (ret)
+		return ret;
+
 	ssc_p->mck_rate = clk_get_rate(ssc_p->ssc->clk);
 
 	/* Reset the SSC unless initialized to keep it in a clean state */
-- 
2.25.1

