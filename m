Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1676C79A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 09:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494FC7F4;
	Wed,  2 Aug 2023 09:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494FC7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690962955;
	bh=sNOGefDQkXeoH+QPbQ8mZhnCfgUNrCoXtsG7ySdYXvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vWL/1ljnSMFyiSFE8eHd878UXl9y7wBZGY9RRaYcKwHpyRPuK8yqhi0OCZ1iR03Ee
	 W5F6/Aeu5c9otsQq6dr/llD7xY0dNw1tKqyZtJfAZR4v/pKJd/4yh6BaCmetdw1zGq
	 lsmmvhPERjHTxUWFZelccSPBYF+z8X7IIReH2wyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD951F8053B; Wed,  2 Aug 2023 09:55:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22F67F801D5;
	Wed,  2 Aug 2023 09:55:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB65F8025A; Wed,  2 Aug 2023 09:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57165F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 09:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57165F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=A0iAhBZZ
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-522b77956d2so5404155a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690962888; x=1691567688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHFpvjYyT+C6FQOobZ/lAA4Uv30nY9VZPx6Wltel8aw=;
        b=A0iAhBZZ0MlcxykiFcmGYSIB1Kg5mGSZ4EaNgrLjv4zn7epsJlIiKZLiNLbc5RIZgk
         m4XIn1zTxuBL6PKBo12fEHSyLzMm4xZjmUKh8LT+vey0XbuMQGOMKA0b82I73oi4xv8t
         fUQi5te6+qvpNF8ENoGxzg9aEOHkDmeJyEJkg7s24+sTX5qMR53n5T1hek77Hhhjhwye
         lJAnP8PYrgEkcEBNTwQyK7HtS9kdBz2tAXwgbwbilB5qauFQVw9SAmPJ2ssAfyLRtVWf
         8Uc3mgDZuKxc3JhMQxcz4CGd661TKXFU7wAIOIdlTjogIkevBl4T+oAoswRkmRPbcsva
         xdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690962888; x=1691567688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHFpvjYyT+C6FQOobZ/lAA4Uv30nY9VZPx6Wltel8aw=;
        b=L/EpPow0x/QfTQZ84vIuFhz4SGHctFvYlJ/QQ5gZFPALV3E98/KtigkCojsnd3ypco
         JxZKC9sATJJUCVIFQc7XfqM4CEW5xIA1aSbFmNOQ8U9SKy67N6SD2C8W5mqwfSvCn7zR
         Pw7RD36XfPB4ftRJ0F0C3L/to0AWn07+8sBIUbm/Rn9OBkhU24BJW/yAqsUwWi9e2K6U
         G24LO2lIaW1qP2G4NRDEBBEadMrukbTfXZtyJf3lcjFclrEehjfXwnjo1MJ7XbHKCoUg
         qkViWqZgkL5BdqAEcfWa1ITBzxotaMgfBp6D5LFz5oH83AnMWesDsTcLp5Vvhkhy8MSq
         i22Q==
X-Gm-Message-State: ABy/qLZlwtRtxGZK5KlO0mE5lLfhj6GMd1kUcNeq0YVqiGv4gU72vMYL
	O6OG+Vxw7Lxh1i+MR6tKKUw7eqdi3twOAdIkPKw=
X-Google-Smtp-Source: 
 APBJJlG0yx6JC4dmyFUtVR6Blc8Xu31KjFmAzNdj46E9aT3WBkkf8L1wuH36ReifMBB6mhPq4O5+DeSzfm+DhQj85lI=
X-Received: by 2002:a05:6402:60e:b0:522:27c4:3865 with SMTP id
 n14-20020a056402060e00b0052227c43865mr3924074edv.41.1690962887837; Wed, 02
 Aug 2023 00:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
 <20230801082433.548206-2-daniel.baluta@oss.nxp.com>
 <87cz06uypz.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cz06uypz.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 2 Aug 2023 10:54:35 +0300
Message-ID: 
 <CAEnQRZAn2W3kD-FsUdjKR7TuYvZwkSXOKBUgwLrqDBeGXV3bFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: simple-card: Introduce playback-only/capture
 only DAI link flags
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org, robh+dt@kernel.org, spujar@nvidia.com,
	tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5IIB65ZLUQGEOL4P2744VXQOVZQLPAFY
X-Message-ID-Hash: 5IIB65ZLUQGEOL4P2744VXQOVZQLPAFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IIB65ZLUQGEOL4P2744VXQOVZQLPAFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 2:31=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> Thank you for your patch.
> This is not a big deal, but...
>
> > We need this to signal that DAI link supports only 1 direction that
> > can only be either playback or capture.
> (snip)
> > +     if (of_property_read_bool(node, "playback-only"))
> > +             is_playback_only =3D true;
> > +
> > +     if (of_property_read_bool(node, "capture-only"))
> > +             is_capture_only =3D true;
>
> More simply
>
>         is_playback_only =3D of_property_read_bool(node, "playback-only")=
;
>         is_capture_only  =3D of_property_read_bool(node, "capture-only");


Good point. Will fix in v2.

>
> > +     ret =3D asoc_simple_parse_link_direction(dev, node, prefix,
> > +                                            &is_playback_only,
> > +                                            &is_capture_only);
> > +     if (ret < 0)
> > +             return 0;
> > +
> > +     dai_link->playback_only =3D is_playback_only;
> > +     dai_link->capture_only =3D is_capture_only;
>
> It doesn't overwrite when error case, so
> More simply
>
>         ret =3D asoc_simple_parse_link_direction(dev, node, prefix,
>                                                 &dai_link->playback_only,
>                                                 &dai_link->capture_only);

Can do this because dai_link->playback_only is a bitfield.
