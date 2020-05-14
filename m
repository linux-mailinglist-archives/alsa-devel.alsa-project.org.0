Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDFB1D457E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 07:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B493C1669;
	Fri, 15 May 2020 07:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B493C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589522395;
	bh=ys0EeGvrksRpLzVRLdlDAsJPGBBdbpJwRZBcIWe5/4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OET8f576BAi8QScSOvfEMOFCwQThNN6DaCPn63txFaME+9dRp/47B9w83v2YtMPsE
	 kQvesaXJzM41Wnkt8jQPk+YtPtKiLmVkvzdCQ986IkIkGJOX4HKFVTU8CJHQ74etpX
	 /XExsu9rzoIaSx/mRe8RKqg4txqHUxfzKmaIJyi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71A3F80253;
	Fri, 15 May 2020 07:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A67F80158; Thu, 14 May 2020 18:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7665F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7665F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1cNdL1T"
Received: from e123331-lin.nice.arm.com
 (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17A45206D8;
 Thu, 14 May 2020 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589473133;
 bh=ys0EeGvrksRpLzVRLdlDAsJPGBBdbpJwRZBcIWe5/4Q=;
 h=From:To:Cc:Subject:Date:From;
 b=s1cNdL1TCU9RU8gOW3vBS1Zeum5zhJVkyGSj+2jWLMx2trylIF+/KPKyT5LsBnN5i
 e5hrxgExm6JIbN9fhqqIru6v+Zfid1mYDJsihXOl05RJ7w7t69R+L9x4QZpKaQnQ2O
 P2znB1u7mPgdIJGzex41EZssAhCcRFXUMIu7cRz8=
From: Ard Biesheuvel <ardb@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
Date: Thu, 14 May 2020 18:18:47 +0200
Message-Id: <20200514161847.6240-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 15 May 2020 07:58:13 +0200
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
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
the dynamic SHASH crypto API here. Let's switch to the library API
instead.

Cc: Cheng-Yi Chiang <cychiang@chromium.org> 
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Looking at the code, I was wondering if the SHA-256 is really required
here? It looks like it is using it as some kind of fingerprint to decide
whether the provided file is identical to the one that has already been
loaded. If this is the case, we should probably just use CRC32 instead.

Also, do we really need to wipe the context struct? Is there any security
sensitive data in there?

 sound/soc/codecs/Kconfig         |  3 +--
 sound/soc/codecs/cros_ec_codec.c | 21 +++++---------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e6a0c5d05fa5..c7ce4cc658cf 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -537,8 +537,7 @@ config SND_SOC_CQ0093VC
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
index d3dc42aa6825..6bc02c485ab2 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -107,24 +107,13 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 static int calculate_sha256(struct cros_ec_codec_priv *priv,
 			    uint8_t *buf, uint32_t size, uint8_t *digest)
 {
-	struct crypto_shash *tfm;
+	struct sha256_state sctx;
 
-	tfm = crypto_alloc_shash("sha256", CRYPTO_ALG_TYPE_SHASH, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(priv->dev, "can't alloc shash\n");
-		return PTR_ERR(tfm);
-	}
-
-	{
-		SHASH_DESC_ON_STACK(desc, tfm);
-
-		desc->tfm = tfm;
-
-		crypto_shash_digest(desc, buf, size, digest);
-		shash_desc_zero(desc);
-	}
+	sha256_init(&sctx);
+	sha256_update(&sctx, buf, size);
+	sha256_final(&sctx, digest);
 
-	crypto_free_shash(tfm);
+	memzero_explicit(&sctx, sizeof(sctx));
 
 #ifdef DEBUG
 	{
-- 
2.17.1

