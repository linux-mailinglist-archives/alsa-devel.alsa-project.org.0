Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAB93D4D1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6365EE80;
	Fri, 26 Jul 2024 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6365EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003103;
	bh=YE4hixYCVQKmzPIsA7SgCIYgqoaL2VnDKmtBWegqXfg=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CFffMCO3wYj/PI1y8/nLjAA7GIHLD+J/c42DccUYuci65VSYSxPg8ZGNKRIvsQRCY
	 i+5NqoS3mIGSuYUH9yRnbJljqp6C2DgLjZ2P9pLpT02v1YNz2RXb+cKiJ8WMOA3KAg
	 ckobONhp48rwhHIrSIYLQj94FGbqlgLb4Y2WvktM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F266F805AA; Fri, 26 Jul 2024 16:11:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B6D1F805B6;
	Fri, 26 Jul 2024 16:11:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C4BF8057A; Fri, 26 Jul 2024 16:11:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4930DF800AE
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4930DF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tz9zm/nr
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-427b4c621b9so16127155e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003056; x=1722607856;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foeasWWJNDhQ/HQ4yEQa5PNHkqWSKIaHaPMG9mfsBz4=;
        b=tz9zm/nr7u/j8wC39XzaKcOTv/RiwLVhPmwb5lb31/bZEcDVxM6Q9AREgjtImqdZpE
         ejORpVYTWPavw7IAh8qK8j4u6h5qps8rcsuFoUShgg++N2F4xLCZ4MELYg/f5tQflQru
         D1JMpC8tQzbq0mlkVZTdsWnoB11sAXm6DeRyW100+VlZ9UOyQ1BEE/XPHwpPw6Tfo7sS
         tcHY1hBSE47shuHYCwb61o+G1Z6Jp6yquefLrBbhAPzByWd0F0s7u6OhtMx/OuqoSZbu
         +Ms1+/X7ye2+/wI0lw6jZ9MGRe0xm7eF96lqxb+GsiiXfaTEUfwFG1mtDjAWOQt2ziaJ
         R2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003056; x=1722607856;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foeasWWJNDhQ/HQ4yEQa5PNHkqWSKIaHaPMG9mfsBz4=;
        b=Y5BYOfJ+CVaC66QNMJ8MnK0diRf6u995akueSseeogz5QsV4agiL/BeEWO440LVikB
         Cnkix+eiCbO+X/tAh7YggNzAhZ/2IL63JaZBBO8cDtCtZ+2XBuGErrn+Oe9SLIn/gwyY
         bRlkaqqh845jMXTo6PYSGoywwV5SnVhdvsP08cBkxxcBytCB6gMc+dz/ojJ9p7HtP9bQ
         0N7uuE+HupoG6RPBYxvYhk26//h/Ly4m0eXWqhi2uhh4fJrs7+CnJRwiMiFoVDVf7Whv
         e/A3Pwwwja6Xv/bfmtroxSO9F8Cqa5hcLsuj/9/9IyfZmEM8dsIiMWJLM7JqVHoFy2X8
         KlBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw0gIha3e+zIohV7C7vJMVB7gDxhKHV2iU2pq3Fp02hIoOIKdQr0RQ4WwcXZsZ8GpTMVSwaW0bJEpfW5QyMuqVDqmDXUnpvbVFZ3g=
X-Gm-Message-State: AOJu0Yw3k4o7AuQeqQfY8PgTM8p1vmBlfVY5T9nnsFq9ZrAXukRWHZWp
	3jXAc77ptDmC1m3c02BtKcQfVHehPBMHTgysSJAWerYxqs6ttDRPu2WlxvKHX68=
X-Google-Smtp-Source: 
 AGHT+IG3sp1c9rKGEdCfW+UiBfPYjCoX2jPEb3H4yCS5NXZnPSEYkTnzpC6vqLsOS0B4q9wzpWgk1g==
X-Received: by 2002:a05:600c:4590:b0:426:6f31:5f5c with SMTP id
 5b1f17b1804b1-4280570f82bmr39943175e9.17.1722003055613;
        Fri, 26 Jul 2024 07:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:10:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire ports
 mask
Date: Fri, 26 Jul 2024 16:10:40 +0200
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCuo2YC/x2NywqEMAwAf0VyNuBW8bG/Ih5KTTWIrSTLVhD/3
 eJpmMvMBUrCpPAtLhD6s3IMWT5lAW61YSHkOTuYyjRVZ1q0Gh0mN2NSi5oEjyg/xYXCbnXDvu1
 NPfghw0OOHEKez3cwTvf9APRfa3xwAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YE4hixYCVQKmzPIsA7SgCIYgqoaL2VnDKmtBWegqXfg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65lV9Gvax58HA4nJOVWc+P2pZ4UebG+2xFoE
 EFFTphcM7GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuZQAKCRDBN2bmhouD
 18aQD/9jqTriLZNGzTS27m5EsRS6+s02mSwC3shx1DXDLvoNDAw3a7tPUCH16TNnrKhlXaoJhfw
 JL+dnvFlRiqGh1EnC3HOJUcY07m5RHTRSFm7THjhgQWo1GZG2XvYgqFjvkVV9bOKK5vQHiF+nI/
 BS+DvwFMNocr/veCSQsUuvKNPlVwdlxkYTh7zwlyvBE60417cWSOR05RfYYYctkp7AWi/h6Ieiw
 woHS3QR/jNB8xqMG0DFUA0Ckoeu3Z116swyTO7PSMUfE2D9gB0HLSpjm08Jzm/+3lLGAQgaPC+I
 UdacDO88/fZdMMC1aQb1c0cUjEhlxdaEMosP6Yg/egprTP+MJo4WFCkGdqldyFMfiWAlNUmfqp9
 7Nb3qFgQ/gflcncKXAGzaDiosxI64hYYwVmPzyE0ge1+3pb30U1AYk3NXelhdpznWqtzR8vSZvX
 vvxCa3NfJGHKbDvojkN1aHQH82meYPyHSXHT6+oZqnydzIgr0PcWNfjC/nbM2yIfq5/+FEX4hNZ
 2wAw0bBFvrOpIT8K/UeHgw2EjCO8UbQWAhy/aMgA6fkQ0Vuj6HRWt5PXyYsLcMJ1DOaA8Sx3UrI
 6r0pSO9YO+k3gZbYwQ6yx6A0MEgvrVbeC9ej09sbT958JvkHwy9ftAmlab7+diNSrPWT/EioYBL
 kvDVeyddORIUEoQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7UW564G3MX3IBADHZU67NMG7FWAWDMDL
X-Message-ID-Hash: 7UW564G3MX3IBADHZU67NMG7FWAWDMDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UW564G3MX3IBADHZU67NMG7FWAWDMDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Incorrect mask of Soundwire ports - one bit too long/big - was passed.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: codecs: wcd937x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wcd939x-sdw: Correct Soundwire ports mask
      ASoC: codecs: wsa881x: Correct Soundwire ports mask
      ASoC: codecs: wsa883x: Correct Soundwire ports mask
      ASoC: codecs: wsa884x: Correct Soundwire ports mask

 sound/soc/codecs/wcd937x-sdw.c | 4 ++--
 sound/soc/codecs/wcd938x-sdw.c | 4 ++--
 sound/soc/codecs/wcd939x-sdw.c | 4 ++--
 sound/soc/codecs/wsa881x.c     | 2 +-
 sound/soc/codecs/wsa883x.c     | 2 +-
 sound/soc/codecs/wsa884x.c     | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240726-asoc-wcd-wsa-swr-ports-genmask-868239f9682f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

