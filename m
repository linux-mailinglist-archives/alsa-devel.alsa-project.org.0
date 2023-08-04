Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B1770760
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 19:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94A21E4;
	Fri,  4 Aug 2023 19:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94A21E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691171881;
	bh=GKuYHb+Bw9ERBeGoytIUGt9ZgJZFMEWqi4zEEosvufo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pb6d25wqc3HOILWQqbkMk8yEkefb9pwb1ujmUYZCce++ZOFxj0rnfVKIeEIWK1Wir
	 5F8C0gKAzQBaZ1jTzVNXSCKWCu0N/ee68F0a79j1XvgP6+BVnzWBGfa9vKtgSupaY6
	 T3fPux451EkshrTiMXB111sYTG2qGDZZc1Ni6/4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E911F80548; Fri,  4 Aug 2023 19:57:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A9E7F801D5;
	Fri,  4 Aug 2023 19:57:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3795CF8025A; Fri,  4 Aug 2023 19:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 019DCF80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 19:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 019DCF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WFvBPqPK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E930E620BC
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C785C433CB
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691171813;
	bh=GKuYHb+Bw9ERBeGoytIUGt9ZgJZFMEWqi4zEEosvufo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WFvBPqPKRBGLuR/OEsLkTMoftJc23oukOMuLFCcNYMERhBOfwI87v2GIr2xMUspGj
	 W2l947w+c+bTWwVg0oJgXk++I6whNCT5zs+SncV9l53HlPsrrSrBlGXEt4dFLYkT8v
	 YQ3w7VIn5zwIc4NrTqnhXjME/6ru41GlPkh1wUCjOzjcOF3Tg6Y53O3OxjZUzTOJi4
	 usBx625bI7TgwkeVSM5XhzhuGeyGHdnwArnXUd6DzDf78R6b9SKJYFhgHVfywF0B9J
	 USsKCr7c1n5zCFVFECoCRjub8sRqSu7/h2iv/ryrFrURHi3lvNleNADmyGfu7PUokI
	 1wGBSAj30Xw/A==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so4291283e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 10:56:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YzYBirdD8fm/oVVQWf9lFaRb/l5Rj/0CftC6uLtyntbPgZmOmm7
	W3KfQIhVu50UoRmvW2mY56+qa/8WerASUB3DoA==
X-Google-Smtp-Source: 
 AGHT+IH7fMb9Z6cQ3aYYpjloEdM4PzkFPO+YGk3G+U637LHZIPsqMU7IUBz9IA+tIyA3w6sNG/0Ti8YWQGTVGeisS8s=
X-Received: by 2002:a05:6512:4020:b0:4f8:7041:e46a with SMTP id
 br32-20020a056512402000b004f87041e46amr94034lfb.18.1691171811335; Fri, 04 Aug
 2023 10:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
 <87351wo921.wl-kuninori.morimoto.gx@renesas.com>
 <20230710151956.GA1992791-robh@kernel.org>
 <87lefn8gh9.wl-kuninori.morimoto.gx@renesas.com>
 <20230714144245.GA3492124-robh@kernel.org>
 <87zg3rxymj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zg3rxymj.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Aug 2023 11:56:39 -0600
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+mTbi-Xmaw_ScMs6zzBCGnZM2cn70HCP-On9TjevE1xg@mail.gmail.com>
Message-ID: 
 <CAL_Jsq+mTbi-Xmaw_ScMs6zzBCGnZM2cn70HCP-On9TjevE1xg@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] ASoC: dt-bindings: renesas,rsnd.yaml: add common
 port-def
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QQ6Z66X54CDXDVNIADLTMTEDKO6O3554
X-Message-ID-Hash: QQ6Z66X54CDXDVNIADLTMTEDKO6O3554
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ6Z66X54CDXDVNIADLTMTEDKO6O3554/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 19, 2023 at 5:36=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob, Mark
>
> > > > > diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd=
.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > > index 8a821dec9526..d9808b130e8d 100644
> > > > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > > @@ -9,6 +9,20 @@ title: Renesas R-Car Sound Driver
> > > > >  maintainers:
> > > > >    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > > >
> > > > > +definitions:
> > > >
> > > > $defs
> > >
> > > Hmm... many drivers are using "definitions" ?
> >
> > Patches welcome to change them. I don't think it's many (not counting
> > types.yaml). Use of "definitions" or "$defs" is an exception.
>
> I will get error if I used "$defs" instead of "definitions", like below.

Are you sure you used $defs?

> There is no error in "definitions" case.
>
> Mark
> Thus, I have no update for remainings (=3D [11/15] - [15/15]).
>
>
>         > pip3 list | grep jsonschema
>         jsonschema                     4.17.0
>         > pip3 list | grep dtschema
>         dtschema                       2023.6.1
>
>         > make dtbs_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bind=
ings/sound/renesas,rsnd.yaml
>           LINT    Documentation/devicetree/bindings
>           CHKDT   Documentation/devicetree/bindings/processed-schema.json
>         /opt/disk_cd/morimoto/linux/Documentation/devicetree/bindings/sou=
nd/renesas,rsnd.yaml:
>         Unresolvable JSON pointer: 'definitions/port-def'

Doesn't look like it. You have a ref to 'definitions/port-def'.

Rob
