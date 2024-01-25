Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF2F83C6A0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 16:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB0283E;
	Thu, 25 Jan 2024 16:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB0283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706196723;
	bh=JhPsd+XYVzYVuRnn7sBxx/KvgxV7WjX72z6mVmTkqhk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d5QKc9FhX99EoLAHd9HCd9Gtm9ARBcdSwmw1wEi6idGCmC5l3d+Vbrk0cWyx+uqMW
	 aj6MbJmGAe+ZLsyurksB926hKrINAymr48JH0gCbbCc1oEbvJsPEWLpXqcxYqopc2J
	 LRY/rqX5KTG79vnMgjsGTonAf07zF7uiixBGYHFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6835BF80568; Thu, 25 Jan 2024 16:31:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C671AF80580;
	Thu, 25 Jan 2024 16:31:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A92FBF802E8; Thu, 25 Jan 2024 16:31:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59A48F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 16:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A48F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wKI4qmML
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5997492d71cso2737751eaf.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 07:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706196676; x=1706801476;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYK0H+CKAoklRasOR981W3Bz82GZLK+0/kJxDe4J3gw=;
        b=wKI4qmMLGjZRTEwni7rWUGnHAk9dloSUrWH7SPh4yHK/AyGlmGmLplsHI9Z4Zhunva
         vtz+Myi/8wuuXIfmKeEHLCrmYbi2obbJBtWztHHebDAZo8LTx1/2NAsWtQ6PL68p6RJ+
         c0sSHETeVGM4hFT5XE6uHM4CMRXoMwF/I2RJxgxzjA7FJFYtlkembJauTHZzGzvfBEH9
         B/ak6E5C+NThwgBcT/4ndBiLpoVlVdDOVIroqre942IhSAJAA/ZVqE57a8Kjo7g0FcvC
         WmizwgOB3eu6cSe/Y1dkxDmZ0kctMedPNqdgFxgcFEMw+IY9R8xivkqSZGz8GQmpOX1x
         wSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196676; x=1706801476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYK0H+CKAoklRasOR981W3Bz82GZLK+0/kJxDe4J3gw=;
        b=gXr9XPYK/rVRqFmd905Xk7VEvwbtKiAs+j/hbQsZw+EgeFltF2vde+C8AglI8XWGli
         T+pCoMLE9rx3JxCUkBiJX2NerNtwsD3IE/dlY8/oTVbLxckFV1BJaa6adeqn81st0cp9
         zBKAQgF07bqeq0DOXEFqdfv7dRMlfUfqkLd0r9JgCWa6ROQOm5KzTxhd3g28RU/aiqks
         K71I6+7ZQc40lfuIYxOIBeIKFbr4VU12gEdiK+vsBpwjkLmJP+vsizX6/X8hQls0+t+P
         E5mtUa+uqKpRxbxyvHgGVRZUBHRZ2Iuq1QQtOtI1mR+9sekZGzQ0P9WdXQr94n0j3S/4
         4j0g==
X-Gm-Message-State: AOJu0YxHg/uToKWqyvYKnEBwmgk/J+lmxToCUHHRrXEVn/ZqRmUJQ2JM
	MqFw2wBamS0vZI6Ig2mfmobRDs2Htr7eOK3PREqQTafm+eqdIxeootuYHxqXPS4=
X-Google-Smtp-Source: 
 AGHT+IEQzLbhD+YKInHXk9DGDwmHvSeNxQb2A7kdlkwqPHQz4iFJ9kjd/DWCpqFl/DPRheEcMOOZBQ==
X-Received: by 2002:a4a:da05:0:b0:599:c127:a5b with SMTP id
 e5-20020a4ada05000000b00599c1270a5bmr1010116oou.2.1706196675383;
        Thu, 25 Jan 2024 07:31:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a4ad34e000000b00599f1741917sm63973oos.43.2024.01.25.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:31:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets
 on SM8350+
Date: Thu, 25 Jan 2024 16:31:08 +0100
Message-Id: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MLNCTZVYB6SBTZRTTU6COQ4YSTFQJTWL
X-Message-ID-Hash: MLNCTZVYB6SBTZRTTU6COQ4YSTFQJTWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLNCTZVYB6SBTZRTTU6COQ4YSTFQJTWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changelog in individual patches.

v1:
https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  ASoC: codecs: tx-macro: split widgets per different LPASS versions
  ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+

 sound/soc/codecs/lpass-macro-common.h |   7 +
 sound/soc/codecs/lpass-tx-macro.c     | 666 +++++++++++++++++++-------
 2 files changed, 501 insertions(+), 172 deletions(-)

-- 
2.34.1

