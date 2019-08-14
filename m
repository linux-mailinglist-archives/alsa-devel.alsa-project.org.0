Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0188D5D6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 16:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58571673;
	Wed, 14 Aug 2019 16:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58571673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565792466;
	bh=ExWYK4B1Wgsg9OPkJetZO8tpfd5WCJTeYQVV/uGkbhE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml7Ldr9DVyEuYrC6hQWh11DMwcSjJbaoUbVt3ZMhHfhvgl9co1iWibRBmY132uKZ8
	 S1sFYrjPmqG/p/0AfCB/a8rBC+/TZ36SRL9tiJLDxjahHUqCGWHkomDg+OjUUhKOGH
	 F2oMB7BPgBVfoOBfZ3p6enCcSkPlSlMr4dIqjREQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363F4F80214;
	Wed, 14 Aug 2019 16:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E89B7F80214; Wed, 14 Aug 2019 16:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5C6F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 16:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5C6F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uK+xdp1o"
Received: by mail-wm1-x343.google.com with SMTP id o4so4611504wmh.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+M3bORKLKAWji4t/1b27E8YGuL0UUMU6Vuc1niTHH0=;
 b=uK+xdp1o9KE1LeGPJ/z5MmXkfhr5zcLEa8laZc/8KAdh8Sls7tHcHWhl6cvtbHt9Jn
 ZSPvgkKd+3FvPDOVl+lmzLlEc4PbLvwPq9p3HuPonaALQyzK06islJp3cEB/ioaxlZwV
 Qe+SLgl2WIAGClCLAnWBZKODFqNZEhHyaeZiLeeOuIan2ExYL2EB439eWPIukCutTxdA
 YTsw9lzlN/M/i2o0bj8DDaNgqSxoaJyQlutpZk0KNEIWbpUMzn4QbbxTK71rsvi1wqI/
 eMptbZWvnoxV98Duh0ItgBbK0AISiy8GB7czONXONMnEqBjjcmzdSdFneBEqIzy2yuAB
 u6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+M3bORKLKAWji4t/1b27E8YGuL0UUMU6Vuc1niTHH0=;
 b=YjoU5sNBcMM+bhqJYblhFazp5f6wLRjJb8R0pUscHYdZ9VxWc7oaF3i5ZSfwgMgpmz
 HOIfk2rAGe7eBr4BwCTql0YBtqRyOLgARZZX3K0uK9HCMxu//cTKtj0eOfrywol4p+qH
 SCC8Rgoht/Y/tzVV/L7mBxrG1eUEfRF1SGLMrgXG9o5/IvQn1CzpVMzkzc4kVz++hjqZ
 o2lCXGKAg4nHoUB3ILo2nWoiIT77eUayLPF3UFGYgJ76cMEMuHDZrzkliron8YYVc5tf
 715vSgWdtWn4ua7gbcb7zIBnWxSdaWB6y1jhhxT68TeQXirar2j7Nm3GJDlZpAu3+JYG
 FfcQ==
X-Gm-Message-State: APjAAAW6Ciiq72i9rQSBxAbvvU1m4RbHTAHECnjodGmncWVyyqFact4H
 s+BTx4F6A/GEoPIa1ceuqmloHE3SEbd3DQY08b8GJGqc
X-Google-Smtp-Source: APXvYqx4LyqfB/FxgXbLvQzVMEBLPiCgr+Yu5cbHNXgTaMqRhmb/PwuyUUKjbYG20t7oR4dDWKZ3GNyOHOyvXdu4ybg=
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr8121235wmc.87.1565792356275; 
 Wed, 14 Aug 2019 07:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190811194517.19314-1-daniel.baluta@nxp.com>
 <20190814010215.GA13398@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190814010215.GA13398@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 14 Aug 2019 17:19:04 +0300
Message-ID: <CAEnQRZA+G8ZD7JY1b6Bd7wXYzSqnFhye4hEx0zn4ATyTRHJ+uQ@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Handle slave mode per TX/RX
	direction
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

On Wed, Aug 14, 2019 at 4:01 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Aug 11, 2019 at 10:45:17PM +0300, Daniel Baluta wrote:
> > From: Viorel Suman <viorel.suman@nxp.com>
> >
> > The SAI interface can be a clock supplier or consumer
> > as a function of stream direction. e.g SAI can be master
> > for Tx and slave for Rx.
> >
> > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 18 +++++++++---------
> >  sound/soc/fsl/fsl_sai.h |  2 +-
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 4a346fcb5630..69cf3678c859 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -273,18 +273,18 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
>
> This function is called for both TX and RX at the same time from
> fsl_sai_set_dai_fmt() so I don't actually see how it can operate
> in two opposite directions from this change alone. Anything that
> I have missed?

Good catch. I'm missing a patch that updates fmt after the first call
of fsl_sai_set_dai_fmt_tr.
Let me update the patch and resend.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
