Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F249441AAC2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4564716B0;
	Tue, 28 Sep 2021 10:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4564716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632818469;
	bh=rP/Y1z2irmSce/dicr31bRCJsf8MJDI/Knwjdmpjxbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qI1oaHUOKyqUpUe0UjQ2UT0W2c7WPGpLyhsKf/fKK2N4O9fNm/1zYsijNlrhbfHxB
	 DO66C3gRlDFpROuYCXqFLYqEj6qCSYChfngo5HxLVfBT86Bc7XGZloiCdcAFHZtK/U
	 MakPi3XJFHD7/z6o45E9UIi7Qy2iKETEwKZp17GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F40F3F804DA;
	Tue, 28 Sep 2021 10:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CEE8F802A0; Fri, 24 Sep 2021 20:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7223FF800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 20:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7223FF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VVtY2/s5"
Received: by mail-vs1-xe30.google.com with SMTP id y141so10982106vsy.5
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rP/Y1z2irmSce/dicr31bRCJsf8MJDI/Knwjdmpjxbc=;
 b=VVtY2/s5q5l1ZUxUs6qBojymcLmo74fTmuLnqtN/9y76NRvIqi5oYw9HXg+zbsEJLo
 P3jlg5uoRrU+3hC/zWNsOTTiARVqZCwekzr3PJ4EWMgDC9Cq2Rpi4MEanCnDbWKzUJ+z
 Lqx8li9Z2hXG5kMcgDXk8pt+UyqXHZgc3thXHdtXfiaFlnaNn/UTIsUeHyS0fGiwfHnV
 bCYSuxvVLVJDBIoIrLp9ZQGZoCQ00h5+LIm9binVV+PDGdTr69sIPqfPKh0/MD3B41wG
 FQW/Wsz6hhQFedS3WyRqLhfDYf14jBqGMtx/GO9aGqAh1gLSGnAwUU87NyiHkQwWs1i7
 /Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rP/Y1z2irmSce/dicr31bRCJsf8MJDI/Knwjdmpjxbc=;
 b=gfDFYdJx00dmcsn5HxALzIEFqjmr48/x8z592X3xpVGEVhBwXDqOHISvv2yBk9MqUK
 8TKwM4hmFHWG4slvcxlTCXGBOvbf2eqoITiekdUN4pB4yDhb/g7OfTJUze+xiV+PM78o
 xOeX0jJZJ9HIsChEfhvlcTA2hIM0f80goZQiMdMLRBJshymqk963DTi+WWAJeInQ+hW1
 qQXjTAJ3B5uiCaRC0XX+VUTN1RNTFgPfG6xciA8Rq9l5/Awz8Sa4q0maMFHrM+ZVIa1P
 wRLZRZAWjq/twGBov16eiTgKsholpKQduDryGrg7an5Id9R01ToQCkwn5cYJLveQGc1L
 ynjA==
X-Gm-Message-State: AOAM530LUU5DllXfE1cUb3gU9r1Nnh5fVaRIAd9G7wvgIiHZy01nwYAZ
 v1QCkvuNYDfvAbnC3/GJuex0ZXnFk/g5AxbB2Ak=
X-Google-Smtp-Source: ABdhPJxzwhF5cghqM/e3cTcvDi6asH3cNebClqpB8azMEdcWpsnL9mu8BaHN+7yZfuhR/QGZKYSNv+cGds/fwqLTcrk=
X-Received: by 2002:a67:d00d:: with SMTP id r13mr11409872vsi.23.1632507810833; 
 Fri, 24 Sep 2021 11:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <CAJfuBxxAEXnPxY-nx4JEe+fzH7J+nLYzD9zLCSzgjViBHsQbPA@mail.gmail.com>
 <CAHhAz+i48QEecqQ16u2s_Y_iw6V6dJzTDzEJO+w-eTYs6rYB7Q@mail.gmail.com>
In-Reply-To: <CAHhAz+i48QEecqQ16u2s_Y_iw6V6dJzTDzEJO+w-eTYs6rYB7Q@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Fri, 24 Sep 2021 12:23:04 -0600
Message-ID: <CAJfuBxxVrbo6LyErMea8JWL0joZBrLa4Kg5r9qzwgW4JUVQvYQ@mail.gmail.com>
Subject: Re: ALSA kernel projects - for academic purposes
To: Muni Sekhar <munisekharrms@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 28 Sep 2021 10:39:26 +0200
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

On Fri, Sep 24, 2021 at 11:53 AM Muni Sekhar <munisekharrms@gmail.com> wrot=
e:
>
> On Fri, Sep 24, 2021 at 10:46 PM <jim.cromie@gmail.com> wrote:
> >
> > On Fri, Sep 24, 2021 at 10:58 AM Muni Sekhar <munisekharrms@gmail.com> =
wrote:
> > >
> > > On Fri, Sep 24, 2021 at 10:02 PM Valdis Kl=C4=93tnieks
> > > <valdis.kletnieks@vt.edu> wrote:
> > > >
> > > > On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > > > > What small projects would you suggest to a novice with the ALSA
> > > > > kernel. The aim is to develop a familiarity with the ALSA kernel
> > > > > source code, and also to submit it for academic purposes.
> > > >
> > > > A good place to start is getting a good handle on what the phrase "=
the ALSA
> > > > kernel" even means.
> > > Basically looking for kernel space audio subsystem projects rather
> > > than its user-space library(alsa-lib) and utilities(alsa-utils).
> >
> > why ?
> > if your interest is better sound, then improving user-space is going
> > to be more productive.
> >
> > also, theres now pipewire, which is new, and all the buzz.
> > its apparently the future of linux audio
> Sounds interesting. Could you please give few more pointers on how to
> start on pipewire project.
> >

https://pipewire.org/

you know everything I do now
