Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCBB6908D7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D40BE86;
	Thu,  9 Feb 2023 13:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D40BE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945876;
	bh=pGzWtbvQZB0rOpQxea9glsEGzbqvHMGMaNKREC7kf8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N8yur90y+QQAVcfKO7EXd0CgvPkZWmhHzOQC2vfuL43UK7+RDJJEqcyaVwiMz+DeE
	 AgpZ3UQyZFgCv4DuAxN1vOhfAVN4Xo7u8HoDtmZ/YFpsEzTYvhTwhyTCrQm630zOnw
	 qqKwAru93MetR6TgaOUbFOhf5hDFwIW6CfhsgA54=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D38C9F8055A;
	Thu,  9 Feb 2023 13:29:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FB43F8052D; Thu,  9 Feb 2023 13:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E924BF804F2
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E924BF804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=b9oygx40
Received: by mail-wr1-x42b.google.com with SMTP id a2so1590384wrd.6
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO9KJ117wKTOcC1OUg42YLZeFHf8xivZIBaKC4T0Ad8=;
        b=b9oygx40ldJo9LFfDxM4Te1QkbTRduIx2zVwXgfZZlw016ZqVoksT+wtVCQGunMT/J
         YjodNFj2pecm6xkX981QtGhSTVyPtLanuH3r+sXdTB0TcDZQXKNnaADCcOvzTHa1zj3j
         V7qtW6UTFA/Mvp2VPbdzlI+7RerZUVvD7KCQVI1+oGwJXR7PbS8vQHPluqqNvJFDTzfa
         6IOKqlub03jLkeKyoriFs6RIlaiTw8DuJAXG7RTu1jPbqEiLgZJ5OsCvS4MpoqI5HtFD
         qUh650ZARW0ePEJKErVcUo5+dpXXAoMX4YWQumZOAGbsUKlt7Qg1PYPPPYu5I001/x28
         RhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO9KJ117wKTOcC1OUg42YLZeFHf8xivZIBaKC4T0Ad8=;
        b=qU2rCnS1fCt8/8NtPM/hHRO5nyb6j3XSfVstdDrGAn7O5SnknE5aUDlNFix30kWw/o
         RYALqzs/Fqwv5cZs/agTgDhw4LCYoWcSD8Ikuq5bXnGpVWQG52mszCJeTOKygreWTFO3
         ewvNIQZmYJgRLUZod0LZ5iqdehriy7P20q2I7/kbAtvmLqMiOcSwxStE4sIud0RbeXns
         Pwk6Xe7PEZPoqrVZCMOWVFTB77uhZZER4J4IaiTNNss2Gn860Z+82N4ibGGgX3lkTP1e
         OYI2gQoWI0E7r1gFCG4VcBTa3kUdlkJA/LnHVO8pKiIKI3HExV+OYrAzjr/N4LXg5pPU
         6dFQ==
X-Gm-Message-State: AO0yUKWZYgWMXDMkSel2cZCbzpXnPKomgU766Ab3aelvZffPSZL4XGvl
	Y3zMXwSpu433p9Tfu0VdrI0oEA==
X-Google-Smtp-Source: 
 AK7set+GamFipe+c8M1q6TLNFOo8pih+b9q2zXK486+LOUgbGRpEhNTbdAQDHNOVoUgWjdpJAGbahg==
X-Received: by 2002:a5d:4350:0:b0:2bf:d137:9945 with SMTP id
 u16-20020a5d4350000000b002bfd1379945mr9561299wrr.51.1675945705398;
        Thu, 09 Feb 2023 04:28:25 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 8/8] ASoC: codecs: lpass: remove not so useful verbose log
Date: Thu,  9 Feb 2023 12:28:06 +0000
Message-Id: <20230209122806.18923-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LN6ESC7WVPVKWS3HTXEEF2FJJTEB24I6
X-Message-ID-Hash: LN6ESC7WVPVKWS3HTXEEF2FJJTEB24I6
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LN6ESC7WVPVKWS3HTXEEF2FJJTEB24I6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c  | 4 +---
 sound/soc/codecs/lpass-wsa-macro.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index e0d891a67a12..a73a7d7a1c0a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2296,10 +2296,8 @@ static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
 
 	aif_rst = rx->rx_port_value[widget->shift];
 	if (!rx_port_value) {
-		if (aif_rst == 0) {
-			dev_err(component->dev, "%s:AIF reset already\n", __func__);
+		if (aif_rst == 0)
 			return 0;
-		}
 		if (aif_rst > RX_MACRO_AIF4_PB) {
 			dev_err(component->dev, "%s: Invalid AIF reset\n", __func__);
 			return 0;
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e6b85f3692ac..ba7480f3831e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1856,10 +1856,8 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 
 	aif_rst = wsa->rx_port_value[widget->shift];
 	if (!rx_port_value) {
-		if (aif_rst == 0) {
-			dev_err(component->dev, "%s: AIF reset already\n", __func__);
+		if (aif_rst == 0)
 			return 0;
-		}
 		if (aif_rst >= WSA_MACRO_RX_MAX) {
 			dev_err(component->dev, "%s: Invalid AIF reset\n", __func__);
 			return 0;
-- 
2.21.0

