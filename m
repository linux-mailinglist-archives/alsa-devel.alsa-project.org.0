Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BB916EB8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC79DDEE;
	Tue, 25 Jun 2024 19:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC79DDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334910;
	bh=0vBGYw+FS13AvBeDigAqz04da28vVKpsvEKRngqhcFc=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iFChQ+lAvAxowxg8PKmAfWYiOz7eff3HrHOX69gfX0VXe625gHBqA1ZnesyVh9Yt4
	 /qTFUCp/PLrlpAuZsyA1U2/nlfXfUOIp8x+6/dEUkQaEqBgB4ogZV8BjZffvU26Pk4
	 JEA25FHTP6IspYlojMUMSfA+7fFoGFeqXL4HO684=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 528F6F805F6; Tue, 25 Jun 2024 19:01:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA710F805F0;
	Tue, 25 Jun 2024 19:01:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 333BEF804F2; Tue, 25 Jun 2024 18:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF7CCF8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF7CCF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gcKCFYU6
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4249196a361so18392345e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334741; x=1719939541;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYBu4PobMIgdfTY6h2udvW8/PZ7jirC6Sa9duUD35vA=;
        b=gcKCFYU6QMuqDW0xjHjMhOI8DgIkAZzurqKqRmfdvHj/7wDj+PSE+zmlKC+Q18pbp4
         nRpVlTLctCqXICG1ohRXcnIu0v3wppj6c7CJSJ90zMj/bsd/1ZpnqMITlnzWYzGlERwA
         DRR0dbbssX2h9oq/UIXWiXhjYwFuMfvthpgyub5AdORIW9WH5/acC8TcIboBP4Lv5CWy
         LXv0qOFjzBZ9STHLIFu7qBT1TlY3APylXtAkc8zzUD7c/Z7MoOVF7nRBETG8LwJyvZ/Z
         97Fl6bqVhju/zpBl63DWo9EEX61MJXLLoJcKOTWq+tmt7fJDzYEJrWxBAIvQ6LG8N2pn
         J9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334741; x=1719939541;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYBu4PobMIgdfTY6h2udvW8/PZ7jirC6Sa9duUD35vA=;
        b=oL1wYmG9ts47vPpSx1GfOJ0SQ5rLaxe8Z+XDJR1pN4xpRxvPgzrGdL80ZaIKYagZfv
         rk4nnHyhOFQ+cFBP+DVt6NbGpCbIQ7homB/ngG4nMe4wh8FVYCsDVVNNpJCbFCl5hjSj
         F80CcFcjoKVWmGFXClP59JU1CENYwmfjYNKiuES6D5QgBoflBjjg7fhyB+JaQYQrESTB
         uyTaeJODbzeztxAdGTgtnpgGmrri/0JH2BuG6uUC40+4QaLmxSVx4jc4J8nPsnLHnUz3
         IIGc0yOUt0+g8OFF73tohpuQGQDQ9KARfPxXPsCKDp3N7ZaVJQw5f5f396s9g4E2Dmha
         3JFQ==
X-Gm-Message-State: AOJu0YxrsB+TY5hS3N1mOpYD7S63w8odOrcmU/3ZcxfQFfL1F7kWKgG4
	J6d1+yyB2QXlJf30YS0RIJ1GG5VsIv+tYLibhKFicdYkQHqUDaScRtOafCSJ7GI=
X-Google-Smtp-Source: 
 AGHT+IHUaZ4mU5uGRN6j2ODv5sXzv2DRzpZrCreP4h6HdLbJU4FVwUS3Cc230v3XgR70R7RUWfR18w==
X-Received: by 2002:a05:600c:3589:b0:424:8f97:8069 with SMTP id
 5b1f17b1804b1-4248f978134mr44997055e9.30.1719334741557;
        Tue, 25 Jun 2024 09:59:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm217969785e9.46.2024.06.25.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ASoC: codecs: lpass-wsa-macro: Add support for newer
 v2.5 version
Date: Tue, 25 Jun 2024 18:58:44 +0200
Message-Id: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET3emYC/x3MQQrCQAwF0KuUrA20wVbwKuIiTr4axJk6oSqU3
 t3B5du8lQLVEXTsVqp4e3jJDcOuo3TXfAO7NZP0su8nGfmVypN1MS/8CeVAKtk4ZugDlYFBRxO
 T6XChdswVV//+/9N5236ZDh7mbwAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0vBGYw+FS13AvBeDigAqz04da28vVKpsvEKRngqhcFc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmevdNqq0tv4A+3jbslGVS16UU0/GvICniNq4Ei
 PT5Vap/DYeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnr3TQAKCRDBN2bmhouD
 1zi8D/915nG8Gwp4TP87gu4KBRwPlUmNpiWoj8gHPtuVIS6jh0QBpQUTXzQ/C2S32sF8UdLdKMe
 hqlquS0dgTs4d8Msz37Lzhp5DI8a+zi+mNJBebnjG0AGyh4hXsqKkfkoq3kTWmohZL8/0mw4gCY
 4FnM/Ao2ntzbtIMO2gfC9JtMVJ8nPidHbg1OInc/sWRe0ikvPbD2adiEhc6L3SW5obK11AYD5vL
 /HE55KcB/ydOrf757QTvSzWxL7FD5Y7YAZVuvFcJg1W7GY3SzpXSh+ErCqark2aXyE05Srxxpnz
 SGtz+QlKxmtm8oVWBJCr3jgVAFaJmlQauDTyHQQ0xQb6SBmgrWhp/T9jOGeo6WCNldslTfdv1r2
 VE+eYW9n8o1ZeXJSMnNNJVbg2lymCoih3s2llEFmiAyfDXQAXL37ZEE/hfugAL1LbI8UMuzOcB9
 oPzkfAFYaFcGiz9Z8troMAfdFYF1q/r77UIykqtc6YMh2JMt/s9xpwFC4cRa/kuZILsUo25CmTa
 sUzeC031pmeLAmZpTYt+R+mzcwiNsPGF1BdtySfpqDaUkaH1PHPr8+3cMPUvjr56Io+Df2kapX3
 cLryfj737fFANY/ogpfPY1WKIT3pRwsGmHDadYdO5E2wQl/LMN8uaMU2ehbD2rOHCmLtdTfkSjC
 8l/6EQbkEtTj3fA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: GADZOOSFOOQM7HQWGS7UVCGDWUQJ6KNH
X-Message-ID-Hash: GADZOOSFOOQM7HQWGS7UVCGDWUQJ6KNH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GADZOOSFOOQM7HQWGS7UVCGDWUQJ6KNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

LPASS codec v2.5 and newer have differences in registers which we did
not implement so far.  Lack of proper support is visible during
playback: on SoCs with v2.6 (e.g. Qualcomm SM8550) only one speaker
plays.

Add missing bits for v2.5 and newer codecs.

This is similar work to already merged:
https://lore.kernel.org/all/20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org/

No dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      ASoC: codecs: lpass-wsa-macro: Drop unused define
      ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions
      ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version

 sound/soc/codecs/lpass-wsa-macro.c | 644 ++++++++++++++++++++++++++++++-------
 1 file changed, 521 insertions(+), 123 deletions(-)
---
base-commit: d585065ee5b64c60496a2403bafee1540cb319ec
change-id: 20240625-qcom-audio-wsa-second-speaker-ee1a5d2d267b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

