Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27C847393
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 16:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D5EA4D;
	Fri,  2 Feb 2024 16:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D5EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706888600;
	bh=scWCCSNr1Q3lv9FkWzECrNcLle7Ox7YalRe8vTccd4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LdzOxyLswBsmC9ekK0ReB1UynJHmAR0Twmcac/a2Cj79eOWXiz832+Mcb1LnQhDMB
	 /EgKv1kJRE6kJvkejCICJc90aGfaX9WWMszs7RL5gsOB3JVQyJ67/fKBW14rhBivpb
	 vq+mzcCuDtDEPt95nUCTCj8DknN0Rg2wWMWl4Xpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A79DF80601; Fri,  2 Feb 2024 16:42:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D179DF80606;
	Fri,  2 Feb 2024 16:42:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D8DF80588; Fri,  2 Feb 2024 16:41:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30F49F80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 16:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F49F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oSQdEed8
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so2935101e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Feb 2024 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888501; x=1707493301;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTaE595ceD/5+24qRv22P7o3MSmNjYJJN4DZfYKGFdg=;
        b=oSQdEed8fdIFQG2Ken6KVwJ2YtFc526GQfmL0oFRAcNqEoE0OX6uPSAgou4AYDDRwA
         vsZiK5uINY77AvWh6uZlmCc5VLmMcAYkuGEeQr7H5ZVrkmOlBitmiCEB7KJk51ywZQTc
         ERnk4GJppQzpNcLiwxjftEegiyZkgOkW8OZjYSRtBH5wHirrTrJ3z3sK5o7OZkXMJiP5
         oaqd7sLBn5SdcKESDIO4UVAsC4dM6xL5fbkOevefO0j75x9PE0eq2J0Ag4tSIyCSMR2b
         a7aaESvTed67p3ouATuoK4uhnKzcZV27jrxjgMRWEpHWdQ7uTCIrI5Nj3GehNTJbVO0i
         L2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888501; x=1707493301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTaE595ceD/5+24qRv22P7o3MSmNjYJJN4DZfYKGFdg=;
        b=FflcrPGvnXLRkEkUa0b16+6UJm6WeITadzSKqGVhTY8BgyIrgV4/uO3giKpOvNRm4X
         JggljWmnBKIPwpKvq7ny8EU07NLzCHgeIfHhleGA2zRBlMKzyG7Fq9f6I3HVeIv7NtZL
         aSa5A8uJRMt7VXLzmizW7dLUYBRUMmFVfwchncO6ejsk4mlsE/rjKQINCCEblZxdrjDY
         xv5Sb6W9EobjyIolljisN1RrpkQvSgDVBcxCmFXnZeeCwUXv+5/RVB823XgU6rkw20Xc
         9GsB3rj2zjWDM/OyEp47CraVaikgBSpWh9JkD2Yav+zkfltTMVFTYPFim49+G4ndatL3
         iu8g==
X-Gm-Message-State: AOJu0YzkJjECj2fEByMgy6FZCpf8ToKD+Gp2nJKAstlS1cO13bCJrzlw
	StJyx3ec4UbslS/5j6f0f2Ij5y8AwWs2RLj60yC9SEa/Vd8CGpq6WIW2kGDNEoo=
X-Google-Smtp-Source: 
 AGHT+IHGdGRJSDguuQBM/q+45C0xJUE3HWzzBXrNL1nVnq4WR1VewqBP5WknN4Upn68unEhG+XLvNQ==
X-Received: by 2002:a05:6512:707:b0:511:3622:508e with SMTP id
 b7-20020a056512070700b005113622508emr1363443lfs.62.1706888500980;
        Fri, 02 Feb 2024 07:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVkuv4Il9EedgVLpQq/ZhdclgzdmtTwnPPSDBsrgSnZo+gjyW9AHgkjtA+/h21aEJrXSM0g1Sj80CLaSu1E5KvA4lvxLsn460edSq0v+V53kBD0D+qR7Aup78/Hhj+2CZqq04PyCdookc7Mqu53p6Ef0iliIChxx/NYodMp70e3QHW5z1l8YYdk4MXG24+VwQYHaTIXy4N4QFMbI0A70BnG2aDH07mIL9KD0FGVXoKP4oyTC690lDHVbZXfeGriepHqBiaYDn43d1ynKeutgJROqaBopUTFKb6d+jurU5MSKqJvhnAF
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: tx-macro: Mark AMIC control registers as
 volatile
Date: Fri,  2 Feb 2024 16:41:33 +0100
Message-Id: <20240202154134.66967-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
References: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HMTGL3LPV6GONHBXM4ESJQRXBXOAAPUA
X-Message-ID-Hash: HMTGL3LPV6GONHBXM4ESJQRXBXOAAPUA
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HMTGL3LPV6GONHBXM4ESJQRXBXOAAPUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Just like DMIC, the AMIC control registers are volatile.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index cdceccf64ac8..2d4f6c04332b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -432,6 +432,8 @@ static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
 	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
 		return true;
 	}
 	return false;
-- 
2.34.1

