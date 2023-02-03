Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BF689421
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 10:41:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83CEA1E4;
	Fri,  3 Feb 2023 10:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83CEA1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675417303;
	bh=pm2JaCyXGzmMo8C5P2x3q3wnt3gx59YssCzyFpDtS3M=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iiXj/06xUT5k0zMtOmYHQU8A5MjYTayi4Zh49PoVD86pWBID839RL8lyWvKeb1N69
	 NniZeJx26Y/yf4j51mRbrHn759ijjtaktE3O7ENzQ5wFDkDao4Axf2m6NPAqmWwzVO
	 aESHIglOdspuwL0jMNSQG/q6tjshLEIBEjSEvr9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41F9F800E3;
	Fri,  3 Feb 2023 10:40:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0ADF8032B; Fri,  3 Feb 2023 10:40:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A59DF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 10:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A59DF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=eXU3zeOv
Received: by mail-wm1-x332.google.com with SMTP id o36so3406871wms.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=BcOFFh4ezLvd92fNkjmz7wpV7RsvIbDnXNZc1TtGyfE=;
 b=eXU3zeOvIS/sTiVvmDUhiTLRt6DYkGsjsFI1AX0qQb+Lg0yPfNg7WquyWULEMsAqc2
 ZIZeFSJ5CAoW5nL5Ft/UIgrcUry9QB797rFehtOyLalYzeVP4IEAGrV4/J62yuAiaH0O
 YK9kygwBhv/t9PBzbSUkC/vyoBgGtrNmJGhUVLspgxAy4lvs0EYULgVMcZsSXLDzLmfz
 J5R5FAIleJ+jEyDEWvgt5njPch6JHQNk+xmyerW3JV7jPlHeiMiiyCGXtY7My8Nz96YP
 3t3OZy2zPAyn0fO7zC8NAl4yePwNNZt5O8RcWhyeDaSYHqMHtlM+fg4jynGcBI+oflZa
 K2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BcOFFh4ezLvd92fNkjmz7wpV7RsvIbDnXNZc1TtGyfE=;
 b=DBSl8znEk+CQlR1FkyjC2i79ikdpecq2TXPdKbjqUmen0ImcaOwuBWytzLbRD92qZs
 PZkVsf2Tal0UnM5jVui1kpvjrt8Fx2VW/6JbA5K93LY2JpB8lLzpvaZfkMumgtiQQl4z
 ojb+qkbgPGPgw8L/s+JNZUCwM5Y34vy+AUzm+ZBF1yUSo5k69UVjhADlxFjIjGXk27c/
 OLzkEQMsIzwljSkVVwGotnVFhg1PTGWuEqYdHZDIn2/101N1Nqmfk9j7w32Pvrw0NPpL
 FyFKFuH7gaONYLzUv55AbMG5yf9DE6UlKbvCrsSLBGctEmgNs1R4pyLYDZSy/PWyd3pP
 TLcg==
X-Gm-Message-State: AO0yUKX4ucZ6kgHpXDt9WoSD5iApHznVpLcZuwalLtIDGlHzEMNCC+yn
 MgX1O9vSAwqa7FfZcO/rPdUGeA==
X-Google-Smtp-Source: AK7set9EIfUGCgZ5uGTG32ryzvXSU83lqMxBe2h4wXPjYKidwJ8U3BQjmte0UPJpZ9LnkSIAYZKdnA==
X-Received: by 2002:a7b:cb07:0:b0:3d9:719a:8f7d with SMTP id
 u7-20020a7bcb07000000b003d9719a8f7dmr8813045wmj.35.1675417231027; 
 Fri, 03 Feb 2023 01:40:31 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003dc49e0132asm7027471wmj.1.2023.02.03.01.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 01:40:30 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
 <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Date: Fri, 03 Feb 2023 10:37:51 +0100
In-reply-to: <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
Message-ID: <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri 03 Feb 2023 at 09:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 02/02/2023 19:36, Jerome Brunet wrote:

[...]

>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#sound-dai-cells"
>> +  - clocks
>> +  - clock-names
>> +
>> +if:
>
> Keep in allOf here (need to move ref from top to here)
>

I'm not sure I get it. As it is, it seems to have the effect I had in
mind while trying with dt_bindings_check.

What does it do when putting the conditional under the AllOf section ?

>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - amlogic,g12a-pdm
>> +          - amlogic,sm1-pdm
>> +then:
>> +  properties:
>> +    resets:
>> +      items:
>> +        - description: Dedicated device reset line
>
> Define properties in top level properties.
>
>> +
>> +  required:
>> +    - resets
>> +
>> +unevaluatedProperties: false
>
>
> Best regards,
> Krzysztof

