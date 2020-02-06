Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B35155874
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 14:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88048167D;
	Fri,  7 Feb 2020 14:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88048167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581082213;
	bh=bfGn7SQVzroQ41W+Zu0QA4zaBXtMhy71i4tkrH2sRzE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7eKPPfaVwp+RCQLKuvF5rEgHsOWnX4mYiPd/xTQcImba7BRo2f1YdL9QMTAsWMtQ
	 7zMrIk9Ui2Peuju4l8obwiRgQPmig0QHchVBYHGgayqRdVYN+QJsCMWz4K75fsj5X7
	 qG0CmwxdpVFaIlSzfmcGyJbNNliPU0ciXjSqOf0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D423F80277;
	Fri,  7 Feb 2020 14:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8428F80162; Fri,  7 Feb 2020 00:55:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C9A3F800C6
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 00:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C9A3F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YPsqhK1v"
Received: by mail-wr1-x441.google.com with SMTP id y11so531122wrt.6
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 15:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hG9QLDrHnieJvdgoYjUy2r02+eenvwZoinClBv74dLU=;
 b=YPsqhK1vyNF8prHN2Jch/olJ+zIsuxpb/M7wPkG2UK+oGbTDx0fFNknkQNvlEwuWlC
 av4RZCzYWGZ/5QhMYfur8Jw5mtW9pCxAhX2Cb2WgpwdaAyhxJSrGStvpSA6zfYFO5NKl
 AWbVnI6NLEa99GCtRCKv3NCyhyavZL7iq9aN4oZ1ATcreUBorTzg2Th8XKeuf/rxdJtg
 JKqyzZ7za7UVCHHnGw7HKYfwhUGL4nQVzMVrmeOHHQfGFmwJEGIFIA6s37CKbBTQgQGX
 MBc5fqtI/iCb1JAzf0RTjapBBf9MnnNYfGBYbI0azDoOu0YCucMuS+yO/vW0gSASbIkp
 RGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hG9QLDrHnieJvdgoYjUy2r02+eenvwZoinClBv74dLU=;
 b=tDlApa/LYlM3obm30qZXUvZuqFLGXwKLW0RYzyYPiBDaAuk0wf9N0sQpSGos6YAWL/
 MTEIhdYPqwvfcvT7mB3SIH70ZfZ8C736aBGLOAcrgZCYDFsWTRE2RW1WhwTF855AGsLf
 YRHHUmUIj/qimKiu0YOQP+sBTWgSfOIImhM9z2ygE6Gqvr+sDxsO9MLlZaLkL2Ny9tfb
 v/EnYGFcWlyKqpwdEXw7Delxp/oXyLhIcaefFk7uCfDr/BkaElL2mW62bhGhWULxIhvz
 c/vhCiZKKd7kmoAEzl5r/npRy7qMDCzX8aCU0kQph9GsfbbuAanoWZ/9yyGn1TJa2EZ5
 QL4g==
X-Gm-Message-State: APjAAAV05Sz4yBDtPg8az5zNDsmFs9WR+3X/yHkDCKtG42DabMyTWkpX
 lpwH6U3mspIouq+XDytMvDH5mZZMurtezx3SS/M=
X-Google-Smtp-Source: APXvYqwmEZi81d4luCjG1xyPRP+e7bDhMkryh9Mt/gVnn0kkHoGKBQb2UQjX6Q47QHUaOWuh9GNOUw6cpbCY3UurYYw=
X-Received: by 2002:adf:ed09:: with SMTP id a9mr552068wro.350.1581033325102;
 Thu, 06 Feb 2020 15:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20200206200345.175344-1-caij2003@gmail.com>
 <20200206232840.227705-1-ndesaulniers@google.com>
In-Reply-To: <20200206232840.227705-1-ndesaulniers@google.com>
From: Jian Cai <caij2003@gmail.com>
Date: Thu, 6 Feb 2020 15:55:14 -0800
Message-ID: <CAOHxzjGiO54BwUDR4zz6MwvFT3-XXDx830cQcQAcVUPA1N_emA@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Approved-At: Fri, 07 Feb 2020 14:27:21 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>
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

Hi Nick,

'ret' is only defined in if branches and for loops (e.g.
for_each_component_dais). If none of these branches or loops get executed,
then eventually we end up having

int ret;

err_probe:
        if (ret < 0)
                soc_cleanup_component(component);

With -ftrivial-auto-var-init=pattern, this code becomes

int ret;

err_probe:
       ret = 0xAAAAAAAA;
        if (ret < 0)
                soc_cleanup_component(component);

So soc_cleanup_component gets called unintentionally this case, which
causes the built kernel to miss some files.



On Thu, Feb 6, 2020 at 3:28 PM Nick Desaulniers <ndesaulniers@google.com>
wrote:

> > Fixed the uninitialized use of a signed integer variable ret in
> > soc_probe_component when all its definitions are not executed. This
> > caused  -ftrivial-auto-var-init=pattern to initialize the variable to
> > repeated 0xAA (i.e. a negative value) and triggered the following code
> > unintentionally.
>
> > Signed-off-by: Jian Cai <caij2003@gmail.com>
>
> Hi Jian,
> I don't quite follow; it looks like `ret` is assigned to multiple times in
> `soc_probe_component`. Are one of the return values of one of the functions
> that are called then assigned to `ret` undefined? What control flow path
> leaves
> `ret` unitialized?
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
