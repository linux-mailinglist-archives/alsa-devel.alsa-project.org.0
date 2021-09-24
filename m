Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA619417A2F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 19:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53DA01654;
	Fri, 24 Sep 2021 19:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53DA01654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632506089;
	bh=OCrSKaoxn7+h/YEX2SAkAPa0QvVM30uVoaGnA/5yw9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkqOcsVCvGEnOVejLzBRuM21P10fmsQEu16PauE8/WVFSUopI55FIOnVCda3GWlJq
	 It07OlD15ndy7skVIqfzKgmIG4jWxChLr9aNYSbFQo9JPgDUs/2GGyZkTAmSiyT26H
	 1m5M404jefddqe5GCtYUgbWz2jPGwtYpUBJ/tgMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C0FF8025D;
	Fri, 24 Sep 2021 19:53:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5255FF802A0; Fri, 24 Sep 2021 19:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D57F800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 19:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D57F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LJGp1JRR"
Received: by mail-lf1-x136.google.com with SMTP id x27so43583767lfu.5
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OCrSKaoxn7+h/YEX2SAkAPa0QvVM30uVoaGnA/5yw9w=;
 b=LJGp1JRRJd52sfAnzqEzskxZcBvzNQYvMCTPzBH6rzc7yDcfMeai6i4zusAOasK4g1
 CwrCa3wRHN25B/02Y5j0keNrRZPEyYp1kQHpNRzlu7dB4o2EMA6UpMwQJ2/zAbwKpL8P
 MqhTfH8IFp5a45+i3DAUv9k69NEO4RV0s0fsC+huzwyzkPZgwEtO8tqsWRIcOIEJ5l/l
 j2n1pOMb0ta239n9FdOy5bSpYYqK7OiDXOQAOS3au48dXAIkrUFYqON/TgukiEvTd0jY
 DlNwLkTVAz2E02ZT1b1kogwXhwHSV70EOqH4VVpoRgZUEzier3sbgPgq2nva5Lfjkr/Y
 6oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OCrSKaoxn7+h/YEX2SAkAPa0QvVM30uVoaGnA/5yw9w=;
 b=kJhHHYGdiuTWMOYlXd/0ir8ot+HVQX7lDYGRsxeMA2JneFl/NzCp0rvvpxHm4w2P9O
 pN166myNWhnZFk5xXrv/8ZE/mG5MWJbPm4L5WbXlrMSSFlL2IlULcbINGpjQMWt/P2vu
 jZjz+Ul31nKPym0tezqQIahE/AN02Du1sacMLK2L8SUVtesQ6lP2152sDBAA2i99voYg
 8Y3H2mtkMN7u/v60gkgKUA8RLs2MOVTUIXWyQKKLD7HLmnXPl9DPbBTS5wkX1Mf+7oL+
 rDEGVpFPPlkJMtpZ5EjLDceKYGj8U57KMF7qyHeGqjpZg/fQeDXeNTZoV+Ffsx+pE7Sf
 1x1A==
X-Gm-Message-State: AOAM530gB1or+b9U9ymEJ/ADhLAYB183oPNLLVk/Pw1N/bKiA5Emln4b
 UQbqh4oixKPotWeutHRo+6mgxaeWPm7Byg/QMLc=
X-Google-Smtp-Source: ABdhPJz4EcLzFgdQs0vIsPdTg8bdcV5AppV8KyZEhA33YwhLyUzuMeF+yKZ0ty+JxxfX8Aityt3JWnndd1ss8e265wo=
X-Received: by 2002:a05:651c:54d:: with SMTP id
 q13mr12454423ljp.526.1632505996857; 
 Fri, 24 Sep 2021 10:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <CAJfuBxxAEXnPxY-nx4JEe+fzH7J+nLYzD9zLCSzgjViBHsQbPA@mail.gmail.com>
In-Reply-To: <CAJfuBxxAEXnPxY-nx4JEe+fzH7J+nLYzD9zLCSzgjViBHsQbPA@mail.gmail.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 24 Sep 2021 23:23:05 +0530
Message-ID: <CAHhAz+i48QEecqQ16u2s_Y_iw6V6dJzTDzEJO+w-eTYs6rYB7Q@mail.gmail.com>
Subject: Re: ALSA kernel projects - for academic purposes
To: jim.cromie@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Fri, Sep 24, 2021 at 10:46 PM <jim.cromie@gmail.com> wrote:
>
> On Fri, Sep 24, 2021 at 10:58 AM Muni Sekhar <munisekharrms@gmail.com> wr=
ote:
> >
> > On Fri, Sep 24, 2021 at 10:02 PM Valdis Kl=C4=93tnieks
> > <valdis.kletnieks@vt.edu> wrote:
> > >
> > > On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > > > What small projects would you suggest to a novice with the ALSA
> > > > kernel. The aim is to develop a familiarity with the ALSA kernel
> > > > source code, and also to submit it for academic purposes.
> > >
> > > A good place to start is getting a good handle on what the phrase "th=
e ALSA
> > > kernel" even means.
> > Basically looking for kernel space audio subsystem projects rather
> > than its user-space library(alsa-lib) and utilities(alsa-utils).
>
> why ?
> if your interest is better sound, then improving user-space is going
> to be more productive.
>
> also, theres now pipewire, which is new, and all the buzz.
> its apparently the future of linux audio
Sounds interesting. Could you please give few more pointers on how to
start on pipewire project.
>
>
> > >
> > > There's the Linux kernel, a small corner of which is the ALSA subsyst=
em for
> > > sound.
> > >
> >
> >
> > --
> > Thanks,
> > Sekhar
> >
> > _______________________________________________
> > Kernelnewbies mailing list
> > Kernelnewbies@kernelnewbies.org
> > https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies



--=20
Thanks,
Sekhar
