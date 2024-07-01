Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2E91D92A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1647C22CE;
	Mon,  1 Jul 2024 09:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1647C22CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819636;
	bh=l7CmpDx0OVT51yTSUKQ7OivFmec9RD8HJKyY4/LpEDk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fqxvEq5kr9krJKnfTh65zLQr+wzr7ji74ThJCUn/HNgSCQL4Q8Z56BLL2MHRSFp6K
	 7MENrwYFMAK9wIxs0jbdzI/j6rfFNWEEH4CchOFC307BM0eErA0uVgBdkr2bn+rF9s
	 EHFXjyLpG+2bdv02Xhuw8buXj5kwZ+dlKDU7P+JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C05DF805B2; Mon,  1 Jul 2024 09:40:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B40DF805A8;
	Mon,  1 Jul 2024 09:40:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D52F80578; Mon,  1 Jul 2024 09:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C6ACF800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6ACF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ldT6Rulw
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3651ee582cfso1523053f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819586; x=1720424386;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B9dNm2ieQc2Bk/AjzSpT1hZ88q/WKm0M218pzJl4ks=;
        b=ldT6Rulw+sDFVmVqcEM3o3bjKO/P5XScLr3FE5cux6jqNNajVfm+1F2NbNlV6f2Zoe
         /p5JAcR8RS71jvTy6lhMIIkzUUh8MuGP5Q6UqC6nqd24thRoOWx9Mvaz12+Pf/EJQPVp
         mKivGN5nSN9DmZkIBqkd9iFPWc3E+PiBcif+oOBefoXxgVJnaIDOMZrAibUJpc8a4PoV
         QSbHcLMbFmoMPloZZkDPmWy7eouri9kmc3cff+Dp9pn+UTZNnTUd3/oBEmKeUYbJr2Pl
         KLjuUSXH43jjkN2o0EQjWq2ucVuDLCISsAEutEVVGlklt4UldTj0jtICvLUZ73XW3Ob1
         CciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819586; x=1720424386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4B9dNm2ieQc2Bk/AjzSpT1hZ88q/WKm0M218pzJl4ks=;
        b=vNvNNLh2TejBpcCOa58ygNihEHORqHD4MsEHpVAD7NY+me0amA8Mt9OB+UiIK/fVkx
         O3mHfGNzyox9xgrto6jZAEnRqj1BxQKkCGko5hZh6B7SpWlfBTe6Er4UyatLn+NOegWG
         nTEL3E/+ZNCQWfNbA/ggj7kGDecvuenGQjZeB5ya+LUQRqDSLmhV1SBWvyFTqs4oLZvB
         g6qM3MjqeyyD6LUHufzvtlYSLoNOZYr6WA1mb4Q+xjDk1VT2xgxMB1mVQ2cnQrZ/9YbX
         D7G0ZUC97W7DA3OVSl2XxiSPoXcYMXK+kctDPnLzISB1lITbuK7XeFKxFX/B3zt/yZxm
         KEYQ==
X-Gm-Message-State: AOJu0YwySXS/oVW2GB8Nf6c8UeXVDalV1mE0SoVV2J4zG+m3LcclbYbF
	XkKHWVlumRUpJcK8qMZE2clF9JntlbSV5XKPmxFYXJvnjAlRaSMCZpOax/FZiQ4=
X-Google-Smtp-Source: 
 AGHT+IHwi9wQ7iu9omN0RZeIldhqGbPY9Yk8ZFtz7ksFEq8ByEQhX5wBxtlk/3yYRzB/D/lJIvLoQQ==
X-Received: by 2002:a5d:524c:0:b0:360:791c:afed with SMTP id
 ffacd0b85a97d-367756a3ba6mr3178457f8f.13.1719819586184;
        Mon, 01 Jul 2024 00:39:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/6] ASoC: codecs: lpass-rx-macro: Few code cleanups
