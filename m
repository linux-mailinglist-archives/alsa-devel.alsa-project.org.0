Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8311B573307
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 11:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E17D16EC;
	Wed, 13 Jul 2022 11:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E17D16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657705249;
	bh=Qof7DzLiaRiho+thbaSITAjgpteeCahmZUoHQ1BMzCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlOyKA2ypNPvZieDoDIW7cgk2wdIBotv2IFUKrco0meUEn/ZFzRxqFBzSVLpQg9tw
	 ehcb8aqu6/cCfmuYglV2cXyjzQbCuvIkIxS03YyQU2MGBj5peEulu5fN2AGjfM19j1
	 JirQBi40080cn7YSIHhRso3/ChsSFqMFhQcZHqa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63040F800AA;
	Wed, 13 Jul 2022 11:39:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF53F80249; Wed, 13 Jul 2022 11:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD67DF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 11:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD67DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZO6UB9xl"
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso106425537b3.9
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/bZLQ21BnbCxpHA4zoKoOFFh9G3ZriCKWCB4lTGRTU=;
 b=ZO6UB9xl2PomzSnA9P0ERrfsb+F0CnXxcbeTNjkLpFEo+2za3/xXWGbmqKTihGXER4
 mUgRTu0USH+xA3FoCVjWLUFkdgJyDitP/5IlrEykEULV55mtPO57VI6rmC/VX416o04i
 kwQ2YtAApJmvL4GOZ2EoIzNaIBDWwqYuzIng2KRohWNuuIVHdS8JipjKP99t92jluQsC
 SISG6PGesDj5oYOmbT0cXN8DLCLKvFQyDUy4LXMu77z2q11E2r0MZC87PvFMpE1f/3gy
 HcQxarJCB6amUiC0bsTHYF7BFZRv9dnUrP+YMZZZOKyEzJfLzJ57y79Rrry3IR8It8sz
 VUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/bZLQ21BnbCxpHA4zoKoOFFh9G3ZriCKWCB4lTGRTU=;
 b=Q4MWgnuftM/l4h5NaLcDmcz5B0g3CwaqllEJ5ulmynsy8qH9fnk239+ZGX2dJUZD2d
 oPME0apSeUrEhDu6yNxQsxiwSG0C9FOzFBMKIcKlUHlEs8uLCyb/CkuuNZqPnwJBvNyw
 vZkfxpCrVw2fV5XpnaaPUW5WGRAm0xdWVETuz5b4QLh76m99L2rc5ta/g/zfafMCR3wX
 FKC1ZYYemcrCcRjdOhGsTZUdQbH0YKuiFEp5/0EM9hMmunZo9ntuqLp5gn7+UIq+POgC
 bjaGE61lbePYqHMCVsBfqi7bB5+S4ujpBX5hdP7CBdTYFqerMhU0lJZRD0E6Ag7cb0Ne
 +9sw==
X-Gm-Message-State: AJIora9aWObARgxJFoIw9bNKBxmfiLNwweli/LTbw1dyxVFFsW1pJB14
 gP3dV08xCDlxjSqYOTgbV+tnOLyd9WQzNO/uCBY=
X-Google-Smtp-Source: AGRyM1uNbxKaJof5c0AAkDGC552d0gWxId5xZzgbfSrWHBy/aP1poMmgkbYdzJkcBPwCKqdNXqAArZSaWfKIFxdFASo=
X-Received: by 2002:a81:4986:0:b0:31d:388b:d08d with SMTP id
 w128-20020a814986000000b0031d388bd08dmr3002440ywa.185.1657705175260; Wed, 13
 Jul 2022 02:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <17c91bfb3a864ae1be2ac3226f170f55@AcuMS.aculab.com>
In-Reply-To: <17c91bfb3a864ae1be2ac3226f170f55@AcuMS.aculab.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 11:38:58 +0200
Message-ID: <CAHp75VdOq5-2h_ojRaGKs1sJqM-wsYtv4543FeBW4_eH4+gMVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
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

On Wed, Jul 13, 2022 at 11:14 AM David Laight <David.Laight@aculab.com> wrote:
>
> >          if (pint)
> > -               *pint = value;
> > +               memcpy(pint, &value, min(nsize, sizeof(value)));
>
> That is just soooooo broken.

OK.


-- 
With Best Regards,
Andy Shevchenko
