Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEDA91A994
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB3821B5;
	Thu, 27 Jun 2024 16:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB3821B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499591;
	bh=xSZ7lFidtpEnEkJOArL4sKDzMjVi/htowUNCiLjTGvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ho/KFtbl18C/JhHN5hRcKuTdYsb649jUeEDpFQEPnJPFK0TZfxXyoa0CKIgDB+cA1
	 pIf2XFfYI4YrofKqIhSdeKs9UDNjOHIoNMXejcfXFBYkEn6JtFT8An7WDPOnRCqInS
	 89rAkgEXqWw/yH1C63fyOWivS9VZ4WifXCu20dKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C26F80656; Thu, 27 Jun 2024 16:45:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B3F3F8063A;
	Thu, 27 Jun 2024 16:45:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 160C8F805DA; Thu, 27 Jun 2024 16:44:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9594BF805BE
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9594BF805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=d+0q2ExW
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ce6c8db7bso6441458e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499492; x=1720104292;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lmwD/upm2r8UYkXfaI7EIZwspGva2/PGMOFQo3oapE=;
        b=d+0q2ExW7sjAJPoRHF7wy1PMJsXlZ5sEA1lmCN0C3DfVDWVTfINoeFWF+EtQQ4c5Ek
         nZsuZvJozRL39iOQmQCX5WtYBZqX7h6NTbXNDFUFyamouPn1HYDDERcHKJRTMqxVcV7T
         HiB4MRH0wnChzg2w2XoGL+78m7R+LuHl4TATm4YArKjcb/EZTo6lQHzcjiFo6qkdFLdV
         DRfyUc8MLRwqsyIOd7pFKOj3nrHB0eLLGV+nVYASyyWtL6OwrBuGsHp0OFDrnF7LdW69
         H6rtswjfUj+gwEJtSlYPpkdCR/W8p6SOXCoDFkJux9powK2WC/i3CYw4x+HC/rT1ZzNE
         USJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499492; x=1720104292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lmwD/upm2r8UYkXfaI7EIZwspGva2/PGMOFQo3oapE=;
        b=HMq+FWZOZxTU1Zl7mLBZVEv64QvnhxcLiSB7f/RwhwmqaTAMWXX1FP5SNJ2kbundYn
         YlvTjC8+1Sco7Jrp/dloZ7vFhFoJqZL/pF+vyOHtjoCSl9Db6eR9M/CSGfauLWtB94BF
         EBUWZzpxUE03sgbfPHYn15bzUHddRdp9L/Nq8muX4mG6IoBOmgdxEp4n00OuVsqi5mBw
         tYxwydkJkYtFFxNQucZnOyo5gg7QJ9zJLk9rXAQibr80QvA4NFfrISDPApj9+8YDeBMs
         57u8aGkMkp7FG/8cp9TSLyROSFeqEJSJ2lENmI5bv56x+F22b9Ty/sHzxflz8ECZ2yXf
         /C6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw4mBk+ANsVSfVQuVrOpf39KgBNCTyS2+9E9yZgxjZi3/puLfRKXAsnx9QfFZ8hcmQIYBp+X+IWraN43rOmpMDD4I9PGJFPH9O/ig=
X-Gm-Message-State: AOJu0Yynp2uAu2vPfAEtekYgkYB4+SfUh6Qc1cG7M5F3ZbaIsCyzXROI
	HicunBVP2eNEkDw+M/bHEYwTLu/po8Q+1Ht2HwcrtsWAsH9rwGOiGA1mVJhL1b0=
X-Google-Smtp-Source: 
 AGHT+IE6naV6JhZphLSxPOXdcBcUuAWCQ1idquccX4cpiEQXBoGOw1GpAPPIUWryj7x2zG7vu9DRiw==
X-Received: by 2002:a05:6512:3ba9:b0:52c:df4d:bb9e with SMTP id
 2adb3069b0e04-52ce183b7e5mr12706369e87.41.1719499492561;
        Thu, 27 Jun 2024 07:44:52 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:41 +0100
Subject: [PATCH v2 4/6] ASoC: codecs: wsa884x: parse port-mapping
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=xSZ7lFidtpEnEkJOArL4sKDzMjVi/htowUNCiLjTGvc=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYhmGIg6QeWI+KXemXDcPu97nis0ADSq17q
 gysZltLdZCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 Nw0nB/9EadJpWoeSOEoNlop26yu4AbCGYuefsbPNTzrR8Bg0XkE5Yrz+eY0orZU63u7a1ZZLnA3
 lS5AoL9uQgGyWrQod2WkC6jBhf/VB+6RTwV/b+6m23PwGEbbgfJ7VAiRJpRrDYnZUMXaDWZ5dqW
 Yd7Q6/ZvvuWW7PNi39ohLsKqaBA2gtlvA3TbYWA/RSjFjVBJ2frq0x6p0GKWMaMIJgpOEB9zAH6
 NMkw7fwgXgOZIVD1ggAeUzih3eOdxHq73dAPb9geEaOwLB9X/xSnMFNrrMo88GSHL6KPWVGWbmy
 BjP0zOb9sJvAz5MQT1iGr40ENCCIMPOxoHooQNrFfKRc2j1P
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 36HQRZ72I7T7XVJV4IXKD3UKFN4JFEDX
X-Message-ID-Hash: 36HQRZ72I7T7XVJV4IXKD3UKFN4JFEDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36HQRZ72I7T7XVJV4IXKD3UKFN4JFEDX/>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a9767ef0e39d..a6034547b4f3 100644
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
+		dev_dbg(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;

-- 
2.25.1

