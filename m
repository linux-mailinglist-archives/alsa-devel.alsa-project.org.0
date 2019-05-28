Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1A2CF7E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 21:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5AD91657;
	Tue, 28 May 2019 21:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5AD91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559071809;
	bh=SSJw2u1mWKqfSpnnx5jBgre6/RYn/33hgzAlohG9QR0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lySEqPrbWGWzUhT2Mtzu7Yy3Mqi7gjVk7sp5NQDpmfgEZ8IvRfdKXmm6LPn2Ag1RQ
	 bEiLROD2ZANqa0mDLZzdGvu7y8kOIEBhWtqMxbtVRJxuFyafkWKAi7kp/ifDr/YXyu
	 ca8fwvwJJkWGri1542qp4xwL0g2oexNbT4e1f/bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E683BF8072E;
	Tue, 28 May 2019 21:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D6EF896EB; Tue, 28 May 2019 21:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC474F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 21:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC474F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WMdL9ilD"
Received: by mail-ot1-x329.google.com with SMTP id i2so18870417otr.9
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oa0SvDHxdHiPETMl8LThKnStK95s6g8FUApfjZVQE5c=;
 b=WMdL9ilDOisFCpdvaQJyQENEM2rM83xm3TVgyV2KK6zUhz5mRr9l8grO6RRCWiE1Dz
 RbKkRyJ0bE35+BVJU02HwNX/O3KuStOaIxxQg6NBK0pYEu7NAuILfbk/Na2BHm4js9a4
 A6aIAf8OD8JCyrcKdEI3DeZHQcrr0PxphWAIpKTodcG8N68PkDUHj7zRnU/njwTnlJTY
 1JX2oloa/t9TJgHuB53m8M+0Nxws1H4EID9KHobBxYDh+L+hBY3OoVPnPBDun+WIMmlj
 Dm5HgFG3kL7e8CZ+spRYGzWgFlayGsxTU2V03Iipdg+THAIDEnCrk7q2cyBZ2gkMDT0D
 EY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oa0SvDHxdHiPETMl8LThKnStK95s6g8FUApfjZVQE5c=;
 b=gfMr/rXiBJWKrFIsP06uU4ECoD7hBdicYncvR8HdWJS6cnRzU6PJwIPxQpPV3sjhVx
 KtHt706oJSzOHK5vlhlLvrdhD6JnBU8ZFjpz6haj2RpwpYikJ9ixtx84TEhUrj8niQk5
 aAIFWD2t1H2cHfyqvqCrC80tdkVzR0W9pdYhpxKOZ7IlGYZr6THj9jk6WQVY3caRdi2F
 nw4f1hyT2/M0xXW/ptvueDAr9KWIDk1/SWHPxojbblZcmHZbEli/wQD0XKsxX/yOLtkn
 w4p6QSVytczP7Tlx5e6fig6tjx6fJ+mjNSJM4+Cr9qpU4dYw2ux341sfHZBXBXy2qMCd
 epTg==
X-Gm-Message-State: APjAAAVu9K+PX5bL0LxATqX21JNxsAf1WrLNV5QAXL3Io6PYUDWiY4UQ
 rIHPTOeF+VmipnqIRA1vHV520cQ5E4e6yMR20q+tpw==
X-Google-Smtp-Source: APXvYqxbMdJiN3/TNXG2ko1F/7qOhxshwx1kYj1CUsL7EFZxOG8iC23bF4kO40d1viJlsifJ2scp5uwvdODX8Hz6KL8=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr19197279otl.132.1559071695959; 
 Tue, 28 May 2019 12:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
 <s5ha7f679o6.wl-tiwai@suse.de> <58dfb36f-47ba-c62f-c39d-e05d000159b7@perex.cz>
In-Reply-To: <58dfb36f-47ba-c62f-c39d-e05d000159b7@perex.cz>
From: Connor McAdams <conmanx360@gmail.com>
Date: Tue, 28 May 2019 15:24:39 -0400
Message-ID: <CAM8Agx3cs-SbE0zw+UExnS0JVo77Q-h40sef3XesBex+2AeL9A@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Merging the new firmware files for CA0132 into
	alsa-firmware
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

Yes, I did end up getting permission from Creative themselves to
redistribute the files. That was back in November of 2018.

I also asked them to email Takashi Iwai to confirm, which I think they
ended up doing.

My contact within Creative has not responded since December of 2018,
when I asked for a name to go with the email he told me to use for the
sign-off, and I think that was why the Linux firmware people weren't
willing to accept it.

If you need any more information, let me know.

On Tue, May 28, 2019 at 3:19 PM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 28. 05. 19 v 19:47 Takashi Iwai napsal(a):
> > On Tue, 28 May 2019 18:38:48 +0200,
> > Jaroslav Kysela wrote:
> >>
> >> Dne 28. 05. 19 v 16:54 Takashi Iwai napsal(a):
> >>> Hi,
> >>>
> >>> it seems that Connor's previous attempt to put a couple of ca0132
> >>> firmware files into linux-firmware tree didn't go through,
> >>> unfortunately.  And now I'm thinking of taking them into alsa-firmware
> >>> package as a stop-gap.  We already distribute other ca0132 firmware
> >>> files, so the addition shouldn't be a big problem.
> >>>
> >>> Jaroslav, what do you think?
> >>
> >> No problem. The same situation is for the SoC SOF firmware files (drivers are
> >> in kernel, firmware files are missing). Perhaps, we can release those files
> >> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
> >
> > OK, now pushed to alsa-firmware git repo.
> >
> > BTW, the situation is slightly different from SOF.  At this time, the
> > problem was that it's been submitted by a third person.
>
> Ok, so we don't have a licence for those files? Connor, have you tried to
> contact Creative for a permission to use/distribute those files?
>
>                                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
