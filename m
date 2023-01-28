Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8867F60E
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 09:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F77BEE7;
	Sat, 28 Jan 2023 09:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F77BEE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674893953;
	bh=o37SBcs06McsQTmu6SZUGhkix4dSCwwiXuQm9A5J7sM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sIPqghlfJnpHZ9iNlA1gWYuU8bTT56Ok+DJXhpJA82ENb+YpgirwAEq85ey98LalX
	 DUyFdKSK1id+7m4j4VlFi5nfUpgGbgGvRrfSvEHSZMktozSyWwpnKR0MpGzMi2drbR
	 PGLO4HYw2jsFzSfypmv+TQu9gRsDcn/ydxbSZG4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA404F80171;
	Sat, 28 Jan 2023 09:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FD76F802DF; Sat, 28 Jan 2023 09:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1B5F8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 09:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1B5F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Bqj2Jiku
Received: by mail-lj1-x22b.google.com with SMTP id h17so7881249ljq.4
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 00:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53nqeNoFm5cGW/b7SjrZlk+jdyxOpAxbJL7zhFYFgng=;
 b=Bqj2Jiku5i7gmtnF+rBxhhCNZ6hSlVXKz9RuTUEcPFB2SRyR7BZ4x40U1e1kAPAb0U
 A+pcQ/aU8Ebp53WyC2MWkz9gp+n7sEl+razU425ITcXy0/XnaRPuhCxzFtri38pKhcKI
 eYVoPEsTVWMuo65xRS+4mZn5PYB1QYSW8E3kvXiUZA50dfW+xwo78EM9PPraM3aZvRgG
 cX5kWbQCbfAS+IBIOXgYX6cET2FdojgS/DSXMp1XCENnVvAhPLZQ9n1CMv1eILFie3+V
 2fa1oVZaNSz4JTPdCdyoZZvI4zV83IdLaDrO00zadmttEZqkCyzFoRqP/AS9CxYsOJKC
 3oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53nqeNoFm5cGW/b7SjrZlk+jdyxOpAxbJL7zhFYFgng=;
 b=ub38SamEvzPeRU0pIoYOTW6NZ1SfPZJyCSxNLvb2Vud3twsMIQTvwNTzdgEvRMGjMF
 aCTTjKOg3dw39JCx7DR6JRnBw1rQD7jMdy6nHLxByD9ikc+QO/2qGOPgAuIA6eyRs5Cj
 Zjy626/OIaBiRgyuxpn9pC9fnCWjYLU/6R8YU2rQpX1SrXQfa6SM+2Qdq/IcM7xoZRvP
 jslszPLs7zpkr8MFjjdxe1dDwoOL0e6jgLKKBK1V4hd8RvBE/aLhC+DMlxwtsuBRVE5P
 iGYbnmXeP7dz4ajrBR+3iCASuYkStzIDmRg1UQr9QK70EJdESVbBvqKCt0AilWyJ/vFT
 DFGA==
X-Gm-Message-State: AFqh2kr+nkKQVfZB/lyMKSXkzAFATHQtkUTgPopWKevGs0yKeRbO7VE5
 hPfItT+dIetrho+4LAQV2TW0IyNxnur9RCxgbVOOzw==
X-Google-Smtp-Source: AMrXdXssLxSDXeddk6+bRROQjB6xuqS120gYZH0VMMqt1w7Ces3q+6jLsUbYVjU8C8WHNC7OZWrGFoTW8NUayh85rP4=
X-Received: by 2002:a2e:8e84:0:b0:289:ae03:644b with SMTP id
 z4-20020a2e8e84000000b00289ae03644bmr2867874ljk.66.1674893877620; Sat, 28 Jan
 2023 00:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20230115193347.24190-1-alex@shruggie.ro>
 <20230115193347.24190-2-alex@shruggie.ro>
 <Y9E7a/erXV/xd3lz@sirena.org.uk>
In-Reply-To: <Y9E7a/erXV/xd3lz@sirena.org.uk>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Sat, 28 Jan 2023 10:17:46 +0200
Message-ID: <CAH3L5QrvuRuSi_5dOHSrhe6mK0ZTM3e7BzCUfR_Dx8uxkBKdhQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: tas5720: add support for TAS5720A-Q1
 (automotive) variant
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 4:23 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Jan 15, 2023 at 09:33:45PM +0200, Alexandru Ardelean wrote:
>
> >  static int tas5720_mute_soc_component(struct snd_soc_component *compon=
ent, int mute)
> >  {
> > +     unsigned int reg, mask, val;
> >       int ret;
> >
> > -     ret =3D snd_soc_component_update_bits(component, TAS5720_DIGITAL_=
CTRL2_REG,
> > -                               TAS5720_MUTE, mute ? TAS5720_MUTE : 0);
> > +     switch (tas5720->devtype) {
> > +     case TAS5720A_Q1:
>
> This doesn't build:

My bad.
Will fix

>
> /build/stage/linux/sound/soc/codecs/tas5720.c:217:17: error: =E2=80=98tas=
5720=E2=80=99 undeclare
> d (first use in this function); did you mean =E2=80=98TAS5720=E2=80=99?
>   217 |         switch (tas5720->devtype) {
>       |                 ^~~~~~~
>       |                 TAS5720
> /build/stage/linux/sound/soc/codecs/tas5720.c:217:17: note: each undeclar=
ed iden
> tifier is reported only once for each function it appears in
> /build/stage/linux/sound/soc/codecs/tas5720.c:214:33: error: unused varia=
ble =E2=80=98va
> l=E2=80=99 [-Werror=3Dunused-variable]
>   214 |         unsigned int reg, mask, val;
>       |                                 ^~~
> cc1: all warnings being treated as errors
