Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37A41AAC1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000D816A2;
	Tue, 28 Sep 2021 10:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000D816A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632818445;
	bh=4vgPHoLHR5J37aB8fN3PEmi+MFUiyS2Zs84VroVwYpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=im3HexSpQzksriTBjFJYw0IjfnQar7wMO7C0Tv9HQBIYnMMmyZAqXb6FRlQQ34fsx
	 KWfSa/OWku5J8W1JMe4TS8N/DTbKp/oQKMrU00j1HKI0m14cjijBzNTlTA8LWtwZWl
	 xNJ1XtEExBi0I7KAjTO3pqIAl5qf7zcvXHdMbzAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B630F804BC;
	Tue, 28 Sep 2021 10:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 302BCF802A0; Fri, 24 Sep 2021 19:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEA62F80246
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 19:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA62F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IoKp49xY"
Received: by mail-vk1-xa32.google.com with SMTP id h132so4219336vke.8
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4vgPHoLHR5J37aB8fN3PEmi+MFUiyS2Zs84VroVwYpY=;
 b=IoKp49xYcO4/EuZ6e+bWpkjtqdsq1u1517lGUS1Ew229StFsXk+mSJAO4UEwL3DvC6
 KHY7bvmYxHVEFDRyA7v1LpyxOX0LgioEaMVBMpKrDZjaDFPkoCCpj4N61g/MHAFFpUFZ
 ir75v4cbVjvrz68RqZv2VndWHOSP1C5F2ou3jbl+uU0Jg1tDoP0k0Its9A47eOunTtdO
 LkvtVlCxfSl5jwJ9QCxAEtnpUkOS1jmojoLIe+At9Qu/RLaVj9UGRF6jagDRdlWBBeVA
 UAd/5Ya63QdVJMaW3hp89CB9TwnN294pRmnwjiCrEltFNJuQ/yaz0o6apDqC0HhwKIJv
 0aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4vgPHoLHR5J37aB8fN3PEmi+MFUiyS2Zs84VroVwYpY=;
 b=mZKS7RDSuleq//GD9ByL31B35RQzqVUa08NMr+v0iHkuSGgUX/LPwBQWHdLYGEBmbk
 d/OwJLRnBZPkPI7/c+vHGg88PZVszVXqlrjBarFu6N5mxWhINRl70x2NmBReyC1v1Y73
 RfPZ/566bSprbwKlLAEPs2yTkuUS3SvuQpnkN8og8gJBgwvVHS5Th5jyAxugSo+gGpMR
 0np9Ejf1CHbM+PdPf6dxX8nhfKXTUNcaOiuiwVLfhwUK5Y1d9dkPPT4mK0eBHdkBTbJy
 G+7d5FFYtlCWGHAPvXdlQSJiY3OeNkL74dxw3/rANCqU6PPpsCz6j1pg9v8Nu2ZW+GAu
 8fgw==
X-Gm-Message-State: AOAM532L57DED8C9LPql628991ObI3BPm3Rl7IKMPTnfEA467BPp2K0j
 JpqvTKULaKjwUfy4hxWWyZDKnwGGGZohGvPST08=
X-Google-Smtp-Source: ABdhPJyEOKkE+EZT+y+of+PkcwSf0fYp6EMqhRuv+NoPy8EO/0ay7VM8BXMSo/MXmdWEWXzA1M1B8SWi6pNS9wUU3Kc=
X-Received: by 2002:a1f:2e57:: with SMTP id u84mr9299393vku.16.1632503761741; 
 Fri, 24 Sep 2021 10:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
In-Reply-To: <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Fri, 24 Sep 2021 11:15:35 -0600
Message-ID: <CAJfuBxxAEXnPxY-nx4JEe+fzH7J+nLYzD9zLCSzgjViBHsQbPA@mail.gmail.com>
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

On Fri, Sep 24, 2021 at 10:58 AM Muni Sekhar <munisekharrms@gmail.com> wrot=
e:
>
> On Fri, Sep 24, 2021 at 10:02 PM Valdis Kl=C4=93tnieks
> <valdis.kletnieks@vt.edu> wrote:
> >
> > On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > > What small projects would you suggest to a novice with the ALSA
> > > kernel. The aim is to develop a familiarity with the ALSA kernel
> > > source code, and also to submit it for academic purposes.
> >
> > A good place to start is getting a good handle on what the phrase "the =
ALSA
> > kernel" even means.
> Basically looking for kernel space audio subsystem projects rather
> than its user-space library(alsa-lib) and utilities(alsa-utils).

why ?
if your interest is better sound, then improving user-space is going
to be more productive.

also, theres now pipewire, which is new, and all the buzz.
its apparently the future of linux audio


> >
> > There's the Linux kernel, a small corner of which is the ALSA subsystem=
 for
> > sound.
> >
>
>
> --
> Thanks,
> Sekhar
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
