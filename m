Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8573F5AF4
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E34161683;
	Tue, 24 Aug 2021 11:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E34161683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629797013;
	bh=VrTmhzRqhQN7FDGSChr3UBIlvK3tI+Ox6e9t+Z93kaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=USb+bSchi1V/hlvhL4uP/MGonodfg7xw4u/4d/nfYNWbhmMPyHJWrJQGq/XqTicvq
	 yvBxeLDRSfBv2cLpCafxY6JDJrD/Np5TDDDfqzeJwZy5CcI+SkL7Wh05Pi+5fJmh7U
	 CXTcpAk4/XC0EreD2MDz80cALuMGtJNBKfwxZF9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C8CF804FC;
	Tue, 24 Aug 2021 11:20:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBBC7F804FC; Tue, 24 Aug 2021 11:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49D78F804EC
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D78F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nZVuSx8x"
Received: by mail-lf1-x12d.google.com with SMTP id u22so43982635lfq.13
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qHor8hC28rZFjli0B0VuhOzO63SO3wlmVvXEzUNAZM=;
 b=nZVuSx8xZQD3cutlxMyHiMft/jbEs/AfzEJb8quJB2sLpeKbXwfZ7w/eYEHxB5OibG
 DKK2jPT3TsAaRXylNuFjNUkJkdwfO5zcKcNVHsml7Qj/zEPNgD3jyS/lgLnVQGw/1Y8S
 BnSGqQ9SxnY7cXckJq517MdjJ9+RLDNW4oYpNKZWxlP3cC4KL3iCpFSgPgpzCKmAWKKx
 DDJ+2QBrtcAANr7Vtx3pm2lkOtLmleqs/MPfd4GVQX8qRAIREPVemtlkOLNzlpThMQ6D
 0rVFTkirIkNSUELdeP4qGN2h1aCBdFs6wzeFg/X9d0rIOatMqhlKIH3/L+UwDRZDQVvl
 rNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qHor8hC28rZFjli0B0VuhOzO63SO3wlmVvXEzUNAZM=;
 b=gerfDXDGRP2AhECgXs+DEpKBBmjCCp9/Ms4Er59+rGMnNZNNeJKqBYl4tH99w5pQKy
 ObRr/H/N92EWQpPg+toGUHXR0cFt+aQoxG+3l2kaESgAqvU1LHRgeDkr8j+az/XDE74N
 va5WNK9Tod2+pKqEWdQ1T93xe1vO64LzLiNWuXYsIeOOlb/sKS9YN4y05LTAqrK2CUGE
 UZHzkNPTyF9vM1lDQ3IcLIq0fDrE7CPgOcRJhQsGErLGMWh4x+biJNp++9h2Z3krk7Sp
 TbDbFJcgscr4jU5SF4Pa9ICuYMwLGi7PcXXxHqZDirJT7dSeRhJXeT7vLEN7ykP+O0Ws
 GjUA==
X-Gm-Message-State: AOAM533Qu/R7gACd+kzRWTNCnJ7+e9qlBaym0JPZ7c4lb1roqvi8X0y7
 M5tfHRSV0SWW1PQdczf4E7KlTsWDGepB781Be0E=
X-Google-Smtp-Source: ABdhPJwf9j6IGjlo1BTczTWnqsQEXTHVMhM3GekrV8YvuGSJUGEm/U9I9/LExm6yQnghKuDS6/w2fQg7m6bCZCQqzEY=
X-Received: by 2002:a19:f819:: with SMTP id a25mr28137516lff.203.1629796797887; 
 Tue, 24 Aug 2021 02:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
 <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
 <20210823184727.GE890690@belle.intranet.vanheusden.com>
 <CAAd2w=adJ3+Rw16ZVbkq72O7D0Dgo1ukHF1DLK6aaN3sGKu3DQ@mail.gmail.com>
 <s5heeaj2rcr.wl-tiwai@suse.de>
In-Reply-To: <s5heeaj2rcr.wl-tiwai@suse.de>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 24 Aug 2021 14:49:46 +0530
Message-ID: <CAAd2w=ZEFrnwC0fdMKUUpaU1XhYztZD-RHECf88+u+H+MNU=hQ@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, folkert <folkert@vanheusden.com>
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

Hi Takashi,

With the above patches -V stereo is working fine.

Thanks
sujith

On Tue, Aug 24, 2021 at 1:42 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 23 Aug 2021 21:06:05 +0200,
> sujith kumar reddy wrote:
> >
> > Hi Folkert,
> >
> > Tried with the above code.This is also getting p value negative.
> >
> > My point is p is negative it doesn't go to
> >
> > if (p >= bar_length)
> >              p = bar_length - 1;
> > it is going to memset second argument p,that is negative so crashing.
>
> Gah, the code there contains lots of craps.  A negative value must not
> have been passed there.
>
> Below is a series of fixes.  Please give it a try.
>
>
> thanks,
>
> Takashi
>
