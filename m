Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBF5B4C56
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 08:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6E9169D;
	Sun, 11 Sep 2022 08:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6E9169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662877198;
	bh=vzhCA73786LnYQpkqE8DVPQmxpkvCPi4nmiZ8yXJ24c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4mgDQDHQ0zmOQmh/cvVMZw3eiNfuToqyYdu3nznjjtrEBhFkDgJ/sRgy+K+3eutG
	 RCBcaf20a4lH1jczK2WibKQN2OOCj7qJsWp58FOtBv9vQpJk6oMvAyEN4Lam2Ymmpl
	 /IcFJI6NICU5IqDz/cpQEke2awvm7yR2JzZ9GO1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA63F800B8;
	Sun, 11 Sep 2022 08:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 078E9F80256; Sun, 11 Sep 2022 08:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94370F800B8
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 08:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94370F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A6VyqIHA"
Received: by mail-lj1-x233.google.com with SMTP id s10so6345053ljp.5
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 23:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3SQ6ARj5AEZPQ9hzBXX1LuY6NZevVpcds8oqZSV1LGU=;
 b=A6VyqIHAvpcIBWeJXArr8aDsrujED0txJJa67G0vmYIaGKWXtYFZNzq1OzhSLKkkat
 0tKC0sxiekaXWlFmirrr63I5dBhySFvEwmDGAG5XDA4laqnxiSG8CB++71zHxSs6Iecn
 HJt9ivo/1/KrYQCM+33AYNjKc+yR6zWYRztQoFOl3HUcX3YQ1noqKqjRJF0Pzm0wFRVy
 UOGk9dgmQNx79D6aLFENV5Ii3iiyLEcGR5nfj7pM3POLvWxZMsIzsXCpgq6BUJEOxWPd
 Qtwiqp3IxBF4ik/LJWyf2KFEpt9FENWrWzRB25yUMuxnmdvjTZ9cUnJ8H4BjO6piqaJR
 W3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3SQ6ARj5AEZPQ9hzBXX1LuY6NZevVpcds8oqZSV1LGU=;
 b=XgqC8ExqhzkKVG12vSVb9WVm9Up/q4CbSMjtmtRowZlNRLvpt3AcEySDY2sNTv6uHz
 ZOqwZNq8aGeyuUUgUPGgGt52n20mbuUlk/rbzsoN2GCChfc0emooeNk2y+2sPCBDX38B
 PwX0AlUWO4mJVMWWhVMhiNKHgHPof/nS56CpRydOT4OKQ93MOturCTBaXHm7Edbayf0G
 7yk9jZfq9rwwxT5SNwHZ5bCmLdRndB1LNPQF1HXi6Jsa1d6GRq4CqGc2EFWBn/e8tsGd
 xOuLcbyax7xxnuclza1iSYJAi3ouV3q83ASYPghoTCdRnWmJsPmQ2k4paWXYUeg8E29m
 xB5w==
X-Gm-Message-State: ACgBeo1iukEnFnvLhcfly7fPo0TjWtNZRB3zopBPOpNKus1OGwsZgq/x
 LicSH0XObDfjk5WQ5P4vg+3L8s7r/ZIaaItaRA==
X-Google-Smtp-Source: AA6agR67C8DJEbwHBTdrZ1DtsmekyO1RC4rHisoRlv06g7S3tHpKeVg9bfFecVcU+GctpGF5gIWSFr2P93MRrEdgfmg=
X-Received: by 2002:a2e:b819:0:b0:26a:a531:da36 with SMTP id
 u25-20020a2eb819000000b0026aa531da36mr5842561ljo.141.1662877127275; Sat, 10
 Sep 2022 23:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
 <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
In-Reply-To: <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Sun, 11 Sep 2022 14:18:34 +0800
Message-ID: <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
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
9=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B 17:22=E5=86=99=E9=81=93=EF=BC=9A

> On 07/09/2022 15:03, =E7=8F=AD=E6=B6=9B wrote:
> >>> +++
> >> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yam=
l
> >>> @@ -0,0 +1,79 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id:
> http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Allwinner H6 DMIC Device Tree Bindings
> >>
> >> s/Device Tree Bindings//
> >>
> >
> > So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?
>
> You pasted the same message, so what is the modification? I wrote you a
>  search&replace pattern.
>

"s/Device Tree Bindings//"
I don't understand what you mean.

>
>
>
> Best regards,
> Krzysztof
>
