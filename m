Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116584088E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 15:36:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99D79F6;
	Mon, 29 Jan 2024 15:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99D79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706538986;
	bh=qKIghWBg+M0Dh/XZ6bWHGX2p/hwwGIxP2PIhUEg/+OE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QbXyrUh4jVSibZMQuyU85bII7XmC0BzNTHM0OyEyNsh5dPdKjktP051JfjyOjUjPu
	 mJdyj4wFCuthfd3U5N9gVJFx2ADh7fd/K/WXeX7N1O9m68rlfZulbPD+JrX3LKjTZb
	 caOtdiozifC0AsUu0dQsP5aq8Ceo3T6AWsRfcmFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BEDF805A8; Mon, 29 Jan 2024 15:35:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E80F3F805AA;
	Mon, 29 Jan 2024 15:35:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7C0CF80567; Mon, 29 Jan 2024 15:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0727F8055B
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 15:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0727F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cCkIwZB2
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso183966666b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706538938; x=1707143738;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPhPmso2Tukg7NLAn/+WM+BVJTCFnMIZlThVcM5mWHE=;
        b=cCkIwZB23D3uQyy5Ycl2fPTDOXnpIIECzb8ILeOb5IiRJRsal7uco2cejarVTNssQg
         0cTH98ih50qkS+c71EFuGx/Accfu2rlucbwlrn5/Mvk1RJhp8fVnT1mqCl5xUmKtThPM
         tnjn4kcePl3w8dg7lZL8SPxhe+CghnfuBmwLLq/0pOdgcvFVYIvu0gG3+KLz6w9jW5po
         QSd8RPuEfeVIb53eUVFhJu6OMFPoAYjW3siV5cmxnLRalwTo2r5xdEm2KxAY6LbtcOjV
         7u4hGnLPMWs7F+RXoODDENdvJOznqKskcnmwdHLScKMuGxPXyxXufPQWu+QWfovP91Fo
         +kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706538938; x=1707143738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPhPmso2Tukg7NLAn/+WM+BVJTCFnMIZlThVcM5mWHE=;
        b=Vtmmsso7ofFBApDFSBE0zXoma27cKI2T1gF1Dwi8YPXFGWFQVZtvWzdttYgeKtumpV
         YhVF+hMeqh0OJUUaFDe5NJqJT+dCpe+qJ7cRI3uLQEZxHqQJoFeiD8Hi/R76CZwfPawU
         a7eztuusiM6gN0BlA4CFHcqELkXKe3+RPqMhec6CLLay+0TjR/txbrs+iKWGzBQYtGOn
         rmxjncj7AghyUhUFfQi8F6yVsJikAaiyarNt1+pRrcxfqQA3kabFpBbSWEtoZMnYMwqH
         MESEh3c2yfibsvYsJTA4Lc+SirvDNFcYlXF0M2WqiLA2MLoXt+DQY6fLrJ2erQcwcdSE
         xdIQ==
X-Gm-Message-State: AOJu0Yy3oAPDlnJ3rcqjWJDnrhGGxTDyLLsigTlyQYi/oaFgFpJGEfSb
	LQ6qC3tso3OKEqiHS02vHKeuieYPzoQFDcY1ii5m0T7qafQ9v/h1NQMsTARU4eY=
X-Google-Smtp-Source: 
 AGHT+IE/jmjtAp5FGOJs5Sf3U/EU/Onj0B5A6BEfEU+D04XcNvdeq48Brg0CKZMpP1rEhlTanM0D7A==
X-Received: by 2002:a17:906:3c59:b0:a34:9a5e:e15e with SMTP id
 i25-20020a1709063c5900b00a349a5ee15emr5105302ejg.28.1706538937910;
        Mon, 29 Jan 2024 06:35:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 sf5-20020a1709078a8500b00a3543718f5bsm2829269ejc.221.2024.01.29.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 06:35:37 -0800 (PST)
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
Subject: [PATCH v3 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets
 on SM8350+
Date: Mon, 29 Jan 2024 15:35:32 +0100
Message-Id: <20240129143534.109196-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZ5RY5KBOT2DUG3AISXMGVDCCQJPZ6RR
X-Message-ID-Hash: JZ5RY5KBOT2DUG3AISXMGVDCCQJPZ6RR
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
Archived-At: <>
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
 sound/soc/codecs/lpass-tx-macro.c     | 671 +++++++++++++++++++-------
 2 files changed, 506 insertions(+), 172 deletions(-)

-- 
2.34.1

