Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418956B8D0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3FED3E7;
	Fri,  8 Jul 2022 13:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3FED3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657280923;
	bh=n3+Z5krWR99OlKbSR+5aQodSgHT9dp4WKx4WJCrDO3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWR0VAOY8yqDczH67bc8OAn15mRIlypJLY6iqWCS3yBNshIpRV7tNKD9T6gbhQJhs
	 ccqBbWnXbrFOel42I7JD8n/Y/9iyvSZlF6NNsnELLUi2rIjhJJLhfig02DndJ/EheQ
	 KyXGZYrblMjpxtlyLLc/ja+/SZ6HDTeQtiCucb5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21477F80084;
	Fri,  8 Jul 2022 13:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA34CF800C5; Fri,  8 Jul 2022 13:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3498F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3498F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V7bktCTJ"
Received: by mail-yb1-xb35.google.com with SMTP id y195so6147715yby.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8LXcNpiL0hugCcH3yPL4TbK7rxIaV5AKYrpbt4Nl4sQ=;
 b=V7bktCTJf9G6gqkLOYPmGR9Uh2eHfOZUgCs4tdTkpPxghs3aZzaZxMM5EaO05LZVbh
 jJ9/vn/oMbawWLJPrFb3h1v6mvjeR3EPg4pbWOxBS/oZu+V8DBiypl9w8fiVghF1g3EW
 gTuGwQ3o3t0Bm/oHPxSSzK3yF9j0aZkhZgzhn26e+VzfIS3NFaDWhGJfvMldbBYgEaB5
 H5xuFgRAyUp4aCFvmyndkXi9dWuu3Xpj6uqWT4Bwt6s+T/NctA4wDoN+kcMZw+Km54kx
 pCpkHMe7iZkGA8z+UjYeSaKH12QoLc+gH8YPPN3x0sSZH6+baAz5GQVIriMYTDENsw2D
 IsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8LXcNpiL0hugCcH3yPL4TbK7rxIaV5AKYrpbt4Nl4sQ=;
 b=blte22qSjs7fVKcuMM82DGtQxTzZ1tg/qmJ0q/PG7Oowsk4ICHDMPqHybvaKupq9XM
 S6WA+TAJBkepZ2OtK7kjW3D6ADCKDS78CkiwoisZ9VoNrbj3h1AuHvZ5M0XeMXI2mSBJ
 /4pRXMSLQWATdVIUHCY0um7AS3eoNbre6AAXvKaYsRkqnOPJyIll0UWhtOhhpc/dRKTy
 tIxFsXRZwZH5JSOlYnzURsTK0hHyAQ4cfU5vVKyU5dsHDCRnAibKKlCFZLpOIDYbL3qw
 K9yF00eaqxBFMhdXtFBbe+TtUEAQXF9gsJ48MkwEDyXxsScp77wIQamO5b16o394W5ZJ
 FYHA==
X-Gm-Message-State: AJIora+dZkeio+IGjY/aRdgxFvDosVFMNQ7XLYOwkaYsXATHWSICPcCn
 KtYukphA1gE+SeBxNGXdoNRuMG0QV7ORaf5nJfY=
X-Google-Smtp-Source: AGRyM1tdP4x7JQy/x8EF4GTgKqBJp8bVVhJs9zL0bB2Xb32Aq50XDeqCZxjHY+getXx/QdxDCe7PG4rZ4CDZs0+VldA=
X-Received: by 2002:a05:6902:154c:b0:66e:8254:146e with SMTP id
 r12-20020a056902154c00b0066e8254146emr3318465ybu.570.1657280852776; Fri, 08
 Jul 2022 04:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
In-Reply-To: <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 13:46:56 +0200
Message-ID: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On Fri, Jul 8, 2022 at 1:33 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> On 2022-07-08 12:22 PM, Andy Shevchenko wrote:
> > On Thu, Jul 7, 2022 at 11:03 AM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:
> >>
> >> Add strsplit_u32() and its __user variant to allow for splitting
> >> specified string into array of u32 tokens.
> >
> > And I believe we have more of this done in old code.
> > Since all callers use ',' as a delimiter, have you considered using
> > get_options()?
>
>
> Thanks for your input, Andy.
>
> When I'd written the very first version of this function many months
> ago, get_options() looked as it does not fulfill our needs. It seems to
> be true even today: caller needs to know the number of elements in an
> array upfront.

Have you read a kernel doc for it? It does return the number of
elements at the first pass.

> Also, kstrtox() takes into account '0x' and modifies the
> base accordingly if that's the case. simple_strtoull() looks as not
> capable of doing the same thing.

How come?! It does parse all known prefixes: 0x, 0, +, -.

> The goal is to be able to parse input such as:
>
> 0x1000003,0,0,0x1000004,0,0
>
> into a sequence of 6 uints, filling the *tkns and *num_tkns for the caller.

Yes. Have you checked the test cases for get_options()?

> >> Originally this functionality was added for the SOF sound driver. As
> >> more users are on the horizon, relocate it so it becomes a common good.
> >
> > Maybe it can be fixed just there.
>
> avs-driver, which is also part of the ASoC framework has very similar
> debug-interface. I believe there's no need to duplicate the functions -
> move them to common code instead.

Taking the above into account, please try to use get_options() and
then tell me what's not working with it. If so, we will add test cases
to get_options() and fix it.

-- 
With Best Regards,
Andy Shevchenko
