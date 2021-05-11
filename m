Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4A37A95B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0EB6181C;
	Tue, 11 May 2021 16:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0EB6181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743520;
	bh=OOvphOeNUgy2lxMUPdsvEYMQ/AfTsUVgNH/pNJ4fJv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKpCIuF3JzjK6YyviZaIJ7csS6TIusw63RGbvdEhB9BlntVxxxk1kRsqv90U3HSMo
	 slBzq4lB/SUy1uG1iZGdiifHfESRG7yGNbEeUr6eXYo8fq+CgGhXKRddIwWoMK6SNP
	 kWW7Y+CQLfo7e9rTyDvrys+WZTX3cAfw/rqgf3Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E0E3F804E4;
	Tue, 11 May 2021 16:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E465AF804E4; Tue, 11 May 2021 16:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3ACAF80475
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3ACAF80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ef363TFW"
Received: by mail-pf1-x42c.google.com with SMTP id h127so16191936pfe.9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s9vYfnNGizia/DXzQt9LvMmzevHRIe0AtBEWW+5SpT8=;
 b=ef363TFWFirJXVfI9x5WSCfHySvf8gXrsZmyJ9A5nmPUlKj+wNgeLnBp4hkI5XGiX5
 my1P6/VdipbKZcJ/si2D+JD6o144GalW8TR+p96/tU9rjK3MeFik8tIhvkIAt2PIQaq4
 DYuC1cMNedDSPdutc1bvjWqdZRf7Z5teI6LGEj4dXWH/j6Fp88P/noljSD/AKvhOV3v/
 B6JHAmUBhdC/5GbFFFvzRKjfRqLBRgvZySCttMyo6TXtL4S3bkrjDva2nFJYshwgguzC
 fWySgFFg6ZVbrP7b6jaA9Ad9zgouLo8YMC5H43mFc9s91ZZ5mgYqDVQB/RuRhxcvOJf1
 vuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s9vYfnNGizia/DXzQt9LvMmzevHRIe0AtBEWW+5SpT8=;
 b=aixazr69/zBLnY6CAcs2HHKRbYd85rEKe3LNTMaRXRYrD73Ap2sgkll75Ezl38G/Ey
 8cP0VXUyetE8cHrTtvUmBuzMdioT5pc3tJ1GRQWWYRupYIHeIb4NsiHm6sv8/eHNV1m/
 xHE+9a0z9BJUblGv2qW2Ch8UUUUYv49rlsrpdgDQscABHqwIUoeAyDPCyi09isIM4Jxy
 EucgzsvE++3jbCa3KeeE3ur8geu3Y7pHFmlCgrzi1yhE9lfD787XuVF2+6Kum1+NCT5x
 +Xu74bwRsskRsnD/Opc8Wm4h0c3Zs+dX/KXpLTuNjKkP4J/pSMm1JIF+9oRWkadTajee
 CMTA==
X-Gm-Message-State: AOAM531oQNispokHT67GkT4PAL8Lqj4DvG3wYIiaGYLWdQSf/G08m5ts
 XVJiki9kG49dd1gsWdBmqiCQtEkkDiJNT5eIhng=
X-Google-Smtp-Source: ABdhPJw8nPLuRSRyShhXX7vnVnPbSBcHzhmkN+VmRMyx6DmoNtkt8GxITxTEKN6KYU9V/EeI0uf1gNbAfnDo8EPwCjU=
X-Received: by 2002:a63:79c3:: with SMTP id
 u186mr27596553pgc.203.1620743310395; 
 Tue, 11 May 2021 07:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
 <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
 <YJqRBIdTlvnsCYsn@smile.fi.intel.com> <20210511142433.GK4496@sirena.org.uk>
In-Reply-To: <20210511142433.GK4496@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 May 2021 17:28:13 +0300
Message-ID: <CAHp75Vfh4AViMMSm6MKAGP7s_ANOSyHVDj5qG=j5YrLPjH+Y8w@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Tue, May 11, 2021 at 5:25 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, May 11, 2021 at 05:13:24PM +0300, Andy Shevchenko wrote:
>
> > Just in case I'll send a v4 with only patches that missed.
> > Otherwise it will be the same as in v3 (see above).
>
> Please stop.

Okay, what should I do?

-- 
With Best Regards,
Andy Shevchenko
