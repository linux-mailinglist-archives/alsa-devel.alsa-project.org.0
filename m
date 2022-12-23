Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73822655313
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 18:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08CC484DF;
	Fri, 23 Dec 2022 18:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08CC484DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671815195;
	bh=fFMm4Z9Jn9GmTLFlEO5rpMTYF/7g0DE4+G2N/Ha2nEs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aaP4dMqkBHcSmSk+hPAiRHiUiL7qRS8Ut6+PdyFfyL5HRSVfhN2Wgqg8O6RW8bPob
	 B7O05bFLylTCaY1YVW+iwKPL7WxvrMmzkl93bqiKxoV/pDhM8aPTgSNVNWHHdb611a
	 Z1HjJTncmxdiWKUVf6H+8WF/pkmY0xUVA883iBtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92362F80539;
	Fri, 23 Dec 2022 18:05:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF11F80423; Fri, 23 Dec 2022 18:05:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E1CCF80423
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 18:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E1CCF80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=eBNdMukw
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id 8A379BA3234;
 Fri, 23 Dec 2022 18:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1671815107;
 bh=fFMm4Z9Jn9GmTLFlEO5rpMTYF/7g0DE4+G2N/Ha2nEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eBNdMukwTGGCj16Ui9T+1ZhPjGYqMZQ8BNhmbhAi5q3cqwZyCSwTEnxk3DMf01blG
 XCeoYNgrsC3QAHEFNA+N2CNkQf4a0E5SL/uPkJjG90++c1dHohvrnoFjCrT5zP7r7n
 F+F7QLcefFpz9W3CKo1LEhOwdMg/cNdaApmbU6nWdJEIOn1ziLxbEiKkABVNwBZ1I1
 9pAVR4zEdNzqov4ndrJ6+CwORd90zfzSbNO1ezs0u4AuOez3fCeRhhS6hJ8p//HYZK
 6NablPAqb15DaqnXSRoycU1sRrZ+VLYpzXLbQHpKnWhrayJTb/8hZBbq73EbxeFLA9
 fohBhg9+G59ww==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] ASoC: nau8822: add speaker Bridge Tied Output
 configuration
Date: Fri, 23 Dec 2022 18:04:04 +0100
Message-Id: <20221223170404.210603-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223170404.210603-1-francesco@dolcini.it>
References: <20221223170404.210603-1-francesco@dolcini.it>
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

