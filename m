Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02D24ADDA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 06:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA6C167C;
	Thu, 20 Aug 2020 06:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA6C167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597897845;
	bh=5yDhfhRc6jSkFpOZJotqqJUq84OHaCl4DqHNKdL3Cm8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dHLMeh0X9CmH1F/vni4z75SqRyA1zog7kN2Gt23PrBsmesnEamMWFuOGKXBAFn1Ut
	 yhbpMutcX/IGv4qbn6/a/HjiUzlbaK2n3oHC4wPC0Msq+MT3O+dxgDNo3pOPuxiYFZ
	 Ujkg92qjw7+d2KzZO4rWL+auIt67eJVTZzjaG2Yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E04F8023F;
	Thu, 20 Aug 2020 06:29:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A81E9F801F9; Thu, 20 Aug 2020 06:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 59AADF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 06:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59AADF80114
Received: from localhost.localdomain (unknown [10.192.85.18])
 by mail-app2 (Coremail) with SMTP id by_KCgD3_rLs+z1f6KMHAg--.11144S4;
 Thu, 20 Aug 2020 12:28:32 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] ASoC: qcom: common: Fix refcount imbalance on error
Date: Thu, 20 Aug 2020 12:28:27 +0800
Message-Id: <20200820042828.10308-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgD3_rLs+z1f6KMHAg--.11144S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZr1rJr13JF47AFWxWF48JFb_yoWfAFXEk3
 97CFs5CrZrGF4fJwsrGr13Zrykt3y7urn8Aw4Iqr17Ja4DCrZ3KFZ8XF95u34rZ3WxCr9x
 Gwn0vr95Ar18KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
 c2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoSBlZdtPnBhAAJsW
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

for_each_child_of_node returns a node pointer np with
refcount incremented. So when devm_kzalloc fails, a
pairing refcount decrement is needed to keep np's
refcount balanced.

Fixes: 16395ceee11f8 ("ASoC: qcom: common: Fix NULL pointer in of parser")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 sound/soc/qcom/common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5194d90ddb96..fd69cf8b1f23 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -52,8 +52,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 	for_each_child_of_node(dev->of_node, np) {
 		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
-		if (!dlc)
-			return -ENOMEM;
+		if (!dlc) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		link->cpus	= &dlc[0];
 		link->platforms	= &dlc[1];
-- 
2.17.1

