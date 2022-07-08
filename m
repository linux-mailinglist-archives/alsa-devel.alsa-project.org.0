Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE656B889
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA13F3E8;
	Fri,  8 Jul 2022 13:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA13F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657279870;
	bh=zYT3772o5tMCYNq+VEApf/z8p61fpPT7/cV32XxONoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mf2M26mJmBIPmvdW9ImuoK8FCpt+Ia2z0btsXxUxoHtgOWyjFOhLvzTmGPdxLexfh
	 kV6cSn83dNfHxHNgnm1XN3eZV6aLf1Ps3wwbz9RFfpw+tUcf3tGHondwBIzh/WiKdK
	 1CAfaXFO2id7IlMnhaeEgkfW0xbgzqM8OIP8R0fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FEEF8025B;
	Fri,  8 Jul 2022 13:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9764AF80167; Fri,  8 Jul 2022 13:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E81EF800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E81EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aIrhRPwm"
Received: by mail-yb1-xb2f.google.com with SMTP id g4so37316785ybg.9
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Znf5kwic3swsEPm/VX1nhdtTQ2a4clPVk80deBD+g1Y=;
 b=aIrhRPwmtS7jdp+GoA5OzkTK3M2lsGW6uVDvlhCzP8iYXs1ude3Id9tbr5pcjY977+
 jpRPa2RfavV4pWJCowLsDzp8HoW5uEgN8R7Mf+fxOi7RnfNaNZvl/CvdsUG0sEub924t
 YXyVKXunoXH1Xxb0qisdSklipYjZcmf9eIbezhgr07vJ7kH+n8QuJz8fMptrcgAiYnro
 g6Fr7rKNuh7cK685D9oy+BSU4PtxTMLYNtavOrAS5OuPNRkolH99tC+sII8fTyAhB/UY
 Uhn8bMuF3e8dpWNr9an9pOTm8DPW81x56aOBQ3FVLyK8SClPN4sKno90TFuwf1P2L31Y
 4FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Znf5kwic3swsEPm/VX1nhdtTQ2a4clPVk80deBD+g1Y=;
 b=T8zwaJmb5AJcwprROdegdivIfAPEkROi6AZSbI89EoVBFbRPbWggP6j5LiR6wRIgAO
 gMZNIyfLNbTLh9PMN6lZEsaq0PbVTsX7BTAvei+AX2Maurj7lyE3qJ1PRq5WLCPtBpzu
 zEKFCQ5ziWDQEejuD7OFd9Fj1w60KWzxI6UEJcNivZBWTOiFcD+Xo6mp7FTb3QLq6/oU
 YC1btunOR6qTBuwRlZ0LhY5hlQrB0MVXS8j0/StbiP2PbZavfYeUfLvn2cNgiYv1E4iZ
 ofIzOlRab/k1OSX7BkAp5ksx8zr+j7yLC3Z8sbK+3Or4TKjr9QOP5LeLIWA66+nbE//0
 jDGw==
X-Gm-Message-State: AJIora/ExSADYcrA1tzip/9bQJfds7a6FaRa26xX03dX2/0ME9MzCsoF
 V9I1BwmDXYLKzYZjbaRJB4nDoQu2rv7jqkcqXiY=
X-Google-Smtp-Source: AGRyM1tEg9RcoPDzQ0HUZg42icoAq3a7h+ylR6/AYWxuzRcKugx0qE8bC4/Qd5pG3DV7+vMU9z8cSABFuJOWgKoH1W0=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr2961375ybs.93.1657279797818; Fri, 08 Jul
 2022 04:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
In-Reply-To: <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 13:29:21 +0200
Message-ID: <CAHp75VcgwMBeo_q1rH3rt=Ax_AmzBeM2CAWXkCYwwhYdhCquZw@mail.gmail.com>
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

On Fri, Jul 8, 2022 at 12:22 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 7, 2022 at 11:03 AM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
> >
> > Add strsplit_u32() and its __user variant to allow for splitting
> > specified string into array of u32 tokens.
>
> And I believe we have more of this done in old code.
> Since all callers use ',' as a delimiter, have you considered using
> get_options()?
>
> > Originally this functionality was added for the SOF sound driver. As
> > more users are on the horizon, relocate it so it becomes a common good.
>
> Maybe it can be fixed just there.

Forgot to add that we (trying to) don't accept new code in the lib
w.o. test cases. get_options() is somehow covered. If you have
different test cases in mind, do not hesitate to add!

-- 
With Best Regards,
Andy Shevchenko
