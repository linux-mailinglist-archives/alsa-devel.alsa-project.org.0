Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA273475148
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 04:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EDC51E09;
	Wed, 15 Dec 2021 04:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EDC51E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639538252;
	bh=dOpfQ6BFNNhnqQyopfZ76fGaU7J2HuwlEdMk5p6c9Wg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H2ddnkXeoE9XoBkoF1CZECq0oqkJUNRNWFjNiZ68WT+QAVUnZra0j7n5v3HL6nZHN
	 59d6gyKEdQtIUqxfer7epGl3W1xBCntl/VQ05dr1CQ6tZe3nYelewpmTzCE2w2V6RN
	 iB6O70rYwu4uiT0D+UgGWTxsuTeHX2IS+tZXoCas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C549F800FE;
	Wed, 15 Dec 2021 04:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10746F800E0; Wed, 15 Dec 2021 04:16:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by alsa1.perex.cz (Postfix) with ESMTP id 87639F800E0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 04:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87639F800E0
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowACXcUDxXblhXTEtAw--.46852S2;
 Wed, 15 Dec 2021 11:16:03 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: rt5663: Handle device_property_read_u32_array error
 codes
Date: Wed, 15 Dec 2021 11:15:50 +0800
Message-Id: <20211215031550.70702-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXcUDxXblhXTEtAw--.46852S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1rXry5ur1xAF43CrykKrg_yoW8Cryxpr
 s8CFZYya4Yqr45Ca13Jw4DW3WxKw4UJFWxJrW8G3sY9rn8Jr15uFWqkFyayayrKrykuF17
 XFWIgF4xGF45Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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

The return value of device_property_read_u32_array() is not always 0.
To catch the exception in case that devm_kzalloc failed and the
rt5663->imp_table was NULL, which caused the failure of
device_property_read_u32_array.

Fixes: 450f0f6a8fb4 ("ASoC: rt5663: Add the manual offset field to compensate the DC offset")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/codecs/rt5663.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index be9fc58ff681..ee09ccd448dc 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3461,6 +3461,7 @@ static void rt5663_calibrate(struct rt5663_priv *rt5663)
 static int rt5663_parse_dp(struct rt5663_priv *rt5663, struct device *dev)
 {
 	int table_size;
+	int ret;
 
 	device_property_read_u32(dev, "realtek,dc_offset_l_manual",
 		&rt5663->pdata.dc_offset_l_manual);
@@ -3477,9 +3478,11 @@ static int rt5663_parse_dp(struct rt5663_priv *rt5663, struct device *dev)
 		table_size = sizeof(struct impedance_mapping_table) *
 			rt5663->pdata.impedance_sensing_num;
 		rt5663->imp_table = devm_kzalloc(dev, table_size, GFP_KERNEL);
-		device_property_read_u32_array(dev,
+		ret = device_property_read_u32_array(dev,
 			"realtek,impedance_sensing_table",
 			(u32 *)rt5663->imp_table, table_size);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -3504,8 +3507,11 @@ static int rt5663_i2c_probe(struct i2c_client *i2c,
 
 	if (pdata)
 		rt5663->pdata = *pdata;
-	else
-		rt5663_parse_dp(rt5663, &i2c->dev);
+	else {
+		ret = rt5663_parse_dp(rt5663, &i2c->dev);
+		if (ret)
+			return ret;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(rt5663->supplies); i++)
 		rt5663->supplies[i].supply = rt5663_supply_names[i];
-- 
2.25.1

