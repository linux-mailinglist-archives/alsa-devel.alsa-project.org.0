Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017762D626B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 17:49:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8783D1672;
	Thu, 10 Dec 2020 17:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8783D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607618985;
	bh=DC3WWGH/zP3Ud3u9lJMxTleO+nKeR9r6s/yrVALKjKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqshLRSabjDcMp5br5oKgHznvbJVqbFVOzhvND+lUeMhOMY6BrazsmampHfpc2NRp
	 wxcx1pSXehASwan5QchI4Vg2UETR2lRtR97LS76sQEXrqRo4MgweVmwNNzXF85PWA0
	 ZaYRd+q671ccmZjBI773JxWYAexLZhxowD8bHOxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F812F8019D;
	Thu, 10 Dec 2020 17:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3EF2F8016E; Thu, 10 Dec 2020 17:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E36F800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 17:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E36F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sZOuz8mc"
Received: by mail-io1-xd43.google.com with SMTP id n4so6172880iow.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zh45VyRyzgQHGkzXe0Ti4Z8IItU/CKUDVbTtYMOFVSE=;
 b=sZOuz8mcLCTfm2zeceFE+1CPwG0DXzlpMttzqc+0tnv9aEP1NDb0E1R+DLumo8fCHN
 1Jx/weRPcuVUAswv9JxWk5YCIERRZ4OrF2tkWhZAScQYBECS1W2EBNCTX8Snne+x/yPX
 X9XpVCYbDxg+iNzAbpyL2FNJ49kNUPQf4cs6VaL2XGiu6zwhNSC3bfn5whMY3wJlGtwv
 8rsEBfOEugMT0Vb5cXo95uKe6zVkmH+aNzb/MWSRITASS53q3gScNN4mqceGLE/6BUMk
 eJ1U/aygt9pDYbpNwEjFD5YUY4z2WqxeJHADEZa+OGM+Yh0M2lO4y4AIyPii1vCnhVAZ
 V4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zh45VyRyzgQHGkzXe0Ti4Z8IItU/CKUDVbTtYMOFVSE=;
 b=CLuvNTeiWUhbdy2m8AilPcM9UKn2nSUY/kZ5iSP3wdpNs6GlczW9Ail8cHJ43D3m7U
 Ltkle930SQDdGFF9GgTNBJOy79ZAjSALfmwJIPrqs0bKFXEnezL8+//TFu91UB+YtZnw
 IKJU1KpiXNCVOYjL82P6cLPBaCdi7/PvfWHM2fEfjdxmdcvZujxdY9vlzYbS0y5iW2tP
 y7wUbbUXAjNyUcC1/zEIYG7FJRoQPPyKG6px4nnNVD6HTpcN5czyplUq8YKSRNY0aGxr
 8XDn2josCJM2jN25kC7x+60anvcwofo0/6Yzg2wszVf7Eal5kGpTqeVig+sI3ezo8iaC
 E5MQ==
X-Gm-Message-State: AOAM533fsXoQ1mvSAleXUk1ZvHO1lKM5XdHqMpH8/uVfjM5FbHmAshGP
 IyriJcgO4ykVl+hC7H/F9viHqka5EbxlSh97s0gsyQ==
X-Google-Smtp-Source: ABdhPJwh2Ki5/TGuZQr2BVQKZlbabwChnxgPwvmDEK2CefI68FXqMEr6mNM4xtEYcIvsEXgrvo8WPWU5SKsyTW3nfH0=
X-Received: by 2002:a05:6602:2d49:: with SMTP id
 d9mr9042080iow.109.1607618878538; 
 Thu, 10 Dec 2020 08:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20201210033617.79300-1-tzungbi@google.com>
 <20201210033617.79300-3-tzungbi@google.com>
 <20201210154200.GD4747@sirena.org.uk>
In-Reply-To: <20201210154200.GD4747@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 11 Dec 2020 00:47:47 +0800
Message-ID: <CA+Px+wXQp9mdvsjz7A1vmaipdnZkav7Mm4oDfH9LviFLC8eDKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: rt1015p: delay 300ms after SDB pulling high
 for calibration
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Thu, Dec 10, 2020 at 11:42 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Dec 10, 2020 at 11:36:17AM +0800, Tzung-Bi Shih wrote:
>
> > +             if (!rt1015p->calib_done) {
> > +                     msleep(300);
> > +                     rt1015p->calib_done = true;
> > +             }
>
> Might we need to reset calib_done over suspend?  If the device looses
> power I guess it forgets the calibration.

In our environment, the power VBAT and AVDD are still on even if the
system suspends.  In more low power mode, AVDD could probably lose.

But agree with you, in general, suppose the device needs to calibrate
again after suspend/resume is better.
