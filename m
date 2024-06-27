Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99091A5E6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE00219F;
	Thu, 27 Jun 2024 13:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE00219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489506;
	bh=dUSDrgAtHsqrMBMVwu3TID32cVpjInOWsGks5FuWKtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QSYak5DDRALVdGhDPfqk0r8aqoMFZ5S/rrWotVHuFMWuV78GJOHlMZLwvhMPcbNUc
	 LryEObki1ZSxqxc0UP4lEdX0DZkc05m9EQO8jBgfmQgx8vHK3YmUend86AUIQ64U4a
	 GoPMR3+nujzFcKprF5ZM2Stb0t5l8rE4ve9Q0+M0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B41D9F806A1; Thu, 27 Jun 2024 13:56:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10575F806A2;
	Thu, 27 Jun 2024 13:56:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1F69F8060F; Thu, 27 Jun 2024 13:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D49F1F80154
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D49F1F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Tu4waj2m
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-424ad289912so14984635e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489364; x=1720094164;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8PKRIjUjJvRpKUO3o64Ez7TG7JmfxLlBEHlJ45a3zY=;
        b=Tu4waj2mJ2i3yyAsA3UWdY4MmZkvNGSBPtHkcMMw0LOq2dXXWpaeA/NTj663DC8GI8
         EZA4gbgaWCa0atJRRhKr9ZIEWOH/FcBDgvwHrjw9RS0uXgO99U9itB4MkFfQodwbopOP
         Rg7ERBHrikfxP4S5QWyW5o6Q48EHeTDTRBiLZBXQTo5GPSFKwhsc6dnJR8WyTbXjmtgb
         nVXdugZNhvNiEnn5yIQxSKyVEcwtMYo9qtAbR8ZCYRj7zutsd8Wmd0ZdGdKCMxYcQ8Kx
         //bwA92fUyydfiXqUrbsxttShTexqxaVKujJLrlH61vHBPMaRlIbdxDLqP60UxVrUgEa
         tnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489364; x=1720094164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8PKRIjUjJvRpKUO3o64Ez7TG7JmfxLlBEHlJ45a3zY=;
        b=VoIVjQRgNZV8JH4BFtADzmONp3PGphXGgUI2h0Hfq0U7dykBsyrWKO6RwusfscoMPR
         NtkCdU03RWHAhiBnt/TMY+FwE4SCLVj4JmTezJx3XE/4nCWH8I5rpblOkgpSZ0/nIW/C
         Prw61swEAhNRMxNjTeLEi8WUDyDPgAozllZeeYSquCmW6aX4Q751MwU/fq8aEhTVVknv
         YEApDxu2sPBzViBDGOIM4aipwGaXZ1pwmgjaXiCi1sFjVal31I+HgiEUyBKIdRIMBkOz
         2z8LDl108Fo5HLB11CyKIJl/39obDLWcHK8xqwVBAgi+vKpi7mxG2HTWu3vrcySQ4S9G
         5pPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgTGFsh/psdq5gG0o8xHdkMjNp76grWhX4P7KjKxkKYqBQ6qMWaxed78rtyJUN9brWze2Q4R7HcnS4iQySx0zfzy0BUZ8+abIzguo=
X-Gm-Message-State: AOJu0Yy/D3AAEJsdHvTzg+g+bFfPUIkQDan8pios2TRLvqI/c30R4DHT
	r0eFBvpxaq/M7CCS7zYNnGcW1xTaIZt482BoonvhGN0N48sb+Wo28roOdK312hc=
X-Google-Smtp-Source: 
 AGHT+IHBbWux1XK3iRVshTsRxxXviYQma5KbR0jw+TjRRrgK4sLvfpFamoLeU0YCU0X6iuVK/eCNOQ==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id
 5b1f17b1804b1-424a4035701mr51778595e9.11.1719489363863;
        Thu, 27 Jun 2024 04:56:03 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:20 +0100
Subject: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=dUSDrgAtHsqrMBMVwu3TID32cVpjInOWsGks5FuWKtk=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNx5Keb8/2UTS2PdI7G4dwNTqMZW5WTi47u
 +Gyoboi9hKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N+SWB/9vQ7yE+tHfTCFxUmw7TEKD+173QS/8VEoVYvSpK0ZvixgEnUmeHsfZVfik5aauwyZi4qy
 EuwBCYrGkJt8e4RCsPkTC923sD43Sryur5818zRXs2x+3qzm9dKlVhLZzEUMl7W0FSA1WRikR5U
 2YicmmmHE61u0snF1GwA68kS43KHDEcxlJzQ09O4MYGMCJ3YA/LYaNCQkSHVYEemYgdDD1ZvSrt
 xqFqvcy+ivl6e230dGVSNO+GPHVAXnLUk6rRHUCCoNYku99GIxThaYleKR6/HKsn5dbRNAjisWB
 4M3vKwa9Wr41gtNrGaBQCdKeU1t4B5vGi7iyYUCwHg5RSg5x
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: ESAEJAWVSMO6JPU66RDOCDTJEXTBUXDN
X-Message-ID-Hash: ESAEJAWVSMO6JPU66RDOCDTJEXTBUXDN
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESAEJAWVSMO6JPU66RDOCDTJEXTBUXDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support to parse static master port map information from device tree.
This is required for correct port mapping between soundwire device and
master ports.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a9767ef0e39d..72ff71bfb827 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa884x->sconfig.type = SDW_STREAM_PDM;
 
+	/**
+	 * Port map index starts with 0, however the data port for this codec
+	 * are from index 1
+	 */
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
+					WSA884X_MAX_SWR_PORTS))
+		dev_info(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;

-- 
2.25.1

