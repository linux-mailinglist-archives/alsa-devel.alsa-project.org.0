Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A044F4BD
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Nov 2021 20:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA6A1666;
	Sat, 13 Nov 2021 19:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA6A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636830014;
	bh=x2IV4/aUQRL29Pp9MU4khHIDyCwOiTSNauU9cnjw/80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iK6mY/xEtAVejOWOu/5LkpVLHqgaGVeBxz4IAixT3NlBAH2tVjy30UiZpPMtjeF2A
	 5XEE2TGEMxSYEVICpNR5wsloX9ssLZTQ+JCydFcjSMitHI7a45XmGvg8NLfjnF8yib
	 y4jthgVkV8LUKG3Y9c+uB7RjeY+AfPzbeOv1L5os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C140F800C1;
	Sat, 13 Nov 2021 19:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57112F802D2; Sat, 13 Nov 2021 19:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D18D7F80134
 for <alsa-devel@alsa-project.org>; Sat, 13 Nov 2021 19:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18D7F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h2yJhbWR"
Received: by mail-oi1-x22b.google.com with SMTP id bf8so25084673oib.6
 for <alsa-devel@alsa-project.org>; Sat, 13 Nov 2021 10:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2IV4/aUQRL29Pp9MU4khHIDyCwOiTSNauU9cnjw/80=;
 b=h2yJhbWRFNQdCQplnn7th9BVesFwC6Pv6YXajTkIhuWh2EJQFgqujBbsu/0UV86JKl
 S1UP7wr7q+2RGZg9T5rutgKVB03M09gqS71flAXlFRiAhSbu2a9QwZXutpcU4JZ7h9DW
 zu3hwyw3aj5/8CSwhR7hd+I2lMnVv0Ot2kqeM+T9eSj+jffCMxhe7E4o6uMVr5Yhh+7m
 3OrM6QUhfjkSiisb5pd2P9FhnmmAhG5rqM9UP5/9zUldoRAMu3NdcsHLg6SR1AmkfAFD
 AQHff20Mqw05cKAfMpqfNXbrffV78li9HfUwhcf/Kc+/KSp55r5R+/6rVHb3hnLTLt1P
 oMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2IV4/aUQRL29Pp9MU4khHIDyCwOiTSNauU9cnjw/80=;
 b=0Os3X+ezfEVBnAtm7xsWNyNuJYvyoVzK2vKSjEWIul23e6ZSS1lBBT3rhmNMeN82Ek
 78OoM7PpFx8cryyybYfckWY+w6KBR1c8u9j1Mk8UTeIwTVT7/HHLLe6uA9mie2l4669P
 LpqdvYvW+wccFau0TQRUJDjT+a5q/vra86oloosWdaxoFxtJTLDHJZOYQyar5mIOdZVs
 Edw7SQB9PIodLvBPNfwu/eGyQUcA/bBoSb8gmZGkMInDtmi0OL5WnlG3zjkAxhuTpSyX
 atYE1bqgjG697BY6OPUsHFXNCfxFNhoMeMtqjTDNSCJ2W7y3gsED1pJ27/VfX/gfGNYy
 KS/g==
X-Gm-Message-State: AOAM5325loRxLVVdjdBmb41MP2xTMlYtwVQwYvhPQnoKEVTgtAAKYzOa
 ihMfMofE5CLOKr9Fx4UlQEA0lwZ3WOWHvdkKEkk=
X-Google-Smtp-Source: ABdhPJzcC1amBQaIO846wyKpdCVWS1N1WnNLy9sawQikBZlNeDE0YV3+fFvjpeWK0Wf+JDbcmpk9XdXHHDyVUdwwINM=
X-Received: by 2002:a05:6808:1885:: with SMTP id
 bi5mr36909810oib.54.1636829924183; 
 Sat, 13 Nov 2021 10:58:44 -0800 (PST)
MIME-Version: 1.0
References: <CAGi-RUJxadzSjuZoVPFKoW_jg+9=k8Onm9eo8W0R160Sjz-C6Q@mail.gmail.com>
 <YY/iQzxPoM+eWPgb@geday>
In-Reply-To: <YY/iQzxPoM+eWPgb@geday>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 13 Nov 2021 20:58:33 +0200
Message-ID: <CAGi-RUL=Rg4q52jjeYF9w88WHN9JHSnN8Kanx7KMy_ZCmzSrfw@mail.gmail.com>
Subject: Re: Possible issue with Intel 200 PCH HD on X299 AORUS Gaming 7
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

On Sat, Nov 13, 2021 at 6:05 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> On Fri, Nov 12, 2021 at 09:26:58PM +0200, Ramon Fried wrote:
> > Hi all.
>
> Hello Ramon,
>
> > Apparently on Linux Headphones and Line are switched.
> > Dual booting Windows on the same machine proves that it's indeed
> > connected correctly.
>
> That's too bad.
>
> > I initially thought it was related to Pulseaudio, but together with
> > Pulseaudio guys help we figured it's probably in ALSA.
> >
> > http://alsa-project.org/db/?f=535021978814678ea328b0d3a053ba3cbd39b709
> >
> > Where should I open a bug ? Is it kernel related, if user-space, to
> > which ALSA component should I open a bug to ?
>
> Bugzilla is the right place for this. This will most likely require a quirk,
> probably inside sound/pci/hda/patch_realtek.c so it's kernel-side.
>
> > Thanks,
> > Ramon
Thanks Geraldo.
