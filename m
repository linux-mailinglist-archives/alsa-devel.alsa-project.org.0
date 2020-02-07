Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24469154F94
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 01:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7391169F;
	Fri,  7 Feb 2020 01:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7391169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581033993;
	bh=QZIRdn02glYkZh5xUkuHYu/0OWDfHmYRRO+cbyNEk4M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewE2pWDDWVNLGTTawXfUgoGByhHfAvIV8dQ0eMZDxHc5e/HFXaiRH1akH7qQ2148X
	 MW/CIIwgNi5fYNjXqS0NhBrpp0usBYVocm7PXL4ayod2nSksLIf/hTyb3mS3cuVa4A
	 CiWiA9ZJUWzpNDGMN6Pt/CMBb/W7Pa4iwxZkBB4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB41F800C6;
	Fri,  7 Feb 2020 01:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B776FF80162; Fri,  7 Feb 2020 01:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7BFFF800C6
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 01:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7BFFF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dKSa49CE"
Received: by mail-pj1-x1044.google.com with SMTP id j17so134628pjz.3
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 16:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZFFBxKxZAZaC7rKowP3dBpqjl3coMOLVdOhrj8QTtU=;
 b=dKSa49CEXUtfhaZRDGsWkw+O6hjCch6SZ9FjRK0eY4/j1tRdrVPrwz6EYDVcQfnF3w
 NUIWH9CEe3EeOP1+HMxOeHGtdV9cduvQm0+D8p+g0cvufaHEP+Xjj4K64VfC4r5Sne5Y
 PiJ/8tS8P/OSvU+SOtZ/5EDx8P1/kyQ2Sih+UALy776fneFXX+1zd1+KhZqKY7eswxyA
 AwCfod4jqeJ0oj8ju1hjz6YvTWkZ/N1+3da+rS2EYvrPoKapEbY2/YmTPjdjuGR/8azj
 OvcW7xRvwWqhNOXhN0mHgP8AVqNuIHD9YYa//7GhbWo6ohLbN3qT4vymsMb8etY371ps
 /efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZFFBxKxZAZaC7rKowP3dBpqjl3coMOLVdOhrj8QTtU=;
 b=YxUxqgLk3QJBoGE7MkgRlqSkeAlNRBfMlCA4soxdlEgBARuRb0sAm/fPKSg+14QW8O
 HRDzd/sWQvkz5TgCOIjPhBWt+QiXgYYkGkUZaOKBVPVRWLQVEJTxUC9UZ1llGnEW2POP
 OpC6qFbBzSXdf5vE15jfz5wPj/kOzAn8yTn3OY4I/OQrXf1gekDaIB3oa+Ot3x8xmaOe
 /lPFWpsVviSWZGBrDBw8JAwpS0d4uzRYWsqpRsz733xNaDOGlkMgZYwZnp8n+DNkfrxL
 aob82V3q1RSYLMHOLk/+2J4cGwKxDJDUOuELc6WPtkYs7pJGVneGWKQp5czKx/yiyUm9
 lJZQ==
X-Gm-Message-State: APjAAAUzVtumXdwI62aRhhPEd1ZPgzK7PBdYT7LhsXwgFoxqjrIPm4q9
 n5WUSmPG+jsEa9fl5xSaVyAfLzS/fMbUDdDj0zMHbQ==
X-Google-Smtp-Source: APXvYqyA9NYMs7vZ3ED+CoZUpSbhn4IlsxFLfzt20lRi0wAfDekv3xkC/NhND7OCu35LYPy7af9afZnqFsVR+uFgjHI=
X-Received: by 2002:a17:90a:be06:: with SMTP id a6mr438587pjs.73.1581033883832; 
 Thu, 06 Feb 2020 16:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20200206200345.175344-1-caij2003@gmail.com>
 <20200206232840.227705-1-ndesaulniers@google.com>
 <CAOHxzjGiO54BwUDR4zz6MwvFT3-XXDx830cQcQAcVUPA1N_emA@mail.gmail.com>
In-Reply-To: <CAOHxzjGiO54BwUDR4zz6MwvFT3-XXDx830cQcQAcVUPA1N_emA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Feb 2020 00:04:31 +0000
Message-ID: <CAKwvOdkaQJrXt3y_QDyZpQpeJqB0nYsV_p21h63SS1k2Q3Da=w@mail.gmail.com>
To: Jian Cai <caij2003@gmail.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: fix an uninitialized use
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

On Fri, Feb 7, 2020 at 12:55 AM Jian Cai <caij2003@gmail.com> wrote:
>
> Hi Nick,
>
> 'ret' is only defined in if branches and for loops (e.g. for_each_component_dais). If none of these branches or loops get executed, then eventually we end up having

https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1276
and
https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1287
both assign to `ret` before any `goto` is taken.  Are you perhaps
looking at an older branch of the LTS tree, but not the master branch
of the mainline tree? (Or it's possible that it's 1am here in Zurich,
and I should go to bed).


>
> int ret;
>
> err_probe:
>         if (ret < 0)
>                 soc_cleanup_component(component);
>
> With -ftrivial-auto-var-init=pattern, this code becomes
>
> int ret;
>
> err_probe:
>        ret = 0xAAAAAAAA;
>         if (ret < 0)
>                 soc_cleanup_component(component);
>
> So soc_cleanup_component gets called unintentionally this case, which causes the built kernel to miss some files.
>
>
>
> On Thu, Feb 6, 2020 at 3:28 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> > Fixed the uninitialized use of a signed integer variable ret in
>> > soc_probe_component when all its definitions are not executed. This
>> > caused  -ftrivial-auto-var-init=pattern to initialize the variable to
>> > repeated 0xAA (i.e. a negative value) and triggered the following code
>> > unintentionally.
>>
>> > Signed-off-by: Jian Cai <caij2003@gmail.com>
>>
>> Hi Jian,
>> I don't quite follow; it looks like `ret` is assigned to multiple times in
>> `soc_probe_component`. Are one of the return values of one of the functions
>> that are called then assigned to `ret` undefined? What control flow path leaves
>> `ret` unitialized?



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
