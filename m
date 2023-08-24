Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB5786AAC
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6ADB844;
	Thu, 24 Aug 2023 10:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6ADB844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692867052;
	bh=jhEdEaThlCVOPGFrmUoOOgeYj8tIGFr+akCYh8a+Qdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GiQXaNEvq+HzVw5zm7HhxCpLlZxyJh2nPRvKlnW8PNSJIK0CKERcn7NC7sqEGDouX
	 EtbxCilSrCEll15MDQ5ab7fcT0uIw8gT+c95c6Nlps04qxjxXfpfJHSnErti8bET2W
	 prLx2V7fsOXvvpirPuSvy8LnFaQ/GbtlAOBbllOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DAA4F805AB; Thu, 24 Aug 2023 10:48:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD52F805A8;
	Thu, 24 Aug 2023 10:48:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18085F80158; Thu, 24 Aug 2023 09:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F351F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F351F800BF
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-58d9ba95c78so70995947b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 00:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862949; x=1693467749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhv4Bg1fdD4fcuHP4DlJnIZ9JdHOfbSov1NYQWp3Ek8=;
        b=OOQMYXUew2CL1YDD/swozt/U6HpKhV+ghsyPOFyvChF0Jj6l4X+T8RNHigDTP0y4NV
         hSM5amlAKxyLl1uRowPoMNklXn4TZIuL8i4cRsH6SjRw3qMFs2C3n1Q6UvzBv4hxVWve
         S7kQCQnfpIYH/ceTQye2TGB2z1c/ZJJBoChFE5QHQtVcmhlx23np1uSWxeR6wB4+Sli3
         GCyIMTljUol06OIH+HJ/yLef5PyyzDg2UwJkERzDUICrUgsC0t3HbWcPcJoGEpdWKSCP
         sSEyirnN/msGFd6Rr4WxIq9NyorHUjvadQJ9A6Z1kcNngzCO8W9ZnsEmUjQzr5zsMQQJ
         NEjg==
X-Gm-Message-State: AOJu0Yw6dgV0IQSrC6nyFoDaOukUGmfcXGGJcy0wGAHX/Nc9Tul6l02F
	GqGj5va3h0KNx6VttBkqxfHHGxdbZWtn4Q==
X-Google-Smtp-Source: 
 AGHT+IE9w8vz6T0Q4bF4iPYcpkBYOKcf2Rx4Z4HxFGiuuB9mGg8rmegmsT/J6JrO3soyYhXpZDKKEw==
X-Received: by 2002:a0d:d8ca:0:b0:583:e958:39c6 with SMTP id
 a193-20020a0dd8ca000000b00583e95839c6mr15353549ywe.34.1692862949171;
        Thu, 24 Aug 2023 00:42:29 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id
 q62-20020a815c41000000b0057736c436f1sm3747030ywb.141.2023.08.24.00.42.28
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:42:28 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso5955964276.1
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 00:42:28 -0700 (PDT)
X-Received: by 2002:a25:ae92:0:b0:d3b:e659:5331 with SMTP id
 b18-20020a25ae92000000b00d3be6595331mr14472125ybj.58.1692862928507; Thu, 24
 Aug 2023 00:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Aug 2023 09:41:56 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Message-ID: 
 <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-iio@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FLSYLFCPQNT3O7XIDLWT4MUNK4RKDICC
X-Message-ID-Hash: FLSYLFCPQNT3O7XIDLWT4MUNK4RKDICC
X-Mailman-Approved-At: Thu, 24 Aug 2023 08:48:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLSYLFCPQNT3O7XIDLWT4MUNK4RKDICC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 8:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml     |  4 ++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
