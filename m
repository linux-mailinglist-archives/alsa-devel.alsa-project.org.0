Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD54410F4
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Oct 2021 22:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D141689;
	Sun, 31 Oct 2021 22:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D141689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635714722;
	bh=5M2J6VLtolkff8vbL1cmeU25yPVsQnA4hle2/XFfcb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXqEIxUQ0bgFHO1T4iWL++fnBTDw8EzasqydLFgFsYCvfICpnUUGh7lX8/OIr8TuV
	 4tHZ/rsqqHdLB+QtWQAOa7p0nzzQ+L3dXCtRJ8/cVDbEUs+egL4pPs/l3y75upHnjC
	 u0NI5kPQyzkFvddDWAB4HOQH/runA+YiD6pLbp6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E8DF800F8;
	Sun, 31 Oct 2021 22:10:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB8FF80229; Sun, 31 Oct 2021 22:10:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D851F800F8
 for <alsa-devel@alsa-project.org>; Sun, 31 Oct 2021 22:10:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D851F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="ksglUMhl"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635714614; bh=5M2J6VLtolkff8vbL1cmeU25yPVsQnA4hle2/XFfcb4=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=ksglUMhlfW/6R1rCq5s/sNSSDMVQiW1A6cgKo8vTmzABYpO5PJOU/HLr2iVV8cN6M
 I0+QykUU/9pTks3sUCyxOmpTsUJf6SXOqp2nVY2RbOnFB3szi/pnRECXXBS2SQtU8m
 Vu3BGO+Jq1WBeKhYGMxhPJEtud290n6982Itd7jE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 31 Oct 2021 22:10:14 +0100 (CET)
X-EA-Auth: gZo/ybajlv073f448wFjPx4WQIIaL02CzThx5GBwARSXnxDwCW7LmmdLvTSg00uCynT4RpDnULaV49m5odBlDHk+qSdLmCea/QRcIWb3kUc=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 2/2] ASoC: codecs: tfa989x: Add support for tfa9897 optional
 rcv-gpios
Date: Sun, 31 Oct 2021 22:09:56 +0100
Message-Id: <20211031210956.812101-3-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211031210956.812101-1-vincent.knecht@mailoo.org>
References: <20211031210956.812101-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vincent Knecht <vincent.knecht@mailoo.org>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

Some OEM use a GPIO in addition to the tfa9897 RCV bit to
switch between loudspeaker and earpiece/receiver mode.

Add support for the GPIO switching by specifying rcv-gpios in DT.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/tfa989x.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index eb2a7870148d..dc86852752c5 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2013 Sony Mobile Communications Inc.
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -56,6 +57,7 @@ struct tfa989x_rev {
 struct tfa989x {
 	const struct tfa989x_rev *rev;
 	struct regulator *vddd_supply;
+	struct gpio_desc *rcv_gpiod;
 };
 
 static bool tfa989x_writeable_reg(struct device *dev, unsigned int reg)
@@ -99,10 +101,20 @@ static const struct snd_soc_dapm_route tfa989x_dapm_routes[] = {
 	{"Amp Input", "Right", "AIFINR"},
 };
 
+static int tfa989x_put_mode(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct tfa989x *tfa989x = snd_soc_component_get_drvdata(component);
+
+	gpiod_set_value_cansleep(tfa989x->rcv_gpiod, ucontrol->value.enumerated.item[0]);
+
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
+}
+
 static const char * const mode_text[] = { "Speaker", "Receiver" };
 static SOC_ENUM_SINGLE_DECL(mode_enum, TFA989X_I2SREG, TFA989X_I2SREG_RCV, mode_text);
 static const struct snd_kcontrol_new tfa989x_mode_controls[] = {
-	SOC_ENUM("Mode", mode_enum),
+	SOC_ENUM_EXT("Mode", mode_enum, snd_soc_get_enum_double, tfa989x_put_mode),
 };
 
 static int tfa989x_probe(struct snd_soc_component *component)
@@ -301,6 +313,12 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(dev, PTR_ERR(tfa989x->vddd_supply),
 				     "Failed to get vddd regulator\n");
 
+	if (tfa989x->rev->rev == TFA9897_REVISION) {
+		tfa989x->rcv_gpiod = devm_gpiod_get_optional(dev, "rcv", GPIOD_OUT_LOW);
+		if (IS_ERR(tfa989x->rcv_gpiod))
+			return PTR_ERR(tfa989x->rcv_gpiod);
+	}
+
 	regmap = devm_regmap_init_i2c(i2c, &tfa989x_regmap);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-- 
2.31.1



