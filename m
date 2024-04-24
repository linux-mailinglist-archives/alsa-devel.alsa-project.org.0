Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D008B017E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 08:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1270C1F5;
	Wed, 24 Apr 2024 08:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1270C1F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713938563;
	bh=ukWXJGkwDRwc3UcBBER5J5oFKEGGzue+iwnJ1u/Jr7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l/Fq38Rrk+bt3sAO+P2DrViA+y72ev2GuG+EzEUi+AppQk80cBhd4+Wm2nukJRbeV
	 x/LA9n0mv2AtoOBB/ccRNFFoTMSsExejjz813GXzhnbQLBkdWqWese2nlTX8mQ9zEe
	 WJne9Jnq0M0W856X4D2R4lBL3LY1S86mA2NBbVLc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AE2CF8057D; Wed, 24 Apr 2024 08:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 881B1F8059F;
	Wed, 24 Apr 2024 08:02:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2429EF80423; Wed, 24 Apr 2024 07:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB1AF800B5
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 07:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB1AF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=JwyKbbPl
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-439b1c72676so218251cf.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 22:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713938298; x=1714543098;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/W5HSMGzNKRFvroL7XEIB583TE1U/at3BEuUXdJmYE=;
        b=JwyKbbPlLtj8v6K1j3qDZAlNsLWzBOpMcvnijsyktKx3Jl6RsLm3DU1DjxlDG5y/G1
         jk9N2GqAbWdPcVkBHayRjteCabkZQya0EWEAw2j1WM2LmpqahCfhXrXYhAh9snqxqYfl
         RzlsjJA+9MagOGgTDGuP/1yuI3K8ZmG1czDMJgJ1LXQvwgP7MNTh/HJI2gAwFFQW4BSZ
         KpowoFc1xmQ2Y4Ldh+cArkW81WROuEgLMZshH6NeLavdLq22WK7RHK6o7X4CvxMnTOom
         rHTYwRJ4vGv37DRd/yM4Mw0j07tUa7r6mlicr8svSzOmGCSnWSwX6mehQ6g48oQyYsdZ
         tl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938298; x=1714543098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/W5HSMGzNKRFvroL7XEIB583TE1U/at3BEuUXdJmYE=;
        b=LPbLjP40eaksLudzEvMN5O26j4tvRCfyky6O4yIv6+7YBlwYK/uimD37DGXtgVbGmz
         n30MEh9KfUtXPF9+h0mOH32V6C5um69VjdcLu7E9otD32kWSXdh1hSZtB0Cs1UiMwZ6U
         rWPUQlPFdjkXxs6/anCsOsv0N8Hs/F+PHH/OwmZzj0x0LheG3BkRH80NGYhNt6BYoHgG
         y/UjtIXzdKZz0Kmpz+AbpUSAX2dadmg4hkroA/jmedVU4CS07KtMZ9bVxP1brPjC9i3g
         JUKps+9gKX7DC+4e0wWD/Z5pMT11R7Tut2FmrWLbFiYm13blV7Zj7AGd7eqv2xwRxEmx
         DOUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ldrvFTCtGV84a800vaEdFWO5WG+JzxNy4g6jWbawiQbCEvv+6b4/ARgZdww6qL5VkTkA2btSU0ryPF7aDjMBSviO2BAaHtz6s2Y=
X-Gm-Message-State: AOJu0YwGhkHraaShbLFSEND9mCj+bVI9YbevLyBsIJ1oTVxoNtZUS0uC
	OsVdduourf8Pt6UPpjJmlvajDj+1uTl/xTQbYvvC43X6yfCMVOCsS1JHf+9QJZl4+q2rWDFxal6
	eOAbH5LZnuEi7r4PCYwxZE7jaryuh6L+yVygL
X-Google-Smtp-Source: 
 AGHT+IFtH+TdYnY/R2NkKd7EY8OhaQPa4uA2hOiV9IhRrDt+9zqEvKh32061ELbCkTI4QNocIDZCt4lHutO/oQbF8iw=
X-Received: by 2002:ac8:6e81:0:b0:437:c89e:245b with SMTP id
 c1-20020ac86e81000000b00437c89e245bmr130751qtv.15.1713938297863; Tue, 23 Apr
 2024 22:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-7-gatien.chevallier@foss.st.com>
In-Reply-To: <20240105130404.301172-7-gatien.chevallier@foss.st.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 23 Apr 2024 22:57:40 -0700
Message-ID: 
 <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
Subject: Re: [PATCH v9 06/13] of: property: fw_devlink: Add support for
 "access-controller"
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, ulf.hansson@linaro.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	hugues.fruchet@foss.st.com, lee@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com, lars@metafoo.de,
	rcsekar@samsung.com, wg@grandegger.com, mkl@pengutronix.de,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: II535DE3P2YQ6QKYYIXGT54IARJK6H5E
X-Message-ID-Hash: II535DE3P2YQ6QKYYIXGT54IARJK6H5E
X-MailFrom: saravanak@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/II535DE3P2YQ6QKYYIXGT54IARJK6H5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 5, 2024 at 5:03=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:
>
> Allows tracking dependencies between devices and their access
> controller.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>

Please cc me on fw_devlink patches. Also, this patch is breaking the
norm below. Please send a fix up patch.

> ---
> Changes in V9:
>         - Added Rob's review tag
>
> Changes in V6:
>         - Renamed access-controller to access-controllers
>
> Changes in V5:
>         - Rename feature-domain* to access-control*
>
> Patch not present in V1
>
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index afdaefbd03f6..7f737eac91b2 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1268,6 +1268,7 @@ DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
>  DEFINE_SIMPLE_PROP(msi_parent, "msi-parent", "#msi-cells")
> +DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-co=
ntroller-cells")
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1363,6 +1364,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_regulators, },
>         { .parse_prop =3D parse_gpio, },
>         { .parse_prop =3D parse_gpios, },
> +       { .parse_prop =3D parse_access_controllers, },

All the simple properties are listed before the suffix ones as the
suffix checks are more expensive. So, you should have inserted this
right before the suffix properties. Also, there's a merge conflict in
linux-next. So make sure you take that into account when sending the
fix up and picking the order.

-Saravana

>         {}
>  };

>
> --
> 2.35.3
>
