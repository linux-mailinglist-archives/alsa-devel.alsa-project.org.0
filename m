Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBE86741B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949DC85D;
	Mon, 26 Feb 2024 13:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949DC85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708948820;
	bh=1boF7Vn0lILkXSfRRTQEenr6/RP11nxQXsy3laGqUPs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tr1mcKxU+3/BA9vBXFomNbLcPEQ1GxX6+8ao+zmmhj6q/k5T0ZvSG7clwBdww+6rH
	 dW91Ykbv64YLgWLy3j1b/02p5l9S5Xj+Yn5WY8ZAY5WDyMcka7azM7xxrSmZEEhkQ2
	 cx3sEQuzMsmkgb9VZBUDEtTwElGTS8b7Sjv9s6h0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EA97F805A8; Mon, 26 Feb 2024 12:59:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6BEF805A8;
	Mon, 26 Feb 2024 12:59:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55B53F80254; Mon, 26 Feb 2024 12:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 826C0F800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 12:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826C0F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y//t1g3H
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a43037e40dcso200133466b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Feb 2024 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708948769; x=1709553569;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KSPDZCe1P34jJFcbH5CL7iIOfc7j2jHBH+bIt8aphM=;
        b=y//t1g3HxNqqG6RpL2PXAs3a+WUgpAsW1pmxe3piiWCljwi+p7cQAfUVpU0BeWJJIP
         hN03wqcOIdEOZRIdJMRetNPLGmVcZ7rrHXs3lFRks9BvHbpeWQ3WwlGThnrDyJ7/kWfa
         NZ5BnjKwUQIzFven9M2jtsLHwhp9hv98ZDTOs40vHJE1u9ENNy9Iq2bzkK48G8Cin/uM
         WR9MWprl/pHmxKm02uO01AnlJ2vooUph1Em8KrmXYmCfvBSlP00RaK4w69kXNKr0z38d
         zbJ0a4/GdHxYl7ozZ+hQf/lZSvhLv/pgCyanHV/LqIBDiGAIFDtg/O/kbpXITE0wk+KD
         WGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948769; x=1709553569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KSPDZCe1P34jJFcbH5CL7iIOfc7j2jHBH+bIt8aphM=;
        b=Utmzg4zK5m9NTwmEThJE7H7TUGB8vAtPeYeO3h9UcvKlJ3oO38E/DOuBvY+c1dup5U
         EBoPlJzMNCAramQC2h/ajkxG3WztRwPIpHEqfxKxwpKjZi/71JaXnY+rz7DZE0/sqWM2
         UYysxbMOz/4/JFdD5tdfJ6yROS4expmxy/xZMiezh/lN+HahZpCATdi77yAAeNQ+BMr3
         N7eF32wfkJkzhCFJG5aUOYF5uBk+lqXiR2ra9ViA93/BeALP16kNUtzgNySvaaRf7+T2
         W98GWKclTFYBcIqfnR3/c8plouDT1ENf5m14Gx/EOx5Nvk24Mi9l5UBuKqTkEAQWZYHA
         XtBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvf1Q7/SRyX7VKOVgwZzY5socXyc0BFxfcGaRy39/aRv9AWNBfvt9MZ4p+U0uGXyvPvoGLNU1Ws7uWjjU9mBhj2x19FBken4+Nz9o=
X-Gm-Message-State: AOJu0YxB9FsHtH6lI88zQpbtr6sYKigl3jDpMCzrAECpKzF90fL0Lyo+
	w70IjtnUf2gqo7Y3nxAAG6p2HGo/AMTlMcudxlivVXGeLW8cjNS4zQmiGYrYcDE=
X-Google-Smtp-Source: 
 AGHT+IFelND3oLFeUPIHV8ueOBEgfQjbSnO9XqLBf3TC4C9FNh0p6bg9Pg6LmuPeWh2Pp5yHNlg1lg==
X-Received: by 2002:a17:906:b189:b0:a3f:268:a8f8 with SMTP id
 w9-20020a170906b18900b00a3f0268a8f8mr4417682ejy.71.1708948769463;
        Mon, 26 Feb 2024 03:59:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 tb16-20020a1709078b9000b00a42ea030a6esm2311877ejc.82.2024.02.26.03.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:59:28 -0800 (PST)
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
Subject: [PATCH v4 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets
 on SM8350+
Date: Mon, 26 Feb 2024 12:59:23 +0100
Message-Id: <20240226115925.53953-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V7F6PLFIEUGQIPMFCRSGB3QJUYIZOGMY
X-Message-ID-Hash: V7F6PLFIEUGQIPMFCRSGB3QJUYIZOGMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7F6PLFIEUGQIPMFCRSGB3QJUYIZOGMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changelog in individual patches.

v2:
https://lore.kernel.org/alsa-devel/20240125153110.410295-1-krzysztof.kozlowski@linaro.org/

v1:
https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  ASoC: codecs: tx-macro: split widgets per different LPASS versions
  ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+

 sound/soc/codecs/lpass-macro-common.h |   7 +
 sound/soc/codecs/lpass-tx-macro.c     | 679 +++++++++++++++++++-------
 2 files changed, 514 insertions(+), 172 deletions(-)

-- 
2.34.1

