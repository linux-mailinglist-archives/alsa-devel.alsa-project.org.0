Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64C38B93
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 15:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7191657;
	Fri,  7 Jun 2019 15:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7191657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559913832;
	bh=xmFzW+wz9mXmxrwczU5GmZvTy+cdO6TA0iTm3iN8adM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LL1sfYfZBhiG24UW95tx5FgNkxevNygrhI8/3tXY0R5HPPqaB6j43zcfeDXNXooDc
	 K/H4/Wuc2D097pGKiL94xX1BjqzIdRLI0DV0Kv610edUcj7GpIWQ6B15RNbsvUfTI/
	 znIMAY1gFHt+9sDeqh2phD/iG46GF0og7Q9EVrj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7892F896ED;
	Fri,  7 Jun 2019 15:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BD15F896DD; Fri,  7 Jun 2019 15:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77EF6F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 15:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77EF6F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YPuvd10a"
Received: by mail-lf1-x143.google.com with SMTP id a9so1600744lff.7
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zglteuaazaqBthCmVMbShzAeX2Opukt4XjIfNYWzrcI=;
 b=YPuvd10a/GlBuRZauyY3uwuOo8uVd03efjQVxBcFaDP3ugheNaioXfTtZV4m2Rd1g7
 SCgomz4OsJVN4ncRqJD2+x3a4nctPsmFX1Cz9Jah8DA1UiqQXoBfcVsejVsXN+c+19zD
 QF7rHSSknjrPJ6IV5Rhrhq9PtZultP6r6sVBvDamo5PS+ci0/KG0fKxz1fNjevOBs0Ja
 SwSDcJL5Ldlt4/MVsFFZ7kRgDgp0jttIKHFMRYOcpxmk+t+gBEd1GrqFDHKuZ7nxBTFK
 QLYKlnLhk9OyXpV+hTuiV9p1fP3Yryj62rzqdbqOVCQeL8xpKriB48a1KeH9REQsfYKP
 wTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zglteuaazaqBthCmVMbShzAeX2Opukt4XjIfNYWzrcI=;
 b=n06M3PTMxkZwyeY02DInh7b/QNJFgrQGpYG4x1ZOJVyQE3DUHRerYiEYPIgi7V4xIq
 Z5GUGjOaSdrj0qHBgxt/Cj8qAgRxjRIwCrpwSzlRsHIRSp089DCWI2urzGy9mpYMiM8D
 +ee6LjSEL8cJj7e4qO/D5stbjNQ4PBWuSeFbjWKP36xhkMBkGWwlNUyHIMjnSaHnjNtp
 Qa4TIUJPraj0n+iR8Ugj/fs2vuk6AgI6eTe+/lor2gOiKv3dCiUhAnVxbG8jd8JxTorc
 ZF/WI+rkzLNVFpi42k0oUSK8r7B1FiypPEhpSW+xvLXCEq1oChdW4wLSe3tyasIjQTjf
 sw+w==
X-Gm-Message-State: APjAAAVwhlYWsGgEBQa2NotTc3E6i1Y3MIJnEHgLcTzsO0U/bSzHSRCW
 jFY5V7Uw0+TPsbAUzYByxAqw3XYOsvrZ2VKyDYM=
X-Google-Smtp-Source: APXvYqxxReNZ3qAxPeqi6EUFqz5+SU/zntxpvZKDkD/5xLHnrZ4bWT05EVa9zL3hfa7rvU+YEqSff6TBRm/G+Xwcesw=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr2892984lfp.90.1559913722203; 
 Fri, 07 Jun 2019 06:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 7 Jun 2019 10:21:55 -0300
Message-ID: <CAOMZO5A=zi_6OtjwWXJcbHn+AKz3SvmKgQrSemd6qWjAePuqXQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 000/146] ASoC: modern dai_link style
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Kuninori-san and Mark,

On Thu, Jun 6, 2019 at 1:08 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Mark
>
> These are v2 for modern dai_link style support patches.
> [001/146] adds missing modern dai_link style for CPU.
> and others are switch to modern style from legacy style.
> Last patch removes legacy style.
>
> These are based on mark/for-5.3 + linus/master
>
> I added posted Tested-by at ateml mikroe-proto,
> and Signed-off-by Pierre-Louis for some Intel patches,
> and new patch for new Intel bytcht_cx2072x

We are seeing kernel crash in today's linux-next and it looks like it
is related to this series:
https://storage.kernelci.org/next/master/next-20190607/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/boot-imx53-qsrb.html

I haven't investigated yet, but just wanted to let you know.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
