Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D23609401
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285448B6D;
	Sun, 23 Oct 2022 16:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285448B6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535818;
	bh=FIDLMQJuDlAuNSYse+GQDyb7LMhn93N903DWDRnK0Sk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cL4UyGIPZ4UWZmftCPtfzIOJ+Jhz2LEJq9yJ1eySzTESU/Kvs2bI7dvSb+L+A17h6
	 sT1MD6quHKZMQEYds06isR3AAP7SwN4VqPzZR7lcWdswxXzqa6gQOhqFkn9d9ZWTgM
	 HdwJnYEhYEl2VlX7wnyalDD3V9CMClQcxMVACkBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9E2F8057A;
	Sun, 23 Oct 2022 16:33:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFD9F8047B; Sun, 23 Oct 2022 16:33:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD00F8012A
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD00F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a0DWRLL2"
Received: by mail-wm1-x32f.google.com with SMTP id l32so5103043wms.2
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iboSBornxxq5IGUmNwjcHJMSvR6JYlZCJH/3I/odZvU=;
 b=a0DWRLL2JY+JO6dqzjcB2ClTvgkWANjY32AL4ej94RFeRL2DR4yLJU5Ipl7ijWc5+Q
 HvylTzAJXnREsUmtZnWTse1fmSC3mej7u2CcEQMxQ25Dr9o7Tlar6iRmG4G2DSpUHDQy
 xZ0YThOx9tX3gALv7DdT/TOjk/O4nF04jN491r7vLGOUFJEKVpZYdcBf24sHLLJ0QoVX
 5VyChncf0aZGHuAsLJXRl+eiMa/gWfBVcvFe4h/Vp7ILOca0BIPmaLz2pc8xuqEKoI66
 axspR8iYJhkvddtzbSVExcoGoTQXf4PjmoUAGtDIormS5Uoc/tvOdFl0maAcEOZFI8GV
 h7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iboSBornxxq5IGUmNwjcHJMSvR6JYlZCJH/3I/odZvU=;
 b=DT1u8WW7U92LWhHt+dhrcQiF0Y/bqmkUgq8di5xCg14EHHZ1c/D3HfxAgyWVe6yoQr
 QYaI0rCU0j5a4cDyoWhuNmC9GiJh99MW8AnFumsMAGlWYR5y2gA4utIMHHEJAZInnfvM
 Iec340sVceiXkVL/iRqgH7gZ6fcj4n92um7Nx9UvVHvWbIPt0xxXSEIAYtwbI/MqvTor
 dhXGoqO16yqTQD0y6mKHsRYnHsVjhDA3Or4ri2rzFJx3pN7NeH+Liaee51kAt+c5Rs8S
 0JQ2F534EglmVd5w00jVY1hhT21Jxye3JMSfBwe7I4oQq3PSnuPU0zH+eFZVaf+H6h44
 HNwQ==
X-Gm-Message-State: ACrzQf2Wg7KBchoA7DpnUSMpnPR8qk1VcJvfoyV7L1eRBbitWwmXGs7s
 eIzCkOshWA2KeCiY1sPIlQg=
X-Google-Smtp-Source: AMsMyM7DlAGa7a2TLSa3QPg8ZAlyQYGmx4u/u3+GoUMF45yau24RIk4RLOslbpLSt+vgtP9nqoRrTA==
X-Received: by 2002:a05:600c:3147:b0:3c6:f871:1fec with SMTP id
 h7-20020a05600c314700b003c6f8711fecmr19700599wmo.71.1666535621633; 
 Sun, 23 Oct 2022 07:33:41 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d4d8d000000b0023660f6cecfsm3702290wru.80.2022.10.23.07.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:33:41 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v6 8/9] ASoC: jz4740-i2s: Move component functions near the
 component driver
Date: Sun, 23 Oct 2022 15:33:27 +0100
Message-Id: <20221023143328.160866-9-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
References: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

Move the component suspend/resume functions near the definition
of the component driver to emphasize that they're unrelated to
the DAI functions.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 72 +++++++++++++++++------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 201368f828ff..ac04b17c2787 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -302,42 +302,6 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
-static int jz4740_i2s_suspend(struct snd_soc_component *component)
-{
-	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-
-	if (snd_soc_component_active(component)) {
-		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
-		clk_disable_unprepare(i2s->clk_i2s);
-	}
-
-	clk_disable_unprepare(i2s->clk_aic);
-
-	return 0;
-}
-
-static int jz4740_i2s_resume(struct snd_soc_component *component)
-{
-	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	ret = clk_prepare_enable(i2s->clk_aic);
-	if (ret)
-		return ret;
-
-	if (snd_soc_component_active(component)) {
-		ret = clk_prepare_enable(i2s->clk_i2s);
-		if (ret) {
-			clk_disable_unprepare(i2s->clk_aic);
-			return ret;
-		}
-
-		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
-	}
-
-	return 0;
-}
-
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -454,6 +418,42 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
+static int jz4740_i2s_suspend(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+
+	if (snd_soc_component_active(component)) {
+		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
+		clk_disable_unprepare(i2s->clk_i2s);
+	}
+
+	clk_disable_unprepare(i2s->clk_aic);
+
+	return 0;
+}
+
+static int jz4740_i2s_resume(struct snd_soc_component *component)
+{
+	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = clk_prepare_enable(i2s->clk_aic);
+	if (ret)
+		return ret;
+
+	if (snd_soc_component_active(component)) {
+		ret = clk_prepare_enable(i2s->clk_i2s);
+		if (ret) {
+			clk_disable_unprepare(i2s->clk_aic);
+			return ret;
+		}
+
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver jz4740_i2s_component = {
 	.name			= "jz4740-i2s",
 	.suspend		= jz4740_i2s_suspend,
-- 
2.38.1

