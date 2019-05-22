Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF4269DF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 20:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA8C11669;
	Wed, 22 May 2019 20:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA8C11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558549955;
	bh=jIsxr6qfrgcnEC6X2ldPvL7y65kzaduF+RuRBzOOnFg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJg8fNRWVdrn+pXfbY9038aFmzMU5msX6XyHsfSk0NbClFWFzHOcGRfUiSz7eJKrF
	 mP2d+V2a4e0+qIz0A9SpcqxoSL9emvGJ3at8rDrpSoyBMRKAhVEdDvTAVJrrQvtz3D
	 sWtRfdh6ODUM3B9Ng0iR1ex41s0EXmvpu7oaTk9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 319F9F89633;
	Wed, 22 May 2019 20:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEA3F8962F; Wed, 22 May 2019 20:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C786CF8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 20:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C786CF8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IgKo5Nra"
Received: by mail-lf1-x142.google.com with SMTP id d8so2431041lfb.8
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxWUH00YdYVo2FVkSI+HN7hxR1IMHHcKqCXHJ6O/7ho=;
 b=IgKo5NraWmalRSJbm9t7bxHO18Z0iy5HfIE4PgaEitYVV2m4pOkO9NRWC3yVqGHNzr
 LW6DF5244g8ch4LDsP8sPPWjv1AifPgWnnVJ2hoJb/xT8QzxYd3DRjRsACdtgAjCt42N
 wKm9XeFobafK5oqVzykeSyQygyGADkAorSqDZcLYjyBJVIfSCti8I7UGCpNqrOMPIWCe
 GozEw4V2ibZb7PvwF1SPgn+2i8EPdsYo9k1EERT0KsChijHYsksM/Yq3IX9rJfDvYpzT
 5cNKjOFISqBQfSbaxOC5q0Fyq9VrmF6YHBIp73PbtS4hamhcgSOs7jBAb1cqPXX7M/nK
 /JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxWUH00YdYVo2FVkSI+HN7hxR1IMHHcKqCXHJ6O/7ho=;
 b=RThyuocHrFHQjphrlG0oPBcLXhwG9x3lBWW9eJV7k7fh9qG7edaCIf/UNjuis6rgd7
 sOagIQ4Fmtc7bWwMRqVB8gNRBDgdOfwF3sI0MXYAYdkgDhnWCBxqDPraMUtLFioLDiS7
 aAhgPLqHfQW5B4JRp7xp3LoepAaDpzIyCMYmDcKVJq+ted0P5HGpTF+/zcseDJYYM2zN
 6KvLv7Cc1fsVkgdTgZBzyGPorLkcqDyHUaP14Z1WXZOTZS70KdvLlSvUQinb2BijqkAL
 W6hdF3o+XtFoGwDjR35JCOwbWYnWW6asVPFF+XEOes6BOBqJU5L0zgmdG7tl2HQVXTD2
 9v6w==
X-Gm-Message-State: APjAAAUW2Hn2IpjG7zf4mffyg/71pzzEhy1BzIsooBunVbNPgHPQYpUF
 ALbbFGbv+H9n98QW2CW8MRh1yKaGsCWGfhJ7kFGEyw==
X-Google-Smtp-Source: APXvYqzjw93U9yNMzbMYMbnPx5r7CHo6Bz3zJS/U/yKLajZ2DX3kwKbRs/xX45mNEvPW0qtsdK+hOxt3JX4xs8tSUC4=
X-Received: by 2002:ac2:43af:: with SMTP id t15mr34980616lfl.45.1558549843057; 
 Wed, 22 May 2019 11:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxjQAya8GQ4bOSBfTBHwXd38c33pOMc35rrSj4O4jMaMSQ@mail.gmail.com>
 <s5hwoii1rd3.wl-tiwai@suse.de>
 <6eb7cc4d-aa95-74b9-e849-22559737f47a@linux.intel.com>
In-Reply-To: <6eb7cc4d-aa95-74b9-e849-22559737f47a@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 22 May 2019 11:30:31 -0700
Message-ID: <CAOReqxjUk_6Fvc=CRnCWu7c=QvObxhwA_psWLz5gLO_v5Fc5Pg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Guenter Roeck <groeck@google.com>
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

On Wed, May 22, 2019 at 8:22 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >> It appears the for-5.3 branch had some broken commits pulled in at
> >> 1c7c3237c0cc4ad3c7b0df458290c8e2a652f178 ("Merge tag 'v5.2-rc1' into
> >> asoc-5.3 ")
> >>
> >> building for the pixelbook I get the following build errors:
> >>
> >> Invalid absolute R_X86_64_32S relocation: _etext
> >> make[3]: *** [/mnt/host/source/src/third_party/kernel/v4.14/arch/x86/boot/compressed/Makefile:130:
> >> arch/x86/boot/compressed/vmlinux.relocs] Error 1
> >> make[3]: *** Deleting file 'arch/x86/boot/compressed/vmlinux.relocs'
> >>
> >> Mainline is still broken as well. Not sure how to propagate this up to
> >> the responsible parties, figured I would start a discussion here
> >> first. I am also open to suggestions if there is a chance I am missing
> >> something.
> >
> > Looks like some leftover interfering the build.
> > Try to cleanup your work directory, e.g. make distclean and rebuild.
>
> works for me with the attached .config.
> Likely an environment problem.
Yea, cleaning didn't help, Pierre is right, it appears to be tied to
our gcc version we are stuck on. I will see what I can do to work
around this. Thanks.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
