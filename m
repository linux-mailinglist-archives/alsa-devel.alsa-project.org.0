Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A723489093
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 08:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158621771;
	Mon, 10 Jan 2022 08:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158621771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641798790;
	bh=mUPr8u0CNCmxq5mFznavMdbF5CjHtPaHS1HXwQr3wCw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZJyFAiAP8A1xROljShQ9tkXSPiLyxPfWGAMXD+3d1w+b/v8nXr9m/6svwj4ittUsO
	 YbQ4tHyDvnJPWq1eupoTjf312jGEaEXOXYpQOtuxFABSbnPIOV1AvfYgfZu2oZ0LSN
	 y3LxZKL9ICy+NdY4zcd6oUU9r/2mcsn9/3ym+K3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 840A6F80134;
	Mon, 10 Jan 2022 08:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19989F80054; Mon, 10 Jan 2022 08:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by alsa1.perex.cz (Postfix) with ESMTP id D6F3DF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 08:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F3DF80054
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-01 (Coremail) with SMTP id qwCowAC3v1cx3Nth2PIdBg--.24110S2;
 Mon, 10 Jan 2022 15:11:45 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, colin.king@canonical.com,
 sashal@kernel.org, guennadi.liakhovetski@linux.intel.com,
 wanjiabing@vivo.com, pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: Check for error pointer after
 calling devm_regmap_init_mmio
Date: Mon, 10 Jan 2022 15:11:43 +0800
Message-Id: <20220110071143.28984-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3v1cx3Nth2PIdBg--.24110S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry8XF18ur4kXF1UZw1rCrg_yoWkAFg_G3
 93ur48uayrWrnrAFyDtr47AF4DAFnayrW3Kw40qas3J345Aw1fZryxGr13Z397Zws3ua48
 WFZF9F43Xry3CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUYMKZDUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
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

The devm_regmap_init_mmio() may return error pointer under certain
circumstances, for example the possible failure of the kzalloc() in
regmap_mmio_gen_context(), which is called by devm_regmap_init_mmio().
Then the rx->regmap will be error pointer and be used in
rx_macro_mclk_enable().
Therefore, it should be better to check it in order to avoid the
dereference of the error pointer.

Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 07894ec5e7a6..2adbf2e2697f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3542,6 +3542,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	if (IS_ERR(rx->regmap))
+		return PTR_ERR(rx->regmap);
 
 	dev_set_drvdata(dev, rx);
 
-- 
2.25.1

