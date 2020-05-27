Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736451E3B06
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 09:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA7B17AE;
	Wed, 27 May 2020 09:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA7B17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590566076;
	bh=NVns2tLHLWaHXU+q4M1E2ZNnBWukSvTOA4gE23MPZZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ht3+bMER0KldWFmFJzdiqrFfBLTdo4ScPW1/hWHrTXgqXmMqvOlRIOQHsYzkiSUYX
	 GJir4RE0rqpW4ImVhGjtZ3JtoIAHhGhk1nyTFZ/7KFM5RT9Ay5Yg5S7rwGitP0xT5A
	 cqvhk6TuxsoRM6Z7hd+s1z5/wbheid7wh5QDKB6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25761F8016F;
	Wed, 27 May 2020 09:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 004F1F8014E; Wed, 27 May 2020 09:52:51 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB13F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 09:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB13F800FF
Received: by mail-ot1-f67.google.com with SMTP id v17so18558498ote.0
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 00:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/vXGrBoFycwluM2P5rydMxcUoPDQRXCjdLYfWHMt+E=;
 b=kjVXxKiSy92ccFfCkNR4k3k8tOgC2LKXGdtGsAZlPP43PxdIbTC5Y2FVxbzwXV+r26
 +5ZJZ+HlfvXWjeU8t4D5nXHJf4UhTE7YavZ3uhHih/kUKs0T4EBQ6Ztl4Mp6T9pBnYjg
 qU8pOOan3KSpdx4btaA3zufmv+MDfKWFjJqcLcJrZeh75wPoQFB0hCEZ622LyDQVbgyx
 IxP7HZugOhj+PNGaoj/62qBQn4/R+Tl2XDTJKa2rWMv4pVftyOg2hHjfBISMnipsk/iL
 3CzRwrIjsfIyP9l6qR5+UJubLZXotapNMwFy7UkFH5QNNO/9YK/PFcDNv4ItjO69Hwv4
 qhBQ==
X-Gm-Message-State: AOAM531bPFSB2zzDYnGqD8bN6Np/8CYcR4e89cM7G1Iy92hUR+3Iqvni
 hClafIkCQgTmWzdCIv3rXYnaCbnVoTJhbP/h4xI=
X-Google-Smtp-Source: ABdhPJyh6XnGunqKyldUQUDAVmqdF5DZz8KnpZzyv3nLlCp4H9hrYSx91YK6xYIWALYMvjLu0Y9UEg6PEXXjbHVOKSI=
X-Received: by 2002:a05:6830:18d9:: with SMTP id
 v25mr3526020ote.107.1590565962830; 
 Wed, 27 May 2020 00:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590526904-13855-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2020 09:52:31 +0200
Message-ID: <CAMuHMdWQ5i4QiMuSEPrHC4i6fDGa2aJrKO5gzyrsc=uCCdYAhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7742: Add audio support
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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

CC Morimoto-san

On Tue, May 26, 2020 at 11:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add sound support for the RZ/G1H SoC (a.k.a. R8A7742).
>
> This work is based on similar work done on the R8A7744 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
