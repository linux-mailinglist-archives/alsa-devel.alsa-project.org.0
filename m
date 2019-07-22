Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D87012E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DB417E7;
	Mon, 22 Jul 2019 15:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DB417E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563802578;
	bh=5HqOBflbgQxJmDA5JVTZy3abTzTGLmhac9YVDgunPKk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGa686/EulhH3HfCqJFs3UbLKRxp1ip/rStbJs8/FL67uApLeXtfMUAr2v1OWAj/n
	 ixZhMnTsdcT4/nDrc84mEPfgxJoR3kHGuEqWflR93Ewnafh7xeFqmW9VCbPDZInd8C
	 4WoEr2Ni54eug5CGssMQbEPvs2gsHVvWSVVq4Ops=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1994F803D7;
	Mon, 22 Jul 2019 15:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18E69F803D5; Mon, 22 Jul 2019 15:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC456F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC456F800E8
Received: by mail-qt1-f196.google.com with SMTP id a15so38477717qtn.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 06:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQJN9DULZLKDWOm0dpoiua+cqLKY8sRI6jmek37s8zY=;
 b=tJO7+4JL4H3PcY1TlyCHRHmpzEl65MM4cFHEswFnBP5x0CcrJN7EZM5+NsVTU07bNK
 HxKI3h33XUR7QPjNeD9GFOACxZ7Mjmsxyg02eFTy/vx+tzNzpZfTN9BRMVa7W2pEfcaq
 dhRvB5s5hWrpVPiq8ACWpdZwP3aQLZb6u5XQzd/m+ChJumMNayxR4PjRQndXnyicNgvg
 8HIbxQhQ5h8V8o5xpYPBdQKc4ZgTLh909gWb4mNTmISb0FiJMNHEBuvowyT+qmXtlu3n
 78RkAfeUbBVrK6XvQim+D8KmJHGqjMDmtuXCpb6wtHNkQVtl7Sg5sfPF99oy9Nopnn5B
 ZXfA==
X-Gm-Message-State: APjAAAWThzq5Qo2FM8yt+1bsI5b8TLz+579y5eS2gs2seR8n6r7Jifbh
 KPSedSr7Jnh18dSF4LQJLnhuH9vgdQM0qpAXh6k=
X-Google-Smtp-Source: APXvYqxQW1DekiCteGUizjTypPf/QO4XURErkMAxOCtWM5a6p4L3ukY2FobFKZF+jzz7Ys0LEswav553xfFSEUaWrwI=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr48218724qtn.304.1563802461127; 
 Mon, 22 Jul 2019 06:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
 <de9e94ee-9c01-1c0c-4359-b637319a298f@linux.intel.com>
 <s5hftmy8byl.wl-tiwai@suse.de>
 <ec306745-052d-f52c-2cce-d8915822d4ff@linux.intel.com>
In-Reply-To: <ec306745-052d-f52c-2cce-d8915822d4ff@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Jul 2019 15:34:04 +0200
Message-ID: <CAK8P3a2tLuqu+upt0nW8dUzXc+t_kEJwVhLcqY8TXydHLb_nCw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
 in uapi headers
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

On Mon, Jul 22, 2019 at 3:16 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 7/22/19 7:56 AM, Takashi Iwai wrote:
> > On Mon, 22 Jul 2019 14:49:34 +0200,
> > Pierre-Louis Bossart wrote:
> >>
> >>
> >>
> >> On 7/21/19 9:23 AM, Masahiro Yamada wrote:
> >>> When CONFIG_UAPI_HEADER_TEST=y, exported headers are compile-tested to
> >>> make sure they can be included from user-space.
> >>>
> >>> Currently, header.h and fw.h are excluded from the test coverage.
> >>> To make them join the compile-test, we need to fix the build errors
> >>> attached below.
> >>>
> >>> For a case like this, we decided to use __u{8,16,32,64} variable types
> >>> in this discussion:
> >>>
> >>>     https://lkml.org/lkml/2019/6/5/18
> >>
> >> these files are shared with the SOF project and used as is (with minor
> >> formatting) for the firmware compilation. I am not sure I understand
> >> the ask here, are you really asking SOF to use linux-specific type
> >> definitions?
> >
> > Actually this is linux-kernel UAPI header files, so yes, we should
> > follow the convention there as much as possible.
> >
> > So far we haven't been strict about these types.  But now we have a
> > unit test for checking it, so it's a good opportunity to address the
> > issues.
>
> Maybe a bit of background. For SOF we split the includes in 4 directories
>
> https://github.com/thesofproject/sof/tree/master/src/include
>
> - sof: internal includes for firmware only
> - ipc: definitions of the structures for information exchanged over the
> IPC channel. This directory is used as is by the Linux kernel and
> mirrored in include/sound/sof
> - user: definitions needed for firmware tools, e.g. to generate the
> image or parse the trace. this directory is not used by the Linux kernel.
> - kernel: definitions for the firmware format, needed for the loader to
> parse the firmware files. This is not directly used by applications
> running on the target, it really defines the content passed to the
> kernel with request_firmware. This directory is mirrored in the Linux
> include/uapi/sound/sof directory.
>
> Our goal is to minimize the differences and allow deltas e.g. for
> license or comments. We could add a definition for __u32 when linux is
> not used, I am just not sure if these two files really fall in the UAPI
> category and if the checks make sense.

If you can build all the SOF user space without these headers being
installed to /usr/include/sound/sof/, you can move them from
include/uapi/sound/sof to include/sounds/sof and leave the types
unchanged.

         Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
