Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B145803358
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 13:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF67112;
	Mon,  4 Dec 2023 13:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF67112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701694129;
	bh=JxFYr8SCaEU/fylo40wqLpp1UbL6/ukff20ogpJB4sA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SS/LF6a0Whq5ZCS8ZPPZaugGX+UaU1wRzvlYft8bu9D9fP2l/Mvdz+fu7mY/P9JdD
	 s99xoqgEPQgAPMvM0B/hbquRWnW9IvLXIRf+U7/butMeqjz12ekdiuMuEJt/Xtl2Fk
	 sC8XwXKRqdUijbm4joCSHLllONuLQ8BzGFezyJUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A7E4F8025A; Mon,  4 Dec 2023 13:48:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB83EF805B1;
	Mon,  4 Dec 2023 13:48:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58DB1F805A0; Mon,  4 Dec 2023 13:48:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D58E8F8057E
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 13:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58E8F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qYXz9cY6
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54ca339ae7aso1771832a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Dec 2023 04:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694061; x=1702298861;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/S3g4FV/iGDfW3ps7M4rheJELxKDhQrVaKwMBGZuxiY=;
        b=qYXz9cY6n1dPNEJ82ffz8fmC2P5u7rLly5BsiU44u9BHHk4YI2pT85FJqmsYe0vH4w
         /b3NBSX5+usVn3w3CKbAyKYpaj9xCw+k+p65i6qSTo8EFFOJ23Oy57k+gllbUzPe7LPZ
         QGoTEsJRKlzyYtT0LCqBUpTxaLeKEzKLn6V6MwV4S4g+c7ePvMst1SqmgwBqmCT6owm6
         Zz7zF+/m3nFPISftoNONIhCNEZvj7oK58nAD+YpF6i92Dj2dB2v9zobfDWnGr8d7V33y
         PukxvZJn42lOU8pYEotaslxBCdQjMRoaFnPlWNiHeBV6qAzb91vxEAup/4s88MsrLZjj
         oFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694061; x=1702298861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S3g4FV/iGDfW3ps7M4rheJELxKDhQrVaKwMBGZuxiY=;
        b=CUJuapK2ck8IeKi1355Zl5OtUt1Zd/Cv6CXar+erWdrj3oYhHERIhMrW0e4C4ijeAL
         9wkJ0ixYN8VD+MsED0xMMMczGRG2iP/DHNj4EzS7GG0jg1nzd/v0H2FHS5S+mLP67zZB
         XrWPp1iHLX9RihOXi8HzFKaQHkUtsFLRho6qN1X7fk2h2qxlu3CM/3I1+ka/E7pa0h0/
         uVBZAGvVsqS3vlqlbhJbmFIu2Zbuf/Ygdjv2C/hD60kJ1cmQi30nxh/175xjg6KPhNS+
         wSm7NYyapSE4cL2bPncQGby7SEzqrW0a78QbAnGa7bxt+UuGzOXt5HXfOsAO3CbOUS3e
         Fftw==
X-Gm-Message-State: AOJu0YxcUfwIf3YSjkDHwapM6mJH2pAFq6Yt7ImZEwTpTFYc8UF01QKT
	gh2315QmBpOg9sDvi6PObQ/sSA==
X-Google-Smtp-Source: 
 AGHT+IF7lYKcq8TAJsw65A/PZFXqqONqGeNcKTt6yJrGmPFcJBo/4G1hXhQpgMC4aF1Y++2UOozUiA==
X-Received: by 2002:a50:d799:0:b0:54c:4837:a665 with SMTP id
 w25-20020a50d799000000b0054c4837a665mr2965090edi.82.1701694060814;
        Mon, 04 Dec 2023 04:47:40 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:40 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: qcom: Limit Digital gains on speaker
Date: Mon,  4 Dec 2023 12:47:34 +0000
Message-Id: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PNQYQBLADHGEKSS2DIUSIK6UQJEUAQZ6
X-Message-ID-Hash: PNQYQBLADHGEKSS2DIUSIK6UQJEUAQZ6
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNQYQBLADHGEKSS2DIUSIK6UQJEUAQZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Limit the speaker digital gains to 0dB so that the users will not damage them.
Currently there is a limit in UCM, but this does not stop the user form
changing the digital gains from command line. So limit this in driver
which makes the speakers more safer without active speaker protection in
place.

Apart from this there is also a range check fix in snd_soc_limit_volume
to allow setting this limit correctly.

Tested on Lenovo X13s.

Srinivas Kandagatla (2):
  ASoC: ops: add correct range check for limiting volume
  ASoC: qcom: sc8280xp: Limit speaker digital volumes

 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 sound/soc/soc-ops.c       |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.25.1

