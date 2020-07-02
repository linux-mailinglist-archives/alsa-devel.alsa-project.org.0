Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8927212561
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 15:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F68416E3;
	Thu,  2 Jul 2020 15:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F68416E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593698201;
	bh=7f0we9ToVtC2sB/gdoGDHjfbF4K+7/v+D6292TCX25E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCXQpLwcMxLmSVKJ4BGc5Yi9T3MEhx9G8YZBo+IL+Zyptovd5/5OvCzAy/f4L0WY2
	 GwbUJ0kD4nnEt4Y7OLn9xhBa3tYHd1py9dkH+iyH6SDB8ud2AdTSbAUn2jiUu9S5C8
	 Fwvm0G0S4J4UHslsEoNG1jh4eQHOKaLQ8pkz+mIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AFCF800C1;
	Thu,  2 Jul 2020 15:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B55F8022B; Thu,  2 Jul 2020 15:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CED6F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 15:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CED6F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TMhYWWiE"
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5619D20899
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593698090;
 bh=7f0we9ToVtC2sB/gdoGDHjfbF4K+7/v+D6292TCX25E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TMhYWWiElbIT4MnoxMMc2yeXHbclF3cBqeSF6fmbCBYSbEO+aY+CbSdySqW0V8fvo
 ycnjnEQa3WoARnXi7AxW76aPgELnTAMwpm5wPK+8fjG99FwJhNc1aX5pJatA6XlvNM
 mtsabmyslhxC/JeAOsYyqei532h0UHDIMHuRYRQ0=
Received: by mail-oi1-f180.google.com with SMTP id r8so23706891oij.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 06:54:50 -0700 (PDT)
X-Gm-Message-State: AOAM532oF5C6O9n+6VYoFbomUw7xC3kQJo0pI0o2rs1I1/aBL5UA3ANm
 eeCQW+qlU1hijvy/EtV1Igo8dQAObjlKcFtBlw==
X-Google-Smtp-Source: ABdhPJy7BdwSxiiHUlLu0FDHVe4/hH1/gMKwhpieAKy6KDx+1Ei/7xR4sh7fMT9qpGAHCKX7iWPY0s5PGl9LLdj/tRo=
X-Received: by 2002:aca:6004:: with SMTP id u4mr24951403oib.106.1593698089642; 
 Thu, 02 Jul 2020 06:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <87pnay3ptb.wl-kuninori.morimoto.gx@renesas.com>
 <20200528223916.GA804926@bogus>
 <87imgfzclq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imgfzclq.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Jul 2020 07:54:38 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+UX9c2rr+yj3E5HywhG5aWxDit1MObceVSp2UCL=MvnA@mail.gmail.com>
Message-ID: <CAL_Jsq+UX9c2rr+yj3E5HywhG5aWxDit1MObceVSp2UCL=MvnA@mail.gmail.com>
Subject: Re: Question about "xxx,yyy" style property
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On Thu, May 28, 2020 at 8:41 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> The Subject was "Re: [PATCH] ASoC: dt-bindings: simple-card: care missing address #address-cells"
>
> Hi Rob
>
> I'm trying to create v2 of simple-card patch,
> And got issue which I can't solve by myself.
>
> I think "xxx,yyy" (= which has "," at the property name)
> needs special care, but it is very un-understandable...
> Now, I'm give up.
> So, can I ask you 2 things about Yaml Doc "xxx,yyy" type property ?
>
> ========================
> 1) reference own definitions from "xxx,yyy"
> ========================
>
> I guess "xxx,yyy" naming property needs to has "description", right ?
>
> But, it is OK if it references "/schemas/xxxx"
>
>         --- OK ------
>         xxx,yyy:
>           description: xxx
>           $ref: /schemas/types.yaml#/definitions/phandle-array
>         -------------
>
> but, will be error if it references own definitions
>
>         --- NG ------
>         xxx,yyy:
>           description: xxx
>           $ref: "#/definitions/mydef"
>         -------------
>
> This is the related error
>
>         -- error(?) --
>         xxx.yaml: properties:xxx,yyy:\
>           $ref: '#/definitions/mydef' does not match 'types.yaml#[/]{0,1}definitions/.*'
>         --------------
>
> # but, there is no problem if it was defined as "patternProperties"
>
> Q. The "xxx,yyy" property can't references own definitions,
>    or needs some magical extra settings ??

No, it can't. The problem with definitions is we can't really check
and do fixups on the definitions with the meta-schema.

> ========================
> 2) phandle for "xxx,yyy"
> ========================
>
> I noticed that it seems "xxx,yyy" property can't be referenced.
> Here, "xxx,yyy" has "type: object" and "additionalProperties: false"
> (below didn't happen if it doesn't have "additionalProperties: false")
>
> If "xxx,yyy" has phandle, but not referenced,
> This is not a problem.
>
>         --- OK ---
>         ...
>         foo = <&bar>;
>         ...
>         xxx_yyy: xxx,yyy {
>           ...
>         };
>         --------------
>
> But will be error if it is referenced.
>
>         --- NG ---
>         foo = <&xxx_yyy>;
>         ...
>         xxx_yyy: xxx,yyy {
>           ...
>         };
>         ------------
>
> The error is
>
>         -- error ---
>         xxx.yaml: xxx.yyy: \
>         Additional properties are not allowed ('phandle' was unexpected)
>         ------------
>
> Q. The "xxx,yyy" needs magical settings to be referenced, or can't be ?

'phandle' (among other things) is automatically added by the tools. If
'xxx,yyy' is defined thru a 'definitions' then that fix-up is not
going to happen.

Rob
