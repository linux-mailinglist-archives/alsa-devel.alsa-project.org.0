Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B960CCC0
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9176131E9;
	Tue, 25 Oct 2022 14:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9176131E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666702575;
	bh=XxcsCzdksKYps+zk9Z4yKnTPjORDcjGWDBSwfChSXs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUt8yJ6OotyQvpZg/vZVgpeLaoGPCvowR9Xt3zxR3y5phy8cKhZQv09YGWkArTyDB
	 Pp72jEsBQ0CLzadgduPa5cft6z9WldUlfyCE9bZ8NPurgupSNfzc0Rre13cUcU2ekE
	 MLJBJ2sBV1zaRkdoXsg0KvlPij6awCLldjWJlLGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3EFF8047D;
	Tue, 25 Oct 2022 14:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0C13F80448; Tue, 25 Oct 2022 14:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC49F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC49F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mdZvmCoI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6191DB81A9A
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 12:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0008C433D6
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 12:55:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mdZvmCoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666702507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CpyH1D/2XK23AKm0sBvO8GEEBnx0Ia1hn6gpjNKkRH0=;
 b=mdZvmCoI7sTcb6SLTN0bP54admX73iDo3rQwL6tUg1bBk9vzeE95gShW1kMLECnN9v71u0
 qbNAvMCooQsC4n6SKuNKn7rf2TB1DtUeT52+jU8q12C235/mzydrzLBOB+gXOvlWvh0dtW
 +FVkJCDhNLF8kgQTpcZWzgXOVcHFIJY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 744c75c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Tue, 25 Oct 2022 12:55:07 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id k67so10822815vsk.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:55:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf1boX/5XZx6FalojIzDKGCiB8+yf5waVuwbmStJa3z3Z12ktskZ
 XlHnSz+4VquzcDSuB+W1zLySlX/8giJqDpJSTaQ=
X-Google-Smtp-Source: AMsMyM4SLcBwHpOsukHpimIDiERGrmDNG5sM1JcAcFHIpJFL2Zkg33awQqoaxph0sE5ov1sU8J1UuTE7aA2f7VdroRA=
X-Received: by 2002:a67:c297:0:b0:3aa:3cac:97b6 with SMTP id
 k23-20020a67c297000000b003aa3cac97b6mr535993vsj.76.1666702505606; Tue, 25 Oct
 2022 05:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <202210250456.vKv5zoLb-lkp@intel.com>
 <20221025000313.546261-1-Jason@zx2c4.com>
 <87bkq0s9rw.wl-tiwai@suse.de> <Y1fRvWfcU4NT1HTU@zx2c4.com>
 <87fsfcqdbx.wl-tiwai@suse.de>
In-Reply-To: <87fsfcqdbx.wl-tiwai@suse.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 14:54:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9qkJk0vH2n7gz1XFyo-W5EMffGA6Hd4Fd8twKSRWz12nA@mail.gmail.com>
Message-ID: <CAHmME9qkJk0vH2n7gz1XFyo-W5EMffGA6Hd4Fd8twKSRWz12nA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: rme9652: use explicitly signed char
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

On Tue, Oct 25, 2022 at 2:48 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 25 Oct 2022 14:08:29 +0200,
> Jason A. Donenfeld wrote:
> >
> > On Tue, Oct 25, 2022 at 08:21:55AM +0200, Takashi Iwai wrote:
> > > On Tue, 25 Oct 2022 02:03:13 +0200,
> > > Jason A. Donenfeld wrote:
> > > >
> > > > With char becoming unsigned by default, and with `char` alone being
> > > > ambiguous and based on architecture, signed chars need to be marked
> > > > explicitly as such. This fixes warnings like:
> > > >
> > > > sound/pci/rme9652/hdsp.c:3953 hdsp_channel_buffer_location() warn: 'hdsp->channel_map[channel]' is unsigned
> > > > sound/pci/rme9652/hdsp.c:4153 snd_hdsp_channel_info() warn: impossible condition '(hdsp->channel_map[channel] < 0) => (0-255 < 0)'
> > > > sound/pci/rme9652/rme9652.c:1833 rme9652_channel_buffer_location() warn: 'rme9652->channel_map[channel]' is unsigned
> > > >
> > > > Cc: Jaroslav Kysela <perex@perex.cz>
> > > > Cc: Takashi Iwai <tiwai@suse.com>
> > > > Cc: alsa-devel@alsa-project.org
> > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >
> > > Applied now.  Thanks!
> >
> > Thanks. For this and the other patch, applied for 6.1 or 6.2?
>
> I applied for 6.2.  Was it an action that has to be fixed for 6.1?
> If so, I still can shuffle.

Well, this is code that's broken currently on ARM platforms, for
example, where char is already unsigned. So it's arguably a fix for
6.1.

(And if you're in fact not going to take it for 6.1, I'm supposed to
take it through my unsigned-char tree for 6.2.)

Jason
