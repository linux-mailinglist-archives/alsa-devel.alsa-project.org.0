Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84259C43B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 18:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B62EF950;
	Mon, 22 Aug 2022 18:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B62EF950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661186129;
	bh=fgBIVRGWiYsoJ1Y2UJ5xGCn8NjqhA9M11zCt+uJPEXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uf9M95LOQ3SxE0d8WKdre5ei9OY5zbd1FCTzllO2Hn40IJDfHE7SUez1D7sAmT//u
	 V+5rjySfcG2GXuzUw0b3/tHO0cEmdMKI79bW3Hn3+0xUlLKctevEa+MFOJCsx8/Bjl
	 fTdIsZxVQvggBES+qJ5C8XWmNPMM08aKWMZazpSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EFE2F80152;
	Mon, 22 Aug 2022 18:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7207F8026D; Mon, 22 Aug 2022 18:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A62CF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A62CF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QS+1k7+P"
Received: by mail-lf1-x130.google.com with SMTP id m5so5391941lfj.4
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
 b=QS+1k7+PE+rePGoe9S3/Sv5bzXx+MhKRdXlXZFyr/Fbt5c6Cz9Zaanza+Ak1wKazBk
 m/rIfz7sa8ff2z4xpc0om5KqeFWYh/69V8JYMeB2GHSkRL7O9KD8hncg+smlKcyWWVPT
 MqFz/Ce4uMUr1qiCsX2rfd2wEeDM899inOCWguVFSAHBHudGjIfswLuaL70NbPhh6wak
 eStexTI6QP7EpgiA3CHeM8D1rfdZiMDqMUNmbiNeMo+s5hO0ktzSywOJxF751Wa/eKMR
 do7TXBX3bO0L16iRgPQ1jbgVrKwlcLIreT0U2UkFsZhZ5rRebQfMNqFHxKluHLm67odY
 uBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
 b=eAOHLHtjKa6TuG+jocFBArsxD9sMmqQK0DkdAGbw+uQ+XlWFWs6NFmkBUzXHI4MBRi
 FrnGWFpQSnOEAatqjWvbh51rRR8xSzy+3QofAPsoQxpLVysf3Zw/tl49qZhmKQmw/3zS
 BZWl8D/U8f76OyG6PQ3eF9Oy+/To19zJa8dnSgbXU7BeuugSBoY1j12FSAsaOPmjMp+g
 RC9+14c772fsQnztitfln3CONzzkX8tTKC1x4mQTELyZNse5Alr22AXxKxmdDPBt7Qqg
 of9tEIORFsYQFkJpv+pXMxb4xsGRJkF1yvZm2uIlXnhbeDRukIeDAleFHLJxeAQNml4b
 o48w==
X-Gm-Message-State: ACgBeo2O45t8BqZ3wOhtd+rV0k+L4qoU5qbsZP8nLZ9OvIsPvKq33Enq
 eln6gzwUStirv55LGHXlAnWzxJLhXKltTHFmx0SU07z3u4omiw==
X-Google-Smtp-Source: AA6agR5wdEQEK+Retm/u5BnbwMryz3pxZ3P0il+KFDxb5lpW/sWxxXD0EVQECkE4rzxIJGgJ1jK/jYaZzrJSAyb58/M=
X-Received: by 2002:a05:6512:2356:b0:492:e06d:7530 with SMTP id
 p22-20020a056512235600b00492e06d7530mr2582685lfu.103.1661186062033; Mon, 22
 Aug 2022 09:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <YwNMUlAmu/qCjuva@debian>
In-Reply-To: <YwNMUlAmu/qCjuva@debian>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 Aug 2022 09:34:09 -0700
Message-ID: <CAKwvOd=9ozTdeYDWzY0i-hrD4Vew5qPAcamx6wo_Y7PA+nCYBA@mail.gmail.com>
Subject: Re: build failure of next-20220822 due to 4e6bedd3c396 ("ASoC:
 codecs: add support for the TI SRC4392 codec")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 clang-built-linux <llvm@lists.linux.dev>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
 Matt Flax <flatmax@flatmax.com>
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

On Mon, Aug 22, 2022 at 2:28 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported,

Hi Sudip,
Thanks for the report.  Two ways you can check if it's already been reported:
1. Check our issue tracker
(https://github.com/ClangBuiltLinux/linux/issues), you'll see that it
has been (https://github.com/ClangBuiltLinux/linux/issues/1691 ->
https://lore.kernel.org/all/YvvbKry5FVFbNdcI@dev-arch.thelio-3990X/)
2. Search for the warning message on lore.
(https://lore.kernel.org/all/ -> search for
"sound/soc/codecs/src4xxx.c Wsometimes" ->
https://lore.kernel.org/all/?q=sound%2Fsoc%2Fcodecs%2Fsrc4xxx.c+Wsometimes
and you'll see two reports from bots and two from humans).

> builds of arm64 with clang failed to
> build next-20220822 with the error:
>
> sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                 default:
>                 ^~~~~~~


-- 
Thanks,
~Nick Desaulniers
