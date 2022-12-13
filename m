Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE864B139
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 09:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08C218BD;
	Tue, 13 Dec 2022 09:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08C218BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670920347;
	bh=GtdNJY/MnRc1O42eHSpkxUmquIvpxN7C7Cesqr0Nlto=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bAPDdJGXdmCu/HBmadbR8iJ+VY3q25FASmxR6VmBMZFQojZv9U5JOrEXbTorsrSUE
	 TZvPh+ClE7OogSnngb39ZnYcrxPgtoumVOt4Qggx5gITWz30KYXbuLoI84/tcz4n3i
	 EZRHtZLAGCeUSc5o1TlnxHR6gF0Ufm+hHNYoF64M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 935CCF80272;
	Tue, 13 Dec 2022 09:31:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 199BCF804D6; Tue, 13 Dec 2022 09:31:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2620AF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 09:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2620AF80141
Received: by mail-qt1-f169.google.com with SMTP id z12so8301550qtv.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 00:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cj2pogcz6ykS5YOcEmS32K1/by57SG2Oy1svNLCAASY=;
 b=FJ71hENq294ZeyB5XRYOempyfm6YTjqns74fHch2126nWN3TcFdtkUwYjkQQfpX3Fc
 x5ePOTxjsDUfswSjkBEz0jwU2+jofbrn58NgykxBACxbALYHGe99Au/0PECt9jffOz4q
 iRpceoay14wejGZaG69LrAtfGLVg0iilSO8aGT5N0BzMahpJ83knxkJvEo1aAL2cEcZK
 OxW2bZQksDWxWX6iRtBQEazDumJHKyZRaK4570QfIokQL6EB6AVm+2+3QdgZOfQBfogX
 e/d6VOGkGIqwNASXo8v9fdCNpb1yyE7dmSxmzIBje6G5UxOXmd+QB6Q6g01lf7mPCJvg
 KTXg==
X-Gm-Message-State: ANoB5pmqtHUzRfKG5XUgM3XxWfiXf6nHh+KvPo0Lf9s1iMdS3ZDc4vlp
 V8kLrox2YWdULGhRDOY3kpk8hD0cbJN9Dg==
X-Google-Smtp-Source: AA0mqf6iKcOLztGjiKHS5a3yLwaNsV2qNX+pljRg5Iw7kIy2xyB41V/FZKo4wscuBCXcoZtATU04Wg==
X-Received: by 2002:ac8:6d1:0:b0:3a5:7645:c06c with SMTP id
 j17-20020ac806d1000000b003a57645c06cmr3087109qth.59.1670920284252; 
 Tue, 13 Dec 2022 00:31:24 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 bl14-20020a05620a1a8e00b006faa2c0100bsm7470654qkb.110.2022.12.13.00.31.23
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:31:23 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3bf4ade3364so182390767b3.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 00:31:23 -0800 (PST)
X-Received: by 2002:a05:690c:f8a:b0:3b4:8af5:48e with SMTP id
 df10-20020a05690c0f8a00b003b48af5048emr1614196ywb.383.1670920283214; Tue, 13
 Dec 2022 00:31:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669980383.git.geert+renesas@glider.be>
 <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
 <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mt7skwsk.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Dec 2022 09:31:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
Message-ID: <CAMuHMdVgDF=wF3Q0_QMecpmmWe1NxyK4BGTNhEvcdS5698cNmg@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio
 codec node
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On Tue, Dec 13, 2022 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: po=
rts: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinc=
trl-[0-9]+'
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm31=
68a.yaml
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: po=
rts:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was u=
nexpected)
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm31=
68a.yaml
> >    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: po=
rts:port@1:endpoint: Unevaluated properties are not allowed ('clocks' was u=
nexpected)
> >           From schema: Documentation/devicetree/bindings/sound/ti,pcm31=
68a.yaml
> (snip)
> > I'm not tested, but in my quick check,
> > we can use "mclk-fs" under "ports", and we need "clocks" under "endpoin=
t".
> > So the issue is not dtsi side, but yaml side.
> >
> > I will check and fix it, but it will be next week or later.
>
> I have investigated about this patch, and it needs extra patch
> which I will post if -rc1 was released.
> I can merge this patch (with small fixup) into my patch-set.
> Of course I will keep your name. But is it OK for you ?

Thanks, fine for me!

=E2=99=AB All I want for Christmas is =E2=99=AB... an error-free "make dtbs=
_check" ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
