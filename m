Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD4BE910E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 21:49:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E9D52263;
	Tue, 29 Oct 2019 21:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E9D52263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572382192;
	bh=CP6WcjvsT7eAQTtFRfo5xm+bGvo7vS4uz33w9wNwKwg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7S1C9nsVkgxwC/hI3M5vCpYybhbmACKiBhmABEjyjFQwykDYdhDUJWPOV+ePdoN0
	 GggPcd6vSQQvegLbXRpI9/NLUVSbYrOU7mqOfvvLY465lp5iJdTvxGnx/ecPnx+buY
	 tyI4tsqKWUDOTy1cQGsVuuLX1TuSSZ5e2FNLjbwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13B8F8036C;
	Tue, 29 Oct 2019 21:48:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BCEBF80392; Tue, 29 Oct 2019 21:48:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5954F800E7
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 21:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5954F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XqxK6ael"
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C366217D9
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 20:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572382081;
 bh=Ygn4EvFTkQPU9gL2XGi0tJULzGH0l8RhkL1ooAj5JHg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XqxK6ael7sn32QGY8CaCGOGjbhuxgUjpBmpIdAEvJUv89tiObkUkSILVBHDCE7LJZ
 rV6D+ERGDqoFwIA6Yrqsskn8zciws9s0b8B8ub38xm14dNkk3ymYfSej13WrhlzPkz
 8JcdPJuAT2cGzKwPOcO8vsbcNpIKxV9thnpvNQvY=
Received: by mail-qt1-f172.google.com with SMTP id o3so68760qtj.8
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 13:48:01 -0700 (PDT)
X-Gm-Message-State: APjAAAV2Lqk+aJY1Y/3vn4EMik97gs+KD81O1mjxIpPHkgIzUCV7XP6q
 k3gTLcHlc7XXJSMp58T+L+GdCLwbiYKaCKLWmg==
X-Google-Smtp-Source: APXvYqxRQv2XrvJIQ3TVSDV3CE8sreLm7dFshwfw+gLwCiGofNx5kLIVQs/5+QRDKOiPEJXkqbqx8OxZBZCu1r+/L10=
X-Received: by 2002:ac8:70c4:: with SMTP id g4mr1279199qtp.136.1572382080593; 
 Tue, 29 Oct 2019 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
In-Reply-To: <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2019 15:47:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Message-ID: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Vinod Koul <vinod.koul@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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

On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> > Its Phandle.
> >
> > something like this is okay?
> >
> > slim-ifc-dev:
> >    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>
> Sorry this should not be an array, so something like this:
>
>    slim-ifc-dev:
>      description: SLIMBus Interface device phandle

You're just spelling out the abbreviated name. I can do that much.
What is 'SLIMBus Interface device'?

Is it a standard SLIMBus property? If so, document it in the right
place. If not, then needs a vendor prefix.

>      $ref: '/schemas/types.yaml#/definitions/phandle'
>
>
> >    description: SLIMBus Interface device phandle
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
