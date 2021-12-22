Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4947F5C8
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Dec 2021 09:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE89317BD;
	Sun, 26 Dec 2021 09:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE89317BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640506848;
	bh=W7Avty83up2t635WXsPjKKQoz3+TAcQiywLDV/AOfuY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZK/CxJDh4yF501PmnWIeMF96qL3Ip0sOtVzifbdO9ginqfDtyox5NljQdvMdHBDDL
	 FfLX3O5E/EZy9donkNmHy7lG64escATbawpXEFoO24OJrztgrpKktqRaDpYjqKNMjU
	 HpyBCYlJlsR3BSZ8H5zIOXOab5h4iNYpp/kQsZLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73864F804E2;
	Sun, 26 Dec 2021 09:19:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8287EF80111; Wed, 22 Dec 2021 15:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2DECF80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DECF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="E4pPQ4NT"
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:4709:e1da:a7a:6d6e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7A5BF83041;
 Wed, 22 Dec 2021 15:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640182625;
 bh=xc/YzeXNS5PcYycmv53uZiNZPzlyAoLVQnzUYJiKDC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E4pPQ4NTw3nyQMfhu7dBhxlBzw1Rc79WbGfS1fKvIBAxq2/YYg1oVHZbPLp45pLmT
 GwMUO7vo4HU9tjngDS3hfJ19onKLFKwFSRTWxVueKtzgObzKQosQCM/XL1hskVPLn8
 sHazVWas1jt/RqVBJrZSYwiy7TM8z38hptS8dqgkVZMpMp0WhCoXb7ZNb2F54DnOsT
 ILiVcUopts4+tymLiiw6ymYFpdql064F3d9suQy43eSh5cDA7gXWYhnGsefrdNhafo
 A/iqD/pfWLtv1GVPkysu3g6tTeu2TbDZ0Jln13Tywh802iHqFLovQwWV76oPvgJzOm
 m5YIVT03xx1zA==
From: Fabio Estevam <festevam@denx.de>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: cs4265: Move reset_gpio to local scope
Date: Wed, 22 Dec 2021 11:16:45 -0300
Message-Id: <20211222141645.1482267-2-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222141645.1482267-1-festevam@denx.de>
References: <20211222141645.1482267-1-festevam@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Sun, 26 Dec 2021 09:19:06 +0100
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

There is no need to keep 'struct gpio_desc *reset_gpio' inside
the private structure becase reset_gpio is only used inside the
probe() function.

Move it to a local scope.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/cs4265.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index b89002189a2b..88d89366f816 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -29,7 +29,6 @@
 
 struct cs4265_private {
 	struct regmap *regmap;
-	struct gpio_desc *reset_gpio;
 	u8 format;
 	u32 sysclk;
 };
@@ -573,6 +572,7 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 			     const struct i2c_device_id *id)
 {
 	struct cs4265_private *cs4265;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	unsigned int devid = 0;
 	unsigned int reg;
@@ -589,14 +589,14 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 		return ret;
 	}
 
-	cs4265->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-		"reset", GPIOD_OUT_LOW);
-	if (IS_ERR(cs4265->reset_gpio))
-		return PTR_ERR(cs4265->reset_gpio);
+	reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		return PTR_ERR(reset_gpio);
 
-	if (cs4265->reset_gpio) {
+	if (reset_gpio) {
 		mdelay(1);
-		gpiod_set_value_cansleep(cs4265->reset_gpio, 1);
+		gpiod_set_value_cansleep(reset_gpio, 1);
 	}
 
 	i2c_set_clientdata(i2c_client, cs4265);
-- 
2.25.1

