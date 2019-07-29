Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D378A72
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 13:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFA01813;
	Mon, 29 Jul 2019 13:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFA01813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564399623;
	bh=S0dZU1AjLfYcHJqjuq6Ci/cyxVFcnXhkSGaKvbmjss0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijA4IQBcHBoRkPd5oSIW/3/FMsas9AVaCkRduf/JhClwl+Rs0cbzcISNM2yp613Lc
	 EkzlRvrzJWTavIDB9RtDbtp6ytYwVV7qLyQRsgcPPd6xfH702xyCrnCuaguAxDn9Mw
	 XRz1AQPyuBLxrxGkNpSsIsYI2f26vWN/eMjye+R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC81BF8048F;
	Mon, 29 Jul 2019 13:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DA8F8048D; Mon, 29 Jul 2019 13:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C2E8F800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 13:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2E8F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bVgt5oMZ"
Received: by mail-wr1-x444.google.com with SMTP id f9so61385562wre.12
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 04:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=bVgt5oMZu9vka1vXyxfezj5eUPF8tafHtuB8RDF5PL5XefOI5mn84bdcGgEYFQWdBD
 v3/RzVElyj8HrIjajPHz9JfYqtYa1a1yA8hfjYuu81uuZW+L4M6UDlbC+97IeFIaW79S
 VyfhVHIyNKEDN8aDRs1lSXylanKCL5tamDdd0LGZFSuGIdZhIA5YtQMSnnlPGOXYI+uB
 otASFE6nLMIXfBJnLYqx5jtskcjMG1v7YFrGQrTtLxogh4D9ruZUok7QnLA9zT0nF3y9
 Mad/lcbjmcAfGQ+6KgMGFjkt1CTbHPYd7gc6HCKZGD+kgkTJ+bsGFjbvG/audBf5AYAL
 O2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=dyQwN+A0uo5Ork+5fmcHeejfn4vWfpiK/pmFXsgyvbRltmHe39fZ5VmHWpveqmpiES
 Kq7+o61fQOfTuLCrnMIHR3WInhawQN4+jpNJyX2oYp3b3JfEZrfSdFOUA0F50MBZiC1y
 Pvo4sKx956rDyb3a8OrkfE5ikKi+pFpjU+fyQsObj6TDfm7ZdF1JxLgRmoIwNF2XzmSq
 qfwa92JKekTiFjO2s0aJi5VFpZTtAIfOcDas/a9P/08fsUyAHNzNvJs61AcfN5uUI5gK
 3wPnASLew9LZ8yJhxy0ovITuW6vEhdzqAkAG/C1sckZmhR0ciCrVOOJU05FL7OLAO6zf
 5HGA==
X-Gm-Message-State: APjAAAX6mFLlZta4RCL4vWMzEcva2SC2lnXNClTLjs+JFgs0VkLM1K8f
 EXdunfGheR0Mcar4ibFMYm5FDxSmki6VRo+XTI0=
X-Google-Smtp-Source: APXvYqyKS6i0fcHmOYx363DJnPTuu/xw0bA5xIlQXAB08qPtFUJYujyOTv9lxMWA//8NpJVOebpAE1xkHqBFV70jCHw=
X-Received: by 2002:a5d:514f:: with SMTP id u15mr21122702wrt.183.1564399401730; 
 Mon, 29 Jul 2019 04:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190725220215.460-1-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 13:23:10 +0200
Message-ID: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/11] JZ4740 SoC cleanup
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

On Fri, Jul 26, 2019 at 12:02 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> This patchset converts the Qi LB60 MIPS board to devicetree and makes it
> use all the shiny new drivers that have been developed or updated
> recently.
>
> All the crappy old drivers and custom code can be dropped since they
> have been replaced by better alternatives.
>
> Some of these alternatives are not yet in 5.3-rc1 but have already been
> accepted by their respective maintainer for inclusion in 5.4-rc1.
>
> To upstream this patchset, I think that as soon as MIPS maintainers
> agree to take patches 01-03/11 and 11/11, the other patches can go
> through their respective maintainer's tree.

Was this series tested with the Ben Nanonote device?
I have one of these and from time to time I upgrade the kernel on it.

-- 
Thanks,
//richard
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
