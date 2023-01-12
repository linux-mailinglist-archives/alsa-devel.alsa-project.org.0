Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932366705E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:00:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE8B8A7C;
	Thu, 12 Jan 2023 11:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE8B8A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673521249;
	bh=beb/MzzbBN/Q8toWLppR6k8xkpnksJWlcfl/d+Uc/tw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=APjilXwdvxqnMvf9HBAuuhKLliabYfWhoJbusnYDbZCORAwIG0gXCN6mdnqTNHn8g
	 Rm602yGJrCzEirAbqTAwj1jB+a4zYPtG0JUiuVkGCLdp/KbHByUfkntlGQMEaSbYxv
	 Ve+bBIyJYvxUR/NIhVjitlEy2G/D/LihYir7Zesg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF00F804C1;
	Thu, 12 Jan 2023 11:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7901F804C1; Thu, 12 Jan 2023 11:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1516FF804C1
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 11:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1516FF804C1
Received: by mail-qv1-f50.google.com with SMTP id y8so12468792qvn.11
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 02:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IH7mi4pHsD5CSZenw/RrhIslHHOi1JF8tLoL2JEA6Vc=;
 b=3dobmyzopB/WK6Akex7CLFEFJgsIRRh9rnWxe7HPYoe8qDopU1b5ZikMGbcijjPryF
 l792ObSL6SWsoH/0tOdt3pDFoDceMMKi4IfeFxmQecOXivKNger5N6qRRXhvEIfzbaT0
 sGy2kh9IKM6tQDZDBtPgXyisUBOpThyFYcuz+BVRKwTt31Aa9NcvFLlbCrzn9KcoPslw
 TglcOmh+C4vjlUJXV6aEPP5Hgpga+fwWhT6HaCgSC3f0dYoToSWkjObRgLQjOV8tGI+e
 FbeDllKymyKaPX10oxtz0bDvckqERsDoOsc5C1ePAmTF9JplEDii0UH7uds4Uwgu9w8G
 jiGQ==
X-Gm-Message-State: AFqh2kqDIjQp3XNq5ouTHz/AfwqyH8QiBgYfmOnNKO5LjaAVZth6Fkqe
 RYuGtO3tNzkjvCObWYNczRAyLh+MYaLlQQ==
X-Google-Smtp-Source: AMrXdXsbSWbTkX1Sd+XSMh7ArBTf+EWrQ2f7aPT+BY+9Q3Xnig4M8xnexIRBK9wUoBbfiyin4dkfsQ==
X-Received: by 2002:ad4:4082:0:b0:531:9341:5485 with SMTP id
 l2-20020ad44082000000b0053193415485mr8057287qvp.17.1673521193308; 
 Thu, 12 Jan 2023 02:59:53 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05620a240c00b006fcc3858044sm10912067qkn.86.2023.01.12.02.59.52
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:59:52 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id d62so2055558ybh.8
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 02:59:52 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr1877621ybg.543.1673521192231; Thu, 12
 Jan 2023 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
 <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkn44ne0.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jan 2023 11:59:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
Message-ID: <CAMuHMdXPS5zToCU-C=gQB3n6=OXzmhMdtVGbCn1Vk1GtKSZGwA@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card /
 Audio-Graph-Card/Card2 dts for ULCB/KF
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On Thu, Jan 12, 2023 at 1:17 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > What is the difference between "Simple Audio Card", "Audio Graph Card",
> > and "Audio Graph Card2"?  Why do we need to support all three of them?
>
> The answer is because of "history" and "compatibility".
>
> "Simple Audio Card" was created before DT support, now it is supporting DT too.
> But it is for very simple sound connection. It is using own DT style.
>
> "Audio Graph Card" is almost same as "Simple Audio Card", but it is
> using "Of Graph" style. It is needed for HDMI support (= Sound with Video).
> "Audio Graph Card" was created because it is difficult to keep compatibility
> for both "Of Graph style" and "own style" on "Simple Audio Card".
>
> "Audio Graph Card2" is expand version of "Audio Graph Card",
> but it is supporting more complex connections.
> Because of this complex connection, it is difficult to keep compatibility
> with "Audio Graph Card".

So they are different ways (generations) of representing the audio
topology on the board? Like "operating-points" and "operating-points-v2"
for cpufreq?

Hence these are orthogonal to (and independent of) the underlying audio
hardware in the SoC?

> For normal user case, selecting one of them is very enough.
> But for me, I need to test all of them, thus I want to switch these easily.
> And ULCB is good board for testing.
>
> Basically, people don't need to care about this patch-set.
> It separates DT file, but nothing change.
> It is just easy for testing.

OK. And I guess you intend to use them as examples to point people
to, too?

> > How come we can have no #sound-dai-cells, #sound-dai-cells = <0>,
> > and #sound-dai-cells = <1>, for the same hardware?
> > What is the real difference between Single DAI and Multi DAI?
> > Why do we need to support both?
>
> It is used on "Simple Audio Card".
> We  need <0> if the board is using SSI x 1,
> and need <1> if the board is using SSI x N.
> It is not mandatory if the board is using "Audio Graph Card/Card2".

So #sound-dai-cells should be in the board DTS, and never in the
SoC .dtsi? Hence it should be moved out of
arch/arm/boot/dts/{r8a7740,sh73a0}.dtsi and
arch/arm64/boot/dts/renesas/r9a07g0{43,44,54}.dtsi?

> > > Kuninori Morimoto (8):
> > >   ARM: dts: renesas: #sound-dai-cells is used when simple-card
> > >   arm64: dts: renesas: #sound-dai-cells is used when simple-card
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
> >
> > The above three all describe the same hardware configuration?
>
> Yes, same hardware, but is using different connection style (= driver).

OK.

> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
> > >   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi
> >
> > Is MIX and TDM Split a different hardware configuration, or software
> > policy?
>
> Same hardware, but different connection (= mixing, split).
>
> Hmm, it is difficult to explain via text...

IC, this is more complicated...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
