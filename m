Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BC53F78E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 09:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D071917;
	Tue,  7 Jun 2022 09:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D071917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654587948;
	bh=I1zgrYunMuxyBhHqu2Mhxd5p8gdp1/mcKvDep6sjwU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSgEnE+u22eYN90U3vMHJI5P/8ERvDC+EKZ+wEQxnsWlLhdxee58yKdLUisfLCUx9
	 WENvVBeodQXNV/oUm9wvfs4T+biWhtQsgd4XpGRpbYO041EV8J+FRGj6KyepyJvBLs
	 fFJfZmaAYQEz0aAHhGW+CIE6WSa40I8H34o6OlPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8B1F80159;
	Tue,  7 Jun 2022 09:44:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA4CF80159; Tue,  7 Jun 2022 09:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.shift-gmbh.com (mail.shift-gmbh.com [85.10.195.145])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 742FAF80159
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 09:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742FAF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shiftphones.com header.i=@shiftphones.com
 header.b="YHMAwMYT"
From: Alexander Martinz <amartinz@shiftphones.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shiftphones.com;
 s=2018; t=1654587877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Asv1fLCYiPiifmvDhcl0BxRwcR2Y3nmkKTyFuAD1iew=;
 b=YHMAwMYTWczcAj2vcskeAzuUVY+UHKweEBxCPj+RcGMEkxbufH/8VKVpi/dknM/AJEC1iL
 ogmsA73Oya9Fbyp8XaZ4gZJSWHKAlt+gbp7fcW0sMo8yYdKJJ4mBtK5emUjkbk7epOPz2W
 HHVRLErLaCVOjHZhaEJYCiIBqJVR3I0nLrXlyDhyAEEuGw9dcBh82zBun/wLPN2wqzyoEl
 vFcFZTom22STW2i+LoBy5aRQWburriZDzq+JF/KlxtGlPQjhFg28GtvRp3i5BasoLwj7L/
 52kN157aFcMiqQpb0G78DqKaRomxQ4gFjZXwSk6QKzjbZJwk59iXr5foaKs6ng==
To: ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/2] ASoC: codecs: tfa989x: Add support for tfa9890
Date: Tue,  7 Jun 2022 09:43:31 +0200
Message-Id: <20220607074329.13129-2-amartinz@shiftphones.com>
In-Reply-To: <20220607074329.13129-1-amartinz@shiftphones.com>
References: <20220607074329.13129-1-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=amartinz@shiftphones.com
 smtp.mailfrom=amartinz@shiftphones.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Dylan Van Assche <me@dylanvanassche.be>,
 Alexander Martinz <amartinz@shiftphones.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Caleb Connolly <caleb@connolly.tech>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
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

The initialization sequence is taken from the version provided
by the supplier [1].

This allows speakers using the TFA9890 amplifier to work, which are
used by various mobile phones such as the SHIFT6mq.

[1]: https://source.codeaurora.org/external/mas/tfa98xx/tree/src/tfa_init.c?id=d2cd12931fbc48df988b62931fb9960d4e9dc05d#n1827

v2: Fix comments regarding register access based on review feedback.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/tfa989x.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index dc86852752c5..e6cb62165524 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -40,12 +40,14 @@
 #define TFA989X_I2S_SEL_REG		0x0a
 #define TFA989X_I2S_SEL_REG_SPKR_MSK	GENMASK(10, 9)	/* speaker impedance */
 #define TFA989X_I2S_SEL_REG_DCFG_MSK	GENMASK(14, 11)	/* DCDC compensation */
+#define TFA989X_HIDE_UNHIDE_KEY	0x40
 #define TFA989X_PWM_CONTROL		0x41
 #define TFA989X_CURRENTSENSE1		0x46
 #define TFA989X_CURRENTSENSE2		0x47
 #define TFA989X_CURRENTSENSE3		0x48
 #define TFA989X_CURRENTSENSE4		0x49
 
+#define TFA9890_REVISION		0x80
 #define TFA9895_REVISION		0x12
 #define TFA9897_REVISION		0x97
 
@@ -188,6 +190,33 @@ static struct snd_soc_dai_driver tfa989x_dai = {
 	.ops = &tfa989x_dai_ops,
 };
 
+static int tfa9890_init(struct regmap *regmap)
+{
+	int ret;
+
+	/* temporarily allow access to hidden registers */
+	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x5a6b);
+	if (ret)
+		return ret;
+
+	/* update PLL registers */
+	ret = regmap_set_bits(regmap, 0x59, 0x3);
+	if (ret)
+		return ret;
+
+	/* hide registers again */
+	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x0000);
+	if (ret)
+		return ret;
+
+	return regmap_write(regmap, TFA989X_CURRENTSENSE2, 0x7BE1);
+}
+
+static const struct tfa989x_rev tfa9890_rev = {
+	.rev	= TFA9890_REVISION,
+	.init	= tfa9890_init,
+};
+
 static const struct reg_sequence tfa9895_reg_init[] = {
 	/* some other registers must be set for optimal amplifier behaviour */
 	{ TFA989X_BAT_PROT, 0x13ab },
@@ -376,6 +405,7 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct of_device_id tfa989x_of_match[] = {
+	{ .compatible = "nxp,tfa9890", .data = &tfa9890_rev },
 	{ .compatible = "nxp,tfa9895", .data = &tfa9895_rev },
 	{ .compatible = "nxp,tfa9897", .data = &tfa9897_rev },
 	{ }
-- 
2.36.1

