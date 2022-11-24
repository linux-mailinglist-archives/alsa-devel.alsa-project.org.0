Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B92EE63943D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5034B17E2;
	Sat, 26 Nov 2022 09:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5034B17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449687;
	bh=soPk7+0knuPzBaEhNRtkIK6MUD3POhg/rBKJrCyVkmA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5UzI+7rcdQd9qGbeqF8+V4YGuVVtTVWHHAYX/2XWspOAbxejwR+Kuc+SX31q5EV7
	 CrAYgYde/Q8kN1RdQ7m/tk9SNhLIGvA/kKEVDF0ym4Q+rJ+8xp12GitoFTA21IwnAM
	 HEdCWBgSdWFcS3c818bkp6kUcdBV+38CW4H+nPU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A70C7F80571;
	Sat, 26 Nov 2022 08:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD134F80431; Thu, 24 Nov 2022 08:16:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B9BF80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 08:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B9BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jN9Iu2JG"
Received: by mail-pg1-x533.google.com with SMTP id f3so889515pgc.2
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 23:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9beI1qbDaBEZGBMzOodYXezAJNnkCn943LXJypsps08=;
 b=jN9Iu2JG6Jbf9f/Vtx6/x8W99mbfvmkmA5JpUTuuOhHuX9hE65G+zwT360z98Yxh2l
 i6PqDF91yJmzwCKNYEVFuLVfqGCqoHx9I7wNV8pa819eMDoiMR27SZF1GHdGnGDHcMWz
 pqI4i03rsZDpQ60ONyvQHuYR+N3femATVqrSC4hLc3ih0MmJpf23tjAqEmigk+Q4lN5p
 TjriD73VK+kqD8Wil5LA1NXQ4waHtGM3IZBFIczk95hCWTGki63dLVXFv0wvyqKSahPp
 nd3iHhwTtHF7fG/CtXcp1E5PNjqsgHvp71L23Lt4pdmYQDMtQS6xnA3gM9hUIGynee9E
 kaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9beI1qbDaBEZGBMzOodYXezAJNnkCn943LXJypsps08=;
 b=W0IKT3DwwZ23DsqfSrRFoLABiDdK87X5pd8o4tXLkEKAsMjo5JdcRYrrMwrEIJWBue
 3sYEbNJlXK1sQVrcxlZuHtaf2CCmOb/9BzZLCC63r5c/arzjJUcSybKGvdPnW0E4EmRF
 YjIdmE9+l/HADbkGp++RzkHq39cX9/u472JKhlcM2a8y8EVmc2t3ZJ0Zx1UlLqt4XTpy
 jHCNxRsIVPlHTgrtmU+m4dfFNGrHtycbakrOTDdE3QNEXD3A65c5soMxd4WlB8+cw38l
 TtGdD4V3OKUlBxPJLCpePJqU4sS0vsZuKTQmnf539QTgKAtLQo8TSS++IfI1XfxtPdBf
 h11A==
X-Gm-Message-State: ANoB5plka7dec0J1INbzw7l4fWoJeGMONt7WCSoaRLfqnVxhBqTEY+HK
 yuPMN/p9olcwJg5B2M1g15SZ+w==
X-Google-Smtp-Source: AA0mqf539xW7yp+XmSaeh7QyKEx/uI4+Px0TRaTKiiPa7cXAYmK2DoSN46/6FwkQRO+vECyNwcPwTg==
X-Received: by 2002:aa7:8c19:0:b0:573:620a:3b1c with SMTP id
 c25-20020aa78c19000000b00573620a3b1cmr13160104pfd.50.1669274195379; 
 Wed, 23 Nov 2022 23:16:35 -0800 (PST)
Received: from localhost ([122.172.85.60]) by smtp.gmail.com with ESMTPSA id
 k4-20020a170902c40400b001867fdec154sm414181plk.224.2022.11.23.23.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 23:16:34 -0800 (PST)
Date: Thu, 24 Nov 2022 12:46:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/9] dt-bindings: cleanup titles
Message-ID: <20221124071632.5cadtc6pbdvdv3xb@vireshk-i7>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:51 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-pwm@vger.kernel.org,
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

On 21-11-22, 12:06, Krzysztof Kozlowski wrote:
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml        | 2 +-
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml         | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v1.yaml               | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml          | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml      | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml    | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2.yaml               | 2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
