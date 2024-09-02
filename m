Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50226968D00
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 19:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156CD1FE;
	Mon,  2 Sep 2024 19:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156CD1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725299635;
	bh=MnDoeT7vCt952wLfteYkGvY6GHFHpBb0+PURR7QujnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PogxR6DVT7kH80QbD9wsNksEQU7SmcZpPc2n2FEl+QOaGHe2HDUPi+FukwlGpjj/l
	 HXVVJJwIdQPLycYsPO0oVQcbpJWbHW50Z11zXFYEpoC68ciEVDCshWV+27Vj7OXqDm
	 /Hjnem2H4g4z6YzyFT9VyAGSBd4XvHdYeUzE9NLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC06AF8025E; Mon,  2 Sep 2024 19:53:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 471F8F805B2;
	Mon,  2 Sep 2024 19:53:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6672CF80217; Mon,  2 Sep 2024 19:53:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1A29F80153
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 19:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A29F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ecjkGmO4
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-533de5a88f8so4632186e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Sep 2024 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725299596; x=1725904396;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTtz4aJ6WOg0pDCld3WKbgJIlmwIlok5mPiJNkSVlqI=;
        b=ecjkGmO4SCfQDB3f7i9YMDPSWwZH5NFKwYbKTaak/bMp9uVDgw3nKRJtUWVNZORgyk
         Y32acIYWG8NnAuMqQO5gABJH5sSctlGOjeaqy4zeiu8KJwXCruapjBqBlnZ83kY/PELz
         0+2wwobUhje3h630K8vDJVdMLYQUrMbMiIz67+wZIqkt93hHRgCsx55iIpJXZt4UlERx
         ornQDjKZF3Iw/fUFrme/5FhTVrwAtoQLll3vp3r7ZfvTxjjKD4K+W/htEC4yIMdMcSyD
         nsG4w2p75Uebh9XplGyT0638X6ea59fBoYfHmMNvHI1UJxqwecYA4ztNA4BpR6y0ekt/
         992g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725299596; x=1725904396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTtz4aJ6WOg0pDCld3WKbgJIlmwIlok5mPiJNkSVlqI=;
        b=iSqiIazcsTpR4po7V0IbERiqyiv/FuguuwM4qbi0FC15LWCgF10ZLa75u6XUP/MeGt
         UI05H0QExv99nwyQ/5U7pI6JlYqHvzcaicB0whmBIoWnBhILPUTdzqOk5Q5v39UqASHu
         lA+VF9tMlRM8DaxlTtr8YXaVLZMLGo84pabMwNWaLqTKe6GwORpKcEjh0nXiSlJ5YMy2
         yaC6YVqwqSUc6HeYhMwQgtEFbK0NW5DoyeKXXy1FDBmhHCTv0KOhxi7jw5s1ZC0yg2+c
         8BKXOZKBiMFQrb6Bi5cWn579ntejLMewPWLBnZMKVE1fOuj/+7GmAfG21cRCt9Wpx9II
         vdOA==
X-Gm-Message-State: AOJu0YxHJM3O145rTE/tGYw8nJ8Uds/KVZqX7Q8AT38Cc+iVD7PrV8U4
	ykA7FxaUPyyAsix7DlQZjXZp5Mi2/y8l+3x/sgBs9fGmzZjrBIv4bYpXhTi+mv+u659D7MLIb34
	G
X-Google-Smtp-Source: 
 AGHT+IEW/pesy5OKJ0IGSRRTNmo3lQ2HG8HktgHM07V8Q3+5V8e1ooBtP7Edf8e8UGZ5iZ6agRXHgQ==
X-Received: by 2002:adf:f4cb:0:b0:374:c03e:22d4 with SMTP id
 ffacd0b85a97d-374c03e253cmr3159185f8f.1.1725266070437;
        Mon, 02 Sep 2024 01:34:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374bfbfc7b7sm5807456f8f.88.2024.09.02.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 01:34:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
References: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: dt-bindings:
 amlogic-sound-cards: document clocks property
Message-Id: <172526606951.2176850.4026983419764013991.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 10:34:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
Message-ID-Hash: TW3UODJVQSE7G6ZBT63XSADBAOXMFWH2
X-Message-ID-Hash: TW3UODJVQSE7G6ZBT63XSADBAOXMFWH2
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TW3UODJVQSE7G6ZBT63XSADBAOXMFWH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 28 Aug 2024 15:53:53 +0200, Neil Armstrong wrote:
> Following an off-list discution with Jerome about fixing the following
> DTBs check errors:
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>     sound: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[3/3] arm64: dts: amlogic: add clock and clock-names to sound cards
      https://git.kernel.org/amlogic/c/9b5d25117985e51faf61a808c4b3e15432d55f85

These changes has been applied on the intermediate git tree [1].

The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

