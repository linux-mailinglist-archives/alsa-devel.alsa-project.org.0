Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A358C74A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 13:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32529823;
	Mon,  8 Aug 2022 13:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32529823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659956954;
	bh=fKdj85/TvRlzt8vny9UnTEii9HDtY6WVmooSsiy0ygY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VcBooBfl+HhCTOaQnAnaXi9TuGXTk0fgqASwpbp91Ry64Tu79FHJqmehGY6SebqyB
	 tb12DILG+UScRGQX+xz3QKrm5FjhL3HBLCWYE2xBEIIfApbhE6K0XJf9Kwrj8hXqdq
	 WfchuQP8pOLKQiSHcTul8V5e4CWXTXXvAfKfUZRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA61F804B1;
	Mon,  8 Aug 2022 13:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90C06F800E8; Mon,  8 Aug 2022 13:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7477FF800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 13:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7477FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U/8GdIPA"
Received: by mail-lj1-x22e.google.com with SMTP id x9so5736751ljj.13
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=G5McPA5IZBMFjJ0FWkBGoduD3K8bZspnlviNAqde1yc=;
 b=U/8GdIPAOfjfBSkPjG5qZxEpHYx+/y1PqJjkW7q9XPKi+rNH9/dxiBi1yihCy+h293
 iNwxkcW7qy7LPeMGxSs5rHpkJQq5EwzuHdr+LCPHKjOeQ83rg8iKzV3zZarNThEsWH0w
 CmC/o7Zp4FC1+BWdTxPiNp8JkSwzUoXh7tQIU56sUavV8iNgWPijx/uuF0xZaPPcxocb
 /f7wX+tz8FQi5OrTmy4E+tsl100B6B6g7NsVYajrm5YYsymY0zrRboDLbi4cvxNVYAbc
 0EoeM/cP8He8woq/BuYMI7uO1xTTlUTwupdPNkoU6aX4x7Uw/vfB35BO1qPupE6jKKH6
 esHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5McPA5IZBMFjJ0FWkBGoduD3K8bZspnlviNAqde1yc=;
 b=jMYspS5t5mb/DpmafLtwYToNBLIT0b1tGsabE1TlquJOJ89OUN8tqHWvBw/tuE6Gr4
 iGwn5zLB5iy6c9evzh3UCT7asfFEwfoXRqQgqkjTDdAoSlXRvoBorRjgbUBzp1J7DwGQ
 qF61i7F/VWx709W+yqOVhRSedteBd1Fh2qycWVONuK29E/vyVvGHTQg4/WAiuKwSmuUO
 GnsZYU3gjU0V59s/eMxkf1sfFkjeVgMv0tAFifME0V4qdN7YGjkWeil44M5GV9VG97yg
 xjschHGYK+ipx9A0Cc7AEIO6TTWJbJrG+XZzJ2P6n5Tx9Eclk1qMmgoYKnndZh3Q04aM
 656A==
X-Gm-Message-State: ACgBeo22HS2yfuBtKMSOPnVTZbQIn7ogWBorfa7T3BE8P6Vd+/gkJl/B
 Bl9PI6GLlysmFsibLvxaTb+daA==
X-Google-Smtp-Source: AA6agR5I5A6dxgwMS+V5R6U4to3TDtNl7lNnpi0SFDGcuvZCIrUri2LyMgMT9eOhaBiYlWL8+eDong==
X-Received: by 2002:a2e:2ac1:0:b0:25e:4b39:e3cb with SMTP id
 q184-20020a2e2ac1000000b0025e4b39e3cbmr5854240ljq.458.1659956886352; 
 Mon, 08 Aug 2022 04:08:06 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b0025e6a598019sm1338801lji.131.2022.08.08.04.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 04:08:05 -0700 (PDT)
Message-ID: <43b3c497-97fd-29aa-a07b-bcd6413802c4@linaro.org>
Date: Mon, 8 Aug 2022 14:08:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/5] dt-bindings: Drop Dan Murphy
Content-Language: en-US
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Robert Jones <rjones@gateworks.com>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ricardo Rivera-Matos
 <r-rivera-matos@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 08/08/2022 13:47, Krzysztof Kozlowski wrote:
> Emails to Dan Murphy bounce ("550 Invalid recipient <dmurphy@ti.com>
> (#5.1.1)").


(...)

>  description: |
> diff --git a/Documentation/devicetree/bindings/power/supply/bq25980.yaml b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> index 4883527ab5c7..509a0667b04e 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI BQ25980 Flash Charger
>  
>  maintainers:
> -  - Dan Murphy <dmurphy@ti.com>
>    - Ricardo Rivera-Matos <r-rivera-matos@ti.com>

Ricardo's also bounces... Does it mean TI is not interested in
maintaining mainline support for its drivers?

Best regards,
Krzysztof
