Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A76B3ECD
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 13:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0110157F;
	Fri, 10 Mar 2023 13:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0110157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678450209;
	bh=eov9cZqee49EnsOA2rb1FsTuDBSCKLFFP94XsuyR1jg=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhdFQBqKzIkTmBbWwApl0OjtscD4ZZDLQJk6tzYlhQjnwmT7PeOP+h67VG8qcA0Dp
	 mXaRj6vmykNjG7cddyzSj9c6J4/qV9aNS1zxrpVgjgb/OP3GKJxyxzFzgpjzLwtU5m
	 fVhfWjfV4DHLq5kAY2jRFvzPG7RI+C5ZCoYDtJ0w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 056BDF80236;
	Fri, 10 Mar 2023 13:09:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D13F8042F; Fri, 10 Mar 2023 13:09:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 47E22F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 13:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E22F8007E
Received: by mail-qt1-f176.google.com with SMTP id c18so5353728qte.5
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 04:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678450150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osXtcLpzII8HMhQvnw8NYQ8r9e4scUgeSo4VdhXXuHE=;
        b=WnlOwluuJEg3/+g5JZC7ATXAw9EueDkkgEq9QY4jhpNLE/8RZnR5PEBKJ0L2CHTKUn
         uCHJevhQ/tggultS6HRazsWzyIbBIWjy1beAmEactg9WKiAHWl/xBOgxg/xAcZQ3M4cz
         s+J9VKfSbAiiQUYl3pjl0/9gbSOTjmKvWpV9AaXgPWjvFx9VHuvU5a5dk7/8NScMyW75
         4APdCk3+hkD9c9O/FvF/6gLPYJmx3yaHwBmQ60IScbpCvCDOWnySUIZnpTZOrQ2/uZeF
         aJES6VT2LS1J8B3G22kkI84HDNYevlgRimNet6mfFUC1T12kXYwLS1PYbgGbOUsp2/OL
         IIqA==
X-Gm-Message-State: AO0yUKUMAvZn0a0efzdFqUB5GRwjdlGjMyIMcBOWm/oKIwHqaocrYxS4
	H1TGgUFmxntRmi5TujttlYdsQRuU/vff0w==
X-Google-Smtp-Source: 
 AK7set81DMuu4RyHyvYmh7j2bgzOSlsbSDUX13ExpxTvQ18HzzghLZgHjGL6dfHfV3D5wcCDSWHXgg==
X-Received: by 2002:ac8:4e90:0:b0:3b6:2e12:4d25 with SMTP id
 16-20020ac84e90000000b003b62e124d25mr3382458qtp.31.1678450150640;
        Fri, 10 Mar 2023 04:09:10 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id
 l30-20020ac8459e000000b003b868cdc689sm1335674qtn.5.2023.03.10.04.09.09
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:09:10 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-536c02eea4dso93736157b3.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 04:09:09 -0800 (PST)
X-Received: by 2002:a81:ae4a:0:b0:52e:b7cf:4cd1 with SMTP id
 g10-20020a81ae4a000000b0052eb7cf4cd1mr16210644ywk.5.1678450149576; Fri, 10
 Mar 2023 04:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230217185225.43310-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230217185225.43310-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 13:08:57 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdXDJe7pSM8buhwRkYF-DXy4C9NnxbgTWefhRwOXFs0DAA@mail.gmail.com>
Message-ID: 
 <CAMuHMdXDJe7pSM8buhwRkYF-DXy4C9NnxbgTWefhRwOXFs0DAA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g043: Update IRQ numbers
 for SSI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 32XWGOQM5OUCO5WL7SBMYOEUMUDFXDGH
X-Message-ID-Hash: 32XWGOQM5OUCO5WL7SBMYOEUMUDFXDGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32XWGOQM5OUCO5WL7SBMYOEUMUDFXDGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 17, 2023 at 7:54=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> From R01UH0968EJ0100 Rev.1.00 HW manual the interrupt numbers for SSI
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
> Fixes: 559f2b0708c70 ("arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nod=
es and fillup the SSI0 stub node")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

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
