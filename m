Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54225B6FDD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA98175C;
	Tue, 13 Sep 2022 16:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA98175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663078976;
	bh=Kr+PtSWdxvH9wjrq0zEGykGvCnQ0rylkWttHp65XQjo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A6rZHl0dvMB9UwbYWqJ+WVYH1gGW/01ntsMIuvzQwortfOrDvFC4reB90tdopfy1N
	 FHpF/9j9ZjTk1qeFW1NZO910P9W3U1Jg/wpRoLMOckmJSz8JCdmp88+thNI6H2NYv8
	 oaD3Z3agSsu3hQ3OANqK2n2mnVp0P27SdP5PJ0uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 511BCF800FE;
	Tue, 13 Sep 2022 16:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB7DF80224; Tue, 13 Sep 2022 16:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E7EF800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E7EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ELzVg/zI"
Received: by mail-lf1-x134.google.com with SMTP id f9so19640849lfr.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=diOEEJ53pi2SIjuL7R6xdCQjJj8D2oDJp5t++EEbu6I=;
 b=ELzVg/zIxoF65RUy4tNzskEQDjbNXG4LTYTF/dnmy+7TqR+DGvkJOUTw+IGvvzLYeE
 9O8vmd9KeGT/gS5groIiIU/hlt98o2Zpvg90Dode/o21KTcy6Uc3k9oZrqMMsFq1ilR9
 zqQ5g9Wk4Wh0F1rt/JHLIs9kXeafUDPU1KQkIFNBS/1pM6SAhbmufnSAvrKVWu5moRzF
 fUSmDTlZSbQGMhPyYhmdnVp0GJsyB8S9JSXAIf54BV99ZbSFn21KMZ8v3J0G7RBQcLqv
 MlWnGSyBpHFpYJj1ZgLxYLl2fWg2EAbkwOhkgwNRGqRylShzvhhT1RrWlz7Ej5vkvdC/
 UnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=diOEEJ53pi2SIjuL7R6xdCQjJj8D2oDJp5t++EEbu6I=;
 b=U18NAR3DQVEEMF553TAdm0rF7P7++t5ZkQmtkOvbN3RaUXmsdmwF4bDZVVuSDn7hPj
 c8txd7CMIUzuk0qXfRP7tEdn8K/kijrkQekG8bDWIx4DXLTtcSxfBL6goAQ2s9JhVwub
 i/34iFlwSkPecsRIBljAifyXuBD6Tar48fWOxY60j522rCqjs0wP028FpW1BeIYN3NQm
 GoyEAP7Uvihf1apO4SFndAgs5aH4eXv6VqlnuH7BkzuBp31NujtlWlJ9SejVfnlFKef4
 IB3Kfjp2DFXykbj8HqE8HzsaC32e41RkOIbvKZrHJUgKJWJwbcFI6niHRM/lx1OG3qqe
 OXVg==
X-Gm-Message-State: ACgBeo3zCwa4mX9RJ+nCzUgJZjK12ejJWwM8Jllo2+JWRF4loe3khc+B
 Ry8WgLEzhx4OX/6iLVwlfdfPJTXyRLA2C+h/Mg==
X-Google-Smtp-Source: AA6agR53B7i8wpZHzpki4WUBgSZYhnBXyKq7i8bep9VN423Pf+riCNq+HobjieAUTmzzRcqacHoJtAAZ/EdCFXPgVGU=
X-Received: by 2002:ac2:4e66:0:b0:48c:e34c:69b4 with SMTP id
 y6-20020ac24e66000000b0048ce34c69b4mr10119082lfs.85.1663078907133; Tue, 13
 Sep 2022 07:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
 <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
 <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
 <1bfa4397-47a1-ea46-5ced-8b69fb2452c0@linaro.org>
In-Reply-To: <1bfa4397-47a1-ea46-5ced-8b69fb2452c0@linaro.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Tue, 13 Sep 2022 22:21:34 +0800
Message-ID: <CAE=m61-W2hWLk5s5+djU4oD3nUVopjjzQ6rZVsbDZdrKRKO-QQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 samuel@sholland.org, lgirdwood@gmail.com, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wens@csie.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E2022=E5=B9=B4=
9=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 21:28=E5=86=99=E9=81=93=EF=BC=9A

> On 11/09/2022 08:18, =E7=8F=AD=E6=B6=9B wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E2022=E5=
=B9=B49=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B
> 17:22=E5=86=99=E9=81=93=EF=BC=9A
> >
> >> On 07/09/2022 15:03, =E7=8F=AD=E6=B6=9B wrote:
> >>>>> +++
> >>>>
> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> >>>>> @@ -0,0 +1,79 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id:
> >> http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Allwinner H6 DMIC Device Tree Bindings
> >>>>
> >>>> s/Device Tree Bindings//
> >>>>
> >>>
> >>> So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?
> >>
> >> You pasted the same message, so what is the modification? I wrote you =
a
> >>  search&replace pattern.
> >>
> >
> > "s/Device Tree Bindings//"
> > I don't understand what you mean.
>
> It's a search&replace command from Unix tools...
>
>
> https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-=
files-in-linux-unix-shell/
>
> https://vim.fandom.com/wiki/Search_and_replace#Basic_search_and_replace
>
> Just remove that string.
>

Ok, I have released the V10 version, please review.

>
>
> Best regards,
> Krzysztof
>
