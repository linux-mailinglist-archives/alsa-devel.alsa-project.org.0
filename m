Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801C542787
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 09:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA94A17D1;
	Wed,  8 Jun 2022 09:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA94A17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654672042;
	bh=KtaYcbhakyitK9nPBYaB6CoOsmH2Hhx8neovDELn9QY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEcyVgE/qy+5wTd5D1yBckjiVCW+aR8JLFk4tImifT8T8BjJVBLahVwhCKpWbYTYN
	 ZRh86uos4KkHco4rr5EhDwQT1Qg85QUawveYtXScpVilcK/RafS/13W2GJd6IiGPOa
	 iUXcBFf1D2F+AU+Z799ZN5EwW/5Yc7EIrwhaEnZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D57D5F804AE;
	Wed,  8 Jun 2022 09:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BA76F804A9; Wed,  8 Jun 2022 09:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36588F8024C
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 09:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36588F8024C
Received: by mail-qk1-f179.google.com with SMTP id k6so11856520qkf.4
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 00:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F6vympKirtV/UYcPI8BombCLRkOe1GzzfEo8DO0cCHM=;
 b=3qfIK4Ktc9wWpoiRcUpd2VFSG/La65BvX1RZDcJGIS29F2XgDt0SLtvwjkM4nUQDRu
 Lymztl5YloPOWx/WLBgNX+keu+q9FkLEosoco3xvwHm5jiJMihhN0QlwlvOvaswWPu8t
 VFmFCz5MTDJq8mMPqHWPtfP6lyaDnO3U3+YlMmykvgDW+8HAt1LIOqLlUE69TMGk5lT8
 myhrqZ3/mUKCPyBLIKTvNM7kgcgFv38xKPocWRsXEe7MoG94L4WSa0dZsQG9xIOvm3rK
 t49HZ8I+mVVOBAbX+O4bqyM9C5qKQSfJzKyvRK3YgjvwfV5MHnDNpgLkZZrFziMQ2QVS
 dPiA==
X-Gm-Message-State: AOAM532TUrSVIs+zp7AgEcPXUH2V7stD26hSaohJXF5trv43EXKDHVXa
 dhJjK7InJhvo2zHDX4GawKK4xfWQT/RLrg==
X-Google-Smtp-Source: ABdhPJywaZECB5Gh6K+21Mos/X09C9IPKeQ2RmqCjl/++0hBM5zVTuXCUSj3lzb9dCoRWvF2Wlt6BQ==
X-Received: by 2002:a37:9ad4:0:b0:6a6:a7d3:56a2 with SMTP id
 c203-20020a379ad4000000b006a6a7d356a2mr15329342qke.274.1654671957567; 
 Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 h22-20020ac87456000000b00304de7561a8sm9907525qtr.27.2022.06.08.00.05.57
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id g201so7136124ybf.12
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 00:05:57 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr34496689ybu.604.1654671957151; Wed, 08
 Jun 2022 00:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jun 2022 09:05:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUGkMTkUFLnpz8b1WA+Oq7M1BrrAX2jLW14QCncpie1g@mail.gmail.com>
Message-ID: <CAMuHMdVUGkMTkUFLnpz8b1WA+Oq7M1BrrAX2jLW14QCncpie1g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Hi Morimoto-san,

On Wed, Jun 8, 2022 at 4:13 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Renesas is the only user of ak4613 on upstream for now, and
> commit f28dbaa958fbd8 ("ASoC: ak4613: add TDM256 support")
> added TDM256 support. Renesas tested part of it, because of
> board connection.
>
> It was assuming ak4613 is probed via Audio-Graph-Card, but it
> might be probed via Simple-Audio-Card either.
> It will indicates WARNING in such case. This patch fixup it.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you, this fixes the WARNING splat on Ebisu-4D.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
