Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A312E257FED
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 19:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FD0176D;
	Mon, 31 Aug 2020 19:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FD0176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598896187;
	bh=n6xJ+kzcShpeyGVRezS06+AvyvNvJ8DXk0s6BAdayXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrKECx8XoSgsZ4DFChebju2556IbIeIND3951R8nR5O2oOfixA4zzhGzWXMpyNECE
	 dNJq9oZvCn3sD3NGY53i0OyGLF7nz/yJ3LLlzC75A7AhBgS8j3knkxaGz5mEMmRXyD
	 lfl0A8LucEg8iZSTHX0JytKYA5FsC0HIql2wLtY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63436F80146;
	Mon, 31 Aug 2020 19:48:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20363F80212; Mon, 31 Aug 2020 19:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 745CFF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 19:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 745CFF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ldoEDMh1"
Received: by mail-pl1-x644.google.com with SMTP id v16so3429443plo.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P829i5Iw79pY5XzrVknioognLQa7eeRlaAv36ZVo67A=;
 b=ldoEDMh1VddXNaWZRPrfsEXG5+Zl0OBnn1+eLfeuSKwavLg0dcI+H0wVlxcuStFM8O
 nRHK8Cg+TDh/AwwKhubsCBz14AnQgdxOxRajQKX50RNKzX1u/i/doBKS4IlqsjcsMUj5
 YqmwcaTOtetuZSPQlJMpKCa3AX8CEJX8xiiv210o0vz2NnN6XBeo5kElEBVzVoypdZQM
 mpvPsW/RrHTTyJrqDIAkkr6sh/sZtBltwONXf5HrfPjnYaQzXlIdS8y8V1uWdzbGX2sU
 jkHAyMkrV7npXAEMbiD93gBqwIjSDhfD9iVSTEG8EILtSp2yWqV2jsh/zfLVgjxCuDSA
 +9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P829i5Iw79pY5XzrVknioognLQa7eeRlaAv36ZVo67A=;
 b=eSI8aZT/nfHS9a9pb8iRruyPToLEd+gLT16RvUZ43jrgNV45gk7CFJf3RkBK4Qn03Z
 /j0DM6nUUFg3CPgPDSdOmhF2w/YwE3wUV95cKb9gA3l7ZmWs0wRblSuvwBaFpLInPt7J
 EzCDk6w9sARHDVbh5UY7b9N4pDu+twhgDari+gyuFDwpFERK3zZM2cqlgUL4GYcWHIIt
 IQMWL9LycvUf/RSGAk6N42ELuy4I9iAgjLAtT0g2FODqHa4k1ZZns+t52dQBmaGPDp8x
 5YF/otkGGStf+Fb5kxVUGQho7+ZemdzXYwEE1CGEQ7+XFTU5PdKGlesz9Bb/UtcDphGW
 XhBQ==
X-Gm-Message-State: AOAM532v++IgBMxqPBxe7ByKuNmcIOH6LwiniYVD5m6dYbHUINMFR/Zr
 NKYrmQvUI04C5bUsMYLTFmyYqAeh/mmBY4YmXqVSXg==
X-Google-Smtp-Source: ABdhPJzvRJ7aNmtvcSGmX2ruQahuZVdBW/pE0eXak3IkWeu4IDPVyPGWeVx87YTz/fWB/bjdL5+DRNg0P9DH9AxZguE=
X-Received: by 2002:a17:902:9f8a:: with SMTP id
 g10mr1879533plq.158.1598896073003; 
 Mon, 31 Aug 2020 10:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200829153515.3840-1-trix@redhat.com>
In-Reply-To: <20200829153515.3840-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Aug 2020 10:47:42 -0700
Message-ID: <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
Subject: Re: [PATCH] soundwire: fix error handling
To: trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 shreyas.nc@intel.com, Nathan Chancellor <natechancellor@gmail.com>,
 yung-chuan.liao@linux.intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
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

On Sat, Aug 29, 2020 at 8:35 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis flags this problem
>
> stream.c:844:9: warning: Use of memory after
>   it is freed
>         kfree(bus->defer_msg.msg->buf);
>               ^~~~~~~~~~~~~~~~~~~~~~~
>
> This happens in an error handler cleaning up memory
> allocated for elements in a list.
>
>         list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>                 bus = m_rt->bus;
>
>                 kfree(bus->defer_msg.msg->buf);
>                 kfree(bus->defer_msg.msg);
>         }
>
> And is triggered when the call to sdw_bank_switch() fails.
> There are a two problems.
>
> First, when sdw_bank_switch() fails, though it frees memory it
> does not clear bus's reference 'defer_msg.msg' to that memory.
>
> The second problem is the freeing msg->buf. In some cases
> msg will be NULL so this will dereference a null pointer.
> Need to check before freeing.
>
> Fixes: 99b8a5d608a6 ("soundwire: Add bank switch routine")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soundwire/stream.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 37290a799023..6e36deb505b1 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -717,6 +717,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
>         kfree(wbuf);
>  error_1:
>         kfree(wr_msg);
> +       bus->defer_msg.msg = NULL;

This fix looks correct to me because L668 sets `bus->defer_msg.msg =
wr_msg;`, but on error L719 frees `wr_msg`, so now
`bus->defer_msg.msg` is a dangling pointer.

>         return ret;
>  }
>
> @@ -840,9 +841,10 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>  error:
>         list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>                 bus = m_rt->bus;
> -
> -               kfree(bus->defer_msg.msg->buf);
> -               kfree(bus->defer_msg.msg);
> +               if (bus->defer_msg.msg) {
> +                       kfree(bus->defer_msg.msg->buf);
> +                       kfree(bus->defer_msg.msg);
> +               }

I'd prefer a conditional check for each, but sdw_ml_sync_bank_switch()
has this same pattern, so it looks like the lifetime of these two
match.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!

>         }
>
>  msg_unlock:
> --
> 2.18.1
>


-- 
Thanks,
~Nick Desaulniers
