Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4F67C548
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 08:59:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDD7A4B;
	Thu, 26 Jan 2023 08:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDD7A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719970;
	bh=QYtWQMPFTpWedQzexNKu+u0XGUOt9qJPJ9mZ5Zgcq4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dZEuCRc7m5fi5mBfwJ6i6/W+BL/EOzQVwO32bGn5N6OPq4BYysz88Cfv/UCjW/kwS
	 /XDL8/95aux23CqDyemAOjBLhUfByeDKDM0/a5SU8q1OkkkvmlADu1R136T3rYZcMF
	 reUb7sbP+g4c0yhkLMtbfhY+8wEI7imXr0TG4JPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D14AFF805B2;
	Thu, 26 Jan 2023 08:55:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BBCF802E8; Wed, 25 Jan 2023 17:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A039BF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 17:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A039BF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o4j8nJom
Received: by mail-ed1-x536.google.com with SMTP id w11so7049984edv.0
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
 b=o4j8nJomybIx4kE59DRw52ujqDVZ1WQewtiJ58C37pZX/5DWWR3us5SruXAAGyfGBc
 0oxAeGxQTdIDM++/ONptAOL1nO0F6K6FiZC1F/r6Qme1XRV2lBzY485x0B9dWJnV3W0W
 TnQMulrN7yyZXGHFTiOyWDC1wY59f/tjlS5vjPAnXkbmCVxXIc2maTfx3FlJemGXPbEd
 oIhFRB2EHA0oTv8BIEwV/oq0Vp9kY4A8qUg2UpNdvj82VIuPM+pGvvRPDGd+iKkdN0iE
 fMhuNZyuRhr5wQD9uKjHTu0/dBcgt18B09bb5lO3wvYzPbjdtZ4zCb8IaUuWGDUTVpmZ
 9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
 b=gW9qBGmaW+ChzwPzLkTiZjDEtHC+GtUiNyAIQa2Jatqt+myGXyHN9pf2WQDy2QG4fM
 UpaxW4R2PRu/M6dKX83E1dZ4Q9bgRCBTsJkVqe3uxGdczte/uRy4d1XGcMRE3H3HjvLR
 1/rZ/HbMjvXC18OC43XW2x5sIxD9T6NDwZiquS3dhHLpfOufo6cN4JcDnWOp4lmtUvwE
 kYVV4SUAliXOOB2v2k2El77DMG53Rn+VT8vtOmEDgxAQdiyCdz0kPpkv8hKblRat3Nbj
 qoH96mIv8q+01ceyWoOoQ3z1Ew+QkYEmziye/ZsdZrekbWD7J0L2eFa6cAIghhlPfWf/
 6gdg==
X-Gm-Message-State: AO0yUKU8L6nyV+OxrxvUWCymnnmFunjgC5bX6RCiuZ7u54ww4MWIYdci
 mxPfOI9Y5zNHf1PqhLABUge4P73vt5NXg6/AbDc=
X-Google-Smtp-Source: AK7set8Ywx0iAQrGoEEkgv3qLgP8YXwI3+TvqWY8ReSLX18XMQnjssyGUpWN7izePXDq8V+lj0t2lykY83BEM5yxFts=
X-Received: by 2002:a05:6402:d59:b0:4a0:90da:4653 with SMTP id
 ec25-20020a0564020d5900b004a090da4653mr814683edb.153.1674664006555; Wed, 25
 Jan 2023 08:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 25 Jan 2023 10:26:35 -0600
Message-ID: <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:01 +0100
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
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, openbmc@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 24, 2023 at 5:00 PM Rob Herring <robh@kernel.org> wrote:
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
For the mailbox change,
   Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
