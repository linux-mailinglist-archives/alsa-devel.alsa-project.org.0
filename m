Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA411D6E50
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 02:50:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320921681;
	Mon, 18 May 2020 02:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320921681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589763003;
	bh=99zfnT+jlIhxeXf7C8eEbI957pcTZl11keR9XegYgeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkGN+5kRhDW6ryMKll1513YV6fTVcvm2xHXhpLBoZi2qYpN2ykMTfFn0P9pWpJYGH
	 IzFbNh9K4fEd4OhN14uqO9S7RNtixKflbQrSFB8qZyTz+dURF38XIIEMMJXdbI073m
	 nvBHSvM1V8UqVS2eFGzJyfL1wRMRujJsFA+HGC8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF82F8015C;
	Mon, 18 May 2020 02:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82E2BF801A3; Mon, 18 May 2020 02:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7652CF8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 02:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7652CF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NtsuPBBf"
Received: by mail-lj1-x242.google.com with SMTP id v16so3950641ljc.8
 for <alsa-devel@alsa-project.org>; Sun, 17 May 2020 17:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=99zfnT+jlIhxeXf7C8eEbI957pcTZl11keR9XegYgeE=;
 b=NtsuPBBfeEL33RNoTJvk4KDKHPZxPoL5nT8FBW6cqNeNkd2tdfKBLWF/Nofnr2TfkR
 WfPGJL65Oxi+rSWIbNRQ+VQWLZkPj2HXThR5EhgWhs0xwaypVZWO4gkM+DpzfZaOdd1h
 1eQfW+hzDVDhZddBFOw9o9Zg5geXUxs4j/uWk/VGX3jKIT2hbAuPv+kZtEXZGFLk4OGH
 hrNX5qQ6YrIZRWuf8yPYeNLo9qzT5sWv9+QrD56DdGtymCQm64pwXV0FqQh4H+gAZZsg
 tsROiqfGaUH5judBbY0i96U1WP7c9IrGjk9k6iGrO60hh+gw9Y6V+KPx0tsVY7a3uIB+
 9KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=99zfnT+jlIhxeXf7C8eEbI957pcTZl11keR9XegYgeE=;
 b=nz5rTyYocOk1HwF+E/bOd/W3Hp3xP9DJuUX99JdOXWLCn9NwDx+0G5YdyDuJ030B5m
 QDX6mWh2kqmhVDtuHZ9bBVRDGn2WuJ+cJq4+0uPMmdGYeLPxUWtg0z5Ayb6wyP9ypOGM
 X1xWHfxIGYYwhDzO/RuYVQ2R8j2PVBGf38+69bYUPV0P2S/Srh/MjCQ9WJZdoRAcodHP
 mMtb7z+j3nA4NkVcPlOvxBrFd8yuJdQmaFMWpcOg1QW72Mx7GxBQJCvvgnLN7txiudng
 Q/hzZQ7GGSySALq7uoZqQ3fnrgvKtYiziKToYgC3IQPDACPEO108yfn471teDWztEJ1r
 NP8A==
X-Gm-Message-State: AOAM532W8YhEiL1DyH+gBcUlzwNZofzP4WrK6YUnRfwo6Dcyqx0EzcFb
 eBNG7q8LfG++2LtPIwErM8WHWjAPbqVuyFhJg0g=
X-Google-Smtp-Source: ABdhPJwtWVqQezl+R0G++NNh4poFaGzeaFqxE4QFP8wtthGe2uE9QL06bgdch8juVQ20JTz/gbJq+ymyF1xss2G2R40=
X-Received: by 2002:a2e:4952:: with SMTP id b18mr8867279ljd.41.1589762895194; 
 Sun, 17 May 2020 17:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200515070742.14151-1-steves.lee@maximintegrated.com>
 <CAJKOXPf-Q-e_K-puR-N2NRwQCmaKD=EczzON4rBymvV2CyoiTg@mail.gmail.com>
 <20200515122948.GD5066@sirena.org.uk>
In-Reply-To: <20200515122948.GD5066@sirena.org.uk>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Mon, 18 May 2020 09:48:04 +0900
Message-ID: <CABff4NSSpK5bZg9WRJ77+QzR_Z_eNaNcMviAOiNWxHCch_S6sw@mail.gmail.com>
Subject: Re: [V5 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com, steves.lee@maximintegrated.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com, geert@linux-m68k.org,
 dmurphy@ti.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 rf@opensource.wolfsonmicro.com
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

On Fri, May 15, 2020 at 9:29 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 15, 2020 at 10:42:24AM +0200, Krzysztof Kozlowski wrote:
>
> > Your "From" address still does not match the Signed-off-by. Set the
> > author of commit to the signed-off person.
>
> git commit --amend --author='foo <foo@example.com>'

 Thanks. I will resend patch with matching email with signed off by.
