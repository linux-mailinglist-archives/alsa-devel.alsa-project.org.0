Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A56B3EC4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 13:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D5014A8;
	Fri, 10 Mar 2023 13:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D5014A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678450044;
	bh=gL/HOi0V3mivcjTgPd6p1Jx4clBGoZ8lvm5hakYxE94=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YdnqC9AAm+ByOqb4cjxXi0xtQqECA/f8KGekOKmILZKf6xYN6QCZzJvI8feAm76Aa
	 f7VIfZQ4I3pWMIGAASFsQikPOtLduObLQT2VcD/v3L9qOx4mX1tu1qMTXRpM185gQx
	 Af4bIsKB5OKSNZ4BCkYECQ824Dux7NB+EM7Uw9tU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54447F80236;
	Fri, 10 Mar 2023 13:06:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06175F8042F; Fri, 10 Mar 2023 13:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE1BDF8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 13:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE1BDF8007E
Received: by mail-qt1-f176.google.com with SMTP id y10so5361148qtj.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 04:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678449925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8UNkrLW/HQojg28MfnnyGYVjttNpcn/zGjRX4vMdGU=;
        b=TnX2UzjFlHHzBw5nesIb3DRMt+hcRleeZ9E0Tcx/fqXdeF09w3eTLeuc/cibOGcB4B
         xhsb9uPy5PLS+NSH4xi+RpZO0k1ElFN7ZOWCyXCFKBvAnrGbkYI3L+0wAfhD+mFuxBfr
         0TYtHYmQqfHXIojwVIHt9YFqETOcAgEOlM3JyyaY6W5TlRHq2dcV0rNX20hV8h1d8kQH
         ddAW/RGQ4B5TIlx93cRXjW01E+kRK33L+iBoQQRYAfD/d/PNpvhzuhQcWSZ0rrwo8deE
         9HOEC9Uc3PW0A3XQDurWprBpLp+rroPOzdnrgaKe2JnTOHIRr9GsPwQ+R7c2vbJ0C9tC
         540g==
X-Gm-Message-State: AO0yUKUoa6uzE4iq1y4iS101SlqOV9jhqmsY3WpayNyqcdpWwmnL4aoG
	LEFsK/gnw7ZHRUNoE4PSSSQMw0HohGuV3A==
X-Google-Smtp-Source: 
 AK7set++PVZbkLIDrcYm3PKAhSzvs05yoCfhUalnn7tPH+l0vBJj04jpb9SSlb5I6OLBQw85Oo1FoA==
X-Received: by 2002:a05:622a:174d:b0:3bf:b8b9:1b45 with SMTP id
 l13-20020a05622a174d00b003bfb8b91b45mr7898669qtk.41.1678449924670;
        Fri, 10 Mar 2023 04:05:24 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id
 a71-20020ae9e84a000000b0073b575f3603sm1169442qkg.101.2023.03.10.04.05.24
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:05:24 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id k199so5007452ybf.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 04:05:24 -0800 (PST)
X-Received: by 2002:a5b:18e:0:b0:967:f8b2:7a42 with SMTP id
 r14-20020a5b018e000000b00967f8b27a42mr12326443ybl.7.1678449923837; Fri, 10
 Mar 2023 04:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 13:05:11 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdU=mCAWQNFCkkCxBkDyYTLM87QdrYMYE9hpOv1fuS=bWw@mail.gmail.com>
Message-ID: 
 <CAMuHMdU=mCAWQNFCkkCxBkDyYTLM87QdrYMYE9hpOv1fuS=bWw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a07g044: Update IRQ numbers
 for SSI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MOE6ZYFJC3O742X6N6UIMTQORPTQA47Y
X-Message-ID-Hash: MOE6ZYFJC3O742X6N6UIMTQORPTQA47Y
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOE6ZYFJC3O742X6N6UIMTQORPTQA47Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Prabhakar,

On Fri, Feb 17, 2023 at 7:53=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> From R01UH0914EJ0120 Rev.1.20 HW manual the interrupt numbers for SSI
> channels have been updated,
>
> SPI 329 - SSIF0 is now marked as reserved
> SPI 333 - SSIF1 is now marked as reserved
> SPI 335 - SSIF2 is now marked as reserved
> SPI 336 - SSIF2 is now marked as reserved
> SPI 341 - SSIF3 is now marked as reserved
>
> This patch drops the above IRQs from SoC DTSI.
>
> Fixes: 92a341315afc9 ("arm64: dts: renesas: r9a07g044: Add SSI support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

> As this is is a fixes patch and we are still waiting for [0] to be merged
> shall do the same for V2L SoC?
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230131=
223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

No need to send, I cloned the above with
    s/G2L/V2L/
    s/g044/g054/
    s/G044/G054/
    s/R01UH0914EJ0120/R01UH0936EJ0120/

and
Fixes: cd0339ec25895c0b ("arm64: dts: renesas: r9a07g054: Add
SSI{1,2,3} nodes and fillup the SSI0 stub node")

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
