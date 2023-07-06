Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C0749BB2
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 14:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D43D210;
	Thu,  6 Jul 2023 14:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D43D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688646578;
	bh=kRZhbctXGs1rz4KZ8SKhER1b2KLFWVBqX/XUAQVGayE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X6YgzB6CWdlE3xmrjcUCV0NbeO0ofTHPbZ7Z2JtmirDDEPQQ3eE7/ooOmogn0gbS1
	 mAuxrpyHnV2M1Le56XePNDM6xpbWo86bQod6GaIX4zaMAGVagSVAQCZS5gxvAs/e5W
	 pt8tZ0ZUQNOUJeXh5gtYcEVHSFQGUKdMCgrcbqRY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD4F8F80544; Thu,  6 Jul 2023 14:28:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38291F80100;
	Thu,  6 Jul 2023 14:28:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF94F80125; Thu,  6 Jul 2023 14:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A1BEF80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 14:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1BEF80093
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-57a551ce7e9so395127b3.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 05:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688646511; x=1691238511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aF033wdSvhE6en0dVjojudzrpib3grbe9zdW84Y321c=;
        b=a0ly3NTL5hdWggazH5BgOav2ETgLR3jD+9jGB2Dwo1f24JQCJHRDqMKwkFx2q/3Grt
         RcqT0vkXyR8h9bo0HjP356ahxqLv4uFBTV0Qvmrz90xZHyJWAZx+f+YjQZrywRB1qU6o
         togfXD4SbkHGKVm0euGIR/2rFKQe8mZc3AQGwHu8p/Aawyz0Iazs5Fp1+q1Y7wI9rZVa
         6UGK9/BhydwCDmGzpzaSy9FTsFc2a68zXjQCBHtFJiG3v5LgRAdgxrMu4LG3kUA4lvLU
         Dtk10yEVJ4fSOLEsL4QH0v595ck4qyiy0M7X3SYOETc/ZBqZdkipwTcfL8xZdeMBo0lE
         9dCA==
X-Gm-Message-State: ABy/qLa4YZ0Gx4lb2Ps5sOvpMHcT99p5XY0/mwpg1coL/zCOabSgEWIC
	pnIIZm8iz2QaklKysUBilM77Mx2kHYzqVg==
X-Google-Smtp-Source: 
 APBJJlF5k7sI8MHeMzHiQ7NR/e6Yuw0Wgz0CQ/YPrvrBdRvJYtxgI0vq0+i/eU+aVHjjlr4qw0ZkzA==
X-Received: by 2002:a0d:e6d3:0:b0:57a:1863:755c with SMTP id
 p202-20020a0de6d3000000b0057a1863755cmr1943431ywe.15.1688646511449;
        Thu, 06 Jul 2023 05:28:31 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id
 a62-20020a0dd841000000b0054f9e7fed7asm306049ywe.137.2023.07.06.05.28.30
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:28:30 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bacf685150cso643822276.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 05:28:30 -0700 (PDT)
X-Received: by 2002:a25:a564:0:b0:c5d:cce7:bc9b with SMTP id
 h91-20020a25a564000000b00c5dcce7bc9bmr1665282ybi.34.1688646510743; Thu, 06
 Jul 2023 05:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688643442.git.geert@linux-m68k.org>
 <7519324a34015e1c046227269409fef688889f4f.1688643442.git.geert@linux-m68k.org>
 <18425cc3-9a4c-4269-aec0-3f821697bfd6@sirena.org.uk>
In-Reply-To: <18425cc3-9a4c-4269-aec0-3f821697bfd6@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jul 2023 14:28:19 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdUo-3C7AQKAstEyYsnqULQVqRsjsZye_f1aB7aLLkjciA@mail.gmail.com>
Message-ID: 
 <CAMuHMdUo-3C7AQKAstEyYsnqULQVqRsjsZye_f1aB7aLLkjciA@mail.gmail.com>
Subject: Re: [PATCH 2/3] regmap: REGMAP_SLIMBUS should select REGMAP
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DHOQHSLQBIUPBHO6DKNLWKK4E2X264TJ
X-Message-ID-Hash: DHOQHSLQBIUPBHO6DKNLWKK4E2X264TJ
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHOQHSLQBIUPBHO6DKNLWKK4E2X264TJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Thu, Jul 6, 2023 at 2:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Thu, Jul 06, 2023 at 01:42:03PM +0200, Geert Uytterhoeven wrote:
>
> > Fix this by making REGMAP_SLIMBUS select REGMAP.
>
> Why is this being done as a separate patch?

Because this is a new select, which was not handled through the
"default y" before.  [PATCH 1/3] converted only the existing ones.

> > Drop the selection of REGMAP by MFD_WCD934X, as this is not needed
> > (now both REGMAP_SLIMBUS and REGMAP_IRQ select REGMAP).
>
> This has always been redudnant, why is it mixed into this patch?

Because it is related to REGMAP_SLIMBUS selecting REGMAP.
I agree it was redundant before, as REGMAP_IRQ already selected REGMAP.

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
