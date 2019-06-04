Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F034344
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 11:35:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199C7166A;
	Tue,  4 Jun 2019 11:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199C7166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559640918;
	bh=J5xYmMgFP/0qddXOzbUDn2oZk+v1BPZG6E3ujbc0lgY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pV8VsUpS6OGdJSaN8V+5tfjRTKIdvDy2Lfhl4pA0HRyyYw+YMBfjKMf95yPPVbzxf
	 QJuhKRlzgKgsYUYI9jIedVrCPrl5j49A1TvzXlFNo4btFb1Apb8cadTYUZFPOYnW9R
	 ch5p0GV0Xf+b6OZz3M621WSRQ6dNFkeaIhVm3dd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A953F896FE;
	Tue,  4 Jun 2019 11:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C29F896F7; Tue,  4 Jun 2019 11:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73125F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 11:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73125F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UHwD7GKH"
Received: by mail-lj1-x241.google.com with SMTP id a21so3776819ljh.7
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRCxsdtOibuHWniTvRjkJuYuUvyqKwna7YBc0m5IVcc=;
 b=UHwD7GKHxC3C5X5dgPpu/iqjCdsjNVRqtDVIZyaKoba6XS4suf7QIjYuluxqRmsabz
 /na8yIjIbRR2VvAEiYtFN4sFn2ubGUcjRtDDs6b44BFKKv89nR86UO2jGy52hnPvfx46
 4oVE59EdezY5g7xj2cuElXA0cXOdc0U1RSgws5SO6hKWeHFnhl4IlWzvnRokLndGSJ4k
 NWW+1Bn/BReSoBJcimTTt5B0bJ4a6DfEBAcMaJgJFwLOb8BnoUq+c0EJKkGLdxiCGm9y
 MkjmrHA1bXauhHh4cdgwY30/0XNzTZLLILPyPoGvN6NW67TjMLDAHmxJp9A0E7iZN4R+
 Hz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRCxsdtOibuHWniTvRjkJuYuUvyqKwna7YBc0m5IVcc=;
 b=Q1sQWr4Z2ErMQUU1kEoGTqSrYQmVgfOLsCu/sOILx5Ho/yFaP/CYDVOWgPwLXNS8ca
 xDwe6KrNGa6jvAIEXEy2EDfvYSkNAtuB53+eIFAY/I1viQ0N6BMmTnoo1+1Addj7QwOZ
 dox1A6pzRdTZs88lDeDFiJGvGladgJgJQ0ZyDkx00Vq8mIkstKP8eY13UmG8AFxA9r1a
 Di8SC4+RAi872o/kl2hjwqRDRFbxS9q0/TaYB8qX+WMPRV/XW6C1zg+apWmRPXLmqe1y
 Z2f5/uLX/BL3QNM37LVSMeeruP5TrkbII998xPmGy/07nvWPzO0KtPMZYr273e/N5azJ
 PcEQ==
X-Gm-Message-State: APjAAAUJ+xE4SBKKzhVTgk4eKJsKastfnJkkZmM5II2JOtAc5luFm826
 ZcyIOuDKDAASTV6a90dpF49hOfnHtiiA0RvXYpc=
X-Google-Smtp-Source: APXvYqyrP8pdeVtz07P1IH9BWhta46YZkJ5Sm9D06iqPl5VqTf3sKI7zXgP9mwg/IgoNozHT4gWj90zU9nhRoUdXHKI=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr9392465ljg.178.1559640803528; 
 Tue, 04 Jun 2019 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-5-codekipper@gmail.com>
 <20190604074632.tby6r57vjehb4jne@flea>
In-Reply-To: <20190604074632.tby6r57vjehb4jne@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 4 Jun 2019 11:33:12 +0200
Message-ID: <CAEKpxBmP6UJkfzqP-AkW5sDzRcb6W9J6vM7C6DAqYVvpEKfxcQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 4/9] ASoC: sun4i-i2s: Reduce quirks for
	sun8i-h3
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

On Tue, 4 Jun 2019 at 09:46, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Jun 03, 2019 at 07:47:30PM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > We have a number of flags used to identify the functionality
> > of the IP block found on the sun8i-h3 and later devices. As it
> > is only neccessary to identify this new block then replace
> > these flags with just one.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>
> This carries exactly the same meaning than the compatible, so this is
> entirely redundant.
>
> The more I think of it, the more I fell like we should have function
> pointers instead, and have hooks to deal with these kind of things.
>
> I've been working a lot on that driver recently, and there's some many
> parameters and regmap_fields that it becomes pretty hard to work on.
Hi Maxime,
let's sync with what you're doing as you're more lightly to see it
through to delivery!
I was trying to clean up the driver as some of this seemed a bit unnecessary,
hooks sounds like the way forward,
CK
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
