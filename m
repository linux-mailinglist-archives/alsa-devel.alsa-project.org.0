Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D64BF7C7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:05:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26CB1860;
	Tue, 22 Feb 2022 13:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26CB1860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531533;
	bh=9Jz+PWFfDErr8IAAuUwJR/qOjE52QesXY5GP1dl54uI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDNYcBLL8QIbe9nuY8yDwmxapP9c5SfKm1QaHB6jR0nFI4x485DRGCadi3rdaBDcK
	 FYA2ruVRgMWLJLmCn1y82iSTSMSIPCtWOtKIi8xqiJamtB0WEtgJdus41AItupS52D
	 1eFOcWsc3rymGIxBDJGdD3ruacrxWDtPncr1N+uA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55301F8057D;
	Tue, 22 Feb 2022 13:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 784C9F8052F; Tue, 22 Feb 2022 13:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A9DF8051E
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A9DF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NYMWNbip"
Received: by mail-wm1-x32e.google.com with SMTP id i19so11368428wmq.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQBKVZb4u7024qTgLZ2s864oDNFbW3uHg+4te5BtCOE=;
 b=NYMWNbipBHYZahgQldqX2PZzyaPbcRUJoLxmAPDUeUPfy5PNMVxXp0eSsSO2WzlHjO
 Ebg5DrRYGU6SGuiK88+kTtiVolqzZbtTqH4KOxvVat6cVeLM0+zHnRCl+ED4GBpIFFaB
 ARwwm+kk4Pd0P6FNhJDthT4UoPdUlzia+rVbbp6w2r2U075/4k3SS2PL3OBujcXZ8Zc+
 mwYp2McLJSiJCzEVuZxeg2/H5b3gnZ9E6kY4PXGZE6Sro8a68IHIFI40yvDVHPvqSkI6
 udI0pHlccfsH5bIi3uNUcV8bhIQ+0shbrzMfGV84lMYiGAOoy5y/cNDoNdE4Z5Y2bwQ7
 vzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQBKVZb4u7024qTgLZ2s864oDNFbW3uHg+4te5BtCOE=;
 b=pEQLaFDaa5w6hoN1EEajqLA5YE4V068Qgpq0I+T601LHrArNY1AoEM2cgJtxnCZkoH
 DoNevr525dqjfupVT371hMo2oDwhXAII9mE0z9UhspqrZiGpMOqJFmZMhFImheL/sfa8
 05HAa/q4V3iHnIJCqus4OypDpt/hmFa27xgIGp9ZGjFk/SR39hxWBvFDzN8zlXnbixmY
 OkLCSUr8zlZ5Tap1jUJZ3gRwMxn7phm+iX7Y8v6EIVQBbS5SAP8HNV3F1zUFdeV83JE/
 3oNvWgNL3r4J8UP0ZL5PaLYz5Bz3+zSwky9uLgiUy/6FtkTqIB90avOtQqOI+t64N/or
 zi1Q==
X-Gm-Message-State: AOAM530+CiRILvI7Q1Ij7HegoPtDp4euZlaaA+sob0kz3AP58SN2X0Q4
 9BDx0jd+PCV7mvPfkPCZSSs5GgNq1WckVg==
X-Google-Smtp-Source: ABdhPJz7QFBQZkBwyxemqJekiErYbd5W8OP3oWFf3xc+jJ27/6at0TozdCdAYIg/aUnO/t13yodIqA==
X-Received: by 2002:a05:600c:4e12:b0:37b:ebf6:3d17 with SMTP id
 b18-20020a05600c4e1200b0037bebf63d17mr3061640wmq.44.1645531200990; 
 Tue, 22 Feb 2022 04:00:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.04.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:00:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 13/16] ASoC: codecs: wsa-macro: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:30 +0000
Message-Id: <20220222115933.9114-14-srinivas.kandagatla@linaro.org>
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

SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)

However with recent boundary checks added in commit 817f7c9335ec0
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
setting a value above 40 gain will fail.

So fix this min max range correctly to
SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
so that users can now set gain correctly

Fixes: 809bcbcecebf ("ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7de09c46264b..b769fb2ef2f6 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1929,9 +1929,9 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
 			wsa_macro_soft_clip_enable_put),
 
 	SOC_SINGLE_S8_TLV("WSA_RX0 Digital Volume", CDC_WSA_RX0_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("WSA_RX1 Digital Volume", CDC_WSA_RX1_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_SINGLE("WSA_RX0 Digital Mute", CDC_WSA_RX0_RX_PATH_CTL, 4, 1, 0),
 	SOC_SINGLE("WSA_RX1 Digital Mute", CDC_WSA_RX1_RX_PATH_CTL, 4, 1, 0),
-- 
2.21.0

