Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C310A1EA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 17:21:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7AC174A;
	Tue, 26 Nov 2019 17:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7AC174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574785319;
	bh=74Loymuy3ZOo1BOeb5azUJo0h01evHRqyAU/LBTB5HI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXm40MyU7gDA2MS7U3jZQrTFDq9doma/TJYrt6uMhjjhIBALrOAnJrdHkTRBQE/0T
	 nD0CSF/PNAcckkGnSz39Jy40hLoooS/VvaK75JZCrZh/WYvd3uG4N/0lntxvVEsC60
	 757ipqKbiyHgT7dn9hEMGKow3+MCXTDzT1jnCQfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A00B4F80149;
	Tue, 26 Nov 2019 17:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC37F80159; Tue, 26 Nov 2019 17:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F66F80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 17:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F66F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CJoXRd8K"
Received: by mail-wr1-x444.google.com with SMTP id i12so23138396wrn.11
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 08:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d6gImANnL33c7hbBYAxB5G3O32nw2QjY5pFiIk1/lXo=;
 b=CJoXRd8KMueLuNzzRrr9FOwaxvji/T8hDo8Z1bG0ig4SSyjdCFVgNSnxTBa83D+XCT
 vZhYMt80Kue+iEfc7W13yiQf9PgAdmlMZwuZA+e28AvDBOcMO7p/gw2ky09jJ04QgdF+
 ka+DW99+zwt/0kpdBG+UcEqw50tdZB/dc7Zix3mrlbPtFyijgxHP61hHa1+PliF5GOWh
 HJhyRAiTky4pj52UeBBKUjUWBwGuTpa4dan0cxV6la1L2TwpBClXJFGUsLazbSXtvoFF
 btNaUWd5W2iHDSPgGEAmMfJ0WdcnGhDQG8YjPGIiEIpYDkSoGyPmYmmVESpL/Pwrsz4X
 CAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6gImANnL33c7hbBYAxB5G3O32nw2QjY5pFiIk1/lXo=;
 b=QAtgcdj2PbaKH9bYdW9wz7fe849O9Fe01x5gq/nPaT/zfz6E3mRMH5qIy6yGpFMxv/
 4TiSO53EcpFL9Vhn/K6kvHRORUMiQ3CGfu10lNao+29Vm66KRfyi5M/w8rIpMGdn0DJF
 a8OjTBPJ9FivQWWOQ60HdPmaTJTnjtHKsBPKprUraeB5LDMDWoiWiYn98nivxQV59l2b
 i+CjBDB2d6F8L9D3Ura+0AuSHVHAY31BuOWe7aI719mCxHzvLZNF9Ct1cwLVusC3RKO7
 B3xiQxjjIjVw892FHsDOLRHbN/g25Jiy/jvLUXmQN6pSn39i6DA0PDwOBFJCKFhWkldt
 RAXQ==
X-Gm-Message-State: APjAAAVbkkbG8nZdANaD84Eme4QzuyuWDs6KsQ+QbejF6F6qVjzcmMk3
 efL4KPVIa6ajjMIDz0Nb2O9eBzvjapFm7HhPHYY=
X-Google-Smtp-Source: APXvYqxLWJFNrR2i4vpczTUBUcLuuaEJnd06U1HNa2I6tT7VHf/pUv6FfYc1TsdJ7ikF0L6gPLxTFOfy9s6hsSfPz6I=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr19992367wrp.40.1574785209086; 
 Tue, 26 Nov 2019 08:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20191122214353.582899-1-alexander.deucher@amd.com>
 <s5hblt30y3j.wl-tiwai@suse.de>
 <CADnq5_P7UA62+OfY+5q7re7na2V2Bc9_7XvZ3d5T9ovjMJVuLQ@mail.gmail.com>
 <s5hv9r6y9h6.wl-tiwai@suse.de>
 <CADnq5_NOfEHUC6nujDK_eCHuRYd2eA5XMj8vjnw77s_hoc_Pww@mail.gmail.com>
 <s5hh82qy6i4.wl-tiwai@suse.de>
In-Reply-To: <s5hh82qy6i4.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 11:19:57 -0500
Message-ID: <CADnq5_N3EhOk_TFMjW-gYxUp2WA_JnJnkQY_pu99P81nrDLidA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: [alsa-devel] [PATCH 0/4] add runtime pm support for AMD display
	audio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Nov 26, 2019 at 10:58 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 26 Nov 2019 16:31:37 +0100,
> Alex Deucher wrote:
> >
> > On Tue, Nov 26, 2019 at 9:53 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Mon, 25 Nov 2019 15:40:43 +0100,
> > > Alex Deucher wrote:
> > > >
> > > > On Sat, Nov 23, 2019 at 3:57 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Fri, 22 Nov 2019 22:43:49 +0100,
> > > > > Alex Deucher wrote:
> > > > > >
> > > > > > These patches were originally part of a larger set of patches
> > > > > > to enabled runtime pm support on the GPU side[1].  However, the
> > > > > > patches are useful on their own there are really no dependencies,
> > > > > > other than the fact that you need both for runtime pm to kick in
> > > > > > on the GPU side.  The GPU side will be landing for 5.6; I'd like
> > > > > > to land the audio side as well.
> > > > >
> > > > > Do you mean that these can go into 5.5-rc1, or they need waiting until
> > > > > 5.5-rc1 release?  I guess these won't break things even without the
> > > > > runtime PM support in GPU side, as the ELD notification is done via
> > > > > audio component, so I'm fine to apply them at any time.
> > > >
> > > > Up to you.  I'm ok to wait for the next merge window if you'd prefer.
> > >
> > > OK, I'm going to apply them for 5.5-rc1 inclusion.
> > >
> > > BTW, should I apply these patches with your gmail address as author
> > > (while sign-off is AMD address)?  Or should I align both to your AMD
> > > address?
> > >
> > > It's nothing wrong to have different addresses in the commit, but if
> > > unintended, it's better to align both.
> >
> > I guess my AMD address.  I usually use my gmail address for sending
> > patches out of laziness.
>
> OK, now merged all four patches.

Thanks!

Alex

>
> thanks,
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
