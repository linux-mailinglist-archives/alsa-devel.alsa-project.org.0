Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088A9E52B3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2024 11:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E1710BE;
	Thu,  5 Dec 2024 11:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E1710BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733395440;
	bh=lBjSO4XZQcFnEk/bAzX1s58M9esiJswkbspXoeJzI6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZSvRRycoPwADkHmpxm1gYWKoBtqs+RMRqtMHte5+5RxVnejWCs8qbm2bYS4zbk6CG
	 bpfp7uKXFCTNLc+iusRdwFsjFAypNfBNAQg0WUaNFgkwDcHJ0VEANcEb2VM5/R6Bg0
	 qxfJaypqDMZtsn8PV+v92HtTt0s+Y2ieuwye/TOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A539BF805BE; Thu,  5 Dec 2024 11:43:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BADF80533;
	Thu,  5 Dec 2024 11:43:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF25CF8047C; Thu,  5 Dec 2024 11:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19DBCF8032D
	for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2024 11:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DBCF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HYjO4oIR
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385db79aafbso27264f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Dec 2024 02:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733395330; x=1734000130;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=HYjO4oIRTLousnxWsFC9ZY7uKFvlSzVHBJkZI5oc4UH3eo3AtnfYKfIz7546Drf1vn
         xLBN/j2Imi+78U02Ad7wKP6LZeJHqCo6hTYvG/zPGf6xG9Q/cWXA0/sSHCxQOSKCzaKZ
         jAq5XRalOeEGU9onfiiNpkpgCH0f+ACq92pM79pnqw2Qzhsbx5gtq1evUkEOe+74HZQQ
         Snga6j/AHuBx2NNPCCfZrIuR6QrNbcSLzR4/vR62X3sTAuV77KTJautfR8fPMmcGxcSj
         2reewnMlURz3h/woeh7qUCJN1O90yBUNIIWg2yrYFCLbRH/huVP3v/L7yjEKFe7Bgh/8
         OZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395330; x=1734000130;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=LgTO+OX1rE4kMihMw83rrg1r/iLAMrEr5luRCPSBERWQpZU5uL3aW+M7FrNkpFA4yO
         ja/RqF1InUdsvJwqF3cy6vcTRBGrFuUCWAo12Wxia9dMNJBpUKg32q+MOczcKmxzLPsh
         rMQGJTgKzmUKpS/GdeKtBgIJuaAGtmbPSxurtIvnQbBApkHBU+tq8gNmev0h6wUE4j6W
         xQukLmqfOJkdzy53EUPOGzHkNq65Vq5yMQNEjDws6dwWprFe+LsUwYZ1JpUeTcEHAa1S
         jjyG5OIvCKTjeLQ9XfUbbRZBGoS2VFv+X0aDuiAnpF8RoVMDejI0rlrdQ8ukDD2q2Gqz
         TLMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVtonD0xRoBI5jx3yKIOL3LnlpRQehmQbEzGZvFJES5Ul/Y835iS1kBFzdEfc5uP/4xRW4mzExIf2b@alsa-project.org
X-Gm-Message-State: AOJu0YxOLd6BFPMNqChjYMSxBBnpIrJDbz4HuufBBCYjm11kYd9kAKtr
	YqDizay636HjfZHv/zG129VfEW6BHrVPurzIky6BhuFbr223wKinTlocMJVtsS0=
X-Gm-Gg: ASbGncsdqKAUn3Eb5/stKEss0ETLhmLC4UnuaxW/Ha1/X843c5AXEu6HgfJqBHesvnZ
	MJBs5LLluk9cnx7roMWMggnQVm7VGp+Q4Ga5I4MSdILrSVFHD12eZJWwtqovcGHe+VrPaSt5fzB
	Ls5gDf0gSSmcX0S96Pdap4Jfs4rbPbjRJQjLGsbB7M0qkvDWrBat18c85yyIlwFvvXWN1hhWQyJ
	7HammSHTubFyRN6iFGRwaj3XUftcXfgDd15Ixyl/wvYDRAeiJEChnJa3uf3vutlpg==
X-Google-Smtp-Source: 
 AGHT+IGz3GjcyfBhQ5HlqLVmhmG7Qtmhnbj9BaPJEz/QzVaC6xVbnrbhQALk4UuX4nKmsjVBEJ+aKg==
X-Received: by 2002:a5d:6d82:0:b0:385:e8e7:d0ac with SMTP id
 ffacd0b85a97d-385fde34d9bmr2947632f8f.13.1733395329824;
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf406csm1662701f8f.3.2024.12.05.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <173339532775.70936.4554643874403091214.b4-ty@linaro.org>
Date: Thu, 05 Dec 2024 11:42:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Message-ID-Hash: OL23KBA73MWV7VJ6LBBAZ5AEOGNZ2EHC
X-Message-ID-Hash: OL23KBA73MWV7VJ6LBBAZ5AEOGNZ2EHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL23KBA73MWV7VJ6LBBAZ5AEOGNZ2EHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/62f95d8a4920706e94759a8f5e34677528530cf1
[08/11] arm64: dts: uniphier: Switch to hp-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/751df73d825b3f7e6cad42ed333c28096635784d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

