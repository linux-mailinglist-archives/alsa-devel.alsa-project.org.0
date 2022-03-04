Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C84CCBCA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 03:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6269180F;
	Fri,  4 Mar 2022 03:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6269180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646361592;
	bh=Eu/gCkcF3v2IpQuz4jpYMCdV+OTT9G6S3OL+oUATlAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M7KFD7+ZdW+X9+2eAJV48uRquNNKwS+N+DDKliQsELYkZcEwFZC3oRcao+k58bOPI
	 XVYfa2N8oZQ/78E+U2MwCuB7xtWjJf6UscxkMVyK0RCE2ME3jj4Yc7u1XNuUfBS8lU
	 SLOhs1AFjnqX2jRutP7VQzoACZ1bliyQnLiN/mik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D452F80166;
	Fri,  4 Mar 2022 03:38:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96553F8013D; Fri,  4 Mar 2022 03:38:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by alsa1.perex.cz (Postfix) with ESMTP id C24DDF8013D
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 03:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C24DDF8013D
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAAnCfKeeyFiBBwYAg--.9896S2;
 Fri, 04 Mar 2022 10:38:23 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: ckeepax@opensource.cirrus.com
Subject: [PATCH v2] ASoC: wm8350: Handle error for wm8350_register_irq
Date: Fri,  4 Mar 2022 10:38:21 +0800
Message-Id: <20220304023821.391936-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnCfKeeyFiBBwYAg--.9896S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1DXry7XF4DZr1fXrykAFb_yoW8tr45pr
 WIkry3WryFg3y3uF1fCrykJF1DJFyxKr4vvry2kr17Xrya9ry0gr4jvFyjqF18JFW0q3Zr
 KrW2v3yruw1ruFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
 Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUO_MaUU
 UUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

As the potential failure of the wm8350_register_irq(),
it should be better to check it and return error if fails.
Also, use 'free_' in order to avoid the same code.

Fixes: a6ba2b2dabb5 ("ASoC: Implement WM8350 headphone jack detection")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2

* Change 1. Change to non-caps labels and remove the revert to 'return ret;'.
---
 sound/soc/codecs/wm8350.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index 15d42ce3b21d..41504ce2a682 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -1537,18 +1537,38 @@ static  int wm8350_component_probe(struct snd_soc_component *component)
 	wm8350_clear_bits(wm8350, WM8350_JACK_DETECT,
 			  WM8350_JDL_ENA | WM8350_JDR_ENA);
 
-	wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_L,
+	ret = wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_L,
 			    wm8350_hpl_jack_handler, 0, "Left jack detect",
 			    priv);
-	wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_R,
+	if (ret != 0)
+		goto err;
+
+	ret = wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_R,
 			    wm8350_hpr_jack_handler, 0, "Right jack detect",
 			    priv);
-	wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_MICSCD,
+	if (ret != 0)
+		goto free_jck_det_l;
+
+	ret = wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_MICSCD,
 			    wm8350_mic_handler, 0, "Microphone short", priv);
-	wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_MICD,
+	if (ret != 0)
+		goto free_jck_det_r;
+
+	ret = wm8350_register_irq(wm8350, WM8350_IRQ_CODEC_MICD,
 			    wm8350_mic_handler, 0, "Microphone detect", priv);
+	if (ret != 0)
+		goto free_micscd;
 
 	return 0;
+
+free_micscd:
+	wm8350_free_irq(wm8350, WM8350_IRQ_CODEC_MICSCD, priv);
+free_jck_det_r:
+	wm8350_free_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_R, priv);
+free_jck_det_l:
+	wm8350_free_irq(wm8350, WM8350_IRQ_CODEC_JCK_DET_L, priv);
+err:
+	return ret;
 }
 
 static void wm8350_component_remove(struct snd_soc_component *component)
-- 
2.25.1

