Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F056BE55
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4936C1DD;
	Fri,  8 Jul 2022 18:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4936C1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657299076;
	bh=1aKltydkZPX622Yv0ceRIhaGuaF0xOHwYfm0fd4wZN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cV090zFAtCC6CsRW6SGDhhgs7S2VJz9xzLZS9zISMYyanGYGQZXObiOyYFnxddJmO
	 3/DsHfjmy4QnxOUEGKdWGVq0OBHn7vSqtGcDLDBevqtWxDtPBHsk+obLrtTcbfTtu1
	 +9LRuTp+nTCDKYTK7BIxxNWspF7GlyKi+u/sp6dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9C4F804E7;
	Fri,  8 Jul 2022 18:50:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76227F804CF; Fri,  8 Jul 2022 18:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E80EF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E80EF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kQcH4jPo"
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ef5380669cso203632317b3.9
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LaMBIefLyrWIZ2KZH3vrySSwBs8YIATiA1SUOo0jUEk=;
 b=kQcH4jPoCGp9lpWPfnBqA8M4TYbwkC2rLOQjvC8rlBMkMveIVZyPRnm0+QVVJSk6Ye
 WFduDaZinYYHf0w2QyMNJWQ1NIiJ6zhkfKadzwP/1xY4dnWlAV4OV/Odr0QzQM4Blk4r
 vZnom6p24eTvTGXD/77BaiFfBUUG9WGTqRmZ4Jd4kWR6F3u1tVMbMRApX5IgVckjJgy2
 KBp1YFYz0ETJ5iJrmXGBJmqM6JtHErBIOOd2nf4sy6wGlNhwNAgvf82a7uL+vvdYGfin
 fBuSyQo/xwCw9M1L+sXRh+yd3IlRCGF4CZlGrcpsSsogFl2hTlILi8jpVGcAtNeWqUSl
 xXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LaMBIefLyrWIZ2KZH3vrySSwBs8YIATiA1SUOo0jUEk=;
 b=JKDs9N3PYm5XRwZrsk6/vFXpeF2TEAh8JPdVm+xHz2Yi/fC5pvOVVgYHbNwhxmyglr
 3WDxhnEYBxPJo+3dtn69bWiL7csGi+oQK2Pnt0/pTapW8bh5lZYQQkUACXS1rVcBXvu3
 b2uMYvOOSM5JGOKhxDygJlGm07sYglr9eTeAAhE+0Axk1jIYiMjg6W8mlVi3ghb+SC6c
 aT9zdbCs/LNvp3Ny5b1vrwnEn13ANE/BzbOY4/HRsf8bNsJqZ7M/oJ35uzNor+wvM3D8
 LTi68Z8YwM1EkOiBJftiCFN0NRRCtle8ybEYNS+eWO9jUQq9z1lOqxJqBPZ1BCEYJc5S
 WVrg==
X-Gm-Message-State: AJIora+p3GiY+KF29U81gECDA3fKxWpGS3j44MSC6LOYEVr+Xty02X4J
 QjLITzoP+vLujjqn65zJ6sGA+5MXAKSbN83SJkA=
X-Google-Smtp-Source: AGRyM1tZlRngOGhokxDZmr1qD7HVrtiCVQ9gBovI9Z7DDmmuzaLt5cP5jAfxbLydF4YD2WWIPe7PJYFzWZHtVmC6G94=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr4939212ywq.18.1657299005058; Fri, 08
 Jul 2022 09:50:05 -0700 (PDT)
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
In-Reply-To: <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 18:49:27 +0200
Message-ID: <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 8, 2022 at 6:32 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2022-07-08 5:25 PM, Andy Shevchenko wrote:
> > On Fri, Jul 8, 2022 at 2:34 PM P=C3=A9ter Ujfalusi
> > <peter.ujfalusi@linux.intel.com> wrote:

> A long shot, but what if we were to modify get_options() so it takes
> additional element-size parameter instead?

But why? int / unsigned int, u32 / s32  are all compatible in the current c=
ases.

--=20
With Best Regards,
Andy Shevchenko
