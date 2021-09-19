Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F283410D15
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Sep 2021 21:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D96C167E;
	Sun, 19 Sep 2021 21:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D96C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632079664;
	bh=T2Prh1KTWq/aM6JoHr6O6d9Zoe8ozb6yrJZm+KEb+9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/TmHyt1OkHDnQq58KnPHowU01/cyJxHX9woid+YPzq47I9FsG7aclzQMNYXSwfVz
	 SC1IqY83BSHpKzUEUXsZYR5SJmJwZpsrkWtdMcwOAWrkmk84dKeucFTVM08reSfQHE
	 TYxWVfFPrsB8TDeApnXhtuZawQyYh7A735e54Xcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0264EF80268;
	Sun, 19 Sep 2021 21:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70EA2F8026A; Sun, 19 Sep 2021 21:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 006EAF80152
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 21:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 006EAF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XO4uWQ8S"
Received: by mail-lf1-x12b.google.com with SMTP id x27so57843479lfu.5
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2Prh1KTWq/aM6JoHr6O6d9Zoe8ozb6yrJZm+KEb+9I=;
 b=XO4uWQ8S5UUdFAupCFckNudDnViyr4u32Y9LXKt4MJckEo1YNRVZ34dGFZ+eqJYqfJ
 PfSVoZE+ITncZ14dBILjJxL42NIBfrypj3WZhzWS8if4KdttqwlxLH2S9e6oYlgeQ05J
 y7Mx2JoD9WhMXTtZMPPHmRksWlTMa5sVpZNjA8ZSZP9VbFsPiVAs3p/co4U3Pu5ngNVW
 ZNwQEYDGkeMqrU+9COXvbe1HB5vhteG9GZ8BqPMcSoWGfa/CFV2JGbSS0gO7huZCqlDq
 TO7v/Y6J9Vubb/i8x9COM/xPzt8Unw8/o50ehI5cBUp2GcDs7HzVgcdtpyKqCQOb8crc
 h0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2Prh1KTWq/aM6JoHr6O6d9Zoe8ozb6yrJZm+KEb+9I=;
 b=KMSdSFjRdDs9vKNbs8CjgKcA2ajg/jhusFwAqKw6vfgrTzuomkQ1RKxQ5c6iJeWLkn
 rAoIYp6YU5YS06cejVLEx+DE94mt0Lczu72K86jSw+vsnldt18d0syPBoPYnf+SKhQZu
 4XnAV8WI9UucRkbkLd00b3jP1yj7vNjTIOLpdrhFBpO3ugO7UW84T2RrIdZFMUJelg1J
 027oKNLsLaDZuOCJRtcyuOwWr+ad1ie2tBpVhTJhL9jaCJveaj9W1jNZmp2wdJehptDh
 IHXy4rt4wmvZWIryEpjt+KrMkuTgIrIr9YH74zSChudPqJPNxQa+e90Ek8UMYPJExXU0
 OkHw==
X-Gm-Message-State: AOAM530QJCzJDYnKppkJB/47l8uh2+LCjUfAbUiywulMpUPRmbtKXCaW
 GoreISrzGSeKhjWtuu6jqjPdigHeVlz9xbxeLxS2mg==
X-Google-Smtp-Source: ABdhPJxj5inlDmjXcL50Gk4rlDjL3I6SupS6KLyLl2WhQvXcWKCySHGHl8Gg6EyrTrzLFK298EU5ntkkpJ6ToROu1Pw=
X-Received: by 2002:a05:6512:3c92:: with SMTP id
 h18mr15926875lfv.656.1632079573728; 
 Sun, 19 Sep 2021 12:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210916141335.43818-1-broonie@kernel.org>
In-Reply-To: <20210916141335.43818-1-broonie@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Sep 2021 21:26:02 +0200
Message-ID: <CACRpkdZY0Cv6zvni2LG0HvOe7EoY2FhvLeSG0_yCF9_jhHa4sA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ab8500: Update to modern clocking terminology
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, Sep 16, 2021 at 4:14 PM Mark Brown <broonie@kernel.org> wrote:

> As part of moving to remove the old style defines for the bus clocks update
> the ab8500 driver to use more modern terminology for clocking.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks good,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
