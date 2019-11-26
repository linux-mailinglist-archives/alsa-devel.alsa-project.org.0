Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8F10A13E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 16:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D61B3174A;
	Tue, 26 Nov 2019 16:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D61B3174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574782419;
	bh=8q8tOR/x/0duaGVdExPjJwVGwxr7ngGGE1cxL1AqNyo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjdlWGztsin1JUfDAs6UZb/Do+2hZGKzMkqxupkKdP67rh+LitDY8IECBgOYAJgBj
	 JMbzeGPEhPRnB9YevWohLcmGBk425WIx40K3tWE80y45hTBkjnWa/4pXUiYk1tzYEM
	 jf1sx/haHyNBgiM0WSbdaW9M2tHTpnO0czyFKMgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 697F5F801F2;
	Tue, 26 Nov 2019 16:31:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CBC3F80159; Tue, 26 Nov 2019 16:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDC4FF800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 16:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC4FF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QdUmBXx7"
Received: by mail-wm1-x341.google.com with SMTP id t26so3819570wmi.4
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c24+1DNjPcWIC0MiLXdDtbzMNdrrUZ0eht/NyiN4IxU=;
 b=QdUmBXx7qSfz+1BimuODpj9N411xZEoMjNRlGlSx5smgvWpbaCukCoS+UN3xmGQmXo
 aQp97/YNfrPHaj/1z9jBrYAv6IvnVPl4oDaawKpSXBhDdf7M9883EDS9TPKu5yQj0a6C
 L1z7ecXbGxnmTr3TS9tOg3XESTbhF6O2AmM8PyBPzN16qMDb8jo4VO0LEKLhmfePSFZT
 NnmHTqHNYgk70vYwDOBVPyKaqnd5UwOk6S4sJ3Z74FsLd3BkY/HlIVqHscJyRi7Tf5J5
 X6e1JnFq8EpPpEflnnI6HC3+yEHc+OVSf+v1y0IWTydj4BccSNBCt+3W+qO9Q2W+Gz6j
 +Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c24+1DNjPcWIC0MiLXdDtbzMNdrrUZ0eht/NyiN4IxU=;
 b=tS7PRe0hV7kusjWDDtJP2PWdRumncP15oXqyOaepFiqm/Z8g15Xc3qTEpvMPhFZFPj
 8IcaM8rVeMwYrHVrDtP/XagSNPOlQBHohV5bmp1rbyzRG6B1rcAHd0hrnsvTxTk4sDO/
 oKlLCC205JDDa1Ymjb5B1mq7dM5dRqsX6zHx/HFkihW1VoUkwv8zN8QkkOBm61CyR9Kd
 uL7O5WhhZflUi5gDhaEfmkZiryycE/RhKRQFz4TFoiIUDAuc/r5QCpVmkFRTLnIj++6V
 L/6VtyMQGSASqV0VGtzuANAobrtDOepMv78YFr68rKwBXNLOu/Z1WXPqdE+E+BZ1o++P
 pTaA==
X-Gm-Message-State: APjAAAWEbmm0aYW0u05TDEO9aNz+ikOK6CeXppnPL1QY477mO9bsfVSU
 PvzZh+QJxsOvmcHJzucgpSVW467itrSoWiinxck=
X-Google-Smtp-Source: APXvYqzkXe+X0XUib6quFDO7rfiSaylagTK2BZOFZ7wF1C0ldC2ZhkCvBezA5ES/JVVM8SE7g+dWHXld+Y2y3IT6Vvs=
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr4909104wml.102.1574782310500; 
 Tue, 26 Nov 2019 07:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20191122214353.582899-1-alexander.deucher@amd.com>
 <s5hblt30y3j.wl-tiwai@suse.de>
 <CADnq5_P7UA62+OfY+5q7re7na2V2Bc9_7XvZ3d5T9ovjMJVuLQ@mail.gmail.com>
 <s5hv9r6y9h6.wl-tiwai@suse.de>
In-Reply-To: <s5hv9r6y9h6.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 10:31:37 -0500
Message-ID: <CADnq5_NOfEHUC6nujDK_eCHuRYd2eA5XMj8vjnw77s_hoc_Pww@mail.gmail.com>
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

On Tue, Nov 26, 2019 at 9:53 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 25 Nov 2019 15:40:43 +0100,
> Alex Deucher wrote:
> >
> > On Sat, Nov 23, 2019 at 3:57 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Fri, 22 Nov 2019 22:43:49 +0100,
> > > Alex Deucher wrote:
> > > >
> > > > These patches were originally part of a larger set of patches
> > > > to enabled runtime pm support on the GPU side[1].  However, the
> > > > patches are useful on their own there are really no dependencies,
> > > > other than the fact that you need both for runtime pm to kick in
> > > > on the GPU side.  The GPU side will be landing for 5.6; I'd like
> > > > to land the audio side as well.
> > >
> > > Do you mean that these can go into 5.5-rc1, or they need waiting until
> > > 5.5-rc1 release?  I guess these won't break things even without the
> > > runtime PM support in GPU side, as the ELD notification is done via
> > > audio component, so I'm fine to apply them at any time.
> >
> > Up to you.  I'm ok to wait for the next merge window if you'd prefer.
>
> OK, I'm going to apply them for 5.5-rc1 inclusion.
>
> BTW, should I apply these patches with your gmail address as author
> (while sign-off is AMD address)?  Or should I align both to your AMD
> address?
>
> It's nothing wrong to have different addresses in the commit, but if
> unintended, it's better to align both.

I guess my AMD address.  I usually use my gmail address for sending
patches out of laziness.

Alex
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
