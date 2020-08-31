Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5125813C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 20:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35BD81770;
	Mon, 31 Aug 2020 20:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35BD81770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598899285;
	bh=WC+dX2WoAbia/Vtx2i2sWGLUVTRR0l1DH72hve5SIIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+JdZ2jzzzq2N8CQIqhSYiMpoqpHEZpxol7nFS4QDD8IWvREuTMO94gO15TieAAuq
	 wL8vT5WHbvyK+IRCCvNZvkYYB2rjNzxEsuxqow8IfSqLYByGeKcyIhItiOFcH2YQ6p
	 LSOAVzvyGVBpskjq9oIHiMttNVH7fYPFYnsHMBvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F46F801DA;
	Mon, 31 Aug 2020 20:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63643F80212; Mon, 31 Aug 2020 20:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF0DCF80096
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 20:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0DCF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ow6IQKyI"
Received: by mail-pl1-x643.google.com with SMTP id v16so3524940plo.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJN4MJCj6Pjg+uwt4f3ml6KYFLqzh8Jk41iwpyLU3Mw=;
 b=ow6IQKyIJLSJBzYpYXZ3p2h21/2zo0rNu+6BgSyrmsI+fkPkNnxcT2qqDeEMWA3gEJ
 bWdsNeSXqko14vOuPfPN5c/O0as/itCxlhZl/PM8jJIlJrq3eG1JDVEZ2L7dSXFiBiX5
 tehKF4C/NjFYOHKqfekO7WTGk9GcLmpINDZMVerWZXNYmH6DR2UZ/m+N9HVsXdjZj+cx
 7ybAZRXR77kKkbnhQPt0ixU154RY5Mw4QjWxjPinBYdBvIXrklkVRgDcuTFchalWrE/7
 aVRYQ+w9RiUq6exwI8Pq+fLZ3V9GMMKSaL0H+ggLvtNqEG4lAYV5fZk5H/G20QrxQaIO
 VnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJN4MJCj6Pjg+uwt4f3ml6KYFLqzh8Jk41iwpyLU3Mw=;
 b=iE19cYuCGyC19ytESeQ3F7IP6GYOFLGYDEXoAFgOvcZ+yhdJ1quuSgzl32SAWl3Fd4
 gMKUtT7rDR8/hT9yYX6Te6ZZ8kEe087EIs0hlERVwOh3WJmfbIC/1dTVb86Nd33jzyJG
 m6wcgvjyAzgubpMxqbhMx5MUkcLH+tiDRziobP0WsUczHflEzvdGYvbTNGf6IK1j9fFy
 7VOFyaLPkIA8bkhDdWyncYraSGdDvOrBNzCH5xiMLWVU/C5GR4Xh/UMzu+RG8w1k4yBE
 cGTcjndTCZdXN1r7qrVuzPf7vOUZuaboCecf6Vaxhb+iSAE29UlSQV3dwDMjF7KxBqm8
 hWTg==
X-Gm-Message-State: AOAM532Q4pI4ZagiXwRqebDGXYTlGlBzhOmtq4RuvhAM0gTbzS5wmMsM
 wOu1AeeqfQRr5yZufvy82czGks8T2niq5LsVGlQ+xQ==
X-Google-Smtp-Source: ABdhPJx8jmeDuqI3ddtnIQ73j4Oysz/hWduc1h6iUSovGQYoe4WKdkmXDjPKBpZrfy3a2DbH8pbnYy2olWyUgVeJezs=
X-Received: by 2002:a17:90a:fc98:: with SMTP id
 ci24mr600333pjb.101.1598899165891; 
 Mon, 31 Aug 2020 11:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200829153515.3840-1-trix@redhat.com>
 <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
 <CAKwvOdnn6eMqJsL=aJ8n5dWWoHjXUL0LBSyVwZPGCKpkBSLHXA@mail.gmail.com>
 <5f9c8819-cd0f-6fb9-1b0f-b34f390ae65e@redhat.com>
In-Reply-To: <5f9c8819-cd0f-6fb9-1b0f-b34f390ae65e@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Aug 2020 11:39:14 -0700
Message-ID: <CAKwvOd=D=LWeSGYekOc9qs_aVOD_jpM2DVZO7=n_2L75Ad3Nxg@mail.gmail.com>
Subject: Re: [PATCH] soundwire: fix error handling
To: Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vinod Koul <vkoul@kernel.org>, shreyas.nc@intel.com,
 Nathan Chancellor <natechancellor@gmail.com>, yung-chuan.liao@linux.intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Mon, Aug 31, 2020 at 11:20 AM Tom Rix <trix@redhat.com> wrote:
>
>
> On 8/31/20 10:48 AM, Nick Desaulniers wrote:
> > On Mon, Aug 31, 2020 at 10:47 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> >> On Sat, Aug 29, 2020 at 8:35 AM <trix@redhat.com> wrote:
> >>> From: Tom Rix <trix@redhat.com>
> >>>
> >>> clang static analysis flags this problem
> > Also, Tom, please use ./scripts/get_maintainer.pl on your patches to
> > CC our mailing list; clang-built-linux@googlegroups.com.
>
> gcc is still doing the building, so it this appropriate ?
>
> Asking because i have been sed-ing clang-build-linux out.

ah, right, you can use `--use-cc=clang` for analyses of builds with
clang.  It doesn't hurt to include our mailing list, since we'd like
to know if issues get reported with the analyzer itself.
-- 
Thanks,
~Nick Desaulniers
