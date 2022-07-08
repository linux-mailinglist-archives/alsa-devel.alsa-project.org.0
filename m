Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C125C56BCE2
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 17:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C97185D;
	Fri,  8 Jul 2022 17:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C97185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657294027;
	bh=REWtmySyv9UJDRb6ZTczhJEXpXEOhplP3vTe5Nx5X0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oma3Cgkzuvof/b5lPy0H4zwvr9OKDX3urY2/WNifXVDCchGESLkDzXzevn9z9/JFH
	 2gTvxkUU5f33HeLqCIs0A6vAPyTCrbpisRwXhpyX65HwTLuIB+XAmokoDCQmv6pjf6
	 rg01uzC/xcjNAf9PwcNzXU7ZmNrDwLTBdQgd3Ei8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 997E2F8025B;
	Fri,  8 Jul 2022 17:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 997E3F80167; Fri,  8 Jul 2022 17:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534E6F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 17:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534E6F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fWK7HkQg"
Received: by mail-yb1-xb2e.google.com with SMTP id i7so38350642ybe.11
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EIFiVH9lUi23KkCa9V/IOGOENSKqD85uGqpTdZl7zAY=;
 b=fWK7HkQgFIGRyNUeE7G9RPw3OTeLrtzQBU6e4ZqpzOQamkRYX5OaqR/9XQ1BNla4l8
 fJVA0X6+czUZHqfcGk1SUUtBiciNfPjS8ygo/Q6RuZd7jfYz/j2GMp1DCbjY/7bRvfpJ
 F5onpKz8wwWV2aFzs1edfnh8TuAa9hui6zfGFkGILvjlCaqauUH3edoBJz90XprJjq5m
 sMhL3cew/FXdjmQBFlFsMQ+Ru5D5bCwlsKsBL01juon4WXx5g2yHPcu1T1hPjrqs7dWS
 LKo91I2os4Gs4yuSPHvZW0PEQrbAREEz95O7WuFrbHmojuhknjtDUp7BdZBRHGa+lJhT
 bafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EIFiVH9lUi23KkCa9V/IOGOENSKqD85uGqpTdZl7zAY=;
 b=moLDQEK3iFQMTiSRvUqtEoBWbWM3xghy28KKWFzRCCqObUwmF9GTrhNvUSIEnzf06o
 /m6dbnshGvEGx+6XSohJf7KVW8+KlNX+VeBYysjlcnOBrzThuzCoviHm2mCIlOAoCE6G
 munbD2x8FMR2eJnCkShvx6TWkpfDpko8qHcPRG41oJ/Kj/FE19M+dq+bNH/4/VwzB4Mv
 P2zX5/99a5KiuHizm871S29BNlS19WCFaWimJU55fPFC3eim1Ik5WQZXWYEvIydR6+9f
 UfOMfOPLG/HCG1msivYR3dWTI7BhN52NnQU8AeecG6dKlks58m+UK3mLWrwdGJM/1eB5
 PQnQ==
X-Gm-Message-State: AJIora8/t+pOr6QrseAOtOkVYX7BujLjPOwcKgujNExOZ4nnzGR0UQZn
 mr0DWS0U+gtD4a3JBA/CgtBrBjbxXCnw1f7+sls=
X-Google-Smtp-Source: AGRyM1uhtmB9cS/RxSD8hUp+5PnXY+7NZya0HJicQKj7l3rlxuBdooljqAlXBFkG9G+H4axTI+jmt9UBpj3HctV9YRg=
X-Received: by 2002:a25:dd83:0:b0:66c:8d8d:4f5f with SMTP id
 u125-20020a25dd83000000b0066c8d8d4f5fmr4307324ybg.79.1657293957266; Fri, 08
 Jul 2022 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
In-Reply-To: <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 17:25:20 +0200
Message-ID: <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Fri, Jul 8, 2022 at 2:34 PM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
> On 08/07/2022 15:30, Andy Shevchenko wrote:
> > On Fri, Jul 08, 2022 at 02:13:14PM +0200, Cezary Rojewski wrote:

...

> > It seems you are missing the (1). The code has checks for the case wher=
e you
> > can do get number upfront, it would just require two passes, but it's n=
othing
> > in comparison of heave realloc().
> >
> >   unsigned int *tokens;
> >   char *p;
> >   int num;
> >
> >   p =3D get_options(str, 0, &num);
> >   if (num =3D=3D 0)
> >       // No numbers in the string!
> >
> >   tokens =3D kcalloc(num + 1, sizeof(*tokens), GFP_KERNEL);
> >   if (!tokens)
> >       return -ENOMEM;
> >
> >   p =3D get_oprions(str, num, &tokens);
> >   if (*p)
> >       // String was parsed only partially!
> >       // assuming it's not a fatal error
> >
> >   return tokens;

> This diff is tested and works:

Thanks, Peter!

But at least you can memove() to avoid second allocation.
ideally to refactor that the result of get_options is consumed as is
(it may be casted to struct tokens { int n; u32 v[]; })

...

> Could be made nicer with some brain work put to it, we need strict u32 wi=
thin the IPC message for the array...

True, it needs to be thought through. But I guess you got the idea of
how to use existing library routines.

--=20
With Best Regards,
Andy Shevchenko
