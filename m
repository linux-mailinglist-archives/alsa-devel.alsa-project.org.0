Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4663944C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5537F17DE;
	Sat, 26 Nov 2022 09:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5537F17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449880;
	bh=I2Ys/08a0y9CoKhS2AundtnjSr8/yi8uXtFIlU/Y9o8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ig3ss55vBk7jlsn4u79HdQA7//8O8GOO/7EuGEZT6v8u7WyP7bMqrKg57XzZuhSrH
	 15fbJe4nNS/lB85GHvG6bEldQtkUhuaLCpzYEdJnv/q9uNpD2OPIbYw47wfPQhI8yT
	 bVR89+ULq/Gysv6q8wQJO0IkWuj1be9gpnRPEYUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15AF2F805D7;
	Sat, 26 Nov 2022 08:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC429F80272; Wed, 23 Nov 2022 02:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6151F80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 02:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6151F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hm7Jpy1q"
Received: by mail-pg1-x532.google.com with SMTP id 136so15572774pga.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 17:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0o+4E907Zvvy6ni+QZQIz8xU1g4Q1COgvbgTOREnlPc=;
 b=hm7Jpy1qREkOXLdAWvAMk4d1oXJ4z39uVk6vVyHKQn0eiACmSjnmVu7+6OjCgem/Nj
 kIC38x4waRshCgVXkata3W3e+zYStDSXXa+t5TCqFTf+YGEaJ0BXaE2iJ5CtShcple2O
 iwGh1BBp3Yhs+WBZuM41+XKvZLKvIQ57B1cHClHhYA/rIet45eATH+Q1t1VffM+nGEC/
 NDtdh2cBSDnIS/UrQQME9RN7DUtHUWpEEKXZ/b0KvJ1Jm7ZGdb8CejVl0zVYrURNmyZV
 oz7vGFvTG3kFnf0zzHDMzJrbdT1rboYq6lrpnWNVWFdZLGnPVJ5ugRoImnF/aGQwpm7m
 jIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0o+4E907Zvvy6ni+QZQIz8xU1g4Q1COgvbgTOREnlPc=;
 b=c22x+0alMiNvp+QZBhVNSzC2VF/ELUkG1g6k/ssQIpUlx50D2fqmYWpKfQEvt+SFla
 VbS+M+gZEozLVycqId3RUO7l53ikWul9NiRmv5/RElLMWNKURMBwK4HOLAyCT1zWSzds
 ksjcSmM6uz73zK/KQIOAOVAFpE2TaKVeB7B0T6nc8KW4JeyxkmFOkTdSEUd7mMPNQ2Hy
 sWHiUOVuyy4jP9Yz2z+R4dNyvtxXD+tBIrJ+8oFw91s2bUadiUnv3r96Z7WpE0AucRRC
 vFYK5F0J9LA6dY0+WOmP1XvZU9i9R8cTI0FyeYb3UZ0E9LHqyGUUimdtf1xaBsR1Mmwy
 pe7g==
X-Gm-Message-State: ANoB5pkMEBHJUrACA0OgbRkntLBczZd3UOgQhNW1iltFXmXSkDXDqIoy
 2BRebYfq2tZGEc1dlpz547c=
X-Google-Smtp-Source: AA0mqf4fIComKK9aDbVNdnJistSL4pHYNFA0hnYz4EKVMEmSoZO0zdR4co1U6hu9d1BpJRYGfXKZAA==
X-Received: by 2002:a63:f00d:0:b0:458:f364:b00e with SMTP id
 k13-20020a63f00d000000b00458f364b00emr7084885pgh.577.1669167254077; 
 Tue, 22 Nov 2022 17:34:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a170902684600b001892af9472esm4174053pln.261.2022.11.22.17.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 17:34:13 -0800 (PST)
Date: Tue, 22 Nov 2022 17:34:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
Message-ID: <Y314kIVvP+p2RIzp@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Jonathan Cameron <jic23@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 21, 2022 at 12:06:10PM +0100, Krzysztof Kozlowski wrote:
>  .../devicetree/bindings/input/pine64,pinephone-keyboard.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/chipone,icn8318.yaml  | 2 +-
>  .../devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml | 2 +-
>  .../devicetree/bindings/input/touchscreen/silead,gsl1680.yaml   | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
