Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFC258EE3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 15:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B3B17AF;
	Tue,  1 Sep 2020 15:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B3B17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598965795;
	bh=IRQPmiAp7Vbu72qt56AlBFeE8Mjc2IEdiAvM/ihm14U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YczpIqxNlxJNem28dxrZNoUdTunE90er0OlC7Lx0vJDcCG5z6U+bB+pFT/quHNdpl
	 13L47V84I5HMLBQjij392M4iHZCTWZ/9xDnR/NA4GfyGPWB7rTsUk97SPMAaMFRCg5
	 aoT71N66hWLF0DAJX3UYWNKP2+VIB7h3SwMpIq4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3634F8025F;
	Tue,  1 Sep 2020 15:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B500F8021D; Tue,  1 Sep 2020 15:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC8CF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 15:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC8CF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="FkuuOZsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1083; q=dns/txt; s=axis-central1;
 t=1598965687; x=1630501687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XM/YiO1AN+GvGSxUyxQbpOxOSqb3rPJ2qUV4jnebMHM=;
 b=FkuuOZsSAWyApeYNMJ7eu+VK3B4mYWmrNAAEqdpLIFDbwPKf6DAw0DbJ
 Le7qYJtF8DjiAcjCqJTp8QwpG2vBnIsI79WCuINS8y6d083/yQWuZcha7
 Uu1TnLHu8xLXapW4SiYxPeppq/EwxBUA1K7H+OkGT4eOSIPzwMtn0DBZh
 8S67QEMpCj3HAj/2dH1q4RIVBuyoZ2HYE4iS6/Pcu/qdPYCwcXAED0Hly
 B/JU3ewpFnJdqnsX4DMQr2nsDwVohX+KGDt4mUs6nLBgiYG7gi76IrSsw
 J3OOI1/zZ0MsJzbGS1/8fLZ4ohoUdzCfcg56mRV1qnSL88onVEETHXDlY g==;
IronPort-SDR: urVlRcHZRIGbnH4AspnR2uVOcG06TA9Z0n8XexRq5uYKEEPHYbwJGmrq0Ioo5lxoG/KKgmyqo6
 BsjAEXKDGc8CFYzk/FNoVYj+qxJBhf8xeh/FF9+VLrER3BrxNJRlyPgscEIMY9cW9sSQTnWS+0
 0esfg9GrMu8aRpsgsUcc/lsVmNCooNQ+FwKZxVSkn2RK1qXs5VQZ/vASoOJK5w/gFCsWOc4Fi/
 e2970Rqug8IDPYt4/2Ns4Uv0cuRuuHVKJS1l9hTEktJJZJCgAuoOVmt6kbyn1OCNehCyMewJ07
 peE=
X-IronPort-AV: E=Sophos;i="5.76,379,1592863200"; d="scan'208";a="12085624"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH v3] ASoC: tlv320adcx140: Fix accessing uninitialized
 adcx140->dev
Date: Tue, 1 Sep 2020 15:07:52 +0200
Message-ID: <20200901130753.27670-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Camel Guo <camel.guo@axis.com>, alsa-devel@alsa-project.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

In adcx140_i2c_probe, adcx140->dev is accessed before its
initialization. This commit fixes this bug.

Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Signed-off-by: Camel Guo <camel.guo@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 5cd50d841177..7ae6ec374be3 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -980,6 +980,8 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 	if (!adcx140)
 		return -ENOMEM;
 
+	adcx140->dev = &i2c->dev;
+
 	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
 						      "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(adcx140->gpio_reset))
@@ -1007,7 +1009,7 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 			ret);
 		return ret;
 	}
-	adcx140->dev = &i2c->dev;
+
 	i2c_set_clientdata(i2c, adcx140);
 
 	return devm_snd_soc_register_component(&i2c->dev,
-- 
2.20.1

