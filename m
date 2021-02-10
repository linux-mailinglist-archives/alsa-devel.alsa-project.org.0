Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C1315F8F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 07:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B3416C2;
	Wed, 10 Feb 2021 07:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B3416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612939041;
	bh=OXavdBpvyb1Dd4oqB+h0ECTg4yI3fOv5ICocqflKLWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DwipIHwc2Pl9UGJHNt2FkwRk+pgvjoUN/8hKv9tgDKe4NKpzB3HN4LiRqBMW1skqH
	 G6LL++FGVuQHOT2b5vb33Vdc0sCJy/a6XIoGarhoRgJmtJx4ECkdP6F8rZmxmU8liJ
	 ZQwAYHcfMx4lNol9j1/Wcf6UyGO8G+9h/fNDs2Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7A3F8022D;
	Wed, 10 Feb 2021 07:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E340F80165; Wed, 10 Feb 2021 07:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92ACEF80165
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 07:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92ACEF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U3TeKQmh"
Received: by mail-qt1-x834.google.com with SMTP id z22so821359qto.7
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 22:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXavdBpvyb1Dd4oqB+h0ECTg4yI3fOv5ICocqflKLWs=;
 b=U3TeKQmh4y3CaWmZxGHT2aKYLXNMmaTMhX74o7qey2Zqpli88QlRz1Xs6iuoUXdHpp
 vrDeFbsUwEWi9FKGrl/Vq8lyG/053P0M7F+3caw1kPcsncgM7m+SOqRxTLW369Uj/FFq
 A9qAxPNoHSKxxAxQ4h6PCTAT6kKIn8aoSohjxh7M15EiZ2Qlcez9KGqofJ+nPPNs1QUx
 9wUhYhnS7JNDZoy+WNsipI0nlpIZKUnH+4QuClQMepS8wOkv61BhtZ57FjpYx+xCISVn
 TLP+LLYgiCtBirVf4LfoqCjegiT3D+R7lUdUz6OYnOoczhRPL11mVNSvXNcSxevXYVoh
 +NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXavdBpvyb1Dd4oqB+h0ECTg4yI3fOv5ICocqflKLWs=;
 b=rkCOMkNn7BijMbhUiudEbdznn/VPvqFsZeA9wVVmuYcDS9vPtlx+kTuFdlxaznRgTX
 LfGDUqJEGEV/S25majH/uVjHNCmpQKx0rP9A6p974REnTUXHeC62c6/h8tXA8JHHNmUY
 wZz7kKYpgvt6U+/P7ydWhjg/3Htgw+QGvXI9HAfh8Mvq68fcFhBEIgiY8A6cR4b6SvFg
 quo1We2m+nDuCAimC6nd2J9bEc+Ha3t2HMwotFLN54QcYSaIJaiwDppKFJ5XkvHqRtTf
 EmGLzsrSI+cg1QXGkV4XYTqGNdu+NJ/7J8Yw6Yp06nFGjX+NW56LW7yEMlPL/gwoeZSZ
 ZV+A==
X-Gm-Message-State: AOAM532O32BLYx6802NITyL7TRzQxxCxILPmPm5TDQD7iZWgYThjf36A
 nJxjRIXbPQqFEs9filrUJRw0HW7jGm79HEtPrtM=
X-Google-Smtp-Source: ABdhPJxAa/ZPqVfua2S148lPQM0vsrXWY7jYa5ufize6XE/GEpwPCHJc4pF60zzqGbSqwjyqF2HO1qXRtmfQ24UTEcw=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr1460808qtv.360.1612938940598; 
 Tue, 09 Feb 2021 22:35:40 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
In-Reply-To: <20210209222953.GF4916@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Feb 2021 14:35:29 +0800
Message-ID: <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 09, 2021 at 05:16:16PM +0800, Shengjiu Wang wrote:
> > On Mon, Feb 8, 2021 at 7:53 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > hw_params() can be called multiple times and there's no need for it to
> > > be balanced with hw_free(), I'd move this to a different callback (DAPM
> > > should work well).
>
> > Which callback should I use? Is there an example?
>
> Like I say I'd actually recommend moving this control to DAPM.

I may understand your point, you suggest to use the .set_bias_level
interface. But in my case I need to enable the clock in earlier stage
and keep the clock on when system go to suspend.

I am not sure .set_bias_level can met my requirement. we start
the Chinese new year holiday now, so currently I can't do test for this
recommendation.

Maybe we can keep current implementation, can we?
Later after I do the test, I can submit another patch for it.

Best regards
Wang Shengjiu
