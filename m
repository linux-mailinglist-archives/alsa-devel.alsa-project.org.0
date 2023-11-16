Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08ED7EE1E5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 14:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1EA5209;
	Thu, 16 Nov 2023 14:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1EA5209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700142553;
	bh=jZX5UedwGiD0BJrRpmk8hFt7URJ/cC3cmoyLgPZt3jI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SueqaWa/MgiUM6X4oMiQrYElzU74WPh6j58rszfgw8cjZZdjDMK0veGeCcYdxOnJw
	 /UthRrcw2aUs6fz+suYSh8kIRpIapFxJEYuZPdMLjbs9wJQ3PW8aYe9Pb78dlNL0rC
	 x0yZXek+RiU+ifuleUNqIV842x5kvHntJHdU7sdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24E62F80551; Thu, 16 Nov 2023 14:48:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7665F8016E;
	Thu, 16 Nov 2023 14:48:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C6BF801D5; Thu, 16 Nov 2023 14:46:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BDC4F80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 14:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDC4F80166
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a7afd45199so9351857b3.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 05:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142408; x=1700747208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMksHTtyECe9fxBa+1TFlBB1X6sF0c8fgEakoogEF3w=;
        b=v70LKQkEH+x9/eGZJX7lKNr0dQMg/M+t0I4fg3uPqRFr12kJBblatfXFG/J8aXwfhg
         D9XO7R8Aemzm7UsmdlFHjVdW/atYyB9FQC7EHH2+wllEq9qTTWygWxdKUDdwl9QoeE4H
         dZSSiHRjVklXlAR1qPZ5f0f7eOL865oo4EOfQXftXVdO7mq9bf5YifX7BJMKAbrXqiwW
         wSqfpgVezTFRunO2RYmbTRFCU46H3nj1epbCdFcNIyaljVhsrXD7U/LCtIXj+SAUCks/
         ZS0F0KlUZoiGCCsposupuGqeBSL/LcDzUuHhhkf6jdYugtvguR0T3YWz+ZdMTa+Jhslz
         gQlA==
X-Gm-Message-State: AOJu0YyikwUvIXLuTEGUWH+QKx1F4XMOv6jqeLNbGpQT80Urztl7IJuB
	JLcMwmmgeY36d4U0TiA+IjRFh6/e77zzAw==
X-Google-Smtp-Source: 
 AGHT+IETxGUXoxYPP/TZRUfLEOaaLlwPz0mpo05T0glEsli4jB8Ug0rg/HSjqyUBNVMBz3PuEh9cAw==
X-Received: by 2002:a0d:e28e:0:b0:586:9f6c:4215 with SMTP id
 l136-20020a0de28e000000b005869f6c4215mr16771143ywe.33.1700142408581;
        Thu, 16 Nov 2023 05:46:48 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a0ddf06000000b005a7a92a62besm1008198ywe.8.2023.11.16.05.46.48
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 05:46:48 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5a87ac9d245so9122247b3.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 05:46:48 -0800 (PST)
X-Received: by 2002:a25:b4b:0:b0:d9a:be79:c902 with SMTP id
 72-20020a250b4b000000b00d9abe79c902mr15874410ybl.53.1700142408226; Thu, 16
 Nov 2023 05:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 14:46:36 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdVGL8-jpUV9M+J_EhcB7=XfyesreFBPf6Jtvg6Cq_2xTA@mail.gmail.com>
Message-ID: 
 <CAMuHMdVGL8-jpUV9M+J_EhcB7=XfyesreFBPf6Jtvg6Cq_2xTA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LI6KY3VJFLXKL6TMJM3OJJYLEI7RZOAG
X-Message-ID-Hash: LI6KY3VJFLXKL6TMJM3OJJYLEI7RZOAG
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI6KY3VJFLXKL6TMJM3OJJYLEI7RZOAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 15, 2023 at 10:34=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SSI block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-ssi" compatible string will be used on the RZ/Fiv=
e
> SoC so to make this clear and to keep this file consistent, update the
> comment to include RZ/Five SoC.
>
> No driver changes are required as generic compatible string
> "renesas,rz-ssi" will be used as a fallback on RZ/Five SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
