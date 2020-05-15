Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BE1D4A60
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 12:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C42D1670;
	Fri, 15 May 2020 12:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C42D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589537087;
	bh=WFiRc7YvYN4B8uiMApInOU8daivBlYrasIhah8qZRX4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Un/geCEAusP3/NjIPhygeL2lSz1O91z3pn76MLuEreI93r2FpHrfdhAPgcaBbmOMX
	 V3EpXy0TVo3HQ06GkcatxWyGFYVtHYIvUOjMj+zsLNtJ8P7Vo3VCOHuziG5uEtf8nd
	 KhDde9IYyRyJ40A+fIgacSvFhSw3xAG0UZCVZyw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04133F80101;
	Fri, 15 May 2020 12:03:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C26F80254; Fri, 15 May 2020 12:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D747BF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 12:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D747BF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BUwzPDn2"
Received: from e123331-lin.nice.arm.com
 (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6AFA20709;
 Fri, 15 May 2020 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589536996;
 bh=WFiRc7YvYN4B8uiMApInOU8daivBlYrasIhah8qZRX4=;
 h=From:To:Cc:Subject:Date:From;
 b=BUwzPDn2XmHF93iX5B/obLYrj8mrH+on8y8F06txbiv/q8QaeCSOT1RiTk7Nz8/U9
 2/wOLI+UiIPsMLi0Nkv/bBo6s3nd4Dxa7ikHlwntOGLculPnmZzwo6/uWTLru3N/lN
 Xd28KuGFWjqU226Y1cNVPYww+g7KdGmA2zyrzm1E=
From: Ard Biesheuvel <ardb@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: cros_ec_codec: switch to library API for SHA-256
Date: Fri, 15 May 2020 12:03:09 +0200
Message-Id: <20200515100309.20795-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Tzung-Bi Shih <tzungbi@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

The CrOS EC codec driver uses SHA-256 explicitly, and not in a
performance critical manner, so there is really no point in using
the SHASH crypto API here. Let's switch to the library API instead.

Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2:
- rebase onto sound/for-5.8
- drop pointless memzero_explicit()
- drop include of crypto/hash.h

 sound/soc/codecs/Kconfig         |  3 +--
 sound/soc/codecs/cros_ec_codec.c | 23 ++++----------------
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 44b8c4cde4f3..2d4f1b4bc011 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -538,8 +538,7 @@ config SND_SOC_CQ0093VC
 config SND_SOC_CROS_EC_CODEC
 	tristate "codec driver for ChromeOS EC"
 	depends on CROS_EC
-	select CRYPTO
-	select CRYPTO_SHA256
+	select CRYPTO_LIB_SHA256
 	help
 	  If you say yes here you will get support for the
 	  ChromeOS Embedded Controller's Audio Codec.
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 1948bc6971f6..8d45c628e988 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -8,7 +8,6 @@
  * EC for audio function.
  */
 
-#include <crypto/hash.h>
 #include <crypto/sha.h>
 #include <linux/acpi.h>
 #include <linux/delay.h>
@@ -107,25 +106,11 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 static int calculate_sha256(struct cros_ec_codec_priv *priv,
 			    uint8_t *buf, uint32_t size, uint8_t *digest)
 {
-	struct crypto_shash *tfm;
-	struct shash_desc *desc;
+	struct sha256_state sctx;
 
-	tfm = crypto_alloc_shash("sha256", CRYPTO_ALG_TYPE_SHASH, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(priv->dev, "can't alloc shash\n");
-		return PTR_ERR(tfm);
-	}
-	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
-	if (!desc) {
-		crypto_free_shash(tfm);
-		return -ENOMEM;
-	}
-	desc->tfm = tfm;
-	crypto_shash_digest(desc, buf, size, digest);
-	shash_desc_zero(desc);
-
-	kfree(desc);
-	crypto_free_shash(tfm);
+	sha256_init(&sctx);
+	sha256_update(&sctx, buf, size);
+	sha256_final(&sctx, digest);
 
 #ifdef DEBUG
 	{
-- 
2.17.1

