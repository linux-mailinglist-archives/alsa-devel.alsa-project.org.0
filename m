Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FA892BEC9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9149E1930;
	Tue,  9 Jul 2024 17:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9149E1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540305;
	bh=dwpTb/6xnICUSoz81QCz1WdqOCgJoRgxLrJ83df9Lxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a+fnEF8VBBhRhY3Q+rLqQBpMsn5FgmaFGTOhH2aFpruEUMfs84rR/wbjPcgNzN+jS
	 CPTgiqPs6sswVsqzcNxpYIMXeFpcj9cJb5BjPdKHNR9N2WU4oUDTrVk97mLceFkT9z
	 kPtsw8Y3u3wCotCAnjWgbgm04khQp+jpzGuek9wY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17863F80714; Tue,  9 Jul 2024 17:48:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A62EF80621;
	Tue,  9 Jul 2024 17:48:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1861F8014C; Wed,  3 Jul 2024 18:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 051AAF8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051AAF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IMBzGAcw
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso3679420a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023679; x=1720628479;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq6E8xpaYTkE4/TuNFv9VlzGhvZEyhhsiWZ97b1YfgU=;
        b=IMBzGAcw5jw1Ag/1bvjNPWDDCAoddWm//y+2lTkB6N9q2o3z+gtfIgHifESltAO2yj
         NvLrQJbFgWJQobDuxYVq0txEn4cBkDDbAq/ul17GA/mK0duZrfIoDywiDHXWy4HJ5Z09
         qTSz0cyH8AsAB/otcERTu7t8ZRxIS2bjv9buhYHAvFM4RDzr4/FbeiuZybFpC5KQmTNF
         BZpJvHUTuk9x6hAAyK45XLg2vo/TH+6tzGL0Jt3kxFY+2EraRA3ajUDSO8XOehTp7KZ+
         fZTNkigZQkpSPWJuKilUpUARTLlN8qV4TOE9ewz5RAbCJaplWndZ5Ub4MmmfSjWZ1/Vl
         lTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023679; x=1720628479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq6E8xpaYTkE4/TuNFv9VlzGhvZEyhhsiWZ97b1YfgU=;
        b=BMn169kNRX1xflWAHSAfJaNpbMpiR5fRMLJF8PurTguGDgFHoe2dbWnT4T4ysh88T/
         QN1MxKpAgs02mbsgKKyA4j0pKbr7ctxRHrNfWEoK39/hsPudUwvAKW9Dp+INjNgMAhl9
         VA92Rid0jifzni49ivdsdQOHUxUMVU+YNG7hDIQwxTusurpv1t/Cu2l3m/U8+a2ROA5Q
         NpEmBVEvt6alEJ1SzQjuCaBeYHHHsl15sfqEBJYkxUtsjKV7MfHYE0kWHzT3ArYMNna1
         IsWo/eEk81fE9KHJgTLzeIyrX2jzdfXTRWqamIq+X8P9RXF6tXf29/rUbURU17gxSS0n
         yCOQ==
X-Gm-Message-State: AOJu0YwDOBb7bFT59ASBA1yPZHNwYj5Y8NHLh7sV640h+NknRXgYFJVi
	jmNf/fJ/15YdPBq9UHfGaP1DH/xZ/K7X7qF14FAF1sU2P0vmfhCR
X-Google-Smtp-Source: 
 AGHT+IEhABzL0PnBsf3kobt1kk0fkrkOzufUwSfbL0Wy674+CeiIFiE0YQvVeoMPunCrTx62/Z6g9A==
X-Received: by 2002:a17:907:972a:b0:a6f:586b:6c2 with SMTP id
 a640c23a62f3a-a75144baebemr984884966b.60.1720023679084;
        Wed, 03 Jul 2024 09:21:19 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:01 +0200
Subject: [PATCH 5/9] ASoC: jz4760: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-5-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=734;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=dwpTb/6xnICUSoz81QCz1WdqOCgJoRgxLrJ83df9Lxg=;
 b=6omJZQ/QIiaamzE/XAx0iMjAim8gjACwbg3+nN5KqEsCorvwhF6l8ybP4kXi7ZSYtmcyfxb3e
 NdNwavD+rCkBD1InWSt+j+HJ8vYOgJRtmyPT4X64Xlbh4AMXmizH0Zn
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J5FAEZJMN6NCERGEFB57QW3EVQX2ARWX
X-Message-ID-Hash: J5FAEZJMN6NCERGEFB57QW3EVQX2ARWX
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5FAEZJMN6NCERGEFB57QW3EVQX2ARWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`jz4760_codec_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/jz4760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index 9df58e23d360..6217e611259f 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -821,7 +821,7 @@ static const u8 jz4760_codec_reg_defaults[] = {
 	0x1F, 0x00, 0x00, 0x00
 };
 
-static struct regmap_config jz4760_codec_regmap_config = {
+static const struct regmap_config jz4760_codec_regmap_config = {
 	.reg_bits = 7,
 	.val_bits = 8,
 

-- 
2.40.1

