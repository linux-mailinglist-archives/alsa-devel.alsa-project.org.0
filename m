Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E336593C0BE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38B9EEBE;
	Thu, 25 Jul 2024 13:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38B9EEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906752;
	bh=5bfQhydr9tMLNetcsEZz+hbSCdoeA4DrLZ/v+dMoi3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4kZU4+o5o7U7L3JqXiTcNHnStzsQJDLG+iy6Wdv69SNGNmKPCNeSicQ742MCqly/
	 WmCi+FTKWnwZioOrfSpNVD5ZegP3CB9ADRNMIGLhe3/gACrBKTHOeb9K+Rh4t+6fP7
	 tBgZ5V2XF1uAzwXd5YhsXypDXiBMLnyQAkWKRO2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C74F2F805FE; Thu, 25 Jul 2024 13:24:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1392FF805FC;
	Thu, 25 Jul 2024 13:24:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB4D1F80588; Thu, 25 Jul 2024 13:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7581F801F5
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7581F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VZSL7aWm
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-427fc9216f7so6380065e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906637; x=1722511437;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFlLzwLRceHnWpJnvPhTnE02ITLGjL6VJSNAT7ByPwI=;
        b=VZSL7aWm8Ay5u9pfsoJlWWRs7wkJ5ktrPFBVPxzXd2cpVMcHEH9vhJUtV7zBvJEzYc
         /ekPxW/KDx/QdS+HgaVAvjF3dufAmWkhnLJ7asMPXGcwZEr4M4w2Pc1+ZYN9v5eZcSP5
         eRi0aO+eMxyeD8FzgmocSUJS9823Pmqb4AvTA+dmTvhh4arHBW76VUPKhKwuGCvgV19z
         42lynSvMpGX2MVinCRFdHANsMGKeA5FpFQrY3TjABPWm+k6rgQbbuSWWHjpzHFOUsSSJ
         uF8RoUQgRXpFv3bfWNysWM6VaRamphxNLgpcypX44lUaFdfwf26M2vFuBue/duOaWyys
         Hqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906637; x=1722511437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFlLzwLRceHnWpJnvPhTnE02ITLGjL6VJSNAT7ByPwI=;
        b=XGRJ+oR43b8GEagqX873sOcLzLf3iJe8uenz/yN5Ncx+AuZ0L2j+e2Nlvbd+PmA2jO
         875zwOwTCk0QIQl1dyL3dcO7Yf8bd0axn1U+9UMepBi+PaOEZgrXzm0XTSmSHllNSQBk
         6IuU0ycShAPf4zA6Uobwptr814emWyGyCJZENCT1yWemYseV7bCtR1R8CLd99rfu318g
         gpV9F3UXgKPgJTUP8XJsu/483tylvumhRbBwBuFOLT3W480lPswZe84WwtUUZPB7eeqc
         anrKrJpLVLLuidzoL6IXEoulMWmhYGyDTzGogK6RZDXk/dzT8QihI/z9Z/dZuyWucbth
         oOyg==
X-Gm-Message-State: AOJu0Yz+UXdNDsAg/UwZgZnFMxu0hvTPvhfLI8cEp6rpOMXRRioXxn1k
	LTJDD5pIz8n1h5lHYjqbOfQNzfov2CngJS8gZehiG9fORZ3dDLRjibiDtiDENag=
X-Google-Smtp-Source: 
 AGHT+IHI+UfhUfC5IdbfjZbkmX32phYaaUoqE0Hf3dZqYfF6Agh382b8dMvAJQrIcQK8MCKaSP5q+w==
X-Received: by 2002:a05:6000:1942:b0:368:3038:8290 with SMTP id
 ffacd0b85a97d-36b36421ac8mr1441762f8f.39.1721906637372;
        Thu, 25 Jul 2024 04:23:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:44 +0200
