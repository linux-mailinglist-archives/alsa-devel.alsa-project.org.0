Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8E341907
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 10:59:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B148167E;
	Fri, 19 Mar 2021 10:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B148167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616147978;
	bh=wzzDvQg9iQjrAsBKawcOWaOhIdortUaaJaMGI3+MA0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PEfnWJD1KlscJIkX42UppwhGIDhR2hl6ZQTch3i/yXLFNyxnEwYT9QYlwJr3M6AsY
	 7EK31G/ECFi0c/2S9ElDBVfOVvs/Q67+TQHwbJVHVXCHKYBN5uAL7X3ZwMDLXia09h
	 Iy1yk0OZTKmXVo0ELs5yf/BlXuV23kz9KFx52L4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF66F8023C;
	Fri, 19 Mar 2021 10:58:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF527F80124; Fri, 19 Mar 2021 10:58:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40E6DF80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 10:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E6DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UG2HGyH7"
Received: by mail-pj1-x1032.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso4584644pjb.3
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASJMW6scRGdDPaxrraLcWwaKe31/1z+RKDFUJFFWtbE=;
 b=UG2HGyH7w2FE5tAZv1zqGqlEcDPQJAB1Ch9dDuXgL4MVWZREHEoils1+2zs8Rzp3x8
 A/GApl1OPPqP4Q9cDMw0sy48UMWzIzopSHj6qDkEJWjiJW3Og/mojXuYK02NtmiTuX+i
 iIde2KPIz6VorgdIvYb9K4dAsM36QgwqTNnJicWnvDIXUef89NnK+SaiAHDu1WnKpgL1
 b52EGc22XTjbYm94HyQ6JGz7a2VWTYqQFwRtEwGP32rY9TnDyoV2Z5uTcP3nyMxA4w40
 xHKN8L0aPY8HYsoXZakJcQNCESmLzZ4EcL/VOCuvw3/cOUCb6FsQJ5zc3rNU0fB5/WVc
 csWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASJMW6scRGdDPaxrraLcWwaKe31/1z+RKDFUJFFWtbE=;
 b=njRuDHVh4NVHPN6lAyqkEOG1TSTVEv5v7ozrJykJXeImtz69a7XJPwEKZ3I3w0JN1a
 Wy2fsahV3Xn/GhgEP9Jya17hGEXLip3Z77Fy4T/W7WxCIUKMsMZMxS6BGgd/b1vyIzWP
 iMfsEKj7rMiQNFPZUL6SkCRIlFT4lCLW/AUDjRFj7WnyCgfh+Y1RGDXC+RvU2r14VR1H
 WObTIjRBCOHsgbadjvw6tH0U0jgodnlgaVNSbmwtHRzFfh0prqR9NcWsgUMRODfobaic
 K+jBX0bb3U3EzyYIv2eg0jiH3eNnayK5U1ZaKbwOX/nNnBdadXif1hhlxv/vxicvyCQP
 DPuQ==
X-Gm-Message-State: AOAM532MVZ3Q8QZ7nayz86TbnUeB/iy9PWJUK7YTAItzI3axwp9JCZct
 nN4HXTMXvcKS3pDyCdxyDXg+VihI+2DK8q4lGtM=
X-Google-Smtp-Source: ABdhPJx9byxFnl5x8/MIuCMAipr1QMVdKi/S2blW5N+g6+8VclWkCkttaH8wH3Rdn84kWtmn1OPnX6sKEYsBNoNYAM0=
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id
 u8-20020a170902c808b02900e64204f62fmr14044687plx.0.1616147878694; Fri, 19 Mar
 2021 02:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <202103191536.9cD1TuQQ-lkp@intel.com>
In-Reply-To: <202103191536.9cD1TuQQ-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Mar 2021 11:57:42 +0200
Message-ID: <CAHp75Vchoe2Z00ODh_AWos3Chfa1AoQMjZw7aD=5cGsTFtK7hQ@mail.gmail.com>
Subject: Re: include/linux/unaligned/be_byteshift.h:46:19: error: redefinition
 of 'get_unaligned_be32'
To: kernel test robot <lkp@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linus Walleij <linus.walleij@linaro.org>, kbuild-all@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

On Fri, Mar 19, 2021 at 9:05 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Linus,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8b12a62a4e3ed4ae99c715034f557eb391d6b196
> commit: de8860b1ed4701ea7e6f760f02d79ca6a3b656a1 iio: magnetometer: Add driver for Yamaha YAS530
> date:   10 weeks ago
> config: m68k-randconfig-s032-20210318 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-277-gc089cd2d-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de8860b1ed4701ea7e6f760f02d79ca6a3b656a1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout de8860b1ed4701ea7e6f760f02d79ca6a3b656a1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/build_bug.h:5,
>                     from include/linux/bitfield.h:10,
>                     from drivers/iio/magnetometer/yamaha-yas530.c:22:

Isn't it fixed already somewhere?

...

> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
>    Depends on SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && HAS_DMA
>    Selected by
>    - SND_ATMEL_SOC_SSC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC
>    - SND_ATMEL_SOC_SSC_PDC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && ATMEL_SSC

This one though is interesting.
Cc Takashi and Mark.

-- 
With Best Regards,
Andy Shevchenko
