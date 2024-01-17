Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5C83094C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 16:13:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1E53E7;
	Wed, 17 Jan 2024 16:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1E53E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705504385;
	bh=zTLF4pKwDUhmIJpTw+ifYX48G8Y/tLdkZCXLW1dsOdg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=okjXW09v+GawH94+xgxDQrebRjscvMvmNmSq9NZdrSY3uAVcWrhQOnSuAdu9yLUqh
	 UhBDwaRXnH+AcQTsCsoqwUy+0+/u4L3S5DWgUXFHJoOJTjP9dziGc4Su5kpvxREufD
	 Hpn1Tha3Nk9P1Qa3yXkJ/xQKNrqmXmgX3RTQp4fo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CACC2F80578; Wed, 17 Jan 2024 16:12:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B285DF8014B;
	Wed, 17 Jan 2024 16:12:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4264F801F5; Wed, 17 Jan 2024 16:12:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA2AF8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 16:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA2AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yPIxdBVp
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7831c604a84so818334085a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Jan 2024 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504338; x=1706109138;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ5dWg/o67onmhTzNFtXrOTvUPTxoBK6DGUcni7z13M=;
        b=yPIxdBVp0tIl/QA9C4sx1oRqt0Ipby/ScMBzs1OSroNi3caLLTjeg9UV6FmMfDJ4AC
         8TEm5ynRG39IBRYOEsOq8m9WMd9iy43oVZqIvQnzU3raZAgm0326Xocb+wtVGl9q+3Rl
         I+/SJo/A9V0TqrP3mxN+W3DBki0tSKsrzUqvd5/UaIKqHDKFexUz55LBWofs6iVvJbIX
         4dQdeJXAl2aVqAt2JiiKMUuhFEgG/AqwSqKdvuGtX9sL6+VvVASxv8n9xJ2v+PRleiys
         B29RnqGVY8gJJACnu7/EIR1QjqKG7wUX0ltJ7DyB+Fv0ItkF155G18lWxDHNQC+wuLaR
         4/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504338; x=1706109138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ5dWg/o67onmhTzNFtXrOTvUPTxoBK6DGUcni7z13M=;
        b=JuDotwlp/0xdQN6o3RT5e12vnqKsobc3Eg94zL/2b6KaDQhoy2Fp4UdiW3cebtXifT
         DIYTFvkSj3LSZDzong0WAWqYJgIXdeD4UvV8pLc8atb9Q7KrhdWDvxsCzzkuUy0HtHzO
         YCmGaVKuOtqCh2Y9QyVRB6Ui/gFgv6o0N56dKm67XhGN9t7rCwKUpZLOIySz9f1Aub4q
         UwdmTn+6dN9l+V5JCT8xO/3g5aUQAqgbmH/0BhsqHgkOOZxi8+UiGwqLrgi/pYWd0pIL
         Gtn/oIKRKiiI6l2O0zkxHzTjvuefqHoKGNJnYuI+RQPCLrudEPBhl4g5xV6aeHCt8aj6
         VdFA==
X-Gm-Message-State: AOJu0Yw8BLOmkfVUdmfst1OnSL+fom70sKOc3MIa7nfhig8qL4UPiJb6
	3AanyfPzrFzUrUKS4s303wPxhp6J9ZmkHA==
X-Google-Smtp-Source: 
 AGHT+IFuzN2ZXkdL1furtqKyL/+PADgDDPC7U/QwREJrS3KVsloHm7pc6AYqgLOErGBf8DiUCfrogw==
X-Received: by 2002:a05:620a:55b0:b0:783:54a1:136f with SMTP id
 vr16-20020a05620a55b000b0078354a1136fmr5882267qkn.58.1705504338226;
        Wed, 17 Jan 2024 07:12:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a05620a24c700b007816cf21f7asm4519337qkn.76.2024.01.17.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:12:17 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ASoC: codecs: wcd938x: handle deferred probe
Date: Wed, 17 Jan 2024 16:12:06 +0100
Message-Id: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4VGIQWSJSMAGP4WKMGHU4CKSL57INHNG
X-Message-ID-Hash: 4VGIQWSJSMAGP4WKMGHU4CKSL57INHNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VGIQWSJSMAGP4WKMGHU4CKSL57INHNG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WCD938x sound codec driver ignores return status of getting regulators
and returns EINVAL instead of EPROBE_DEFER.  If regulator provider
probes after the codec, system is left without probed audio:

  wcd938x_codec audio-codec: wcd938x_probe: Fail to obtain platform data
  wcd938x_codec: probe of audio-codec failed with error -22

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index faf8d3f9b3c5..0aaf494844aa 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3589,7 +3589,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 	ret = wcd938x_populate_dt_data(wcd938x, dev);
 	if (ret) {
 		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
-- 
2.34.1

