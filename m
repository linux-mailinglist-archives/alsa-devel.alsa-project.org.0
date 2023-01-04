Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A965D4F7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:06:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37CA6B1CA;
	Wed,  4 Jan 2023 15:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37CA6B1CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672841187;
	bh=fkw4KQkZxEXxi05Y7BnBvucOJZ3tO3pncymAHY/a7qo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P4W3FTLKiW/L10Qu+FqqVmXFTisX7MQMHPuaf9BCFTsj/8y5Wd5kgn3tGD0rngqYJ
	 xkR0HpU1jvDUQ7MShOaZ0zMZhBU7S0a3joti43ejipM5tbyyxVDIY4Z04SiuwH0o7K
	 PfKpOiTQVV+UCCwI/3usoccWSU8JDEGa+Rupk6kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2B0F8053C;
	Wed,  4 Jan 2023 15:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B98F80539; Wed,  4 Jan 2023 15:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-08.comm2000.it (smtp-out-08.comm2000.it [212.97.32.78])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D7CF8050F
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D7CF8050F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=KIPeWVv+
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch
 [31.10.206.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id CD750423666;
 Wed,  4 Jan 2023 15:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1672841082;
 bh=fkw4KQkZxEXxi05Y7BnBvucOJZ3tO3pncymAHY/a7qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KIPeWVv+VUIRRpSGxzx+xXoCZoyACdz8qifrnsA4lmMUs+hXjn7mX9sIX9CCaXBHS
 YnrFikS6o0cneTMRM1sMiLlgGAyZ4L05p5y/rMJGF7x5rwZe37K6GYNUhksdNxIvlR
 e6UNDyI/frYhjVFefePXQEGsEfzZxDpKo/DRV37gcBgJaxajiWe9g9ORyvYKB7ysX7
 Hp9O/Era1/kx3hBiroaAIQOrF+OyPdGbzMrGbF67524WMTQ81a4bz2Dbhtsd5Ny6ot
 7nqnC/zC9BuLda91YRfU+Lr6oFyAt2FMH3s8YyAkjd/wBcqeUzKqNa90g0cjUIMpZ5
 9tw2lHK93aEkg==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: nau8822: add speaker Bridge Tied Output
 configuration
Date: Wed,  4 Jan 2023 15:04:12 +0100
Message-Id: <20230104140412.35575-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104140412.35575-1-francesco@dolcini.it>
References: <20230104140412.35575-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Allow configuring the two loudspeaker outputs as a
single Bridge Tied Load output getting higher output power.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 sound/soc/codecs/nau8822.c | 9 +++++++++
 sound/soc/codecs/nau8822.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 1aef281a9972..d5006d8de639 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1056,6 +1056,7 @@ static const int update_reg[] = {
 static int nau8822_probe(struct snd_soc_component *component)
 {
 	int i;
+	struct device_node *of_node = component->dev->of_node;
 
 	/*
 	 * Set the update bit in all registers, that have one. This way all
@@ -1066,6 +1067,14 @@ static int nau8822_probe(struct snd_soc_component *component)
 		snd_soc_component_update_bits(component,
 			update_reg[i], 0x100, 0x100);
 
+	/* Check property to configure the two loudspeaker outputs as
+	 * a single Bridge Tied Load output
+	 */
+	if (of_property_read_bool(of_node, "nuvoton,spk-btl"))
+		snd_soc_component_update_bits(component,
+					      NAU8822_REG_RIGHT_SPEAKER_CONTROL,
+					      NAU8822_RSUBBYP, NAU8822_RSUBBYP);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index 547ec057f853..646f6bb64bc5 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -187,6 +187,15 @@
 /* NAU8822_REG_PLL_K3 (0x27) */
 #define NAU8822_PLLK3_MASK			0x1FF
 
+/* NAU8822_REG_RIGHT_SPEAKER_CONTROL (0x2B) */
+#define NAU8822_RMIXMUT				0x20
+#define NAU8822_RSUBBYP				0x10
+
+#define NAU8822_RAUXRSUBG_SFT			1
+#define NAU8822_RAUXRSUBG_MASK			0x0E
+
+#define NAU8822_RAUXSMUT			0x01
+
 /* System Clock Source */
 enum {
 	NAU8822_CLK_MCLK,
-- 
2.25.1

