Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DD7D867
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 11:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA7016A1;
	Thu,  1 Aug 2019 11:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA7016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564651346;
	bh=O0bD5Nu+MvfuvcDXKbQc8n87M0sL3dkR5gwAHfeBoCk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCBV1EWE05yaxH0/4NtDqs2hc0ecUIDYD9Qg+8b9eP9rBy9K9ls3HfQ/SMYgUA36P
	 ugiVQG0S74XCGUZ40Q4cqBq4plx1gJ21VZvOsieLHfqWQOM3W8PVQonGrjZClwmWtl
	 H/Oiwj5yRSGXoSkKab+I1EJnDvfA5NvDZAbwKxEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28CDF804CF;
	Thu,  1 Aug 2019 11:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3391CF800F3; Thu,  1 Aug 2019 11:14:59 +0200 (CEST)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 546CCF804CB
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 11:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 546CCF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RyB3qmqp"
Received: by mail-yb1-xb2e.google.com with SMTP id x188so3255507yba.8
 for <alsa-devel@alsa-project.org>; Thu, 01 Aug 2019 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=foDkP+kIyt4nRDsTVow7xbe7P8bV8V1OCNzaFAvp2SQ=;
 b=RyB3qmqprjhJ25/4Jqa5dpfYqWgPt9pgVPqzGVqQDDelmkxPe7DZEOAqUep0HLbGey
 Uhg642F7wTE5O2do89xd/URT+nyJIl+oDs2O7Qflca4LFP8p9J76BySF3PPLirEpzGh8
 uHbUCNp/jN+LaJIigyNm+wOQlXEsGlpVNOt25IDO5HwDVaepcgaLydGK1q7DWVt61Von
 5Yz6mn5NgeYIpCEgv/GW5OCT1C4I8wVsT82WzvsqQ0rVLAwBYY1G6kwXThaKgqr0vfZc
 HL3z2FwACol+0uhaQFk6GI8S0CIRWLPqIqzMmAHDpTspHNLxeqlWddUDRSaXoMh8R6AE
 eAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foDkP+kIyt4nRDsTVow7xbe7P8bV8V1OCNzaFAvp2SQ=;
 b=Krq38icVXaCzidYXtvsdwC18bGQbeWDDjVjSgaUvCbNQBeXBib6Ch5tjq8w0mBp2yI
 OYPBTxo/cS7ge8rHfoKXDxy/7+1ijdTJPNgN7EYJnrxUngLp+ADnPqItIy1FHmeI6ubX
 QUqpax7g9Gvct/U3WBTWLnH4qIpuoe6GAl0TH7Nk+VdzQEXoqhGKrKUzKypkMGxFrCd2
 DSmmebt1GUSLbXvi7GOqPHxER3CmXT2fSP823Hd7/NnLHWzRpsrGFVlZ6Dm0NfgfUAFN
 xgrvtHNjCoZhMcZrTeuwRASQqAelkaYVESorFDMQ2vclxTpkwqwF0XEHFyLS+p996GmQ
 vQbA==
X-Gm-Message-State: APjAAAXVfnFsVSn95OYjyTuYEb97ADcZ4m+X28kZRUBAgaWgVcFHuHgL
 x9peZ7Bi0fAnwa1Xryy47CA373CB83zdTOdfvdA=
X-Google-Smtp-Source: APXvYqxKUvvTq8ho852VMM7HDX7lJk3FKR2IkFiP0ymkHYLd+K0tVi8omvJFFEoPvIxf+N24zzmw78waaSrANLEqB4M=
X-Received: by 2002:a25:44c6:: with SMTP id
 r189mr59223946yba.282.1564650293142; 
 Thu, 01 Aug 2019 02:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAFwn9n1mL0tE8CaD+tF1vWBQv-E5hidz3B12WiHzxRhvpHs8fQ@mail.gmail.com>
 <6d91a30f-07a0-d5cc-6796-7480ed4e6989@perex.cz>
In-Reply-To: <6d91a30f-07a0-d5cc-6796-7480ed4e6989@perex.cz>
From: Diego Buffa <diego.buffa@gmail.com>
Date: Thu, 1 Aug 2019 11:04:17 +0200
Message-ID: <CAFwn9n3E1_qxi=xioM2+G8NFhppLEZBNWe1A6gW4iU=CGZavzQ@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] standard read/write vs event waiting routines
 (poll) in ALSA
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

Hi Jaroslav,
many thanks for your answer, if I understand correctly pcmjob.c, you are
polling on capture, play and ctrl files (thread_job1).
So in this case it is clear the scope of the polling, sorry I just look at
https://www.alsa-project.org/alsa-doc/alsa-lib/_2test_2pcm_8c-example.html and
I was not understanding the advantage of using poll.

Regards,
d.

On Wed, Jul 31, 2019 at 7:03 PM Jaroslav Kysela <perex@perex.cz> wrote:

> Dne 31. 07. 19 v 18:05 Diego Buffa napsal(a):
> > Hi all,
> > I am trying to learn more about ALSA, I always used example found in the
> > howtos but now I would go further.
> >
> > I went though ALSA documentation (
> > https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html) and in the
> > specific the transfer methods.
> > Basically I don't understand the advantages of using poll instead of
> > traditional blocking read/write.
> >
> > Generally I know that using poll I can multiplex I/O on several files,
> but
> > in ALSA I cannot create the poll descriptor array as I want, as I must
> use
> > snd_pcm_poll_descriptors() which requires that the poll descriptor array
> > should have the size returned by snd_pcm_poll_descriptors_count().
> >
> > Am I supposed to realloc the poll array descriptor once I set it up with
> > ALSA, and add my own files? Should I then always check poll array
> > descriptor with snd_pcm_poll_descriptors_revents() before checking my own
> > files? And in this case it is safe to call
> > snd_pcm_poll_descriptors_revents() with a  poll array descriptor bigger
> > than the size returned by snd_pcm_poll_descriptors_count()?
> >
> > Many thanks in advance.
>
> All ALSA poll functions works only with the ALSA file descriptors.
> Basically,
> allocate your pollfd array as big as you like and get the file descriptors
> from ALSA to this array (using the returned count) and check those
> descriptors
> through ALSA (revents function). Look to alsa-utils/alsaloop/pcmjob.c for
> an
> example.
>
>                                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
