Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD867538DFD
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 11:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6271E1EF2;
	Tue, 31 May 2022 11:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6271E1EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653990526;
	bh=wqrfsAjg91vIhmTTumo0T/wmnpOzpK0crnAIG5Waehg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=htGPLhyo2CVA0AQoZprhPdliSoPgfd9QWmAa04SlTVzHpHSp+dNxTFQm87CQ6+3km
	 y/jFjmc1c0xx71XCVt22uqDoLzKWngTt0XpMAhKghOn41i290DC3AauwwJk1cL6AhT
	 BR08T/RUhlGEhLfqav8T0HqneBiqcwaRKPXGprcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDDBF8012C;
	Tue, 31 May 2022 11:47:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEA63F80161; Tue, 31 May 2022 11:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by alsa1.perex.cz (Postfix) with ESMTP id A81FBF80129
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 11:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A81FBF80129
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowABXX5Mi5JViNrfvCw--.18879S2;
 Tue, 31 May 2022 17:47:16 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: support.opensource@diasemi.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: codecs: da7210: add check for i2c_add_driver
Date: Tue, 31 May 2022 17:47:12 +0800
Message-Id: <20220531094712.2376759-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXX5Mi5JViNrfvCw--.18879S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry8Gw45CF15JFyDKr1fCrg_yoWDJwc_C3
 y7Ww4jq3y8KrnakF13Ja1YvrsIvF15Jr15Cw4ftryrJ34rAr1FyrW8Ar93Cr48Zryvka98
 CFW2grWxCw1SgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
 W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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

As i2c_add_driver could return error if fails, it should be
better to check the return value.
However, if the CONFIG_I2C and CONFIG_SPI_MASTER are both true,
the return value of i2c_add_driver will be covered by
spi_register_driver.
Therefore, it is necessary to add check and return error if fails.

Fixes: aa0e25caafb7 ("ASoC: da7210: Add support for spi regmap")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 sound/soc/codecs/da7210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 3fa3042e4424..76a21976ccdd 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1335,6 +1335,8 @@ static int __init da7210_modinit(void)
 	int ret = 0;
 #if IS_ENABLED(CONFIG_I2C)
 	ret = i2c_add_driver(&da7210_i2c_driver);
+	if (ret)
+		return ret;
 #endif
 #if defined(CONFIG_SPI_MASTER)
 	ret = spi_register_driver(&da7210_spi_driver);
-- 
2.25.1

