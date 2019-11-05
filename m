Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF87EF894
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 10:23:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19251719;
	Tue,  5 Nov 2019 10:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19251719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572945811;
	bh=ua604iP+lh5fxIBDvNOMghmq+yoxkRpSqib6oNz2FCU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHCr3agsRrULYWni7SQ2sD/FCx5z2zA0AmFdfnbgd5DDqdkb6liEl3mHBwhfN+dQ7
	 6+xwjHJdeexTbwqo5kzpa2u0KFPmm0r+zi6KW4wCAo57sF4mNHFVLqHLhs1X7yieHd
	 Pl/f28vP9Rm/YyN7QwD1Gpj5a1HG6dnfKZdaEt7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE572F80446;
	Tue,  5 Nov 2019 10:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA44F8049B; Tue,  5 Nov 2019 10:21:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90968F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 10:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90968F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cB/L6dgy"
Received: by mail-lj1-x242.google.com with SMTP id l20so2267770lje.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 01:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/CqzVlG8zZAxxKu0vX1NdhVqqh2p9Uh91d/oE5bEMc=;
 b=cB/L6dgy3oPjI3dV+qGMCvc4MOdB5pQERdwKy0ik6L9roaBW6UIyW2VEtSjvxT9yC5
 sn48tazf1Tx/XEX0UzchEkwheBAraWYqFdbbBVS/CQQWWsmqt0Zi0mECdk9PRbeLD3gw
 3PIs8WRvvJqRv4HAbYDqEkLcsHOfv7rJfVS5txO6KwIqN+rbja0ui/iLe3v3a0BH1IQY
 qnBmhU7rltn+IcsBboFu3T3puSPhwhyu/knnR7iAEvpqoGXcc4EPkZe54WJ+GTNGvypy
 NxYDE4Ox6omwzjNIQbrC7ZIGduIYLK2eG6n4vsDSUabJpjE9MLcFvS+U5K88rcs0DD2i
 yDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/CqzVlG8zZAxxKu0vX1NdhVqqh2p9Uh91d/oE5bEMc=;
 b=ZxSF7HM8l21EjtTLpZ4c6deJnk62IM3KneSPbhVR9nSBmaFmNnx4rDR6WG5zI/LEMW
 LXdUmfYW1Bn+PPzP60yIE5dP6hOTVI90byr/w5AANjdB7XojG7utGDWdMUjpAaqdOuto
 3B1lZn/iB+twQT9Cbu1bem+cGs82XvfOsEr8zw/RNpJ4daVBeMyol5xsx1qd+3RWMruA
 Z0oDJL8FRZKSamXgEWfRuI7n+nywMWejSbFX4w65Iwm1kz5Qra5V0XWAeAiS8x3mjc8j
 o2tEUmWdiHGRQKap6avngctj6nEweE+cVdJDrFgy92dN7Sd21ltaqNb0/mXqpBto28aD
 7wEQ==
X-Gm-Message-State: APjAAAW0Q2/fvaq4tDBF5Eoz3yII8MWZjJfvh71lPrzCObaNlldpx9Hs
 sC41WPqGrQZ4XT9wsmjz7eKzucMEE+4UeQf1kfWgxQ==
X-Google-Smtp-Source: APXvYqwmMv3t6J3okAPckGlL9lzAur03q2Mfx8rqE3VQcM3317qB2lKyitRE461c8i9EOJ6uFvuH5xh8sDJfPyofi9c=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr21359472ljb.42.1572945700516; 
 Tue, 05 Nov 2019 01:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-22-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-22-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 10:21:29 +0100
Message-ID: <CACRpkdZT_3fV+u6aLk_w453XdgLF7KbQMzPB5ZJ4xd8V-LvoqA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 22/46] ARM: pxa: eseries: use gpio lookup
	for audio
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

On Fri, Oct 18, 2019 at 5:42 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The three eseries machines have very similar drivers for audio, all
> using the mach/eseries-gpio.h header for finding the gpio numbers.
>
> Change these to use gpio descriptors to avoid the header file
> dependency.
>
> I convert the _OFF gpio numbers into GPIO_ACTIVE_LOW ones for
> consistency here.
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This is consistent with the way I imagine it should be done so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
