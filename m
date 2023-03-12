Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9486B6AEF
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Mar 2023 21:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF8A141A;
	Sun, 12 Mar 2023 21:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF8A141A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678651792;
	bh=BX3JWvM/dexX9Y36MYf38c8gkb696GRMUJCOT8KIers=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gno0+eQffSSy2WYQDJrzAey85AV2YITK3Nxm7OJXA4+U9OqhcWq+LX2VXaQt9Q2Mw
	 CBAlSGkeqIypKwh90Y9DUC4D7l/a+2xKR1WAqfJGa27CR+OylhoU/c4CFQonSxXnsk
	 NyVS/9wdJU4kcqMrTKPkgpuMAaADxclcDUsr/sDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48FD0F8032D;
	Sun, 12 Mar 2023 21:09:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01360F80423; Sun, 12 Mar 2023 21:08:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CDA7F80272
	for <alsa-devel@alsa-project.org>; Sun, 12 Mar 2023 21:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CDA7F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qSqjIZy1
Received: by mail-yb1-xb2e.google.com with SMTP id g27so6024630ybe.3
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Mar 2023 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678651727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmi+J++OGCebvXG2OuteACsXG7VG8WEMmH0VAhRv8oA=;
        b=qSqjIZy125h3FNoRcrriOFeNadFlctDcytOGs+PrwpqMpRKmZZgQQcobiIcwzcmcUe
         oNeZLvnbL7M7wddMHg3nedL2yHXhT3/Fi+f5/X/yCxPtszsPbJo5ffbGgRq06/C/gJNg
         w9ZxFvYKON/0jDT0k2UB9gMj3+sSkSAVfwXZiG3+BYWFy2QqVMtsEkBZZOMx/ml1UsZy
         8VZDUiduKT52X1hvS8BNtVAUtWUGAb7W5yw8UKeb0i493JF/CzHgo7P6GUi7Ql+Pkhh5
         mMQuJgXmWSHF+v4AkkkRXxVA4ihmcbkTSy27mwjOlAvHnTkG04eqLvITKYU7EXwo/JKt
         m5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678651727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmi+J++OGCebvXG2OuteACsXG7VG8WEMmH0VAhRv8oA=;
        b=oGMkI1gl+/P+blBDakswEkm90sxDSGxGIm1edZ7HHQoqw6QstnuJ8i2HIWk304B/Xm
         +tqA0JsQys2Sy2etNrMOL74lF35oPyeKutx/vdmsZuExHc7OGnVxCJ8///WS4cRJUG2l
         s0pPi19eJEuqMbWFafgq4BYfvvwG3mjezpREw6hwsu5kSckScjIgVvGYajZRc3nz7p/6
         KrZZVVJCfNkOltPoZlSHcQT0D4+IYMLtcw60inM+NOEhWa7DQjJYuTimSlvCNt5V1gvy
         KteEmAn9JldCuUrBYd4FkOrMKy3QNJFPzDo7Qn7wL1s0k9jR/OuPnXboUl77iugc7wh7
         VQ3A==
X-Gm-Message-State: AO0yUKU2m+nGek9avn3reQbvTKzc5SVWIzzcKXsqVTOdKKQJIr4yu8Dc
	qGxdqB1rYpJ2PafqhhNeDOuD5AClojUo+PMa96s=
X-Google-Smtp-Source: 
 AK7set+6kHalpwaiIcd3v7fpFSrd6c7dAP8piuDmYsjqoY/hPg2fu8i7tGskRB1bAa2poI7EYmOdjFdiPyRigEoQq24=
X-Received: by 2002:a25:9109:0:b0:b13:7a6:f462 with SMTP id
 v9-20020a259109000000b00b1307a6f462mr5610638ybl.3.1678651726777; Sun, 12 Mar
 2023 13:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=mCAWQNFCkkCxBkDyYTLM87QdrYMYE9hpOv1fuS=bWw@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdU=mCAWQNFCkkCxBkDyYTLM87QdrYMYE9hpOv1fuS=bWw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 12 Mar 2023 20:08:20 +0000
Message-ID: 
 <CA+V-a8u4ovdBjdijGCJ3cfoQ-p=G55YwNCY-14DVfsLjCeVGcQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a07g044: Update IRQ numbers
 for SSI channels
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NNGJWMFCP3SHRNBTGHV2VHYUCBKQ53FB
X-Message-ID-Hash: NNGJWMFCP3SHRNBTGHV2VHYUCBKQ53FB
X-MailFrom: prabhakar.csengg@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNGJWMFCP3SHRNBTGHV2VHYUCBKQ53FB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Geert,

On Fri, Mar 10, 2023 at 12:05=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Feb 17, 2023 at 7:53=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > From R01UH0914EJ0120 Rev.1.20 HW manual the interrupt numbers for SSI
> > channels have been updated,
> >
> > SPI 329 - SSIF0 is now marked as reserved
> > SPI 333 - SSIF1 is now marked as reserved
> > SPI 335 - SSIF2 is now marked as reserved
> > SPI 336 - SSIF2 is now marked as reserved
> > SPI 341 - SSIF3 is now marked as reserved
> >
> > This patch drops the above IRQs from SoC DTSI.
> >
> > Fixes: 92a341315afc9 ("arm64: dts: renesas: r9a07g044: Add SSI support"=
)
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.4.
>
> > As this is is a fixes patch and we are still waiting for [0] to be merg=
ed
> > shall do the same for V2L SoC?
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/202301=
31223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> No need to send, I cloned the above with
>     s/G2L/V2L/
>     s/g044/g054/
>     s/G044/G054/
>     s/R01UH0914EJ0120/R01UH0936EJ0120/
>
> and
> Fixes: cd0339ec25895c0b ("arm64: dts: renesas: r9a07g054: Add
> SSI{1,2,3} nodes and fillup the SSI0 stub node")
>
Thank you for taking care of this.

Cheers,
Prabhakar
