Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7F91BC11
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E47B2344;
	Fri, 28 Jun 2024 12:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E47B2344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719568827;
	bh=pXcJZXfOduG19g33CWHG/iY96S5LfDhVExDtf7vtU/c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l46gA7iKAmdLPG88zU1AoFxFOBLfOdl8t5a/f7K+HbFic60Lx/yi9e/W5lqrDidb9
	 qdT+AXOGIIDFS63yElw011nmcGknM5nHIvD+UoqeBmfPjEp0srkLbk63VKCaK9WvU+
	 d3Fc+PiymPMToErUbSqToeE9xAMM5XsMUJ3obV8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211BEF800E4; Fri, 28 Jun 2024 11:59:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7DE1F805AA;
	Fri, 28 Jun 2024 11:59:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC642F80423; Fri, 28 Jun 2024 11:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7671DF80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 11:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7671DF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J9JFcv3u
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-424acfff613so4679045e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719568716; x=1720173516;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj7f8gpSZwh6TRqOjZfbXgm8n7bo9ud79bHIhbKk/yE=;
        b=J9JFcv3uyrtoVs7/9UWIQpw22HFWmJmTMN1p+icHWYYxvvW9Wc2eqIrrdZ6/6zW23u
         qJ5tZWg0DwFBKaooaiAg2f58fO5SqNhXG8Bh2RVFq5swrful6mofUe5bn1QgvLSC0IwR
         wLiKmGGN+72M0uWLZzfFAoIDUFDErxPvC3KvfOKip9xy6ShqeO/Dqu9QAs+kNGMYpod3
         C7849iz0HD4hFXqG7u/IznqmSp1ZAhdDMS+NzoLFQObmw/kPcv4rKCgIgA4cdW7nKgEQ
         xWtA/YKzyi/VPxhy8vk5pepvxbY6T5dpPrsfJ+PPU5C/N/HuHttAv9CPx0De8ri6ud9c
         W+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568716; x=1720173516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj7f8gpSZwh6TRqOjZfbXgm8n7bo9ud79bHIhbKk/yE=;
        b=fwxgVlxqr6yeI4Fe9e15B91MEI3p0UjB9NzZ47Q+CLE8tE7RfPKYl8Aez/WsMUVSfW
         BmF10gGopYjwY0jlZFb1j+OQ9wNayFKPB6Nz12CaAD1CycDMK8P/HDch/x73RjhSFy3n
         OlJtpMqC+Kh2z+SIwi8/Pk/tMiBjodeHmw52CiqIQH4ya0aVFMt0gipGI8hFrYaYlETZ
         akFIE76HoQe2lF458+4fDxrt12SWYVt0hkrOUur8wJul9d2kTmhbJ9L3Pu3Ox9Yu0SDd
         VkfiPqH3nr+c784OTwhRLNeQuqiSuNOIhZo6oR3DxfW0YzhTGE7PlGrR2zFWb21LbOW0
         aGRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBkUZzeJm42KbGo+s/b6XqPW/dSUsPzejbPUDFHtYAo1dnutAWYoC+t/yRhRfUQkqw6VgVLaEsjQTJZ2S5++5t76Qsv1l0UiZI3FE=
X-Gm-Message-State: AOJu0YwjBCj3O1LD1XI9AGAGAF5Vp+vsTQswJ17Cv8395TGDJKs36HrO
	zmmaiZyz5WvKS0tTxcaL7nowHOpBnq8kqUlr5MZT2eWdKK0MxXfMnIs0P66Grhg=
X-Google-Smtp-Source: 
 AGHT+IGOECgt/Tx2J3NULa0P6WR60IFU9SZLYVOKALAhoMlIlXENOp0BXYMSZmaQsxPOdOKobn4xsw==
X-Received: by 2002:a05:600c:1e1e:b0:425:6a52:eaa5 with SMTP id
 5b1f17b1804b1-4256a52ec38mr15858465e9.41.1719568716326;
        Fri, 28 Jun 2024 02:58:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e13d4sm1760802f8f.56.2024.06.28.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:58:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: Fix using NULL pointer in
 probe() dev_err
Date: Fri, 28 Jun 2024 11:58:31 +0200
Message-ID: <20240628095831.207942-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZDZT5O2VYDMSF4X5CYSE7SAIPFK2KPRV
X-Message-ID-Hash: ZDZT5O2VYDMSF4X5CYSE7SAIPFK2KPRV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZDZT5O2VYDMSF4X5CYSE7SAIPFK2KPRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 'wsa->dev' is assigned closer to the end of the probe() function, so
the dev_err() must not use it - it is still NULL at this point.  Instead
there is already a local 'dev' variable.

Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f619b06b8aec..14e0cc4fbff3 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2798,7 +2798,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		break;
 
 	default:
-		dev_err(wsa->dev, "Unsupported Codec version (%d)\n", wsa->codec_version);
+		dev_err(dev, "Unsupported Codec version (%d)\n", wsa->codec_version);
 		return -EINVAL;
 	}
 
-- 
2.43.0

