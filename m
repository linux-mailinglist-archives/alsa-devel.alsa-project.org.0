Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE407260DB4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 10:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 831711763;
	Tue,  8 Sep 2020 10:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 831711763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599554294;
	bh=EWL+OnuByHsHZDrwNm3gq93U2lfWAYJJnSQDa3mE2Rk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IlOEmdSKiD3RT8szdKjO71372JFL4Lx0+jr39WZex5sGwb5rhSV+Wmky2dBUKYUqc
	 OAcO3XOqv4NZOd1qhxyL7kThpNFwJfoy0tlZ83tovJn0yryHrZTKCYz/ec7FwWatP0
	 KeX80YPYmeQ58f4V+1tYX+KMgh99gbFzPCHiESww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB256F8015F;
	Tue,  8 Sep 2020 10:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78F00F80264; Tue,  8 Sep 2020 10:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D356F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 10:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D356F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="X5FAnwM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1085; q=dns/txt; s=axis-central1;
 t=1599554143; x=1631090143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gTwpcPl1kFBU+63Hn6Z1DD9u9CbnXsIkdWpPX9XgDYw=;
 b=X5FAnwM35QTTUbhtCDm7GLEW1lPiCSBqtRMY33prv/GefFETP6vm1ZAm
 haLHm9WeOwNfA4YAzD4F6GuA35dte2Bl3QOCeNG8k0JGiWJ0EsvO5zAao
 NAGUNL8j6ECbkFL2G5NQvUyGbqmSvXL5+livbj9iMviXV81lVP3tnNGMv
 9n0x6DRgdx9LN9nSlf+Ur43OyPaWOomgob4NMA0jS5D2SCqifcbcJGXfZ
 4ushOcyOFxGwzbYYkWiZIdmFRezVAZj4gFSICDP6yVnL5A3mava44dkSj
 b/n85B7dtrREG2ESI4OB+4Gsdv30g1ISn7YYVMLOF/xehyhomrWbR+dHz A==;
IronPort-SDR: A7seHGq6UizqtY69aiZX4KZ3Zu6mGxvUchvWKDjdzIPhdJ9OtVV/8Ul2TCAIemDAi/3aWCFDLh
 u2WJSVdU7ksbuH0Z3i/gSLQdZ3NQrh2zZRK3dElRCbP5PXWYdr0QWbATS+ihsP5DuwsXg7+JhW
 Aq7xV2pNpFWph5pzc8D9HbXOhAaj49SFJVdkBi4iYjP5/DbCOtIGQbBygKYNNPWOoBk6y1U5Hb
 kYjQBabhRKBIKtZ0+39/YVXRJgHV4pLGM1c/BoYuzVoVjoFWDitPWb8zjvqMK7Bwrz1ZZ+lm7c
 0lo=
X-IronPort-AV: E=Sophos;i="5.76,405,1592863200"; d="scan'208";a="12651999"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH 1/2] ASoC: tlv320adcx140: Avoid accessing invalid gpio_reset
Date: Tue, 8 Sep 2020 10:35:20 +0200
Message-ID: <20200908083521.14105-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

When gpio_reset is not well defined in devicetree, the
adcx140->gpio_reset is an error code instead of NULL. In this case,
adcx140->gpio_reset should not be used by adcx140_reset. This commit
sets it NULL to avoid accessing an invalid variable.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 7ae6ec374be3..597dd1062943 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -984,8 +984,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 
 	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
 						      "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(adcx140->gpio_reset))
+	if (IS_ERR(adcx140->gpio_reset) || adcx140->gpio_reset == NULL) {
 		dev_info(&i2c->dev, "Reset GPIO not defined\n");
+		adcx140->gpio_reset = NULL;
+	}
 
 	adcx140->supply_areg = devm_regulator_get_optional(adcx140->dev,
 							   "areg");
-- 
2.20.1

