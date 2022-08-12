Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09C591460
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 18:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E89BFA;
	Fri, 12 Aug 2022 18:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E89BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660323365;
	bh=riYi9ShONetadgMTCd2Qvq8wgYqZeziFMNaYgR23kdw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=An5CA3J80Ba1DZyr9utqh6+vBgztKg2C8C67kpatKi8G/zJ5OwKUDm1MpXDN5gRQI
	 187TY7dDcwncOHsPl6DDJA3nvDdVCbFnL6eD9QB66F41aWr1cqdJr5NeQyJY5/2rRz
	 oVqu/gqs1VWbLMh8EuuRoe7Oe8DjVNyDrwuhPG3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F99F8026D;
	Fri, 12 Aug 2022 18:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31731F8026A; Fri, 12 Aug 2022 18:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D30F800AA
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 18:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D30F800AA
Received: by mail-il1-f177.google.com with SMTP id g18so760558ilk.4
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 09:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=fRm+MK443iv+bWqysNNlWEdx5OQMpvKZbcU7Wh8UXuE=;
 b=vJQP3vga9zS2Zy5Rqt5mcwblo9rTqOPCt11m3d2n7ZujOxIImGeHpmeSoQ+D7IkBOW
 yr8kicuY6Zco3gZtfGeZwmMdJAodNu6KNOFaQrf+BE5L5EwsIcEEIo9lw5GPSJ1ApKOj
 M+GZObds4Ou7n5awTfLcCBOZ3hLB/MxRZhf7I/xuON8mk1bw7+z9VXOjUqGy2d0uBXr1
 Xt9fbwSuShhQ0dNt7KKIAQowetlPtO8/VMBhZRcMrdXbTUzobgApgHCBcczWJrXf1Cx9
 kiLFFCi0alYmburGLe2TgfQ6P82rQC77uMB2A1mxEoJ1bR4YkBely2RHSoZIAgHcYpfa
 puWQ==
X-Gm-Message-State: ACgBeo1hAqZA3+HwsDfgrVFWwV3tpJOOiN9pDR2awyynOLqPWXUF6dfg
 y5YaxIZxATphSnVHpUPXQw==
X-Google-Smtp-Source: AA6agR6tiAMmjfHF8/Q9cMoh1KscSKGBxd6+ZvSHYQseYcfmbrN92lYw48Pzhq+xNnC/wejeACiZbA==
X-Received: by 2002:a05:6e02:148c:b0:2de:c3b:91d with SMTP id
 n12-20020a056e02148c00b002de0c3b091dmr2342165ilk.95.1660323298542; 
 Fri, 12 Aug 2022 09:54:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a927304000000b002e4c8200225sm141783ilc.39.2022.08.12.09.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 09:54:58 -0700 (PDT)
Received: (nullmailer pid 315561 invoked by uid 1000);
 Fri, 12 Aug 2022 16:54:55 -0000
Date: Fri, 12 Aug 2022 10:54:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings:
 few stale maintainers cleanup
Message-ID: <20220812165455.GA315443-robh@kernel.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Mark Brown <broonie@kernel.org>,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Tue, Aug 09, 2022 at 07:27:47PM +0300, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. Patch #5: Drop also Ricardo Rivera-Matos and assign TI bindings to Andrew Davis
> 2. Add acks.
> 
> A question
> ==========
> 
> Several of the bindings here had only one maintainer and history does not
> always point to a new one (although I did not perform extensive digging). I
> added subsystem maintainer, because dtschema requires an entry with valid email address.
> 
> This is not the best choice as simply subsystem maintainer might not have the
> actual device (or its datasheets or any interest in it).
> 
> Maybe we could add some "orphaned" entry in such case?

It would need to be obvious to not use for a new binding.

> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (5):
>   dt-bindings: iio: Drop Joachim Eastwood
>   dt-bindings: iio: Drop Bogdan Pricop
>   dt-bindings: Drop Beniamin Bia and Stefan Popa
>   dt-bindings: Drop Robert Jones
>   dt-bindings: Drop Dan Murphy and Ricardo Rivera-Matos

Series applied for 6.0-rc1.

Rob
