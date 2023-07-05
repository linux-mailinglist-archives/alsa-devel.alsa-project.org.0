Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B7748462
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 14:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37300203;
	Wed,  5 Jul 2023 14:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37300203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688561395;
	bh=PXb0DQDe32KiE8H49vQOuEk7IGh4GM6lW/3evMK/PfI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FsdKx/4pdMnOISNQR1Bb7lDMJps+zFHMNz5ffB7uTSEN8yGcXHSYaoIytt4VqqxVR
	 4MV1mLI+v9NaA7rumb669JCX1OJGQuoWXsDHurI8XhtNKWqmX0C1OHTqDSGJOxVej3
	 VWLyyDsCSj7zvbcDfeQLuKde5bTuc5CIp+dePcCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 812F1F8053B; Wed,  5 Jul 2023 14:49:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37298F80124;
	Wed,  5 Jul 2023 14:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82E8F80125; Wed,  5 Jul 2023 14:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64FF7F80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64FF7F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=votp08ad
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3142860734aso602175f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688561333; x=1691153333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=796mPETlBqbeNQ5vV/FcWX3FA/XcOt8VlMkifegXBJw=;
        b=votp08ad7DjF8+34RaFA/Zj5QD6sm6iRVV4rH3+q1RS92sWxEZ6fSnVef2YVtLxJCA
         7sjTG310S7I/gaKEs6jL5sODe5C8w8Vopwf76GMsd5hh1lN0NCdcu4kHDFkRWJLsPhN2
         KNDFznH+2YAYgItpod/1CRQnEDBziRBjsWh7nCBg2ZfcpDx5hmXEDSWS6zXwazoPRSLE
         AS8DL31mS4zBnxdLo2d37lKtTGZuKj8NTMlKc2E6d0RSmWvAlO1RdvlyQ0cN6aX9kEIw
         IEk2lK+2FKDvNS0JhaLzHCmBsymeQ8GzU+dpp0kUfk9l+8YQcn8vBrCHUWoMMT+2MfN+
         OUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688561333; x=1691153333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=796mPETlBqbeNQ5vV/FcWX3FA/XcOt8VlMkifegXBJw=;
        b=V8eM+K4YUhssU822SVqyI+whu66+Ik135pf3GHs68wJU7smgFoFewzrj8doyu+dVdT
         H65XGVjpp0Zg1uo1MMjiKaYXkV2k40foJ8bR6z/SmgiHMj6jjvsRjcBY2ZPmzRre3cKx
         vvTKLACzzSdiEv3tPTx08srLXdgy+egrFl3j/ROCCjasHaxbSILEPGaWIhq02mrlMZwh
         WHklNfncpvndroVP6J6lNujuaG0EoV71YW8sM+wfBb5VErUaTmTCV2T8E1O3kA3capfz
         XB6zdou1nubOGp16MEiIvPVrlSQVp1wGmWV0Dn9X4ciFJ2RGUR2Inkkk0l4tFfHOO10i
         W6mA==
X-Gm-Message-State: ABy/qLad1xeuYgrbZWgb36Rcp0+xYoDkA2NI0HJByQmgzLaMCT3m9mvG
	0sFwLR/XpO4nXgtWexIS6P3edw==
X-Google-Smtp-Source: 
 APBJJlE7GGHPV5ilUTNwqFWMGOathf6ghUXbeCZOEhnHAO94EQBL8ZMk5xLOXPIg/ka5t02RLI4U3Q==
X-Received: by 2002:adf:e805:0:b0:314:314e:fdda with SMTP id
 o5-20020adfe805000000b00314314efddamr2551891wrm.23.1688561333301;
        Wed, 05 Jul 2023 05:48:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm30770606wrb.85.2023.07.05.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 05:48:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH] ASoC: qcom: q6afe-dai: fix Display Port Playback stream name
Date: Wed,  5 Jul 2023 13:48:50 +0100
Message-Id: <20230705124850.40069-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JB7R72SPNTYBMFGWFWZHUKFFHRUFUEIX
X-Message-ID-Hash: JB7R72SPNTYBMFGWFWZHUKFFHRUFUEIX
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JB7R72SPNTYBMFGWFWZHUKFFHRUFUEIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With recent changes to add more display ports did not change the Stream
name in q6afe-dai. This results in below error
"ASoC: Failed to add route DISPLAY_PORT_RX -> Display Port Playback(*)"
and sound card fails to probe.

Fix this by adding correct stream name.

Fixes: 90848a2557fe ("ASoC: qcom: q6dsp: add support to more display ports")
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 31e0bad71e95..dbff55a97162 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -476,7 +476,7 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 
 static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"HDMI Playback", NULL, "HDMI_RX"},
-	{"Display Port Playback", NULL, "DISPLAY_PORT_RX"},
+	{"DISPLAY_PORT_RX_0 Playback", NULL, "DISPLAY_PORT_RX"},
 	{"Slimbus Playback", NULL, "SLIMBUS_0_RX"},
 	{"Slimbus1 Playback", NULL, "SLIMBUS_1_RX"},
 	{"Slimbus2 Playback", NULL, "SLIMBUS_2_RX"},
-- 
2.25.1

