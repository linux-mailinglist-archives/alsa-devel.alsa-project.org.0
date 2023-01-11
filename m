Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A21665E42
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 15:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293DB6C07;
	Wed, 11 Jan 2023 15:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293DB6C07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673448425;
	bh=0ea6LWEtkEXqh+7ZkQFQUScvZQsL7MwdE5UTRBWUplc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L5uuDwcsXJ9l8cgQaOqnBkkxpdzo3a/rcPrRwQrIb5EUimvTFx+6t28+3pNwalNaW
	 lYjFMYtJkxGbtBh+25ku5IZj/kXi7vteT4EPTU8VIy1SBOSUlxU3bAvTehtxNY/MPM
	 Lctd1C6g67w1KXfcfV6W81B0THXS/AsMUfdLtp5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE3EAF8016E;
	Wed, 11 Jan 2023 15:46:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D78F803DC; Wed, 11 Jan 2023 15:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A23ADF8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 15:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A23ADF8019B
Received: by mail-qt1-f180.google.com with SMTP id z12so13852636qtv.5
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 06:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m6oGhEpGw0nlmVNW90naWw9DJiWnxock79eatbawP6o=;
 b=aFvb3jOBJkO0dFwZ8ksiOOkCQWTnURtAq6jXUJVc6b4gB9P9ehEVL1ziT2NvPK5WLL
 7Yvy1oVCHxcEd1ps+eeC2AjVCQqIxYccEHjIj0umBjysifSx07OU+rX7L2ie6s9athP6
 793uMtxjQJ7JJuguP3QfQlAIPpcQKdzWEsPOaPkAmHOwKoqm7lM/I4fr7Ooa5mFrIKHA
 UdM0pCKh58UaYMMbGNdeXQSdHG3y97JDHKMxxRtL/15qZUa5+Jan1Kw6gOCeHehU0r+K
 7V6Rp7YR/jf+EOQ8JlAIr4cOSs9ui0ZXP0rMXpYJ4V61ChF8FToubjAN9+DPoiOlwiSI
 UpFQ==
X-Gm-Message-State: AFqh2kqPiZyDtJ90McfQgM/+/abjspcgfMznCPaw2Pa6a4sONcDGyZtM
 aVtu6hJ5cLUPH0AGTB7u5pUXUxKf8uRNnA==
X-Google-Smtp-Source: AMrXdXtzXpeJ+khxQIuuwGs047wkgknBpbdGZ5jxD5xy/ARu8mfuf5CsobY70hMZ59XnvxIMNme/jw==
X-Received: by 2002:a05:622a:1e13:b0:3ab:b012:f173 with SMTP id
 br19-20020a05622a1e1300b003abb012f173mr54319701qtb.28.1673448361624; 
 Wed, 11 Jan 2023 06:46:01 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 hj4-20020a05622a620400b003995f6513b9sm7542636qtb.95.2023.01.11.06.46.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 06:46:01 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-4d19b2686a9so70281507b3.6
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 06:46:00 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr3792744ywb.384.1673448360609; Wed, 11
 Jan 2023 06:46:00 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2023 15:45:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
Message-ID: <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
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

CC DT/ASoC

On Wed, Dec 14, 2022 at 2:47 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> ALSA SoC is now supporting generic Sound Card driver such as
> Simple-Card / Audio-Graph-Card/Card2, and it supports
> "normal connection" and "special connections".
> I'm its maintainer, thus I need/want to test these.
>
> I have been tested these by using my local patches to switching card,
> but maintenance it locally is not useful for me, and users who want to
> know the sample DT settings.
>
> And I have noticed that some local patch had bug, but no one noticed
> about it (of course :)
>
> ULCB/KF is very good board to test these.
> So, I want to upstream these.
>
> One note here is that this patch *should not* have effect to
> existing normal users, but useful for test user.
> So, this patch-set adds "3 card" x "2 use case" dtsi file,
> and ulcb/ulcb-kf "include" one of them which doesn't change anything.
> test user can switch to other card or other use case by changing
> "include" dtsi.
>
> [1/8][2/8] are small tidyup patches for all SoC sound.

Thanks for your series!

I really wanted to review this earlier, but I am held back by my lack
of understanding of the audio subsystem and the audio bindings.
It is also not clear to me what really is hardware description
(i.e. to be described in DT), and what is software policy (i.e. not
to be described in DT)...
Hence I have lots of questions ("A fool can ask more questions in a
minute than a wise man can answer in an hour." ;-)

What is the difference between "Simple Audio Card", "Audio Graph Card",
and "Audio Graph Card2"?  Why do we need to support all three of them?

How come we can have no #sound-dai-cells, #sound-dai-cells = <0>,
and #sound-dai-cells = <1>, for the same hardware?
What is the real difference between Single DAI and Multi DAI?
Why do we need to support both?

> Kuninori Morimoto (8):
>   ARM: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi

The above three all describe the same hardware configuration?

>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

Is MIX and TDM Split a different hardware configuration, or software
policy?

Thanks!

>  arch/arm/boot/dts/r8a7742.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7743.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7744.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7745.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7778.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7790.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7791.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7793.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7794.dtsi                |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +-
>  .../boot/dts/renesas/salvator-common.dtsi     |   3 -
>  .../ulcb-audio-graph-card-mix+split.dtsi      |  89 +++++++++
>  .../dts/renesas/ulcb-audio-graph-card.dtsi    |  85 +++++++++
>  .../ulcb-audio-graph-card2-mix+split.dtsi     | 111 +++++++++++
>  .../dts/renesas/ulcb-audio-graph-card2.dtsi   |  26 +++
>  .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 162 ++++++++++++++++
>  .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  88 +++++++++
>  .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 177 ++++++++++++++++++
>  .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  30 +++
>  .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 137 ++++++++++++++
>  .../renesas/ulcb-kf-simple-audio-card.dtsi    |  85 +++++++++
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  66 ++-----
>  .../ulcb-simple-audio-card-mix+split.dtsi     |  86 +++++++++
>  .../dts/renesas/ulcb-simple-audio-card.dtsi   |  89 +++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi         |  60 ++----
>  34 files changed, 1212 insertions(+), 120 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
