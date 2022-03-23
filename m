Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A35814E545F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 15:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355A216CA;
	Wed, 23 Mar 2022 15:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355A216CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648046354;
	bh=y7kPB+6dz+NTgOxXvHEPt4jVFLvTfCy8QOblukuN19k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDzgBPuZsyTNIAO4dvndOe//Y4X3fYnsEFMa21/B79rKmdasuOxpQ63ogr7FF83Dj
	 SeZsqOlBi26rYYN9thUzTjqxi+HyjFXy9eDa3G9gAJt0fOhjO0UICGxDvtGSuds7WB
	 b0jrb9pgGdL1br+e0Yhnqa+tI8OA/azOCAXAA9yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73841F800F5;
	Wed, 23 Mar 2022 15:38:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC66F802DB; Wed, 23 Mar 2022 15:38:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC920F800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 15:37:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC920F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mLaezqSt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 031E7B81F13
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 14:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B79C340F3
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648046276;
 bh=y7kPB+6dz+NTgOxXvHEPt4jVFLvTfCy8QOblukuN19k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mLaezqStUH26yDjyzPofJ8wgZLSXXnrZU8AVSixiSAmQ8ZPvHTO0eWSNP+5+ypecA
 yY/Dw4v84+t6Wqfi769TVna5IugBGOH7uVbOOsejDS5GmhZjFQ6geh2J43uUt6xSlM
 Yvny2Zi4mZgEVnqcEVwTpp7oVEaoyizKuxcawWC01viMl0Nny6i+kyk9kdtc+M0YLX
 K0XVQzZSOdQwFLYdNFHtbpMv/8AuJBqZ2x/C9UFVcRwB2x7xX7dYzHn33i2DRGdjwT
 T30Q3b6kYF0j/7I0GLzBi7s/5jERngdZXDGGaLE55jKsKsLyDvnR6HSb7w5C3F6XNZ
 P+pcpwJqUY/TA==
Received: by mail-ed1-f50.google.com with SMTP id c62so2091642edf.5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 07:37:56 -0700 (PDT)
X-Gm-Message-State: AOAM530qScBUjnqw7Xzj12oiUmuAJlT9CrH2UIPDW9QJylNbtyJlrh78
 fF2erIiH35rIxJLzDSm0S3z3yyUjx7vWSU9Gdg==
X-Google-Smtp-Source: ABdhPJxkYhGJZroqp0K4TQl4kYe/4WvgzJrBtElcSt4uMwnWhsfX/Dqo/ZAYg+WYAz1tvKUP7RuzhTrRC7d46flZT0s=
X-Received: by 2002:a05:6402:42c6:b0:419:276a:dded with SMTP id
 i6-20020a05640242c600b00419276addedmr488840edc.2.1648046274998; Wed, 23 Mar
 2022 07:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220303232350.2591143-1-robh@kernel.org>
 <Yjl6fP2Bylv6ud8W@google.com>
In-Reply-To: <Yjl6fP2Bylv6ud8W@google.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Mar 2022 09:37:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5GkEaE9sf5HJMaNQLkZUB_q2Qyv2rzADVD7if1MNvqg@mail.gmail.com>
Message-ID: <CAL_Jsq+5GkEaE9sf5HJMaNQLkZUB_q2Qyv2rzADVD7if1MNvqg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 - <patches@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On Tue, Mar 22, 2022 at 2:28 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 03 Mar 2022, Rob Herring wrote:
>
> > The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> > pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> >
> > Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml:=
 \
> >  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(=
pinctrl|pinmux)(@[0-9a-f]+)?$'
> > Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
> >  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[=
0-9a-f]+)?$'
> > Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
> >  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '=
^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> >
> > Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> > nothing from pinctrl.yaml schema is used, so just drop the reference.
> >
> > Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> > Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v2:
> >  - Fix lochnagar-pinctrl nodename in example
> > v3:
> >  - And fix lochnagar-pinctrl nodename in 'required'. Sigh...
> > ---
> >  Documentation/devicetree/bindings/mfd/brcm,cru.yaml         | 4 ++--
> >  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml | 6 +++---
> >  .../devicetree/bindings/pinctrl/cirrus,madera.yaml          | 3 ---
> >  3 files changed, 5 insertions(+), 8 deletions(-)
>
> Requires rebase.  Doesn't presently apply.

It's already in 5.17.

Rob
