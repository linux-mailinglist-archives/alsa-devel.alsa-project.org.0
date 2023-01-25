Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDC67C565
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C184E79;
	Thu, 26 Jan 2023 09:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C184E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720139;
	bh=rmu6C2tdEjRvBjsiHN1ZRm8SiMKbkz6DdygTdTMPWns=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=voHjbxheuR8IBLz7ZTxOi90Z/quV1upL50G9bSVADxLlTFfef+YMa84KEs3Df/pQf
	 Fj3/elXjVSavi6E0MyjUQ8vzMMsxCqxqd51UxeSvwsPR/U3ZuVb4izUL2+8R375gHf
	 qopn379vYt2hfPZRPPzD2VKsNRLefeiEgCMaFsDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3207AF805E9;
	Thu, 26 Jan 2023 08:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7159F80424; Wed, 25 Jan 2023 11:10:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A74F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 11:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A74F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EWZ+hu4S
Received: by mail-wr1-x432.google.com with SMTP id r9so16487062wrw.4
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 02:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
 b=EWZ+hu4S4a62p8gA2V9ZYPkv1qLN+s8IMtIROJN7y8CarZG2svVmLvXgd+cIXCTqYK
 NmDzRiCF06lhNIqcgTEj1tarMHcDsKa7kHDQPaG8pOtIq/W5AbCQB6RvTcD1myTpCzRp
 TRVPIsNn/MVN84z/l/E40mM1M3YZ9xN3d/JOW4gawseKTBi9l/HQ5vDPs0OzNhZfxYZO
 aDNpO0Ibc/PEQId4AU9aFKgNJhl4vADNywb3qlpc3BO7gpS9YHIB2cwG5XYpu1Xj9faD
 FC0dRFpKpviOy+GKJ1IlFSq1v3ihdct8DCv97iaxXiys1mUD8mQh4tZ+cpBZvSJ/9qt+
 sssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
 b=TTFOP6++vFghuvlyi2tlcZvypwUJvS8j7Y9dbtSGUCq6se0sioB6snHc4SmlJzA7HQ
 lTQz+JSfUuAjnUCxXWVSoBhAqfum/B4Yv+RgJ+RNJ3V0EgxMbfm5DS0OSFLhmsP4UBZk
 l2fziGyQ3kJak9GJAs3zUYKhoTdgyBju7Bb2eOUvKKqwoLi93U/vNx/NGc/Wu0VpSGKP
 NGCmqW8tE/7R8vPY9i0e+7Ik83d3xWMZAZ/drv0f7+pYh6zlCOGke/KCC6kMGuPJ0zzS
 z96Sv1Qm/TQJvuTSWBAsi6mcbsZT/lKPaF7iY6Y8WUWuo16SxW51+oIz782tQ6m/1kHI
 RkvA==
X-Gm-Message-State: AO0yUKWOlTmybvVKZCItc95BlJNOUb5jpgctHXgMHpwhRdNOQGw0TRDI
 cnU6tSKPkklqSyUR/+IczRY0Fw==
X-Google-Smtp-Source: AK7set8k1yyqihkL7lEDeuIamGfJrPidQaf3VL7shCTdtPbifYjaUj0j3ZCA+tCz22qbl5k7/4CR7Q==
X-Received: by 2002:adf:facb:0:b0:2bf:b746:6224 with SMTP id
 a11-20020adffacb000000b002bfb7466224mr2062674wrs.0.1674641440862; 
 Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002755e301eeasm4024686wrw.100.2023.01.25.02.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Message-ID: <859715d1-a442-7f64-2345-60d0fe28bdb5@linaro.org>
Date: Wed, 25 Jan 2023 11:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230124230228.372305-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:02 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 25/01/2023 00:02, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
> 
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

