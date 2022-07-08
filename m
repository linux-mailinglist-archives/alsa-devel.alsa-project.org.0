Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1056B734
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 229B983A;
	Fri,  8 Jul 2022 12:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 229B983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657275833;
	bh=6KzkschGKTWTaHNsKQJYX8KTGYcO/FDTJpySLd9Ijk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p63HyS49WZaK19JSQy+Rkyqw2bPWRu3Lybo3f9WL9F33xBHLZ7pEOO8wkvVBMpHwe
	 Vh98d7fmHYuZlS9VbiXKEWkO4OrWkS4cZKV0siC52rUeKLvxp0fYhIM/EP6W0WsTJA
	 0LNM+Z63MJxVFkDCWr8jxjqto3juXpYdSsx7PE+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF18F8025B;
	Fri,  8 Jul 2022 12:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A484F80167; Fri,  8 Jul 2022 12:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E885F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E885F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X3O0NXyh"
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31cac89d8d6so124586957b3.2
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZ4IbpkhTt7N5QdvdcRfv0LETZPalI9AnqCWUmPEgog=;
 b=X3O0NXyho2Ze70IR2+FhfW0cRMjUsjsmkHjyiiNZ2Ph1zTaLUx4Nz1WJ20nk9BBS8E
 Rr3plbtojjCdfENUItK5Ik0H64DQqJzGPLyJTWWnAWObahAwp+bpglbZBepGzeouMp0c
 cFPcoohMwZCTsbQn/gyLHeFmNaRqnxANrSF28HFe56kgUwVPGOj3A0mgeRB9TQv4ErKT
 zttGd0xDSPSXPTYLAA2rk/ZspSRi96vEp5Wl+VG/gjNep7XzG6pywaoUIFTH4rHLprAb
 bI7BExV8B83ZaROMgzzPQFAumDbnSrx90e5VP4Dkc1D89VpEZuPEI3ME5ANp0Haia8jG
 RY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZ4IbpkhTt7N5QdvdcRfv0LETZPalI9AnqCWUmPEgog=;
 b=4+cGXiTyh4CFWITA9Ks9xIoLk5Qk1yOgUFPe7aHxz/8OOrh3ExSVaqKSS5x2xQdPcu
 4wq2BP/ntzQVeWJaLJiL5WhMWfhdxJwO2Uwz58fmO8jmEbm2FSsOhHKWient2OhXf+OV
 gboaJaV0GIsp9hQf9yuKmFH1pAp/rATUThpBYJkOKaB0y8M3Ovzk5hu0iohUgwjMiihj
 DZEXfUB5r1duw4TaiKgIT3ysRRKPLNiB1UCw0954k0UqV3XNBio7K56GNamag/fMA+yq
 dPulRuGJC2Hq04DDNCH3b7a+eXmgDrMWDjcsEJc8dJ0GT0iXWc7jLCoCAJjeTJvFqBS3
 R8Gg==
X-Gm-Message-State: AJIora9oLB+bI1f2MjXC3lF5R0TjLdikM60fLip6RaZjBIWwhi4/3y8Y
 FfMfoGZKvBC/RvFUV1oloO0JLxF474/g8XeLfQ8=
X-Google-Smtp-Source: AGRyM1tl6c85dccTAnzvDTTnQkyHZS0mobUXNvZdBvp7v+R3SZa6ILtw7kdYwTzsLgFK9dnfMyZhIYJxwyBJJk2Mdso=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr3133190ywc.520.1657275762117; Fri, 08
 Jul 2022 03:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
In-Reply-To: <20220707091301.1282291-1-cezary.rojewski@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 12:22:05 +0200
Message-ID: <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
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

On Thu, Jul 7, 2022 at 11:03 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> Add strsplit_u32() and its __user variant to allow for splitting
> specified string into array of u32 tokens.

And I believe we have more of this done in old code.
Since all callers use ',' as a delimiter, have you considered using
get_options()?

> Originally this functionality was added for the SOF sound driver. As
> more users are on the horizon, relocate it so it becomes a common good.

Maybe it can be fixed just there.

-- 
With Best Regards,
Andy Shevchenko
