Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16EF56BCEB
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 17:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E52B847;
	Fri,  8 Jul 2022 17:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E52B847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657294229;
	bh=YMEGxIrE4woAf5cnzkZ+3hQp7ZS3VGf+M1Bxpp05xRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c31aoZs2IFIJyk7878mTFRY5pnfXYM1kGgOO4PnwTOxQwWiUBpb2F8OOZARqbzZqQ
	 g3w5JSRz/HIMmc5aa/wGseEMQgZUuIvF0sXmr+nvvgUZ0XsmZyL5x0rtjdT1j3IKbZ
	 IfKx1Irugh+upZyjFZETcx/qjx/Qd0lqm5ElzOVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C811F80084;
	Fri,  8 Jul 2022 17:29:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02325F80167; Fri,  8 Jul 2022 17:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40CC7F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 17:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40CC7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ecaQUHS0"
Received: by mail-yb1-xb36.google.com with SMTP id e69so31796802ybh.2
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YMEGxIrE4woAf5cnzkZ+3hQp7ZS3VGf+M1Bxpp05xRA=;
 b=ecaQUHS0lHe+xS7QeRj1P7pinsI/NrxvyEsdPWpDaG8YB0F0Gz5iEiFh9Ln9piexBw
 zQwkOUXEIc0AVVNGhpCiTO4NKOH6r0qPLtCr0wX5GBIgI6AjppwEqmpJ6EA45WJ7GniL
 H0cMz3WrgzTFVKC1UyQdBTLpO3kJ17s0sw0uPGMmQSrdlmq80M+yFSD1NuE9jEaBnymI
 Ff+/kJsyLWJ3zVjyZgsEau9JwoRRBMKgEwL7wpIWCP2wI9w0zmjWCToJ4h+VEKDTKIDl
 quGIcI3DxzcnjRkhNk83S6Gb79aPn+5X6FJWpwiFoxfQM4WzORdTLgDcc02w7Ir8g2Ww
 Te2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YMEGxIrE4woAf5cnzkZ+3hQp7ZS3VGf+M1Bxpp05xRA=;
 b=jz5Ad2puJ1vLgSO3P0p3uszLvpiSEHg5LLfulkSFRj8TCnYf1ykc6hkkvmLbAiISA6
 AZaGgEBhi3FnQoeEG8MSXJf+n3ccyDAnLpEjzkBKCP8LpN2h4TAtFoIKkpBAMNYk7ySz
 BsEwrF50G+SjCpiXbnrsm6/fYg0Ffu1Xj3h+Zyy8iGcKvD2wvmHljhoJ7NIy45oj2ggR
 PYHF/y/s0EYG55I3mrD5VrPHm9nM3xBCB6+RdB8BR7rMNIUdSeSnZFtpGn7GeIf/gfxj
 iCTvaKFwbY5evTNFu+pJ7pOmEFmzZTavQ5EirqYXOJlx1UBCUfqyOrvEIpsF6wcASfaC
 j0Uw==
X-Gm-Message-State: AJIora9HCKzH0bTOINt26jJUqpDBTkNLepiB3X2xnI8ej/UjNG/bh99N
 IrqY6x4QxO1EPLYlUpZVzD5c0nXsQcu6a4Mx7us=
X-Google-Smtp-Source: AGRyM1swmlKZ4XV6RN24eaRkZwJll3K67xeqgJ9qYHEzq8RVNfkeSaXb0i1fFJ5yeI+4TVhowP1eXn8EehYYfXKEa3Q=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr4250392ybg.460.1657294159638; Fri, 08
 Jul 2022 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
In-Reply-To: <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 17:28:43 +0200
Message-ID: <CAHp75VcUmy3xa3kKQSsiG84f3VWd83xt9ZTGnAdA3Ub1PJ7raw@mail.gmail.com>
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

On Fri, Jul 8, 2022 at 5:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jul 8, 2022 at 2:34 PM P=C3=A9ter Ujfalusi
> <peter.ujfalusi@linux.intel.com> wrote:

...

> (it may be casted to struct tokens { int n; u32 v[]; })

On second thought it is better not to do this (it will work on x86,
but in general it may be surprising on BE-64).

--=20
With Best Regards,
Andy Shevchenko
