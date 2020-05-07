Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A731C9D79
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 23:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5157182F;
	Thu,  7 May 2020 23:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5157182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588887370;
	bh=W0s/DxhIFMC/gizNbGryGXEQxCscmhXtowbIp8aKQQA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PMQM4l9YOjMuMqPslinSVzyjI1w3DCD3Tos1Orb1XG5VoBfqruwT919JVC0lzYA3e
	 JJ0JzmhYfw3+DByoGgC4nT5WIq/sZb5wHanUVA3fFiFAcsKDzFe47612xnkpOPaxs3
	 yyv/16NjqVyY4nvHn0JPhXQYd9oPbF0vglVQrcX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB7EEF80162;
	Thu,  7 May 2020 23:34:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AD4FF8015F; Thu,  7 May 2020 23:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BD32F800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 23:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BD32F800F6
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M42Ss-1jWo9f1xCq-0004Xr; Thu, 07 May 2020 23:34:07 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: cros_ec_codec: allocate shash_desc dynamically
Date: Thu,  7 May 2020 23:33:51 +0200
Message-Id: <20200507213405.1869430-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mP81ucRfJ0n2J5vksalKCXqnqjJ2Qyi7rUxUi+Qw5uBcwTowcbw
 i4m5Hv6OHNLto24ko3XxR5xHOB/S08y9gc/fl6B4hMFSideVdmA+s9jO6bt2XjI9ckPQVHW
 a0BuPYhrCl89Hl1V4BKX941bK0n9qyEWWdIbAjh3hqak4MlQciGt4WGj1qMnC4WuCem81/5
 q1TyibN00u3zbdg47U1lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YlYAs++/TXg=:+/xJSWcjlOALQmASEKD+mM
 yE28stKlsO0l0oYH+yhPbxVPfRZki9ANaZmbRNEn0yVjhj16CnJSim2c857PjGt14hQYgPgkp
 k5APNe8omUP9RjBt7FuD8RnUvoCvnfFB6c9xFQWnymlWIjc29Ino8gqkY9Hxo7dIgxZ44pjVY
 Ierqf0RnUqWiPqlfb3qkMHqa9AM52UHzdjj+Wz7L2LzoDgVrON5iOf99LyVQ5h1wX82YvndCQ
 f/nWAUfncfUMg5TSoL69r87E7PzMf99DQ6e5MxTDZRgW+jT780zp1/ezpiHbiWYRYaYBRRuLK
 5r7+09VMTHG5vhPgizR+alHKZU+A/ZpVmhd9xhgDsE0WKV6ygg6FrlA87mjgj620TNb9NHDSc
 mByk1MtGAjpUVP75mbbUP4YJd3v3fVrXFhlNi6gvAX0h/JJLtGcrJOsLUabzJy/jH/Xw4mjgw
 wL1GMyikEC48LiEH/mR7kzXv651QWh2Yq7lKkZLX48X2dbukfkawGM/4SEMoeo9IlAhFwIb6e
 OMx3gzs9vyik72WDGU9WX8YX99gf7U2c5DdubkVP8ilLqK6z16NWgPFHQGFY82FwmJaDTxLR5
 ceOO4/wrmqg/L3IAJEv+BEX7a73dTDoULgQlIQdTuwfi+quO5940TK2xLMYXDDEyFJ10wnYBr
 oA9VmhZiTDFDkHmL1affrKaOyB6ZIxfVSNIq45GrNIQiCikuo9ZHI3DskR6ReMp5m1dXqcUb/
 u8DKMoa1c8zAHWJASwBF/MIYpH8XOIv64i15hjgjbQyVdSm3eVK3sQQYmcZ3ZmGhW6vaJGJju
 eWYfe+m33ifu3xeMhlQHaryqPW20krpS9URANAtmLjFORH1Dsk=
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

The wov_hotword_model_put() function has multiple large variables on
its stack, the largest of which is the result of SHASH_DESC_ON_STACK().
In total, this exceeds the warning limit for 32-bit architectures:

sound/soc/codecs/cros_ec_codec.c:776:12: error: stack frame size of 1152 bytes in function 'wov_hotword_model_put' [-Werror,-Wframe-larger-than=]

The function already has a dynamic crypto_alloc_shash() allocation, so
using kmalloc() for the descriptor is correct as well and does not
introduce any additional failure scenarios. With this, the stack usage
of wov_hotword_model_put() gets reduced to 480 bytes in my test
configuration.

Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index d3dc42aa6825..1948bc6971f6 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -108,22 +108,23 @@ static int calculate_sha256(struct cros_ec_codec_priv *priv,
 			    uint8_t *buf, uint32_t size, uint8_t *digest)
 {
 	struct crypto_shash *tfm;
+	struct shash_desc *desc;
 
 	tfm = crypto_alloc_shash("sha256", CRYPTO_ALG_TYPE_SHASH, 0);
 	if (IS_ERR(tfm)) {
 		dev_err(priv->dev, "can't alloc shash\n");
 		return PTR_ERR(tfm);
 	}
-
-	{
-		SHASH_DESC_ON_STACK(desc, tfm);
-
-		desc->tfm = tfm;
-
-		crypto_shash_digest(desc, buf, size, digest);
-		shash_desc_zero(desc);
+	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
+	if (!desc) {
+		crypto_free_shash(tfm);
+		return -ENOMEM;
 	}
+	desc->tfm = tfm;
+	crypto_shash_digest(desc, buf, size, digest);
+	shash_desc_zero(desc);
 
+	kfree(desc);
 	crypto_free_shash(tfm);
 
 #ifdef DEBUG
-- 
2.26.0

