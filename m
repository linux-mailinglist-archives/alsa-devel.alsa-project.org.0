Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189E2B968
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 19:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BFF17A5;
	Mon, 27 May 2019 19:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BFF17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558977966;
	bh=Rp3XZ/rtimWdbeQ+z27gWf6t9TYV9lbJb+rZPFzmJhw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLwviW2kgMKy1JPak5y5qQT5e26eIo7FIPHGrxezGAkfQ1gtDUCJtehV6hJvSyCnj
	 zMDpxbZImxU6zy4SAjwO1k9SDYtoaEVMxKBd35peqdWfyPzxzaSgD3o7wp+JOiF8Eb
	 6c6lK+38Y3AjmrVmQ/IwYmriVkRtxFuEvvDYo0UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E8A4F896E4;
	Mon, 27 May 2019 19:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4699F896E4; Mon, 27 May 2019 19:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F64F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 19:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F64F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="PGJrELCk"
Received: by mail-yw1-xc42.google.com with SMTP id t5so6880248ywf.10
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 10:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BZbzXZc/W5smwk8w3+KGH8kuhga8mYWq6suT0ecrPk=;
 b=PGJrELCkKvSmEcgV+vZyoARuiPQZ3S50gRNt99perTupynCv1I03n+4PY/XQW5KESK
 Goz/IVUcIHheHZlYEccTQFYtrGcHQZ/I142vvbq0PoM22XojfZjiNHrEDKMO8svpVNPa
 AKqKjy04j1vp2ak8xhzJfjP8YDf41Wi6jD95v/+P/1NdBGVyxyD9EOp8rFKVtmH0m/BT
 yUBx7LP0qRvFFxo61hFKCS1Oeagg8rZW1/zU1LCXzz/WNlereoJxySaRwVFJ6ArBQqjK
 /euZ/rpC5oE6NfmrDUhAYZ3zvhI5/RLSXr+vRDac6UBwBvVhfotnK2Y6jQ+9bPA6nD5I
 91aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BZbzXZc/W5smwk8w3+KGH8kuhga8mYWq6suT0ecrPk=;
 b=VMmnszMptYE1LzwcQgQT+7qAfs+jp8Gt2/CyDFxSUgNO5TlPqnNt7ifCWCuAiA1XUC
 8KXuudAc2Du0RsjIBlNRWh/ukPKt+0QGEfX0+HKRbZTeu1aIa1ytVt4AS/SyELuG3iRL
 4yb9RdoZsgeZFuJrNK1+8SR66c6kUdAu5tlWStki6x8YdsbPsE7Fj7NFFgSOf1hOX2UI
 UFZaw/i3RGtoXD90fHrc1sswvEsOheCSXhl9dtutRN6TMWkSa/N19/Sq90QSWa1XCN1x
 lBnxALJ08IzPI3rydg1YOdwEUTDWn/+ZVdC8Xod8fsCdppcYtN0My7x90M36ly2+olGL
 5Zdw==
X-Gm-Message-State: APjAAAWlsTjFiuE3av9PeFNIn4lCJrncyV0QSzNV6wo3h17zp8oq5oyO
 OOdavsJ1ynuvUvu3gOHyg5sR3ZBjAy03SUQw/rzwjw==
X-Google-Smtp-Source: APXvYqwUT0nOK/t7Mi7IbarorSow4XPI6bgOUi0sGZ8g1Yi5LSSBbgZMe20VNRbjAYJAap3g4t20N36fBjX7kFntfO4=
X-Received: by 2002:a81:2bc6:: with SMTP id
 r189mr22084970ywr.337.1558977854408; 
 Mon, 27 May 2019 10:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxjQAya8GQ4bOSBfTBHwXd38c33pOMc35rrSj4O4jMaMSQ@mail.gmail.com>
 <s5hwoii1rd3.wl-tiwai@suse.de>
 <6eb7cc4d-aa95-74b9-e849-22559737f47a@linux.intel.com>
 <CAOReqxjUk_6Fvc=CRnCWu7c=QvObxhwA_psWLz5gLO_v5Fc5Pg@mail.gmail.com>
In-Reply-To: <CAOReqxjUk_6Fvc=CRnCWu7c=QvObxhwA_psWLz5gLO_v5Fc5Pg@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 27 May 2019 10:24:03 -0700
Message-ID: <CABXOdTePNR=O0EhUgFNVCUvCbqaKtpdnZw=NtFLc6aNtAWUpKg@mail.gmail.com>
To: Curtis Malainey <cujomalainey@google.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Cannot build broadwell on for-5.3
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

FWIW, the Linux kernel still officially supports our version of gcc
(4.9.4, I believe). "Your version of gcc is too old" is not a good
argument to make.

Guenter

On Wed, May 22, 2019 at 11:30 AM Curtis Malainey
<cujomalainey@google.com> wrote:
>
> On Wed, May 22, 2019 at 8:22 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> >
> >
> > >> It appears the for-5.3 branch had some broken commits pulled in at
> > >> 1c7c3237c0cc4ad3c7b0df458290c8e2a652f178 ("Merge tag 'v5.2-rc1' into
> > >> asoc-5.3 ")
> > >>
> > >> building for the pixelbook I get the following build errors:
> > >>
> > >> Invalid absolute R_X86_64_32S relocation: _etext
> > >> make[3]: *** [/mnt/host/source/src/third_party/kernel/v4.14/arch/x86/boot/compressed/Makefile:130:
> > >> arch/x86/boot/compressed/vmlinux.relocs] Error 1
> > >> make[3]: *** Deleting file 'arch/x86/boot/compressed/vmlinux.relocs'
> > >>
> > >> Mainline is still broken as well. Not sure how to propagate this up to
> > >> the responsible parties, figured I would start a discussion here
> > >> first. I am also open to suggestions if there is a chance I am missing
> > >> something.
> > >
> > > Looks like some leftover interfering the build.
> > > Try to cleanup your work directory, e.g. make distclean and rebuild.
> >
> > works for me with the attached .config.
> > Likely an environment problem.
> Yea, cleaning didn't help, Pierre is right, it appears to be tied to
> our gcc version we are stuck on. I will see what I can do to work
> around this. Thanks.
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
