Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2237F0F99
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 10:59:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D615A4A;
	Mon, 20 Nov 2023 10:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D615A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700474352;
	bh=5P4iX1pCt4fNCoExnayWFUozY5cibqaJikimPWI2k6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MpsEEaDZRvSUVgCg7Oz/iy+Pcp7lr9Y8lzEKFZOke/CjK7iYXehnvNCW/FZAA3L46
	 51E6yezhq2FKxglezLzfWGhKeMPJKtcBsB6njkP9jth+x4CU2NwfIgsguJaOo4gx+G
	 Ym92VEKaDQlKLdSjXcSu5ozAccDpDXQmYTtDyVpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8D60F8047D; Mon, 20 Nov 2023 10:58:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A975F80249;
	Mon, 20 Nov 2023 10:58:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4722BF80254; Mon, 20 Nov 2023 10:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1681F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 10:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1681F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kH3EchnJ
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548d1f8b388so600411a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Nov 2023 01:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700474289; x=1701079089;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx8KGcst8hZnUB0atywBnApo9bOB5kKeKwi0TRtSy2w=;
        b=kH3EchnJe++N0Hoo0JOEANSX/lqqSLsDawOSpBTQwDzJ5m7e2OOvFbKQXZoNwQByxx
         cvnew8Fxw0wDW2DCtfZUu62poKUL16qY9k1kzx6O7xPgAJnssCYq3GnqFigsHwm32T9G
         iuY5dm8IEZGX4aZ6wYwzcX4lsH33csvEMjozNI70mgFspMf2GPUtI9jE0dk9+fQE7D4P
         w4zcj97ZaF2TfNW8bbFVlTBmynWX9T2fxALI9/TPizvVd/60kygTEXOv2w07ta4Rd90t
         SH5fW8LDJ8AA1Gc3KzN0NVU3lWrM4pmstYs/ZV31uhTjN2MJkf5Z+w6FReSL2j/kwwhq
         33jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474289; x=1701079089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx8KGcst8hZnUB0atywBnApo9bOB5kKeKwi0TRtSy2w=;
        b=LKIu13xgABs7WSXY7VGgykGMeSxVJqpQbEJyNRIRrAHD+Ul0vtRi1KzI935fNe8u3c
         iEz0j7UF8usmEEc4942Og8oAgRHwlDmPoiEVgsXwVy9FBF3c74F2T+sbJelof6dEI+7p
         KlVNj8nb+jVsLr0NCMallECuBBPoEo5kA+oMPYzJnJOkAiDxrPJsJOiTu9iU0y4++QOj
         33vWoF38/wbUIdNXl1BKu+nSXmbbEwxnneXu3zHA4Zy0XcVuokNVjZlgKAaeH3yuvnSS
         gwKQxmlB6S1/QkeGaLNsLCChHltwhMe0xfujwDq+Mt4p7lRp9kT3Fr//6ohrdyhb4zFv
         qZ2w==
X-Gm-Message-State: AOJu0YxMyrrHBCPInR7hxxDRIH0MzkIEg+6I/06v5U3FejR0WxjF2XtC
	WwQSTaE9IZboxA6f1e2G4LFXDz61QZv4/JIjZG4=
X-Google-Smtp-Source: 
 AGHT+IGE1+uZH2w9ZEXVg+Vvn0R0pdA5KZgF+DVi3C22NcbI+PLG2Hwpgza/u8FK/NadtggaoT3ouXzwkHgGuamnAQU=
X-Received: by 2002:a50:fb0c:0:b0:53d:eca9:742e with SMTP id
 d12-20020a50fb0c000000b0053deca9742emr4790550edq.9.1700474289055; Mon, 20 Nov
 2023 01:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
 <874jhh2g8s.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874jhh2g8s.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Nov 2023 11:57:56 +0200
Message-ID: 
 <CAEnQRZBb0ZJk7aTaji-xH2jEs7QiTaoXTuS5_K-ruSaxpEnWdw@mail.gmail.com>
Subject: Re: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LNKYB7KBVVSYNAQOOHIHSM454D3RK6NO
X-Message-ID-Hash: LNKYB7KBVVSYNAQOOHIHSM454D3RK6NO
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNKYB7KBVVSYNAQOOHIHSM454D3RK6NO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Morimoto-san,

On Mon, Nov 20, 2023 at 6:36=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel, Mark
>
> > We can specify DAI id using reg property. When dts
> > node has only 1 DAI simple-card always assumes that DAI id is 0.
> >
> > But this is not correct in the case of SOF for example which adds DAIs
> > staticaly (See definition of snd_soc_dai_driver in sound/soc/sof/imx/im=
x8m.c)
> (snip)
> > -     args.args_count =3D (of_graph_get_endpoint_count(node) > 1);
> > +     args.args_count =3D (of_graph_get_endpoint_count(node) >=3D 1);
>
> If my understanding was correct, for example you want to use 2nd DAI
> but your DT has only 1 port (thus, it is using reg property) ?

Yes.

>
> Current simple utils is assuming (1) DT has all DAI settings, (2) having
> reg property is option.
>
> But current DT requests reg property.
> So maybe it is good time to remove non-reg-property support ?

I have no problem removing non-reg-property support. This will work
for me. Will later send a patch.

I want to understand how current non-reg-property support works.

I'm looking at commit 73b17f1a65c881fc ("SoC: simple-card-utils:
support snd_soc_get_dai_id()").

So, the reg property was introduced for cases where we can have ports
of different types? E.g
In the case of HDMI we can have Audio ports and Video ports? And we
need reg property in order
to get the correct DAI id?

I don't understand how DAI id is currently computed if we don't  have
the reg property and also
we have Non HDMI sound case:

Here is the code:

=C2=BB       /*
=C2=BB        * Non HDMI sound case, counting port/endpoint on its DT
=C2=BB        * is enough. Let's count it.
=C2=BB        */
=C2=BB       i =3D 0;
=C2=BB       id =3D -1;
=C2=BB       for_each_endpoint_of_node(node, endpoint) {
=C2=BB       =C2=BB       if (endpoint =3D=3D ep)
=C2=BB       =C2=BB       =C2=BB       id =3D i;
=C2=BB       =C2=BB       i++;
=C2=BB       }

=C2=BB       of_node_put(node);


So, this code assumes that the DAI id is exactly the number of the port, ri=
ght?
But this is wrong if we have a component (port) with multiple DAIs attached=
.

Daniel.
