Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF0E39A4
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 19:17:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06155170C;
	Thu, 24 Oct 2019 19:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06155170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571937473;
	bh=NbzLAk5fHjDRL063e5F1MeTJtT5DjYPY07Or3gNXlL0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTqxL8osWiOrjWBIEDnvUU5IuvJjamTjAeS5isYB2bidvETLJdiHmQe4t9uTppssG
	 XbchibaEqG+jouk4Nism/Qv6UzGnZBKDN5v2ng/huM54SNlTyOPA4iXjqQfv3NzU8A
	 ODyezSZ7Rs1uxTSyR8h/NoRCKl6LltrmsEDnYrB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AB4F8036E;
	Thu, 24 Oct 2019 19:16:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0F5AF8036B; Thu, 24 Oct 2019 19:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88736F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 19:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88736F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bNp+7fUR"
Received: by mail-qk1-x741.google.com with SMTP id y189so24146603qkc.3
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crG+DRT5ntTO6UrnZjz7Zk+aIch4CLzmhTF61MiVCPc=;
 b=bNp+7fURF9Ol8vUPwHGKGm6mK9ijx7pSmONTo8SbOqpmSf0D+KM+IwQY2l8cYRl0tc
 4Jlf4tFma80yY3usPo8m8fNAx2W3NJVos7I5+Fy3FYeouo5F7elc73VyeznclDfRUKJ6
 1GQuz3/rw88FlDhwFBVqYsiDxvtt5Si747jAG4IuuZuyBtTUXxSgpxctMMsWrQHI2KXC
 L4kMhUMuXKs1qttPbAlVMMH9KKVo9HAGMIHvPYm9S97Q9Oer5iiXEy3Yi0arikGoB0rO
 +td1l/vUo1NwJh2Ncplo9FWjk5/JcFWW548edS3pxJbv/LR2OyPs0zvvU0VdgI5PWi4G
 W/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crG+DRT5ntTO6UrnZjz7Zk+aIch4CLzmhTF61MiVCPc=;
 b=JDczqisrUccltSp6uQL1Mgfg+uHQnsFlCjtvjDZeD8Pefi/9gw3/bE4A5/hB8EmwuO
 oMkdQTWebaPKiR0MKay2CROKoceX49yAnhBARWSNa0BKm7/Iy4rEBBXfZ5yvs68UqN94
 aZm6Sz8g60vZcVUEwjAh/JOrhSAHOstlOGQb6Zmi3kEPl3i4hOMDtX/AhSgFroERG2Ui
 5qZaCTXTWgA+1RtpUr8ETiJOlwKJMY0pBdU53nJ5YlGG+BftcGm9+xXfi5LWOXPYoV+L
 axWV+OVfr+0W5NeU+eOVhMA+cb2T6wWVDsYML8mNY4Wr7HH0qlH7NSeVSLh9+EQcv+05
 Kz6g==
X-Gm-Message-State: APjAAAU1OZdJn04SvdB96FVqNMIhZQGG8BreTrNVzhyN4MD2VxEdKL68
 MVVxgLk03CFuiLkajbgCTnNJj1QLiwVK4fn3quHXZQ==
X-Google-Smtp-Source: APXvYqwO+pjq/T6cA1+tZZRLnofnfCEwAKnPL1uQAxpaH1IWS8TnV2isw/FukpIexYC5euabMYGxtp47q9ysO8wbEl8=
X-Received: by 2002:a37:9a8a:: with SMTP id c132mr14717102qke.92.1571937359669; 
 Thu, 24 Oct 2019 10:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191024124610.18182-1-colin.king@canonical.com>
In-Reply-To: <20191024124610.18182-1-colin.king@canonical.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 24 Oct 2019 10:15:48 -0700
Message-ID: <CAOReqxhzYnN4vkoiJ1vDN3UwmkJs--u7cUgpoSDtMr1dSThR3Q@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH][next] ASoC: rt5677: Add missing null check
 for failed allocation of rt5677_dsp
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

On Thu, Oct 24, 2019 at 5:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation of rt5677_dsp can potentially fail and return null, so add
> a null check and return -ENOMEM on a memory allocation failure.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Thanks

Acked-by Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
