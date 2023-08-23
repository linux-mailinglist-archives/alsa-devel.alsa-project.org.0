Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E878621A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 23:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92AFC845;
	Wed, 23 Aug 2023 23:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92AFC845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692825476;
	bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pKUM45T3Gaojvkd8IgApd4uzDqrow6KFe8OSbNMb3BxDZ4WhcegzaP6fxdjubZGay
	 bW0xPXMbFr8QWqgIukbsJFvtFGEKURfhxZ76EIHPfMVYPUHtcKs2ivnkhbOX4tTfTE
	 GMzL0+jGMIoWWEpjCESzzOHj0UqZ9pYXIW8Nn6X8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2DBEF804DA; Wed, 23 Aug 2023 23:16:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88073F800F5;
	Wed, 23 Aug 2023 23:16:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE677F80158; Wed, 23 Aug 2023 23:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E5BBF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 23:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E5BBF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZDmv2BjJ
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d650a22abd7so5996348276.3
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=ZDmv2BjJU3fBSftYGcNM3tb+ILU/d9+cLODcLN7bJx5jE0GqvFKrPnlSYGlL0k9kWu
         m0bch7za38IJ+CLWsWjflpljG/O8F9HEsNE/VWjVNStBDOBq3iJDnH2eTLO/dJEAtALA
         zbXY+4ZWcbcUYtwqB7UctSATyz1sDYmgfZ/uZj88iB4dhaAHsNB4lm1XJShf+lSlTUF4
         q1mw8cBg/PsTLqlxfYRQ9OdT1JyBSqfrgsLuehUHu9V36ypWdR+RMX9JIQmW7yxqcnfx
         Bu1+6uVlgAFqvayOjaJa8cEpXa7Hm+cDiofeMeKPmewLASFqzTHTuUzB1cC9zTcv8uzK
         +bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=Seuduzi/gF2t+8BBpjwAMmj7K/2M21fTDiVvyhAK5uo2LdCBl+Zyu4gr3XknF49ssO
         w7d0VIKPuW0sw9OqCRnRQ7HMh9rcbnzjV5Rg3kewdNiRSZF+M3+zmb1EFNY11tG9fS0q
         Rrkbwlb1RW3+BKmptL6GYcrX+YxJ2Z1Xm5ex8LNIOR7f3RAzydr1qd/9OLHCIdZloMZF
         rYdiug7UPXklGiani6vKOlm8fXxyOfghau/QNFRSdHbEz0pUvSEGQiKbQzOxiZYwo7Tt
         sBlGOZpQdeZkAzgz4/eR9dPERRDAir0ygjFOsbwJg+RoFICJTKNxFhJwx5F/0ZdZBZoJ
         0rsQ==
X-Gm-Message-State: AOJu0Yw+CQr9whVC3WlIlNS2Z0OIGJDpiIlaYKyUCBjsKjYZiLqfpLZ5
	Wbj0DpuRcg3H1Qe+k94wyQXbWVc/0buvuKNgUshAAA==
X-Google-Smtp-Source: 
 AGHT+IGU5hlAbzjKR6dHf8nG7wjH+gLTIhLdkOAR0BQZYCAzmvxO+0vsobrLpwu8+6G8uJRZXAov+P50unjaO9+ZE7g=
X-Received: by 2002:a25:c08f:0:b0:d09:f39b:cecf with SMTP id
 c137-20020a25c08f000000b00d09f39bcecfmr12862557ybf.9.1692825393910; Wed, 23
 Aug 2023 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Aug 2023 23:16:22 +0200
Message-ID: 
 <CACRpkdbuB-NotnMXc9vZj-byjk7spCSkZ+Dx=R_eOqoSV5CdTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BEIC3ZPNDPCXYP6SS4BOO7B64AGW7O6G
X-Message-ID-Hash: BEIC3ZPNDPCXYP6SS4BOO7B64AGW7O6G
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEIC3ZPNDPCXYP6SS4BOO7B64AGW7O6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 8:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