Date: Mon, 01 Jul 2024 09:39:32 +0200
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRdgmYC/5XNvQ6CMBiF4Vsxnf1M/6Dg5H0Yh9p+QBOk2EqjI
 dy7hUk3Hd8zPGcmEYPDSI67mQRMLjo/5BD7HTGdHloEZ3MTTrmkJVdwlXA3/gZ6ss5DP+oYwXi
 LBkyPepjGCFwxVTTM0rJuSIbGgI17bifnS+7OxYcPr+0zsXX9i08MKKBFwaqaWS6qU+8GHfzBh
 5asfuKfZvWTyVezVpIxKVBWxZe5LMsb9CceQSkBAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l7CmpDx0OVT51yTSUKQ7OivFmec9RD8HJKyY4/LpEDk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl04miXbCVi2whIvFXDGy/G8Yc1booM4gP/Yd
 EGO7UTr4v+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdOAAKCRDBN2bmhouD
 11raEACIDCPfzgDMUPpRI7qxYBm+QvKhVXtPljGQ1KS/fnSzaFQTSduEey/7UhMliwzArc1bobj
 2RjtD/nYMy8O5uy5LqWKfIpDjlUSLpaKKq8dKecfgLg3QSly0TaFJojGqTgHDFP8dxOMYcjBsPK
 mDKL2Q+E69ofya307xc0aqKFtnppNnrfsLzewqabt+zfZ5LMgPtWDdZbbVsYv7ioTatdhhJXseC
 AlmO3jx7CaNrn8ePK9J6iVkdrJ3fk5CywEawUh/USF7F7Z/WaWAvWqn1e/5d0L6GDmajy5E09Jk
 aH8KCCHoelA7nHA5k8/m+0zs0g/269KPE8b6yZCeiCtnlMO+PVu1Pl4YhfKSOnw9+Lcuezz9mH9
 EeTjtCMzkmUKD0nyyVNk8at9mmjVuS8LHyUivQOdcDFsov1bAq5IhHVV02OEjStclYa8c8DURl5
 E2KysJF9RuuB1d0jjgaoglCq04/qw0NGqcO9vAW7JiRgJF5S7LMo3KsQHo1YkbbXxaYmMP9A+Zd
 fg4Dgpi4EcajNkzW8VU4AfJU5+b41qqZgFbNM/nwQwUsHRkvzCFHRwsFMXfIe2A6mtLtL1COajX
 5vOEA8K+EVkC36y8/lVVpKz9dNNzqF9Rc2cQPJnQALnFpoYXbYfStvEATeOwB28qbdelMSTb/0D
 Dm32U4t8lUDqAzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: LWKEOHJ3KISZFT62ZFKHOBICM37P46BL
X-Message-ID-Hash: LWKEOHJ3KISZFT62ZFKHOBICM37P46BL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWKEOHJ3KISZFT62ZFKHOBICM37P46BL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes in v3:
- New patch #1 to fix clang jump warning ("ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm")
- Link to v2: https://lore.kernel.org/r/20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org

Changes in v2:
- Use cleanup.h instead of devm(), therefore not adding Dmitry's review.
- New patch #5.
- Link to v1: https://lore.kernel.org/r/20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org

Improve a bit the Qualcomm LPASS RX macro driver and align similar parts
of code with LPASS WSA macro driver for consistency.

No external dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm
      ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h

 include/sound/soc-dapm.h              |  2 +-
 sound/soc/codecs/lpass-macro-common.h |  5 +++
 sound/soc/codecs/lpass-rx-macro.c     | 63 +++++++++++++++++------------------
 sound/soc/codecs/lpass-wsa-macro.c    | 22 ++++++------
 sound/soc/soc-dapm.c                  |  2 +-
 5 files changed, 47 insertions(+), 47 deletions(-)
---
base-commit: feca1ff0cd5ab7bc3990ec5a387d81d4dff88068
change-id: 20240627-b4-qcom-audio-lpass-codec-cleanups-27175f1d069f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

