Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AE160B1A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D134F166E;
	Mon, 17 Feb 2020 07:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D134F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922271;
	bh=ovzHyvQX3pGpNDIQXTwxb06DJSmC1Td2cppsRH12VhQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufE7GGdKUPn2lRv7PxEmQLeTV9pX+ewKS/MaYlEzhUXr0PBc2yyxqGW20kC+pfKmj
	 4JHnieUz5j6vIEJnRfLyxYg+dIaMrE9Nwd/KebJdx1WIfhThgFJwlCl2B37nMoXmAI
	 X131SH9xxEhyuGSza0z7BAhZJjOorxi0q8I+zUKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D64EBF80307;
	Mon, 17 Feb 2020 07:43:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6560F802E9; Mon, 17 Feb 2020 07:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D27CFF80247
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D27CFF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="FgUCPyXn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AETHeRsM"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EFDF75393;
 Mon, 17 Feb 2020 01:42:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RL23TFeyfohaq
 Fe9/si5ERmK2iXLt8kBsYvo76dSlQ0=; b=FgUCPyXnJZi/KZECeKVFaBdVs7uHJ
 ZcP1t7CHUw/kCODt0DSRDsjqARVY1mXJCwrptVkZ5zR9mE3pWMPg9jmYs9MulBnL
 olVgDFH0fJHMU2+OFLj+j99hLHAWUY2s4lLurN9UIQ8GnJ+C5gSLhV7yQRCet2mj
 sAtfHJFmJONsadyZRPA9DynW85w/nlTtnpe3nZ3H2rEEujNwaDLJ927pjrHAniHs
 8qNr9zugWKRg4X6vYklyEQKV7puT6PHt8ewhnp8AMFX/NW7SPZth2Fi9cKzT4kA1
 1r8XoSFhhtFmkAnsw1PLet7ry0ffXwRyqJlQOPLk7U8/c1VytXmyGP/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RL23TFeyfohaqFe9/si5ERmK2iXLt8kBsYvo76dSlQ0=; b=AETHeRsM
 iC4xYnwgptPjbfeGnC/uSo4Fcb4xrminxRmX82cR+w/FRCP5IZdylKao3KD8SNsW
 bD/2ZX/c1fhT3V8MlGWZqqky3Tu1TccvFFAePhT2GzXpdW+Yom4crn8T3Ffs2+Ay
 a/89sTAqKRvcYwM0x5tF5D+hylFJzd5MQwtv4Qu6NiCNZzQeG7EAeeXjpypBL5g2
 YXr22ai/6SMG2hKstnSPKay67onCHE2TrbBdmjaDw8XfAySmGe+A7j7J7IZsUjy/
 dg7n0HW4xaiq5CWO1HBJqCoxbG2hM+BBKBZaxVvotJRR+B2gk4foSoCkPu7CL+LD
 EjCoQSc/c3+ajA==
X-ME-Sender: <xms:8zVKXlczTuVLgGu7I_zCBCT6sJ1IL5hkmZP_Qnz7YWnXNOCkJZzrlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8zVKXvqGL45JB25gP-ARNYaM3xZgUJsDJprnTOIGYrhB5KeKRW_mgg>
 <xmx:8zVKXlxf14KADWAVDQ6xnvD-QQgCXLVSpHduqdhk9DPdvr--v6K9Zw>
 <xmx:8zVKXldehaOZSeActgy8cpguyLDIF49P57CewGxAMfvHTwnz63xg7Q>
 <xmx:8zVKXvoGTGgrO58ryaL7sepXcWLbQb129U1hKWrK0jFP36PLCbNvvg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D668328005A;
 Mon, 17 Feb 2020 01:42:59 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:30 -0600
Message-Id: <20200217064250.15516-15-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 14/34] ASoC: sun8i-codec: Fix AIF1_MXR_SRC
	field names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Even though they are for the left channel mixer, they are documented as
"MXR_SRC". This matches the naming scheme used for the main DAC.

Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 8b08cb34c503..6c2fe8549668 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -55,10 +55,10 @@
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
 #define SUN8I_AIF1_MXR_SRC				0x04c
-#define SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF1DA0L	15
-#define SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF2DACL	14
-#define SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_ADCL		13
-#define SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF2DACR	12
+#define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L	15
+#define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL	14
+#define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL		13
+#define SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR	12
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R	11
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR	10
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
@@ -373,18 +373,18 @@ static const struct snd_kcontrol_new sun8i_dac_mixer_controls[] = {
 static const struct snd_kcontrol_new sun8i_input_mixer_controls[] = {
 	SOC_DAPM_DOUBLE("AIF1 Slot 0 Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF1DA0L,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF1DA0L,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF1DA0R, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Digital ADC Capture Switch", SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF2DACL,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACR, 1, 0),
 	SOC_DAPM_DOUBLE("AIF1 Data Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_ADCL,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_ADCL,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR, 1, 0),
 	SOC_DAPM_DOUBLE("AIF2 Inv Digital ADC Capture Switch",
 			SUN8I_AIF1_MXR_SRC,
-			SUN8I_AIF1_MXR_SRC_AD0L_MXL_SRC_AIF2DACR,
+			SUN8I_AIF1_MXR_SRC_AD0L_MXR_SRC_AIF2DACR,
 			SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL, 1, 0),
 };
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
