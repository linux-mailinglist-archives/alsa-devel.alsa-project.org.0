Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A04F7C06
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBE117A8;
	Thu,  7 Apr 2022 11:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBE117A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324678;
	bh=apCzpXIVEQpS4jMwVLTtqq0SX8az5EimldCm/zNcReU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GSfz1A98M9iAXMafx2FX6gAJrqjqSWMgNS7hk8tydFqXHsSqLinKTcoMJF47sQWEf
	 WNXLWi3rJ40sC1Dl8Ap/jfWXREQx7IzUQqISwyGazpVq4n5KO1msZypTxsOzqybWiv
	 N357MO9+LkrOatZiQbucs/sanUEnmUJRoHozUhyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2163F8026A;
	Thu,  7 Apr 2022 11:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D8FF8024C; Thu,  7 Apr 2022 11:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A36F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 11:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A36F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hoXopcE1"
Received: by mail-wm1-x32c.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso5294840wma.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcmZVA3orHoN9CH1Vhr363WxSRr0JXTI0/1EIITcF5A=;
 b=hoXopcE1J4Lu+/5QCJTm9yJNQ8Yb86UCP4CA9gAy2UBbnq8nUx6Ua0rQhteCIqnj2R
 G0Idwm66oA9e8R65t8xOagV6ii5h9McHbgguclDEbJRUm7KlfUNapz8gFEQkuSg3gVY1
 O+2uE9eBMJ9wfg/JTt7L69bS9bIRyRnSee3nqEARRi6MTo2ANU9iguZRal1SSV4Ly4fM
 xulDm8BBByY0XJ+K14q/+woqGr8B4uOXSRwSK4tXK9CTxQmOF+i2vgBqHTITDbd5FXAo
 SiMJXGP7sNZxDBwadlX2KPmaNsFOyr82DA60+ZxOQRc5AAYfADsa6w7lC2C7j4JIqTNL
 eCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcmZVA3orHoN9CH1Vhr363WxSRr0JXTI0/1EIITcF5A=;
 b=omJvf7auyxl2R14hc3ap8W8QkLxyU5o4s4DnoovCzYXe42edhbmoXJUCHowBzpu4LH
 4lLWDpN22xf4Bn9pPm8Oq9kRrTFbBmo1zubj8EQytnz+Eavwsnzv6eJkB5KLJQDY4QR5
 NcwWgOR40dGBVHiubmUzJlS0atL/+CgEevXL/QkktNr+o7lcgjoKjAlj5ruWoHE/kszP
 HfspceHCdnewBt4Jlo+sTcnzl33K1mn+p3j50NXIUfzc6iijBqtxI2n1OkfialMhtTLD
 nuylNc6tced9Pmu00tTc+/XFGD3+s4EhZp9X9UaawxJmHfKKM1BbDqGnVLru3vlJOpPC
 uNuA==
X-Gm-Message-State: AOAM531AlB5XNePBLJJuP9y9JXsRwRTsWYplAglZW3kl9sppUnkt6FbG
 mkq12AXkSILQZwLNslWXbuCqzg==
X-Google-Smtp-Source: ABdhPJzCZw9SBdZNrxID/udYi02fbYRoy3fr/3m1eSfHrX75d8jk2uFP+uevMIspFJTM/9uNx2oC4w==
X-Received: by 2002:a7b:c0d0:0:b0:38e:68bb:5ce7 with SMTP id
 s16-20020a7bc0d0000000b0038e68bb5ce7mr11143555wmh.105.1649324606195; 
 Thu, 07 Apr 2022 02:43:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm16368002wrv.10.2022.04.07.02.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:43:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wcd934x: do not switch off SIDO Buck when codec
 is in use
Date: Thu,  7 Apr 2022 10:43:13 +0100
Message-Id: <20220407094313.2880-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Amit Pundir <amit.pundir@linaro.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

SIDO(Single-Inductor Dual-Ouput) Buck powers up both analog and digital
circuits along with internal memory, powering off this is the last thing
that codec should do when going to very low power.

Current code was powering off this Buck if there are no users of sysclk,
which is not correct. Powering off this buck will result in no register access.
This code path was never tested until recently after adding pm support
in SoundWire controller. Fix this by removing the buck poweroff when the
codec is active and also the code that is not used.

Without this patch all the read/write transactions will never complete and
results in SLIMBus Errors like:

qcom,slim-ngd qcom,slim-ngd.1: Tx:MT:0x0, MC:0x60, LA:0xcf failed:-110
wcd934x-codec wcd934x-codec.1.auto: ASoC: error at soc_component_read_no_lock
	on wcd934x-codec.1.auto for register: [0x00000d05] -110
qcom,slim-ngd-ctrl 171c0000.slim: Error Interrupt received 0x82000000

Reported-by: Amit Pundir <amit.pundir@linaro.org>
Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 1e75e93cf28f..6298ebe96e94 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1274,29 +1274,7 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 	if (sido_src == wcd->sido_input_src)
 		return 0;
 
-	if (sido_src == SIDO_SOURCE_INTERNAL) {
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
-				   WCD934X_ANA_BUCK_HI_ACCU_EN_MASK, 0);
-		usleep_range(100, 110);
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
-				   WCD934X_ANA_BUCK_HI_ACCU_PRE_ENX_MASK, 0x0);
-		usleep_range(100, 110);
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
-				   WCD934X_ANA_RCO_BG_EN_MASK, 0);
-		usleep_range(100, 110);
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
-				   WCD934X_ANA_BUCK_PRE_EN1_MASK,
-				   WCD934X_ANA_BUCK_PRE_EN1_ENABLE);
-		usleep_range(100, 110);
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
-				   WCD934X_ANA_BUCK_PRE_EN2_MASK,
-				   WCD934X_ANA_BUCK_PRE_EN2_ENABLE);
-		usleep_range(100, 110);
-		regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
-				   WCD934X_ANA_BUCK_HI_ACCU_EN_MASK,
-				   WCD934X_ANA_BUCK_HI_ACCU_ENABLE);
-		usleep_range(100, 110);
-	} else if (sido_src == SIDO_SOURCE_RCO_BG) {
+	if (sido_src == SIDO_SOURCE_RCO_BG) {
 		regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
 				   WCD934X_ANA_RCO_BG_EN_MASK,
 				   WCD934X_ANA_RCO_BG_ENABLE);
@@ -1382,8 +1360,6 @@ static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
 			   WCD934X_MCLK_EN_MASK, 0x0);
-	wcd934x_set_sido_input_src(wcd, SIDO_SOURCE_INTERNAL);
-
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK, 0);
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
-- 
2.21.0

