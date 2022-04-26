Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67EB50FE97
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 15:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65FD3174D;
	Tue, 26 Apr 2022 15:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65FD3174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650978857;
	bh=GbAT558/C+xZMex5jTrsU3lvC4ATxll0I/9EE9jqLbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdipbeiOsk7hkJ0sdR5FEt/FJuDK/UGJSWChQx89+2MuxzUuu+c0CVsvnJCX7P/GM
	 Y/zVEmFhaWny6j42Ogk5ZSdrOWgxCV4LyOdWta29nhR3xUitr9H2Lbx6BBny1m7RbQ
	 W8W9XEZ41toraKf+wRp6HyFht9wMmy/8Mj6PxKEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB4FAF80171;
	Tue, 26 Apr 2022 15:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742FBF80152; Tue, 26 Apr 2022 15:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA874F800AE
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 15:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA874F800AE
Received: by mail-qt1-f182.google.com with SMTP id f22so12507126qtp.13
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAxWWuUjNDhLgbFiNEhS4lFEmjQmipfMjJSwxa6hGCU=;
 b=77yYgFeJeBxzyTAOGZ3cD+zNW3C3o80DWPNpqp29UwP3D4FzhmDSoPMYacVoqX5ILk
 OXvBwl4WCdV46l2AKLO3GsQheEtHO2IgrqFSkbYg5jwj50U+jAMD2qTMqWbihTPRJBt7
 oil3J2daKkVeOR8kfGPqVEGphNq7gSGew8zRC7lWyI7X5arj45xFAMcr4p838ncSFy1o
 BcbfMBqXtuKKaZS9FueaniV1GVN6CrIRUpDEbQUEKr4XFPUobTAp2en5VvEFugtrkMCn
 PzUED+S70upzDyyoCpgCv2A7hBVM3tqPxup6qbdCy35pv53UCp4I+LEsTi9VgjwecDob
 Fm3A==
X-Gm-Message-State: AOAM531XmoaQcDOb8avYdKmGfWSftWc1E1u/G5/XJRApV3C6XczKsUfo
 i4DAtCQegK6in0b2aLtu4PbPHwOOvgWIMA==
X-Google-Smtp-Source: ABdhPJwhmMlVFBJnDgIvZkzj+EXcG4S1mNYzwFo6eIKQdqpSBiL3sNuI3wLiO6KiQ7MAtASTtX5OzQ==
X-Received: by 2002:a05:622a:1a19:b0:2f3:6517:70aa with SMTP id
 f25-20020a05622a1a1900b002f3651770aamr7533125qtb.60.1650978786797; 
 Tue, 26 Apr 2022 06:13:06 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 i25-20020a05620a075900b0069f70e90e6bsm1559798qki.134.2022.04.26.06.13.06
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 06:13:06 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ebf4b91212so181599157b3.8
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 06:13:06 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr18317969ywh.62.1650978785952; Tue, 26
 Apr 2022 06:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220426074922.13319-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220426074922.13319-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Apr 2022 15:12:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6WbAt6rNedz2ex31BW7gk1qtW5U1c-uQDEm1Tcd9fdQ@mail.gmail.com>
Message-ID: <CAMuHMdV6WbAt6rNedz2ex31BW7gk1qtW5U1c-uQDEm1Tcd9fdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: sh: rz-ssi: Drop SSIFSR_TDC and SSIFSR_RDC
 macros
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pavel Machek <pavel@denx.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Apr 26, 2022 at 9:49 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The mask values of SSIFSR_TDC and SSIFSR_RDC macros are incorrect and
> they are unused in the file so just drop them.
>
> Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
