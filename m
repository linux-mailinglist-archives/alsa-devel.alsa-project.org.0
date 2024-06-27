Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433491AB20
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99EC92119;
	Thu, 27 Jun 2024 17:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99EC92119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501869;
	bh=q5e0BwtxSUJcwFevbMIiLhtV0bDtLk1JVUBFWPJRci4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c7HQccBT67uA4tBoeV4/DkLMSSAlXGF8TwQcADKxvsiX7V3v80BN22/bJJwGIr+YX
	 GSCMpOa+ovSJOPx1yeyCZJAMd/2K9uo+O3qWLnzDBuyfUzGcCYam/gZIKpwWK5oiUM
	 lp4PqPvj06XPmrmHl/r07vSlERB+k1aiewTRwehY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A19F805C5; Thu, 27 Jun 2024 17:23:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36113F805AC;
	Thu, 27 Jun 2024 17:23:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37898F80495; Thu, 27 Jun 2024 17:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58D43F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D43F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IiHl+dGL
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso7747385e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501829; x=1720106629;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBnWRzOVrE39LA/BtdLJYz0EF2Ov+NcNWuXEh5DU/2E=;
        b=IiHl+dGL5Jq6+0/Iv9ptKlJm2x0/dC84ykAw3+Vo+R7OlSf3BoqSni5eLXYCig5lZ3
         U9zbj6Q8IW3DhG1F4nlRyHU9/I0ahceOpVkotcvyJx0uAhRTuY5l8b7x+PwH8DotoRQ7
         1SF8E6hAnkXzXNu5jBYyNDjO2e2SoMqBBBetmI3KVSLsCoQ477EE+QHT2xiQnW925qUP
         LEmiBF83kQHVvRnUdn+PuvUOf8phD7XNBMcpIjZWjwO+jT7deLTTPcjv+/LrJcuJp3VK
         Z8qB78Te37KOobsuCAtSHl5vzRagUs+pa/V4/6TTaKAg464kF/yGb8Tq/IwFNaEWfcxY
         SNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501829; x=1720106629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBnWRzOVrE39LA/BtdLJYz0EF2Ov+NcNWuXEh5DU/2E=;
        b=sGmmsPcr0XZIAlwLoLs305GdUP/iwinVL0kE5vK24ngYV5sLQoHzOTD2ZpuAXv8ZLj
         NzDOwaDrLynQrHV/8H7B7MWdE3doRemORq9a9F0rAZUOG7K9OzoDOfQJ9JBhQNxJPKhH
         9o8vFl2mVyykXr8unmbOrWoAj7A/a3MHwpNfCF2inx3iNMsL7zpKwPiLV5Wwj9NRrmjW
         Uf08Om/tl/F8Xnm6q4JkIxRZ9urFY0ojoXxI/cSGGBVPXMzgK5bY85k8QWoEitWjXk0x
         GAEslrYNYjdMMX7ZI5hgQnNfYhjifKjKFSKSAv14m2Y1aPpnzT4PMEWUvodIrG6fatph
         5HNg==
X-Gm-Message-State: AOJu0YwqeSrNA+hVV2WyYfaaw0GeI5SszXjUJyIIqCzZfZH2Z2RSgjz+
	GeaIMTm3UJg9sQu90KGz3d/uDmVT+QH7Nyf5YFTbpCauE9Lhxvo+95sk+6LDrEY=
X-Google-Smtp-Source: 
 AGHT+IGz4RFVCbxrSnzyiZWinUPxSefZKCrCIlIhIcYbR4ADu79IBzwSrxjnJD9KzdgtU4iOvyRIFQ==
X-Received: by 2002:a05:600c:9a6:b0:424:a31d:a046 with SMTP id
 5b1f17b1804b1-424a31da1eamr71772985e9.15.1719501829317;
        Thu, 27 Jun 2024 08:23:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: codecs: lpass-rx-macro: Few code cleanups
Date: Thu, 27 Jun 2024 17:23:42 +0200
Message-Id: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6DfWYC/x3NQQrDIBBA0auEWXdAJYm0Vyld2HFsB1K1DgmFk
 LtHunyb/3dQbsIKt2GHxpuolNxhLwPQO+QXo8RucMaNZnYenyN+qXwwrFEKLjWoIpXIhLRwyGt
 VdN76Kdlo5muCHqqNk/z+k/vjOE7dO1p1dAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=q5e0BwtxSUJcwFevbMIiLhtV0bDtLk1JVUBFWPJRci4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYP/EtpuKpXFrpXU8aGEeX8e7rsZWx79JF/PG
 f1oa4SAEn2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2D/wAKCRDBN2bmhouD
 17pYD/sESwJpcYRXVf8DHMWNHdhNf9Y3i6N6wtGjkdSXczWRJlm629OhFVRWJ0NDXhzP+QD0IwJ
 I2TDiCFdbyeKZZd1C26Ux9JgZgDb/NB1qqIP4SqmFcbb+zPE1BysZ/e7Oa2urPN9edCN2cO0j0b
 STisS6u18f/gWPuBkRW/DF80vhY4sJenFRm/HI+0Ud190zMlSBJws30Ewf+VUQDvzmZOlu4d+al
 +Bu0/m5JylJOc3JMFlIYuTif3T7WXeSJcs1fTH1+JAnEJ2S/a83JHURmBIqrO8/YZxyXsgoFU/s
 UgF46V3P83fK1gOVEFUUXX0Mdo5ffvvgPlyW7KBp+HD/2QxT9wEH6yWgBJTpVvIa69xzSAqXU+b
 6tW94bkmWwjis99DQZSdcT1zYqvkDAM6MZZAQ95B58SkOZghfaw+Q1GfnidByDJtkqnybgQ9/AS
 Bs0wSkJI8Q7F69IHR72sEIOfUEKmPw6YBLETNNAPBTT5AW7a1K2RziXcVEuxj1k/umLEPgRa3UW
 a7v3Y36UUjOZtSwI0kcPpNWMKT3FOMNhZ3v+XCv14D/i8x/MOS9Nr40HAibmbbcAJQ5HENbSrih
 u5t+v+N1XX7tQi8IX1e2M6YlPgrUvSesPTFFDgPKcEvaW3OrHkRhTK59FlLz9M7pGVbaW0zkyuC
 h5PFDnKVPwBwbdw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: OLL2PCBBNQDJ6QMMWNNRVLJP5EPXMV3T
X-Message-ID-Hash: OLL2PCBBNQDJ6QMMWNNRVLJP5EPXMV3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLL2PCBBNQDJ6QMMWNNRVLJP5EPXMV3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Improve a bit the Qualcomm LPASS RX macro driver and align similar parts
of code with LPASS WSA macro driver for consistency.

No external dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: codecs: lpass-rx-macro: Simplify with devm allocations
      ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets

 include/sound/soc-dapm.h          |  2 +-
 sound/soc/codecs/lpass-rx-macro.c | 37 ++++++++++++++++++++++++-------------
 sound/soc/soc-dapm.c              |  2 +-
 3 files changed, 26 insertions(+), 15 deletions(-)
---
base-commit: 47ec7f026f5db6a0fe26c6215554d043d04368eb
change-id: 20240627-b4-qcom-audio-lpass-codec-cleanups-27175f1d069f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

