Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBF351675
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 17:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE85A16AE;
	Thu,  1 Apr 2021 17:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE85A16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617292611;
	bh=hlDLQmUe9Gd+pJwn22ryyA/m4xYbHk4TOS/PTaarRKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLSC8slnwWMOTYBRandwOIEzh707NR8PKJ5Y214oLhBlELvj5/c+bd5pdH2wUZeeh
	 VOOBqgm2qdgSBLd5QWIMQCtDP0TjPeLONlg4gxnjNt2cwvd3OKsgM/ulqQeg8p6RxF
	 UJINUZTKEfnutyMvGxKAxhW7Xel1aT9KtZq876Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C0DF8026F;
	Thu,  1 Apr 2021 17:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D88F8026B; Thu,  1 Apr 2021 17:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12066F8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 17:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12066F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pnbnGYID"
Received: by mail-qv1-xf2a.google.com with SMTP id t16so1190742qvr.12
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Wa45AycFQ/i2+J90fww+yZG/OVcHrL8DsNCow1vBso=;
 b=pnbnGYID/67WN2CXK5yFEElsIuPbc1/CuYImFLFeXxiqVDXJcyfKLvPujl4iM07a10
 AlKCkgMtQYwbcXKdJLHt83pEz/wjLaeqXTQ9XVYVciSYTDblSgzDfk+YYHDua5ZZg/uV
 OOs4X/FhOLYuCCcXho2Hvs4Axtj2Ed8DA7uqRieUt72s+P+DQxEBhvT0vgb/ZeDWb2OO
 Kks7IANGJiZEeNS+q9DtLPHlbUH2b3vj6htVNj/pMVYPJTVqamI6DL2HCcYwobsq/J0x
 nwSkJBFp1t9cXBmmgwU1jlaM179/sJTQs6v9CkgKveZ3E466M5QJ0qRDQ69S5UAPvKLC
 dYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Wa45AycFQ/i2+J90fww+yZG/OVcHrL8DsNCow1vBso=;
 b=mesSL5UCkb44Hsb2OK32lVK2lfJ5mdrfisGpmIWW71fF2JDocq8V89fKlsZ9KIr4wL
 TndJfeoowBXk7LKTI+JLjnUfaz4VYTN1NX1jA7mc1hbLUwZ9kNdunwnPAlOBQ2WBbmda
 YkBMWgMHPqLFndJxPVUi2hJJ+5gk6TfxPjtMULk25Pv9JZeDb8CbkOvPNVDI6WK87vJi
 8/dqaAK7sduXezaDbdDHvbsNuRG/YAEdtHG8nE8Tfyl5zYR+6siJvSfhqCGtAx3nlR6k
 GZLTlh5FFJg5QXQsCkEBuWwZ+hZKUYqSGavqFJj/qLVzaehZjJW/N1VQAqjwBTZvlUzU
 f9qw==
X-Gm-Message-State: AOAM531394dvhrrk55w3F721Prz1DlXC1wDToK4UuNC7kj5FWAID2MHh
 2QvgsnBD3Njq7yXD7Ong/7p6mtl32cMr7H37Zk0=
X-Google-Smtp-Source: ABdhPJwMyJq/vcN0xuWZpSglhGdw7zwHBIYvxodgskKGXoF1bVac4ip4o5hqwfr36T5CozMHW/vafEF1PW2mT7lfECU=
X-Received: by 2002:a05:6214:523:: with SMTP id
 x3mr8477363qvw.27.1617292515849; 
 Thu, 01 Apr 2021 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
 <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
 <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
 <CAEsQvcvjf-o7x8t06cCB3hwMNXZYf=xJWsbnGdTmt=CXP2HJQA@mail.gmail.com>
 <CAOsVg8qTwqFwnmWZwu02rMqwkpbNZFV4COL8yB-BAJDNuT2gug@mail.gmail.com>
In-Reply-To: <CAOsVg8qTwqFwnmWZwu02rMqwkpbNZFV4COL8yB-BAJDNuT2gug@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Thu, 1 Apr 2021 12:59:54 -0300
Message-ID: <CAEsQvcs55c9Y-OwoypArz7gNt5AK3fZZtREjedi7TA6zxZXhdw@mail.gmail.com>
Subject: Re: [PATCH] Fixing most Roland-related devices' USB audio
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Em Qua, 31 de mar de 2021 23:19, Lucas <jaffa225man@gmail.com> escreveu:

> Thanks for the encouragement and wisdom.  I hope your additions, and mine,
> work out in the end.
>

They will!

A real hurdle with tasking everyone with patching for their devices, aside
> from having probably long since given up hope for use of the device on
> GNU/Linux, is the amount of disparate forums they voiced their issues on.
> There's also the daunting likelihood that select few music creators
> actually would decide to compile their own kernels to see if a problem is
> fixed, let alone feel comfortable enough applying a patch.
>

Recompiling kernels with custom patches and workarounds for regular devices
is madness. This should be needed only for development purposes.


> I hadn't realized this was a list to drum up testers, or that every change
> needs to be tested fully.  I thought it was a direct path to possible
> acceptance for inclusion in the kernel, if reasonable doubts are considered.
>

Well the Linux kernel has to be somewhat orderly even if the open source
development model is inherently chaotic.

This should be a list with lots of testers but I'll bet the volume scares
them off.


> I hope they'll let me sidestep that huge, unreasonable, undertaking, as my
> test implicit feedback "fix" for the UA-4FX (which doesn't need it) proved
> it still functions as perfectly as without it.
>

I disagree a bit with you. It's not very wise to add unneeded quirks.

That should mean that for the devices that don't require this patch, but
> which had been accidentally added, no harm is done.  I can't really see
> myself as owner of all these devices someday... ;)
>
> Thanks again, Geraldo!,
>
>   Lucas Endres
>

Thank you,
Geraldo Nascimento

>
