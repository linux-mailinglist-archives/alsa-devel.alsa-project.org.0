Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDB67C569
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AAEDE7C;
	Thu, 26 Jan 2023 09:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AAEDE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720187;
	bh=5jIvH9CqETzpDoXn8tJjdWQRzQEgf/6OxsR8sHRfP2U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oJx8LBC3+2ct18i9BtX//zDZou9tI7HnhERw1dOM+JycPD6IhAq37LGsbI4yGTse0
	 55eZHeGD+rLiFP6Vfaskom9dvLhQIiugmghHoh7Bo2r8DOO6DbqERRrqb+mS3Gm1qn
	 4NUytSekq9WW8a7mFxpBgPOzXZbCId6sr7TMQQQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 132E8F805F6;
	Thu, 26 Jan 2023 08:55:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C2FF80424; Wed, 25 Jan 2023 14:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6316BF80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 14:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6316BF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ZWujWps5
Received: by mail-lf1-x133.google.com with SMTP id j17so28863275lfr.3
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
 b=ZWujWps5xV+1Wp9WkpTktZV8uw9uUYoO8g5XV6hX5GoFex0wS6QvPRwAG/2X2m1TpC
 AnHeNzLJDDtn53tWfoYWTefbTDjXDAE0nyphHivQZvoRdrxbqpV+7GwZiiMjSczRHu8S
 2+wR907XANDw+tY9iJAZ7kQb7uGdBtK+VXYG5abfl8fMtfvdNrdyGPXGOMxIoU9QKeVu
 4IlTBODyMAWFOY81r6JOyh5Fa315CiPWT2rXXbjFQEfpJSeF4VXVDJglh9UTsnUwh9su
 TYGOZhQhykmGOSX5lbdOvzn5eD1DRAR9mumAOcV1QbWLinLDbhcnO/qlNyd2Axsp+wEi
 p/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUlWEcztX7LC+YPVdX7zQ3TiSCzemn77YbP9UmZzYSE=;
 b=3yg4RGhvzNA4H+xAZlwEszAlJ8A2NFp7Fvx5Ppp4fvl5XK+rCYXRNAcfXcvrCvDAtQ
 rU1/jves7KOy18+3zXHQeNir6EqQ7IbaQTZI8x2Opzg7hFqwSyTAhlvTnJnRIl6Abr9a
 bU6+8g6LdFU+QXd3r23HYvcg5qFeUJfEbZVLNWQ2HygTq/F8UfmTlcg+/Y2ju9JfTMQQ
 LTKn8bJOESxZYmUgc/3OP9KU8xZABdXL7I+yvS7SGafsQPGHvOPVQnDegtGffnBsAGoB
 tbwrCH2iz5/kH56phDvYjIkYYxHOEuTB97BSVUojICVRXFSgt1iXwQYXd9oWqcumpX7k
 8B3g==
X-Gm-Message-State: AFqh2kowtqWYXBuwzjXJ26+d8lRA8tbYlQ+J7d8jtLmbOHZV3OBLmcra
 8JhRXoQTQsONyYf1VXmE9PMz4QXiRYNyQnaoHbXLXg==
X-Google-Smtp-Source: AMrXdXua3Xzk3n+mAS+SHWDmCwyiaUE3a82cF5mU8PKvzbJFSacMHuyCjbHJ/PWxjesRw9CjRh1dmLPf3Blx2uP0BXc=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2768406lfu.615.1674651728174; Wed, 25
 Jan 2023 05:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jan 2023 14:01:55 +0100
Message-ID: <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 12:00 AM Rob Herring <robh@kernel.org> wrote:
>
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

[...]

>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 7f26f6b1eea1..31906c253940 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    "^.*-pins?$":
>      $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
>
>      properties:
>        pins:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]
