Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AFA218D48
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ADDD10E;
	Wed,  8 Jul 2020 18:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ADDD10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594226618;
	bh=PtXTYUvhYp1TuGbsTeUDAcDwsA77DUzWQdDtmeDTULs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAjGDm0gHtSLNuzA6Ztu8cDso6BCKh81WhC9jVsUPImEhX88NbU2nNTkPietX0XPE
	 3GcGGvo/wx8YiO//AM/45BZVksEclpcYGjQtZeDLse5acrkLKuHrXYa+FxCwS3STe9
	 MCHBK7Ysqtj2BzSQsmm1L4q7oRIXLB+CGNQuaXB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F03F80150;
	Wed,  8 Jul 2020 18:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D19EDF802A9; Wed,  8 Jul 2020 18:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D47D9F80150
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47D9F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qJN66Ndy"
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87BD820857;
 Wed,  8 Jul 2020 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594226433;
 bh=PtXTYUvhYp1TuGbsTeUDAcDwsA77DUzWQdDtmeDTULs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qJN66Ndye2qFIHyiJrkgTdH/ifIhiwbe6VTAXwwXDZSots17O7ZP+1npYona5La6I
 E1LdabHsFPyNR8BUdckP4hJKQyONX/UDQSyqJXwe9Xnv6Y+u8NmH/n20ylLt/+KQD/
 5Sdkno5gfMnXsS5w+S5mBxoiReJ9IRpAZBydLEEk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 5/5] ASoC: cros_ec_codec: use sha256() instead of open
 coding
Date: Wed,  8 Jul 2020 09:39:43 -0700
Message-Id: <20200708163943.52071-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708163943.52071-1-ebiggers@kernel.org>
References: <20200708163943.52071-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@google.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

From: Eric Biggers <ebiggers@google.com>

Now that there's a function that calculates the SHA-256 digest of a
buffer in one step, use it instead of sha256_init() + sha256_update() +
sha256_final().

Also simplify the code by inlining calculate_sha256() into its caller
and switching a debug log statement to use %*phN instead of bin2hex().

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 sound/soc/codecs/cros_ec_codec.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8d45c628e988..ab009c7dfdf4 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -103,28 +103,6 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
 	return ret;
 }
 
-static int calculate_sha256(struct cros_ec_codec_priv *priv,
-			    uint8_t *buf, uint32_t size, uint8_t *digest)
-{
-	struct sha256_state sctx;
-
-	sha256_init(&sctx);
-	sha256_update(&sctx, buf, size);
-	sha256_final(&sctx, digest);
-
-#ifdef DEBUG
-	{
-		char digest_str[65];
-
-		bin2hex(digest_str, digest, 32);
-		digest_str[64] = 0;
-		dev_dbg(priv->dev, "hash=%s\n", digest_str);
-	}
-#endif
-
-	return 0;
-}
-
 static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
@@ -782,9 +760,8 @@ static int wov_hotword_model_put(struct snd_kcontrol *kcontrol,
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ret = calculate_sha256(priv, buf, size, digest);
-	if (ret)
-		goto leave;
+	sha256(buf, size, digest);
+	dev_dbg(priv->dev, "hash=%*phN\n", SHA256_DIGEST_SIZE, digest);
 
 	p.cmd = EC_CODEC_WOV_GET_LANG;
 	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
-- 
2.27.0

