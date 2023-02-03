Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D00689A75
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3916C7F1;
	Fri,  3 Feb 2023 14:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3916C7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675432509;
	bh=4CRxwykjPg7aZ5YxfDUQQ24YtkXYi//ocfbhcye/EMI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jJ7X7NaNtxB/OK2CYfW+4mruAMcRJIPdOKC+jw9ZrclSc/p5J87fXHu7fuuJPQhO7
	 uflA5SuWoLkp9exW8tQoffsjQqSwbh0DPzPHG6hp4tUY7niaR3jpIpVmH3A8wf058i
	 NmACB23JzYPl9EUeUAyAMZ3rU9KpU14yPlv5duNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61C3F800E3;
	Fri,  3 Feb 2023 14:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9993F8032B; Fri,  3 Feb 2023 14:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D798EF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D798EF800E3
Received: by mail-qt1-f176.google.com with SMTP id w3so5443234qts.7
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 05:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nbKgXRRhHOsf8b2qFYqubarXiD/2JOI3CXyxQSetlOo=;
 b=fL4myU+0yLIxu9v4IDvAJg6jyKKB33J8Cm/GgWgds03PM3QdviomgBSOi4laT6oSNM
 Zyqn55uTtGZGWTfdrgrnzOoSYyg6q9ml5Vp3jpO+E+JhNihewMVFQ5BVSQcKhyFR5X0W
 wtDoXSkthXWFhCC2uurNTpEZR2Fbgi6/9j6sH2Dg22uXImREc3Gfniq9tSDt5exV4WUH
 Qm+ycw8WAHYaNoWN+puew9XZHBQuq5Q5wcW/eDryoF+NZsZ6oWZUwY0TmpSnhL04t8d2
 Xf7MdD2Oo2gAdJMrP/djxRnECGPW819iIgW7my85kpSQiC88hK6iahrk9WLh0M/E6VcR
 b5yQ==
X-Gm-Message-State: AO0yUKVs1XY8Cad9GZxWsAOshJJVR8PROofqQgAgjCxRVWHBf4+5oIi1
 VTAfORVm2K96hVo2MlzXl6ujGAdO1R4FHA==
X-Google-Smtp-Source: AK7set+2k3f6xS0oHf5ZXH+1SpjYih7cXldliHwW1Vjfqh2GcVksI4S25m/IDlSD+tI6ZKvO2fyKWA==
X-Received: by 2002:ac8:4e95:0:b0:3b8:2615:8b8a with SMTP id
 21-20020ac84e95000000b003b826158b8amr19660422qtp.44.1675432441846; 
 Fri, 03 Feb 2023 05:54:01 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05620a056d00b007208dd55183sm1815870qkp.40.2023.02.03.05.54.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:54:00 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-50e7a0f0cc8so69309557b3.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 05:54:00 -0800 (PST)
X-Received: by 2002:a0d:c2c4:0:b0:514:a90f:10ea with SMTP id
 e187-20020a0dc2c4000000b00514a90f10eamr1025067ywd.316.1675432440139; Fri, 03
 Feb 2023 05:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com> <20230203071506.GB24833@lst.de>
 <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
In-Reply-To: <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 14:53:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Laurent,

On Fri, Feb 3, 2023 at 2:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Feb 03, 2023 at 08:15:06AM +0100, Christoph Hellwig wrote:
> > So given that the big series doesn't go in, can we get this removal
> > picked up through the drm tree?
>
> Geert has a board with an ARM-based SoC compatible with this driver, and
> he expressed interest in taking over maintainership. Geert, could you
> share your plans ? Should the shmobile_drm driver be dropped now, or
> will you revive it in a relatively near future ?

(Trying to) get it working on that board is on my list...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
