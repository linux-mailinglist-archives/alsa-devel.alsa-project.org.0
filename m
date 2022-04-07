Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CD4F77E8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9344717BF;
	Thu,  7 Apr 2022 09:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9344717BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649317386;
	bh=SKgsFMjp2EuJPR0lTJTcUhVPt214abIc2qcMW3bgyIc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tp7MOoRZOGOTs4CLVDoNQi8ucMcbmQ7hhQWXPdzZ0An9+abyYk630oIpbOXjAnmmV
	 PP71dDLDHj3QETSIQVGYLdr52uq+DRJLC7bFf7cZgVdSaAjt+UWmwqdL/ceJanqpT3
	 CqplzwB+F9u9IM1X6tc1RYRDrUvUhOzh4tZuyCUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3748AF8051A;
	Thu,  7 Apr 2022 09:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B67CF80519; Thu,  7 Apr 2022 09:41:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7809BF80516
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7809BF80516
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0V9Pebyx_1649317293; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V9Pebyx_1649317293) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 07 Apr 2022 15:41:39 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: max98088: clean up some inconsistent indenting
Date: Thu,  7 Apr 2022 15:41:31 +0800
Message-Id: <20220407074131.44217-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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

Eliminate the follow smatch warning:

sound/soc/codecs/max98088.c:1112 max98088_dai_set_sysclk() warn:
inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/max98088.c | 56 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 429717d4ac5a..bc03ecd749f9 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1102,44 +1102,44 @@ static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
 static int max98088_dai_set_sysclk(struct snd_soc_dai *dai,
                                   int clk_id, unsigned int freq, int dir)
 {
-       struct snd_soc_component *component = dai->component;
-       struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_component *component = dai->component;
+	struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
 
-       /* Requested clock frequency is already setup */
-       if (freq == max98088->sysclk)
-               return 0;
+	/* Requested clock frequency is already setup */
+	if (freq == max98088->sysclk)
+		return 0;
 
 	if (!IS_ERR(max98088->mclk)) {
 		freq = clk_round_rate(max98088->mclk, freq);
 		clk_set_rate(max98088->mclk, freq);
 	}
 
-       /* Setup clocks for slave mode, and using the PLL
-        * PSCLK = 0x01 (when master clk is 10MHz to 20MHz)
-        *         0x02 (when master clk is 20MHz to 30MHz)..
-        */
-       if ((freq >= 10000000) && (freq < 20000000)) {
-               snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x10);
-               max98088->mclk_prescaler = 1;
-       } else if ((freq >= 20000000) && (freq < 30000000)) {
-               snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x20);
-               max98088->mclk_prescaler = 2;
-       } else {
-               dev_err(component->dev, "Invalid master clock frequency\n");
-               return -EINVAL;
-       }
+	/* Setup clocks for slave mode, and using the PLL
+	 * PSCLK = 0x01 (when master clk is 10MHz to 20MHz)
+	 *         0x02 (when master clk is 20MHz to 30MHz)..
+	 */
+	if ((freq >= 10000000) && (freq < 20000000)) {
+		snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x10);
+		max98088->mclk_prescaler = 1;
+	} else if ((freq >= 20000000) && (freq < 30000000)) {
+		snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x20);
+		max98088->mclk_prescaler = 2;
+	} else {
+		dev_err(component->dev, "Invalid master clock frequency\n");
+		return -EINVAL;
+	}
 
-       if (snd_soc_component_read(component, M98088_REG_51_PWR_SYS)  & M98088_SHDNRUN) {
-               snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
-                       M98088_SHDNRUN, 0);
-               snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
-                       M98088_SHDNRUN, M98088_SHDNRUN);
-       }
+	if (snd_soc_component_read(component, M98088_REG_51_PWR_SYS)  & M98088_SHDNRUN) {
+		snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
+					      M98088_SHDNRUN, 0);
+		snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS,
+					      M98088_SHDNRUN, M98088_SHDNRUN);
+	}
 
-       dev_dbg(dai->dev, "Clock source is %d at %uHz\n", clk_id, freq);
+	dev_dbg(dai->dev, "Clock source is %d at %uHz\n", clk_id, freq);
 
-       max98088->sysclk = freq;
-       return 0;
+	max98088->sysclk = freq;
+	return 0;
 }
 
 static int max98088_dai1_set_fmt(struct snd_soc_dai *codec_dai,
-- 
2.20.1.7.g153144c

