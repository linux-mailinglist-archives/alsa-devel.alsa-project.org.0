Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3E4BF7C8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 940801856;
	Tue, 22 Feb 2022 13:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 940801856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531546;
	bh=FCDj+ae/PfJ8FTz6bF1L9/2cypzyhRVDjH18xeur8U4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t51o7fYLViJ/jnh9g1v1ZcIHJ7CsftJTYzt4SpFPuSSf/A3j/ug40sQn5LCXg9QF5
	 yaFBJ4sxF1qLstPxcyPtas7tcwaR3BsN6M5er11HJTsukSUJe6jVZ8JzW4Ok8DjjV/
	 2wfx/jzYYLwZG72q4KZD8fZYA2BUnfQE43iwJdiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD55CF80587;
	Tue, 22 Feb 2022 13:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83665F80537; Tue, 22 Feb 2022 13:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DFC9F80526
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DFC9F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZcSttheq"
Received: by mail-wr1-x42c.google.com with SMTP id j22so6642457wrb.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmZEQ3ujH3Pl/PlsauuKASqPX6aha5wSkDNcz+GXFIs=;
 b=ZcSttheqZnwkIgV2EU86exfYjrFWaOGCDWXrMLKQ8kORkWiA8gaQCjNZk7zEtxkvwc
 BUbtMrKB1nEAK2jmQZvuLZrb0cwYMA12eF0ueiMTMakoKY8aUpBBD+mqwOYNaATSENF4
 sELx5pl6prlUVdzPKNa9yB3URLb2s4L6+tUIA4hUykhmidIrFyayNYhDiKQoDJuQ7LDr
 4aFJWt5v3fzyzdm100KtKwhoI+b/WfL5k+8CG8WTEqgUyDszA1CXsHTM6FVPope/3pzB
 Aly6MBZtia7ImgFjOU6LvPtrLc/ilDX5UibKm0jCCuYRzmyOIzpD/Lheev+vSOl5kZb/
 qQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmZEQ3ujH3Pl/PlsauuKASqPX6aha5wSkDNcz+GXFIs=;
 b=PQIVLbfFcYvoVHL3Aij7jpxPpwBty64ovsRB9xQ+OuwVvugIOxSEycDQX+6FmEmNYv
 bLLD3V663Idilf/AGnZkTThjqoRQgVFPFi0RjS/PGEpBQ98Pta55Cb2dT+NPWPSGLXfu
 wrs8arNa/Ah5vO0/DTtrgMZucXxgWDzha5vyr3K6sjdp7pOct/OD0XAeC01N07WUUhh7
 JbmqPuwkzIFjOWa7KHUZSGuXzshSH+fzR0ZP6tnwQOuaYJd0pXHotY1vISTmCAmHHypY
 PeQjvU+GJ4oWGfky5tOMgziMkBETFd8155xGxDfyIk2chOntsCTgcKZTo5dmrOx5wWxj
 dlgw==
X-Gm-Message-State: AOAM53225HxtkATPdpq/73ktdMOzkfrvF5foOq4oiuT/OfcSXbQPcMlQ
 +PfYZES5cC1vFiBrjYS7FdN5mQ==
X-Google-Smtp-Source: ABdhPJxndahYnuQraQMbxX+OKEAxy1ZcBC0/LyfDFYD/2+U7rFud58FwmA390FMxfotlbCmKLdl1vg==
X-Received: by 2002:a5d:6546:0:b0:1e3:2236:e338 with SMTP id
 z6-20020a5d6546000000b001e32236e338mr18795796wrv.72.1645531203029; 
 Tue, 22 Feb 2022 04:00:03 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.04.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:00:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 15/16] ASoC: codecs: wcd9335: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:32 +0000
Message-Id: <20220222115933.9114-16-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

on Qualcomm codecs gain tlv control specifies min max range as both
negative to positive numbers like

SOC_SINGLE_SX_TLV("... Volume", ..,  -84, 40, gain)

However with recent boundary checks added in commit 817f7c9335ec0
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
setting a value above 40 gain will fail.

So fix this min max range correctly to
SOC_SINGLE_SX_TLV("... Volume", ..,  0, 124, gain)
so that users can now set gain correctly

Fixes: 8c4f021d806a ("ASoC: wcd9335: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1e60db4056ad..cf7bdd309f70 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2254,50 +2254,50 @@ static int wcd9335_rx_hph_mode_put(struct snd_kcontrol *kc,
 static const struct snd_kcontrol_new wcd9335_snd_controls[] = {
 	/* -84dB min - 40dB max */
 	SOC_SINGLE_SX_TLV("RX0 Digital Volume", WCD9335_CDC_RX0_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX1 Digital Volume", WCD9335_CDC_RX1_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX2 Digital Volume", WCD9335_CDC_RX2_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX3 Digital Volume", WCD9335_CDC_RX3_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX4 Digital Volume", WCD9335_CDC_RX4_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX5 Digital Volume", WCD9335_CDC_RX5_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX6 Digital Volume", WCD9335_CDC_RX6_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX7 Digital Volume", WCD9335_CDC_RX7_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX8 Digital Volume", WCD9335_CDC_RX8_RX_VOL_CTL,
-		0, -84, 40, digital_gain),
+		0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX0 Mix Digital Volume",
 			  WCD9335_CDC_RX0_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX1 Mix Digital Volume",
 			  WCD9335_CDC_RX1_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX2 Mix Digital Volume",
 			  WCD9335_CDC_RX2_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX3 Mix Digital Volume",
 			  WCD9335_CDC_RX3_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX4 Mix Digital Volume",
 			  WCD9335_CDC_RX4_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX5 Mix Digital Volume",
 			  WCD9335_CDC_RX5_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX6 Mix Digital Volume",
 			  WCD9335_CDC_RX6_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX7 Mix Digital Volume",
 			  WCD9335_CDC_RX7_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_SINGLE_SX_TLV("RX8 Mix Digital Volume",
 			  WCD9335_CDC_RX8_RX_VOL_MIX_CTL,
-			  0, -84, 40, digital_gain),
+			  0, 0, 124, digital_gain),
 	SOC_ENUM("RX INT0_1 HPF cut off", cf_int0_1_enum),
 	SOC_ENUM("RX INT0_2 HPF cut off", cf_int0_2_enum),
 	SOC_ENUM("RX INT1_1 HPF cut off", cf_int1_1_enum),
-- 
2.21.0

