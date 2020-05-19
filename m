Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE581D97DC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 15:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5655C1768;
	Tue, 19 May 2020 15:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5655C1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589895332;
	bh=coLMXIiwFAB3SjqQUq/Qm5lexdIpuR5TxU5tCYGwRLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tpDcDii5QygSBx2CVjz8R0790BvjyH0x8aLHOHSUrf1LmKYuSwEghBt2bbbaKYKlI
	 HhBAlf+HKnVAO+SMByjpcKLXSM+ChWXJxca/bdincv72r1JwoxmtHTuHtYd8foq08c
	 2zAX+llr6b9XdwxBYiRX/66MTpvZKqPW+mBbBEsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A00F8027D;
	Tue, 19 May 2020 15:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EE2F8028F; Tue, 19 May 2020 15:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB1E2F8025E
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 15:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1E2F8025E
Received: by mail-ot1-f67.google.com with SMTP id g25so5334734otp.13
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 06:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfjq0+2TvhTDPcTzKAYSuLPQPlCSitYKtY6JkPINn/o=;
 b=CzmDu/hkfyuFlg1JlpLCwFn66U6SepFg0XQRbKkLNdKkWpAUYrP+EGozqWwUROBs+t
 R1NY2a6Avn16xiwmFEt9NVDKXcQhOfWVUQoKw1rh/J1lXQysO6RLJiI5lz9xgTUrd2se
 7Esz7ZE/iJUIFgmEokHVIhuTQk4jAFp7zKUAMKbSlOfYNO5UqQ9X8hApFAD2CVYXt9Oh
 jgMB0K3Qd7bjBhWx96nI2TSsPW875Te+3BW2s4rudSbxWL8DyaaoOMZtN0lMHVqoEMnt
 0Lb2AsGsmoVB4cB27RxIzoNHPdzzOQIaVDVjmCSB7mw6IycV3bhRMfHGcwQiIcZc7CGd
 EDGg==
X-Gm-Message-State: AOAM532xQjMcWNrdNALR93ByGOtotJq3qGgqDaJvBpeXDp3wneWd6ezU
 42tJbFbsBrm9QmkuofmXf9Mc5vbCvAM8erII5qQ=
X-Google-Smtp-Source: ABdhPJyAt8NmTZFbYZI4yPgmGZfB2oiwlkINlsEI5ZmOA2fK+9EJ+dJOLJ7AaVOzaxgpBhwWAcngv4M7f+TntDTKrRI=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr15739186otp.145.1589895192859; 
 Tue, 19 May 2020 06:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200519075858.27869-1-geert+renesas@glider.be>
 <20200519124714.GA45550@sirena.org.uk>
In-Reply-To: <20200519124714.GA45550@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2020 15:33:01 +0200
Message-ID: <CAMuHMdUHHzBNFHy07hgdryJEeHUDMOCP8XauCn7TmUK7uGZcFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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

Hi Mark,

On Tue, May 19, 2020 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, May 19, 2020 at 09:58:58AM +0200, Geert Uytterhoeven wrote:
> > make dtbs_check:
> >
> >     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
>
> This doesn't apply against current code, please check and resend.

It indeed doesn't apply to your sound/for-next branch.
It does apply to robh/for-next, which has commit 9f60a65bc5e6cd88
("dt-bindings: Clean-up schema indentation formatting"), so I guess
Rob will have to take it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
