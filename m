Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A49FDE79
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 11:10:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A861B6050E;
	Sun, 29 Dec 2024 11:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A861B6050E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735467054;
	bh=1Zq6Q1SJzniluQ1Awzyy2RAk7VBFMN49Y8wa5KK6rr8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YDykNesuGmhv63/tuQ8uAbtqLNdRGQlu252DQHzOduWzc7ZQtmC4qoGHOtwHUeaNY
	 pJKGZ5AqR1ek6oYK7sMvuVkDakpqZyxd4Ix1Fte4Wwb7NN3wOymLPlGfDBMEKg0MEN
	 111Ck5C65TQ5CdIgkh7VXvSmDbphykavwcjkFhBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39079F805C1; Sun, 29 Dec 2024 11:10:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C2FF805B0;
	Sun, 29 Dec 2024 11:10:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A6FF80246; Sun, 29 Dec 2024 11:10:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49453F8001D
	for <alsa-devel@alsa-project.org>; Sun, 29 Dec 2024 11:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49453F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uza+rlNf
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436381876e2so12046135e9.1
        for <alsa-devel@alsa-project.org>;
 Sun, 29 Dec 2024 02:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467010; x=1736071810;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSpF+CuRXyTaTI6CZu8ly254OOzIlOn2pYHOVoIJa0M=;
        b=uza+rlNfmbFxWjnqYDy/sjs2CE8pHPUFrBwGGlV8Ybp3hkkfAyzRSW/TAV/kSNKXni
         gopqKdSjqK1OTykENyegAwUu6n8o12GHn/FWPKDCJOrhc5T19UivPUOrUNdRKj2Vkx/C
         iqb4FnMHDqDyo+JyzAvQtPLZL7vfPC3eA/irgs3j0Sanab5q7wR1axL4aIeWxthK0+RO
         60cnOU9jYVh0i5UAPoBg7liQjTQkSoxMhYf4pbfADFF3JQERYnndcNy8k2JaFAJQzdag
         y+Q16K+XoR76nyfpswZxsvLW9nlzcEdkBTcS1xtX5azAFL4+KLAtO80XRDjpAaOE9gYz
         V9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467010; x=1736071810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSpF+CuRXyTaTI6CZu8ly254OOzIlOn2pYHOVoIJa0M=;
        b=Kzqp4JumBh1YU0mSFJF3ZLJ79FTV6igcnTUoEjORwndRDWvj6pnM4wblmw//vsWUMg
         Xyptbh2jw0m2jQ1/UwASdqkKw7rx2p/OKaym0d/CSD20U1c6m5ZAfvQY/k7lnbcJQUoJ
         D9DKJnxXMl2wCDgz9K7qL+UkYnalxCVrKDZXYDd6ry1jZFXyE/p8ciJ1fbO+V94MFOY9
         YZXi9fHb/2iuXb1RVrbAQcmhPKVSoLH3jTyeq9vPwr6lSvcXMWXdvwUN6GGzvhs6gkp9
         pfsZIy3mqtdh/o9ckwnVyoLnq4EexleN2O7qxzerOCRhTMtINavwn2WyfUMU7fqAeMRA
         yPUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31UpZRJUpJK0jaqnhxq7p7ZkvulGDFBx40eG6IpxoxDAJig06NmT4lS+6n5Z0G3/9VGlRbaNvgzYF@alsa-project.org
X-Gm-Message-State: AOJu0Yy45Bojsmnu471YYVRbWRamgwMkWTZFBVmHIhwSPemr11lhdZHp
	zVhFKenNKJghNuvNwSGuqor/jVdM9qc5izoFsYSIKLdoZ/fcLKsMYJYMQBBYi0E=
X-Gm-Gg: ASbGnctR041X3PRAa3fvjEAQqSugpTF1jQBChmD7V/X6redj204aEwZ0sEF7xpmNFYZ
	umy6e92A6zYkv+4JBZf9iajwxua5uMiyrp/kLWzvMtq+yPjc1nMm9v4UC3A3tvOYcV7He0VMQyi
	vaW8EyZcEjP/jKgaeK5qpCSQHj9pgLKS/ebmRjiS6sE5da6lc7wwB9uKvlQC3vRnjeHNQqfRuro
	eimziAsgKi/Za3e6c2vtQl8rGawqHdlxO0GXcGiOP6i/kZnnJlgCF6AMX/4ncL4cbZuf4C6
X-Google-Smtp-Source: 
 AGHT+IGW0d/YHpnyePRkpp9wXq4qyqr1+YfE7APJGg58iLxynoeEjadgGXZSm4ML0xt0Ba0edpBXNw==
X-Received: by 2002:a05:600c:3481:b0:434:a30b:5433 with SMTP id
 5b1f17b1804b1-43668b601eemr102007365e9.5.1735467010008;
        Sun, 29 Dec 2024 02:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea40csm320505375e9.1.2024.12.29.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Artur Weber <aweber.kernel@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
Subject: Re: (subset) [PATCH v4 0/9] ASoC: samsung: midas-audio: Add
 GPIO-based headset jack detection
Message-Id: <173546700767.10606.15963860254937329872.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:10:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Message-ID-Hash: TXVDH7A7SD4PGC2DRONXJCAKWU6MUMKJ
X-Message-ID-Hash: TXVDH7A7SD4PGC2DRONXJCAKWU6MUMKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXVDH7A7SD4PGC2DRONXJCAKWU6MUMKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sat, 25 May 2024 15:28:04 +0200, Artur Weber wrote:
> Many of Samsung's Exynos 4 devices share the same midas-audio driver
> to handle the codec setup. While most of these devices, including the
> Midas itself, use the jack detection provided by the WM8994 driver,
> other devices such as the Samsung Galaxy Tab 3 8.0 (lt01) use two GPIOs
> and an ADC channel to determine jack insertion, the jack's type, and
> button presses (for headsets with volume up/down/play buttons).
> 
> [...]

Applied, thanks!

[7/9] ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      https://git.kernel.org/krzk/linux/c/2c3c373555460b79a6a201c87230d32b211f8323
[8/9] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      https://git.kernel.org/krzk/linux/c/d15cc681ba79fdc722d4aa7a83e572850cf5f64a
[9/9] ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      https://git.kernel.org/krzk/linux/c/acd33b48ce663c7e293b11cd77df7ea702ca34f6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

