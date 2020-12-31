Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA092E7DD4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 04:07:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F203616E2;
	Thu, 31 Dec 2020 04:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F203616E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609384043;
	bh=Tt9Hzlc5IfybwmSk2vJw8ezHQrHNh675+JyhNznIL4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2O7xcHjDStdX2dwKqFNSbD7B42GOnKDa+PBn0TpjMO9bvF/ZK1350iA832EOARhJ
	 DNW+y1y9nfPVty+jvicc6/4UbEhc2WIX9fKZI9NkVy0pY9ZDNOAfFqfP5vRLwlUCxd
	 NNVhFWsnHr8xb6W0iaRdKxd9bAIwxuypZl61dA2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76526F8015F;
	Thu, 31 Dec 2020 04:05:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9492F8022B; Thu, 31 Dec 2020 04:05:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07BEF80141
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 04:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07BEF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TdwHg7F/"
Received: by mail-io1-xd30.google.com with SMTP id m23so16288367ioy.2
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 19:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eh0LYyioy3C3UVC9bwYubsDJdeJ6pKMdFF5bTDt6YkI=;
 b=TdwHg7F/YVh3cN8PVMIQ+oWuBWKeEigWj/hFDBYkaxozMfZ7KRhZV8NB24QPpMxZVK
 xP3TNC2izS62C735GRSAXt/qTtQMNg7nBjEHOWTRKP1X5oZMcq3dMRgdbzQrH/TzGBQ+
 SHM5HmfZirh22LlNPpXWW5PHSmqTU1/ts1e8j4qndJlm0ZcHX7mtgmz7VmvebMzPeZ5E
 ftVVCPZJmNM8NzK+7HhYtl/TCiTuP/yl52CogDcqU7OrPzzEDGipEEGYXYxi23MHUGpc
 Q4tu2j8nNkWSBI30ztNyCm8ZY7Uq4FW8S3wpY0Td3GVO1U4XtfLJ+Bu/4Y3gS5VhOuX6
 108w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eh0LYyioy3C3UVC9bwYubsDJdeJ6pKMdFF5bTDt6YkI=;
 b=KGrBOfBQvSrBIgAwcV0a3qdH1Oigx/4EbKm0q2lgIDJzBlxJ0us/snigNqWkkbBeHQ
 A7Gm4uCp7+PSGvhgbjexMVDVG6mb5lX4tloAtQkDxZS9HAJsQK9qaghaAfJAF7nTgnq2
 wVuxRO9L2TccG6Svn8ZIkuYuYfwRVQMdnP8FSyjBuc5tNlkaSCx8iLmXPJqw8HIcsyd+
 46cCtbGti52/0nZGQSpw0CHSZYd7IB90KYObkoKG9jVauLE9DTiFFI16SHZjFtgWnYY5
 XxltZxYmcSntsQ3ZlB/3Phi6tXGa+vVfgF8t6gnJqcsj5n5ANRwW9QsZ0LJoXfMMECwW
 4z7g==
X-Gm-Message-State: AOAM531tSI5LvYeazlHmjKjDByIPrPz4gVb7ICLe6Q7W5eaflh+TNuXb
 X9u7Sb/ggj1WiIU1k9TdDp1/HHqB73j3wAQep419dw==
X-Google-Smtp-Source: ABdhPJxN3b3LpOts6FmTvL8wbWxbWHHukhWKA4JsuemgJC0/GdUY8dN5ynrejN4PSioTS9QR8vw0smV+ayjN/GeXNak=
X-Received: by 2002:a05:6638:1202:: with SMTP id
 n2mr48302031jas.85.1609383936067; 
 Wed, 30 Dec 2020 19:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20201230154345.639122-1-arnd@kernel.org>
In-Reply-To: <20201230154345.639122-1-arnd@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 31 Dec 2020 11:05:25 +0800
Message-ID: <CA+Px+wXEjm+yb+8g2qdv8+WUWXJf+MPKpLL7ovS_08f0ch_Wnw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: add MTK_PMIC_WRAP dependency
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, Dec 30, 2020 at 11:43 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Randconfig builds often show harmless warnings like
>
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>   Selected by [y]:
>   - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y]
>
> Add a dependency to avoid that.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
