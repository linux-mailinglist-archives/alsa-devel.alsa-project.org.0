Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2884738C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 16:42:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE5F1E3;
	Fri,  2 Feb 2024 16:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE5F1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706888567;
	bh=eJrK77JbCOPtMQySye6xFo6DxvsSg0ZFdJ/9vChdHvk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R3D8oWq2RaNBeu2aISiSxqFic6D38jsucWL8d37WIKtbor1E1XlNUvK8MqZOzo7me
	 e1gVeZFJ7h7MulL/WhzgFVYaiUr8t8/HjrdDT+srsuAyBjVjRhJAZMli59R0GZTKeT
	 LXLjCBjkMXkgiV6SiuakZQ6dBCVABVrDbLdmlcHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 906B4F805B2; Fri,  2 Feb 2024 16:41:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA89F805C8;
	Fri,  2 Feb 2024 16:41:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F73F80564; Fri,  2 Feb 2024 16:41:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB9D1F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 16:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9D1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jY0SGIs0
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a349ed467d9so287697866b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Feb 2024 07:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888498; x=1707493298;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9GFyYMnxvYJ3CC02VMRtntZh2qFQxlE6u4r2ee4s6k=;
        b=jY0SGIs0HlhHoT+WpCat4Vs/ZJwLO2+fdL2FU1abe31ubnuzJw02y9Z3nke3ZH1YqX
         JZLEhedIQ/BA3LaZjJM1Lb4QX1mncyG+1T9LyNvO47jwSF8tfqqxk/rLAU/nAl7I0MGm
         xWzjI5O92w9qufyCgntQ4g27xUVBbejPG6kkM6V7Mtfh1jJxDY2ygeaIgsArz3MJuWoT
         7R/X9nNEu5j+3nQ6yfhGWPWOavpGNgkg8f4VwVfEHKiJmQ+s+sTwHnN1V8bxQE+wd1kV
         WO7bUAi2ZqQBs7gQ4d0rHCfeMzkh3FsV7fIQUqPHZRUsdahkBPm7EoOaHqAj8EWdYOhr
         Mh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888498; x=1707493298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9GFyYMnxvYJ3CC02VMRtntZh2qFQxlE6u4r2ee4s6k=;
        b=wF82bL9znD6Rzrc2Z8MXPTyllmEdy8ESq/SgJG+oedtxG09KitZlCfc3tJ5JLgXbL1
         tU+I4xv92xrXQmSBTLkssMXEMGx1G7Om+3bpXa9SBr8nHgZ0ACfVUjh2lyQBWxL/rZ08
         sTkWOrvmaj7cpt9O8czgZezO23KtQUYJupl2KwDBDX+3jnuggQR5OaLo+l0BtxgP+P+b
         KKs4OPBUeaeAYqDU8IN+RkLcvF5a9uUwiuLeJZW7VuPPzRvet5aP6CKQ4UTAm4PL9+Vy
         RemkHufdXkbq2e7R0bR7WCiTOCunrx4vxMdk60puR2bp3GSKjtL6axJBuI6T6VkECRas
         iQpA==
X-Gm-Message-State: AOJu0Yw33dSaTPeorXXG5fbZdaJgxgCUQ455rzXB02PLlXU0z2UZl1eq
	E4i8QosglrjsI9IJcLyxlOptuOttJaKqR+hDr8enXDoJYqtDdnl8O1sExfNx6cg=
X-Google-Smtp-Source: 
 AGHT+IHOVJOP0VpQcVk25AB8u737nThh3XuWqp65dG0kE/mgS+wyNCIL1lVGJyBNR1Jm01ocDs/fKA==
X-Received: by 2002:a17:906:31cd:b0:a37:1f87:33b0 with SMTP id
 f13-20020a17090631cd00b00a371f8733b0mr816000ejf.13.1706888497815;
        Fri, 02 Feb 2024 07:41:37 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU54/Xv9yBYsJVhurd9b8NvezMMQWn48AVlvITIq4IowJg+essYYhY9hiRygevu1tYmpTvN6J5p5w7/cAg7LVWcZCDtugFmyoF1n6UDzO125nyA1CQN1VmSbLO0TVAYD9IM7m8qXMvg3qIei5z50ulwK/3Iz7aeDdzDsLneYjBosPAPSCorxZJVTOSv4ScFS89Bdme1nzsHwH+JLvPpSxkE8+yulMlt6qzMCab0LZofgF2k1Vq0Xx2rQ7t637l1Ni7UOD0BAUNFuvyFOnwcbRBlPe1hucyp/teLwGsWQkgwLe+8+5M4
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ASoC: codecs: qcom: tx-macro: minor cleanups
Date: Fri,  2 Feb 2024 16:41:31 +0100
Message-Id: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IUZMWLEQQQBBDPRYEA62ROHIYQV3575E
X-Message-ID-Hash: IUZMWLEQQQBBDPRYEA62ROHIYQV3575E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUZMWLEQQQBBDPRYEA62ROHIYQV3575E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Few minor cleanups.  The series will conflict with my series:
https://lore.kernel.org/alsa-devel/20240129143534.109196-1-krzysztof.kozlowski@linaro.org/T/#t

Depending what will come in first, I will rebase the other patchset.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  ASoC: codecs: tx-macro: Drop unimplemented DMIC clock divider
  ASoC: codecs: tx-macro: Mark AMIC control registers as volatile
  ASoC: codecs: tx-macro: Simplify setting AMIC control

 sound/soc/codecs/lpass-tx-macro.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.34.1

