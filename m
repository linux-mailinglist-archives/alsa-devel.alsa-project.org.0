Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1745C961
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 17:00:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB8A17AA;
	Wed, 24 Nov 2021 16:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB8A17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637769612;
	bh=4tfCpgIIyHadTHjj0WlZd4H6STeE7N8SpeoyvEWND5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PmIleKZ6Bt/NQsDPNffe59YLxBvEiDEBat5bTM89iLGJ7Kn6kwdSg1PTg4jyJjgQ4
	 sHbnys4RxYjQosbIJZqbEvVqLuNqbOv6LjLZ5QSOo+kDMrpXQL+4PZG8lrBWcpv9sl
	 ObuOReqc/086DtnlnK8MoDUSkiHV6cSBuXBlLaAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1474FF80212;
	Wed, 24 Nov 2021 16:58:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE306F801F7; Wed, 24 Nov 2021 16:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8E90F8013A
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 16:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E90F8013A
Received: by mail-ua1-f45.google.com with SMTP id n6so6143951uak.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 07:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ptv6aIhfTWN4MeV+ze8LFVjMsNdx8UNG/X8//1/4PrE=;
 b=12oqB5M0jAlB14TA1dcr2V30uQkZBiGSCk6WR9bVousghIrl04iSALt0UQV4P4BIas
 +MA8JERr7BV5bzMDQZ0rNC8r9jNbzdB5XBQPpvVrapOk/N5QVh0IUaCcXLhIwzAxTLWi
 2UFUv3+0QewM41TG3f5QlAJHcegXGcy6yR2iel2tFU4YKY+VgJuAN/pYL5Ue2Uu1j4a0
 R446SdYE0M/TGtPx9E+Ir7HAogGewvVIKNXCNDJJVEYkRLU9SetKsHlUyl6y9WBnlafN
 0blAbR3cM1qyaDoTKKz0W5u+97kj7GzW5LfD0+Xi8wpYKS23dfC1E5u3lqIogaw3gqxi
 VoBg==
X-Gm-Message-State: AOAM5329/c8LPwirjyXHDDweAvw6NCxjYX+skj0GI1MuIxFn17Yeu56m
 2VsdZ6uXF3EyV7sq6lNOtYCk/DFxNpVnHQ==
X-Google-Smtp-Source: ABdhPJxHiL8/91gFGO9urDPULakSBKbPtkkJbNaWX3VGCk2HINEAYAdob8ND7jHNb6iCNfmngyF0/Q==
X-Received: by 2002:a05:6102:94b:: with SMTP id
 a11mr26354360vsi.39.1637769522084; 
 Wed, 24 Nov 2021 07:58:42 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id w2sm106621vsw.29.2021.11.24.07.58.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 07:58:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id o1so6098865uap.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 07:58:41 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr12046695uai.89.1637769521047; 
 Wed, 24 Nov 2021 07:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20211124155101.59694-1-david@ixit.cz>
In-Reply-To: <20211124155101.59694-1-david@ixit.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Nov 2021 16:58:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4c1CMc_GzORTN-j1j3LZ0jui=h2RDVoVVMQmXfOuAmQ@mail.gmail.com>
Message-ID: <CAMuHMdU4c1CMc_GzORTN-j1j3LZ0jui=h2RDVoVVMQmXfOuAmQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,
 wm8962: add missing interrupt property
To: David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: Rob Herring <robh@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, - <patches@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, ~okias/devicetree@lists.sr.ht
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

On Wed, Nov 24, 2021 at 4:51 PM David Heidelberg <david@ixit.cz> wrote:
> Both, hardware and drivers does support interrupts.
>
> Fix warnings as:
> arch/arm/boot/dts/tegra30-microsoft-surface-rt-efi.dt.yaml: audio-codec@1a: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
>
> Fixes: cd51b942f344 ("ASoC: dt-bindings: wlf,wm8962: Convert to json-schema")
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