Subject: [PATCH 2/7] ASoC: codecs: wsa883x: Use designator array
 initializers for Soundwire ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2569;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5bfQhydr9tMLNetcsEZz+hbSCdoeA4DrLZ/v+dMoi3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXE6P6roRkXoVY/K1xVHnF3/DmAhMbfXU/SW
 rdbGLXNlCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xAAKCRDBN2bmhouD
 16GGD/oDVLyKmM0xSiNmRbDucXD4aBD0aY6ODnIpmZQ7/lnlpWOuPXgV2Q3c3djzlRym60/IOVP
 zmoUqNu2LiOecq/VdyyfFx7yNyn4VgQbu66YmVuMbwItvpbj+UF2KHUKElSMQoiu2FVHgrLthYg
 kf8VOeEMXFQ73IhWpygDAaBVFUMKT1pnMEsg5sJEvdC0oNOvU8/oOTK0SLmHC7HMfUw0PbXi+Cj
 BJwVj72PlXzdnIDc6oD+yQfbFy02TriW1i1iIeBrAfvneOKuNZQIHaz4f73cZpwhrlKzCl82r7k
 TvTXQv8nbRD9IU61S9SrKW/SfJWCMdHpU1htnkll82L2T1EcWtOgjB3TXkEmJYaI6ELSJtD04D3
 V1qxlXeT4P5gDhbE18tQm4xAxl1v8PsCBtmKg+6XkOmaKH/Wyw1uPGIQ8ia/rPlTbtciymTMh2s
 RZHljfhesgLD4wOsv0Cs0pla7hwsz6rS3Po9EfOZa6M9+wjHX44l2ti+JG7K/RKVMq7T0E88p9/
 UhVlhgEkm8TsPnK3vCegGOcZgCm4gn79xWpShxhnZL75+FTrNb7pQLRkA0Xo0zIdCO1k1DxCO3b
 4OqwGY/7N4fIufujHwb62cTuUukR9d5YITK7mLF75iPqj/23JqCfzLf7Axn6V4aLWrLmkwi7/pt
 s6cdJ6Tnbp69mMA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: CHYK6LDEZD5OPYLA4VQFUK7QSD7F4YPZ
X-Message-ID-Hash: CHYK6LDEZD5OPYLA4VQFUK7QSD7F4YPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHYK6LDEZD5OPYLA4VQFUK7QSD7F4YPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
store configuration of Soundwire ports, thus each of their element is
indexed according to the port number (enum wsa_port_ids, e.g.
WSA883X_PORT_DAC).  Except the indexing, they also store port number
offset by one in member 'num'.

Entire code depends on that correlation between array index and port
number, thus make it explicit by using designators.  The code is
functionally the same, but more obvious for reading.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index d0ab4e2290b6..9dc2e4d96b10 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -482,33 +482,32 @@ static const struct soc_enum wsa_dev_mode_enum =
 
 /* 4 ports */
 static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
-	{
-		/* DAC */
-		.num = 1,
+	[WSA883X_PORT_DAC] = {
+		.num = WSA883X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* COMP */
-		.num = 2,
+	},
+	[WSA883X_PORT_COMP] = {
+		.num = WSA883X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* BOOST */
-		.num = 3,
+	},
+	[WSA883X_PORT_BOOST] = {
+		.num = WSA883X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* VISENSE */
-		.num = 4,
+	},
+	[WSA883X_PORT_VISENSE] = {
+		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
@@ -518,17 +517,20 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 };
 
 static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
-	{
-		.num = 1,
+	[WSA883X_PORT_DAC] = {
+		.num = WSA883X_PORT_DAC + 1,
 		.ch_mask = 0x1,
-	}, {
-		.num = 2,
+	},
+	[WSA883X_PORT_COMP] = {
+		.num = WSA883X_PORT_COMP + 1,
 		.ch_mask = 0xf,
-	}, {
-		.num = 3,
+	},
+	[WSA883X_PORT_BOOST] = {
+		.num = WSA883X_PORT_BOOST + 1,
 		.ch_mask = 0x3,
-	}, {	/* IV feedback */
-		.num = 4,
+	},
+	[WSA883X_PORT_VISENSE] = {
+		.num = WSA883X_PORT_VISENSE + 1,
 		.ch_mask = 0x3,
 	},
 };

-- 
2.43.0

