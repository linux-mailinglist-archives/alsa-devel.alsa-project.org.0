Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F934259D79
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 19:44:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08F317E4;
	Tue,  1 Sep 2020 19:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08F317E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598982240;
	bh=itQXTaS+DasNetAiGRc5YbzjBV9Zf8FN8JsytvjJ9bY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKjebd/tjoEZkyFc++BGnf0aZzvMSo6JJlfPpOL9yFm+rcEmX5/4FF+Xu8qOxorbB
	 YcZcmwC9ZwXdzEHMbAaVLRx8eZnOwhxJBPAg9T2twn4u5WrV3J+kg75EQ4t473qgzP
	 Ww2IBbOpqQ7+CtgEQvsYbFKX7w2LzA5uCryFwizA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC36F800BA;
	Tue,  1 Sep 2020 19:42:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C75C4F80217; Tue,  1 Sep 2020 19:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF9EF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 19:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF9EF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tYjWjwxP"
Received: by mail-pj1-x1044.google.com with SMTP id b16so772649pjp.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oADnpVnhuzHJnPApJ9kIojrHq2eqkgYQRcAqIs0z0NY=;
 b=tYjWjwxPr0KmCCesr5cpdQVclvQX2lHtsn6mThnuSuwoIkTfTALNKOWdscS0oA+A5c
 WapSqTzs0o8TV8mfYcNhDS79CPLiX026NaMf9kWdbTCJeKw/T/xQmyP4E9/uXLyRcXJ2
 KeV5YBHMey+XSJCK/Crw64DBSCaN509bwNCgqAzczLOnX0ITSP2bwt+9WHllKCW+8YvE
 Smm3iD45iDt7iI4Ga+Zh11WmgsltN9OKT5VlYxOMgR/6eMM3dnE9CnfHT8q7mdmVYs1R
 1C23Vj2Xeo6uaXFa8XCdR6guZYfFTduAgAmolg6yXEUqGI+/34FqDp7vKi8kMRzKIN7f
 bI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oADnpVnhuzHJnPApJ9kIojrHq2eqkgYQRcAqIs0z0NY=;
 b=A9Iek9FmfJkjr4DErTsZ7MTKR6OoAMh5KpoRyEova4oNRp3+axUdIM9vW3hKTWguoi
 RMj3uSrSGVsYG4dnXaq41rlx0AwKxT/vblhUU91cWsTcUnfdxRRMZwW+1rNcy6g5eVF0
 Rvab1eH3NjxWTLLaGCyGHQh9GNm1s29mcLIzeIzsZ6MBX859WWP5pEqW3rvCJm3a1ReA
 5UXmBjh2QTjyLliko/eJ3rpn5ZIXj0AbLfK2/jZXnQYE6S0ZrwzK/0GCosQNIlzPfp9D
 BlzRfAIn8x29QaC8qqrayN/KBm/2yVRQmZ3rqCYvYlmCes4Qxot/moeligkLsOWBg24M
 TE7A==
X-Gm-Message-State: AOAM533pYmqyBl+abb7wi5PZz1GGcFjtXNRiYxpjjThxtIN+Rzx++0hJ
 LQaKv1RHzkSc1Rvd1s5XveovPTM5z9CQb9L17a+P6w==
X-Google-Smtp-Source: ABdhPJxM50938pUVlUK9XqlpjvVyutM77s5En1MbJNd//hDIEsEqDJXdPcaXt0T87RXZE12W08Q/NMM4z13H4Qoiw8M=
X-Received: by 2002:a17:90b:889:: with SMTP id
 bj9mr2665819pjb.101.1598982126505; 
 Tue, 01 Sep 2020 10:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200829153515.3840-1-trix@redhat.com>
 <20200901110244.GZ2639@vkoul-mobl>
In-Reply-To: <20200901110244.GZ2639@vkoul-mobl>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2020 10:41:55 -0700
Message-ID: <CAKwvOdkK12Af7hdzDYk2FD+0Y8fXwLviRL2Xxjatuk61O3JQjA@mail.gmail.com>
Subject: Re: [PATCH] soundwire: fix error handling
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, shreyas.nc@intel.com,
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

On Tue, Sep 1, 2020 at 4:02 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello Tom,
>
> On 29-08-20, 08:35, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> >
> > clang static analysis flags this problem
> >
> > stream.c:844:9: warning: Use of memory after
> >   it is freed
> >         kfree(bus->defer_msg.msg->buf);
> >               ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > This happens in an error handler cleaning up memory
> > allocated for elements in a list.
> >
> >       list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> >               bus = m_rt->bus;
> >
> >               kfree(bus->defer_msg.msg->buf);
> >               kfree(bus->defer_msg.msg);
> >       }
> >
> > And is triggered when the call to sdw_bank_switch() fails.
> > There are a two problems.
> >
> > First, when sdw_bank_switch() fails, though it frees memory it
> > does not clear bus's reference 'defer_msg.msg' to that memory.
> >
> > The second problem is the freeing msg->buf. In some cases
> > msg will be NULL so this will dereference a null pointer.
> > Need to check before freeing.
>
> The change looks good to me, but the title of patch should be revised.
>
> The patch subject should describe the patch, in this case is setting
> pointer to null on cleanup, so an appropriate subject may be"
> "[PATCH]: soundwire: set defer_msg to null".
>
> Please revise subject line and update including the ack/reviews
> received

That's fair, I think
soundwire: fix double free of dangling pointer
would be most precise.


-- 
Thanks,
~Nick Desaulniers
