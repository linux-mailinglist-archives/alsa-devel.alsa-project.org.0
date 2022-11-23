Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1263944D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6099B1788;
	Sat, 26 Nov 2022 09:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6099B1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449896;
	bh=by278e5QnqTm4MRKblTyR0onvyU/qLoKFrhL/Ygvztk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+OjAJn/1z8Cj62LWqV3Wm9Q6QXk2OZC2kF1huYiOgKTzX0mNwtj+3/1lXz8tfxOK
	 N2Tr780fbLDEaiqZ3ieb3lfh1D2obVB2TAONhKiIdBANkE+latfABmAzPTNgzJo/jv
	 edG/T95wmGX2sZ7E5ANsHJSeFqdTiHNsFRb4Nxpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0F8F805DF;
	Sat, 26 Nov 2022 08:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07D86F80272; Wed, 23 Nov 2022 02:35:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53656F80154
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 02:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53656F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HP7scXWG"
Received: by mail-pl1-x62d.google.com with SMTP id d20so15304494plr.10
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 17:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aMXbvTa4szYt2+pP730kENx9BC6mONDNIAJzOhCO5eY=;
 b=HP7scXWGWUuUAQpBHAbYGT9Ro4FSzBvlteLDZXmRtKIZTW83yQz3QCmZa2e1V2+0x2
 Pw8YRUKvoQ4DiaSm/YAu6wmnyNScBLJZbD3KIrABeA6kImnOgusYWOUmR/kcS0XT8B9P
 1cL+hQNaxyuve1DQLJxDEdiV3tM0KQavM9pnRQl5dkjJUDRmOiJmgk/Snwqtq9fbneJ6
 501XaE1hYWbuRd4jlIvX1PvZl9pGuG5KgjbXC0nzOtGgAQfzAquf1FCtOSuDF4D8vTiR
 HsFLOv794pyzG5OBIwR2N/Q8Yj34VkSutSr3XEu/KkJ6LoDgNdzwSB8kRI/bCqRFYG1b
 9wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMXbvTa4szYt2+pP730kENx9BC6mONDNIAJzOhCO5eY=;
 b=mAPSxuSOH0E2Vdjfw+pLUfhZTUK5prcH+FmYtC+YV95EN9eUzbaNfUegpZkSbk5O+Y
 9wfToyQOIk5nDlnqLADaBtKaWXBt7Md4beY7JQ0tL3lxR6liiMiL4qHPVx/TluM4cfAv
 Oj061mUuPjipBUNeAkLYQGmAsVpHq2nRS0MNcxlb6kMl7OLSyA1W+FwT3+xdNBiLB4yA
 hiUZIC967bB/MZNyb8MggXz5iuofMK4fmTJM2wEeGQ2quQcWsCQpJR4GHR3z8jOtdYy3
 REsFwIvetynEkrA60NihVcP336epJmhRMOtvyHRAaJfEocGH340pvPd1yIRx63ArzILN
 F9jQ==
X-Gm-Message-State: ANoB5pnE9u7Zi+hd1CoZah66Rac8IOCl0r1pelMprh8oRlNyxFbpoV8K
 Z9GLphb9KyS4/yWFjHmx6u0=
X-Google-Smtp-Source: AA0mqf6x4fc4IKvIExC1o1e46QIsOPFQfVNfDh9OQF6vDoU8m9LQB2uyX84qmPAg+ZnqxdiG9ViVXg==
X-Received: by 2002:a17:902:f391:b0:186:ac81:2aa9 with SMTP id
 f17-20020a170902f39100b00186ac812aa9mr6832869ple.95.1669167334579; 
 Tue, 22 Nov 2022 17:35:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a17090abf8700b00218e5959bfbsm52591pjs.20.2022.11.22.17.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 17:35:33 -0800 (PST)
Date: Tue, 22 Nov 2022 17:35:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: drop redundant part of title (end,
 part three)
Message-ID: <Y3144aAtCaejFDAC@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
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
 Rob Herring <robh+dt@kernel.org>, virtualization@lists.linux-foundation.org,
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

On Mon, Nov 21, 2022 at 12:06:12PM +0100, Krzysztof Kozlowski wrote:
>  .../bindings/input/touchscreen/cypress,cy8ctma140.yaml          | 2 +-
>  .../bindings/input/touchscreen/cypress,cy8ctma340.yaml          | 2 +-
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml       | 2 +-
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 +-
>  .../devicetree/bindings/input/touchscreen/himax,hx83112b.yaml   | 2 +-
>  .../devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml     | 2 +-
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml  | 2 +-
>  .../devicetree/bindings/input/touchscreen/melfas,mms114.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/mstar,msg2638.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 +-
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml      | 2 +-
>  .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml    | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
