Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A591E3AC3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 09:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402D517AC;
	Wed, 27 May 2020 09:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402D517AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590565214;
	bh=bukU5Y2JeNDhw8USqAJVbTP9WF7GP/tu5Ai1G/EvfwA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBu0UtNPJ1LYra2soKU2iTK50oExgCuMO/4hAQIQIwOMaKyOnPzg14z6TvB7JLmSi
	 MhvNALTAoL5T+gCvnCJQy4QDREz9w8WlkZqQu5SrzYRVYODEWEaQymb0HXcby3Tnhj
	 URQRRvul95YVWbkIwEtCqLhK4pyRDb+B+zgPaPlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6376BF80146;
	Wed, 27 May 2020 09:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4051F8014E; Wed, 27 May 2020 09:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C9DF80146
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 09:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C9DF80146
Received: by mail-ot1-f68.google.com with SMTP id v17so18529767ote.0
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 00:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNLv5z8EKY1yuhWqFKsZJ0tNJNt2riKYrmpKQdpJCq4=;
 b=WeXGsjbWWyB/XU6kMVQjGyjcua692B+sf3F7xY1N8Lyat+NS0aO4SlXhtYva5yPxTw
 LORPAFf0SpoviOgwmcW4PKWJaug61FwlFLup/xB5o4WDXF3yVwJXI1axXfcayX91EJ5e
 nCZxOEPKaPzDgI0B7qlQW+z6FvrpykRtGAm9EEj9ozx0JUyJOWOzUQDbZjyeno0nR6zP
 m25S5HAy+M/Y32dvUv1Q0cPQ5jgX2uSAwxWoWIsX8dlPjVf02hnTYIB77pO3rAi8KI3p
 Y8RBHd8lDSN9q58HNvqIjV3XiEJymr2WoA6ml18PHaPSroeZpL/qJpytAq49zFlIQZM6
 nk1A==
X-Gm-Message-State: AOAM531Azt/5czp5LspeP2YYazRbULJmnK7k4FgCkzYaGOAhb6+0oc9O
 ybJt0YqU7xmfWyMRrPboTik886Physwyf6cFFVA=
X-Google-Smtp-Source: ABdhPJxm2iQnKGPaQ8cudthAdTY+DMCSTWHl/gI3LFICJOmziwdjskV5xtEX0AQPODgatzLU0HkSgXSO28tDFRH9NJs=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr3628517otp.145.1590565100227; 
 Wed, 27 May 2020 00:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2020 09:38:08 +0200
Message-ID: <CAMuHMdVZJoRYTohMs+Qt9oYF+2MSHVNDa56BNj6VJNnqPXPvhw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Magnus Damm <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Tue, May 26, 2020 at 11:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document RZ/G1H (R8A7742) SoC bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
