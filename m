Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CFD50D9F3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 09:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09CE164F;
	Mon, 25 Apr 2022 09:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09CE164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650870728;
	bh=9Xt2htmeVJs0TLgtBJU6PkYxB2+izhFR1BnWRxdLjNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iySw/voInsY5Rtpfk0zcBt2dEZY4ldvALX/hH6/J4ZvSHpHJJ4vmugv6hEamKcdsZ
	 eOuutOCbhNoYn7jtPmLYp8T9VHzpmtHvmfIXt9KH4YfRknlpc1Lkp9p4F4OA+kaNMW
	 bxsbAdP+fmxRDFR7NIKDWF7S9dV8UHG/303iKbFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B10F8014B;
	Mon, 25 Apr 2022 09:11:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 422A3F8016A; Mon, 25 Apr 2022 09:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54AFAF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 09:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54AFAF800FA
Received: by mail-qv1-f44.google.com with SMTP id e17so11129431qvj.11
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UiAv8Aic2vVJVwyihga0T+23vlcl9W+2+olbQc8im/I=;
 b=Kr9rJ+PonkJyAPop89EeqR3IoVYTTPqhLOhkRktq6eGCd4C/q36D5J3GhphbPDvVgx
 L7dHizB5oEXmiTKbfAflT9frexscNS8Urpk9z1LjdSxK8cVkZLa1N1IominMPgZMKG0N
 PUgs2/QXb9lu/An9f6Ox+52hPvze6FxsrEl5gMCPNQPl8i5akq/OipXMWt1T6DQSk8p+
 UBa8DOKxRhbXe4fwiTtV+euQkoTrs2o4JYH47AKk1j6K2332O8XpSOjHdrXDCNikAXCg
 Taw61Q5XdIao65TN5w2dp2A5GujAMff9QLCRJRdwu20b1COyjs/YbISY+3M2AdL2cNAu
 zcxw==
X-Gm-Message-State: AOAM530u6LdOYcnoOsRcyH9cFEgDloM2FcikKmI1npBHTfNu1TihenYE
 hCSDy97KWheUrHrTO/98KKWAQMIh0TP23w==
X-Google-Smtp-Source: ABdhPJz8sB/xFEO1GGqRMnfsZQM43Plt/m6U3mEVcTz6EVix74H4jT+IO5YT1sNKVePazBS0mOxMbw==
X-Received: by 2002:ad4:5aed:0:b0:446:4db4:e26b with SMTP id
 c13-20020ad45aed000000b004464db4e26bmr11517786qvh.23.1650870657233; 
 Mon, 25 Apr 2022 00:10:57 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 x188-20020a3795c5000000b0069eb51aa159sm4574136qkd.108.2022.04.25.00.10.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 00:10:56 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ef5380669cso138514297b3.9
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 00:10:56 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr15122808ywi.449.1650870656410; Mon, 25
 Apr 2022 00:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 09:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOc_BskYpKnQJ-V5vo7cXuzFdW-deqDB4mquasows-8A@mail.gmail.com>
Message-ID: <CAMuHMdWOc_BskYpKnQJ-V5vo7cXuzFdW-deqDB4mquasows-8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
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

On Sat, Apr 23, 2022 at 6:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SSI block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L SoC's, so
> instead of adding dependency for each SoC's add dependency on ARCH_RZG2L.
> The ARCH_RZG2L config option is already selected by ARCH_R9A07G043,
> ARCH_R9A07G044 and ARCH_R9A07G054.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
