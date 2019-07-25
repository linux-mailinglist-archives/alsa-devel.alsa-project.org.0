Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BD746CD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 08:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4097A1AAA;
	Thu, 25 Jul 2019 08:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4097A1AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564034911;
	bh=iJYczcqg11VCJSyZdKsXf9gBqTl+NTisat7Qb7SgN+U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hRF23Bl+b7vjZztvpvNSg82iGq/Esauyh7zfU4rwYdW3GANy5hmL7UCE4kbgujN4N
	 pZYg2txJehfI1vjqzk0iHI63hoG1Ce58DXUbq7BFljHVlJwhRJZR/z7kJIpit03eIL
	 iJEzLHzEGxbCQay3UvyIQuxMKq304qQkmgklk7f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB12F803D0;
	Thu, 25 Jul 2019 08:06:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94B0F803D0; Thu, 25 Jul 2019 08:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AEF7F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 08:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEF7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l1cZEu7o"
Received: by mail-wm1-x344.google.com with SMTP id l2so43511118wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 23:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCKWfzF66+ujdKKdWZwTIX1edTZnqRGNlAf5n/ijexc=;
 b=l1cZEu7oBoEUbaODHvPDj4hs5QwlbKDNhhHJ+bLSfsucvkhINm8tK2olBGb590JxN6
 8cC0kOI38URs6KzfUm2ptxQ8aU7Qu+yVy9ewhyPBm0JQ3ZhDyplUfBWXXYzfyXpb1+xs
 s9ZF+EvZ2TmDL9mKPay0zyi9g0VWCNnWrRdzOtKjCgJib6v4vcIkHGzQcBua4hTdy4tH
 o0tvMqqwkS+Z21/CbxeDSwmMbtH9E9jkSVAJ5giy1VeIyr0blOIlXK9SvP+dUDlMXVYz
 +NdvK8byqXj/kGmO/ThzaxA4SKOCjI3HM5j9aYFe4YnjXaQqcIzixxG0vf/KUbs07fu7
 O0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCKWfzF66+ujdKKdWZwTIX1edTZnqRGNlAf5n/ijexc=;
 b=sNG2+AMoGXlurU3jN/MxAOGSUG1jObPwsCaIcjjEbTeQZ8ycVklOQihUlxuZ3UzzsF
 OOIQBuoM+KgvACoxK39c7dF0bvHVfPd8b+HIS3Cui6ce976IRC78uD8OJSzSBRhr5Vh0
 BXU+PSW30PH57pkLn1A32+JVSvvojgdEUVLer4RbS6TkqGhl/QS9/6VHljJ74KnRIJDc
 JTd1Wrj7zXdXMO1JZOQ+gP0uKtsKpWG/cBTyh4C7/EKl0ASbep3Y/1GaM6ffdK79dRnU
 uLkXWodAVsgJ3vI9qG9v3+UybD8/UNNCT6PYFKgcMCtkHDn9reeZqIi8wBKOcB7ormnP
 SjyA==
X-Gm-Message-State: APjAAAXkJDQEFum7J/B7u7CQAhJw3H2msMPwzMx5Dr0fFvxVXVKSaWNT
 KoChRXyMvi6FUkIMoUQzDsWVACPygqG4K+Fs8uM=
X-Google-Smtp-Source: APXvYqxIPslz5P15OAhT39MHqqaUtf1TLMeZSR/qP2Piw/0OfQIpnkCOtBjfyWYriXs7PAGzu/zSsxP85pq8AEZPaM0=
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr71636835wmd.87.1564034799292; 
 Wed, 24 Jul 2019 23:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-10-daniel.baluta@nxp.com>
 <20190724233212.GD6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724233212.GD6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:06:28 +0300
Message-ID: <CAEnQRZC+5OWwBJfifjeD_8zD3z9efdNMb4Ey0P1Ka+y63v-XNA@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 09/10] ASoC: fsl_sai: Add support for SAI
	new version
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

On Thu, Jul 25, 2019 at 2:32 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:32PM +0300, Daniel Baluta wrote:
> > New IP version introduces Version ID and Parameter registers
> > and optionally added Timestamp feature.
> >
> > VERID and PARAM registers are placed at the top of registers
> > address space and some registers are shifted according to
> > the following table:
> >
> > Tx/Rx data registers and Tx/Rx FIFO registers keep their
> > addresses, all other registers are shifted by 8.
>
> Feels like Lucas's approach is neater. I saw that Register TMR
> at 0x60 is exceptional during your previous discussion. So can
> we apply an offset-cancellation for it exceptionally? I haven't
> checked all the registers so this would look okay to me as well
> if there are more than just Register TMR.

It is not just TMR exceptional. There are like half of the registers.
Thus: half of the registers need to be shifted and half of them
need to stay the same as in previous version of SAI.

I'm not seeing yet a neater approach. Lucas idea would somehow
work if regmap will allow some sort of translation function applied
over registers before being accessed.

Maybe Mark has some clues here?

thanks,
daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
