Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C264BB5E0C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 09:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B0A167D;
	Wed, 18 Sep 2019 09:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B0A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568791877;
	bh=XfZG3aKAj0Vt57YY6U5fO4y9+6NYQeFYhS9KIXAXS/c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRnsoZP1/oaT39h6YTjuKyRfS9C00ucmg7bdMgUYT76ZBN2rr3vX/YZXK5/0oAOWL
	 3diE5AXh2DtnPhhe/a70x3jd2vKUwdCt2IHcj2i8G6Uk5NT4tlexEOAIjgGXXi1Xdh
	 5QX3SYetEU0xGvk86vt9/YepZh0DqH7ABnL8h6kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 766B6F80534;
	Wed, 18 Sep 2019 09:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ACABF80506; Wed, 18 Sep 2019 09:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64672F80292
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 09:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64672F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bHgC61S8"
Received: by mail-vs1-xe44.google.com with SMTP id w195so3793331vsw.11
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDoUVLf2sM2Wd7eza5DvRhJf8f3rN/ciRvE3nXJqNFQ=;
 b=bHgC61S83XFKjjHLXOkOq4DxsfgHo2iXOrB0kGNER7zB3qrVVxUkcW0pixzEoZ/hFO
 9zlhd8/Ni87ZlTvrJ0eiUB+ehwc8ERiN1SdYfkRdu5K74DlnoLi+h/s3kgUV+MO5yxI4
 IpXJ9/umG++g7tOVTqBUHyZhF1w1+BHeH19F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDoUVLf2sM2Wd7eza5DvRhJf8f3rN/ciRvE3nXJqNFQ=;
 b=RiFKErRNSbUKnZ+7Xv72X9tz7TyqELD4Q/L5PgC1YUFKeVtvkDGqWYtIK+28jLiHLI
 pDjUuluTfHRBQLwD0jjrR7hl9byhb2istGyEeMcOXAk/yRCeDQKB2nGbUT758x0lCtEY
 BQKqG2sRR4Q/+yYH1apt2Y04HmEuwLbXeQfpoSSCKIrsfIFb82fpH7j7AQ3xmH+Ju7ja
 ljzZ/BPjbDf6mwHTyhNbnc9UP7yKbgvxusS9U1LAidtCChzSZ5zBXThhQ7ucj3rV8Leo
 5vksm5DeqzNJwY6KvC44EAWAZd3vBpj4ool+yjmmWNgPtBEpPtT+viVoj37zlZSHjcG9
 n/ag==
X-Gm-Message-State: APjAAAVjCZwFvJlGGMnl7pfmJBYFEB6yD7LLIV7B/QbKYCZT9KJnZuoO
 qYCgO3r8gd+sxVJ4QcS9QZ95mKxL0zDgpmfW25Lxvw==
X-Google-Smtp-Source: APXvYqz3X6HVZiW3ZAIrMpmqoTkGT9csY3mslQR+djJ/IC/kNyPMlb3OEGubgnn0YA3Nv38dQWDVGsLPAgmKFKrvNcM=
X-Received: by 2002:a67:db8d:: with SMTP id f13mr1362214vsk.163.1568791763011; 
 Wed, 18 Sep 2019 00:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
 <20190909135346.GG2036@sirena.org.uk>
 <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
In-Reply-To: <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 18 Sep 2019 15:28:56 +0800
Message-ID: <CAFv8NwL3+4Qsv0B7PtVhB=HX6uFUMMaw5V=E3NTRE-v_jDVAxg@mail.gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v5 0/5] Add HDMI jack support on RK3288
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

On Fri, Sep 13, 2019 at 5:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 09/09/2019 15:53, Mark Brown wrote:
> > On Mon, Sep 09, 2019 at 09:37:14AM +0200, Neil Armstrong wrote:
> >
> >> I'd like some review from ASoC people and other drm bridge reviewers,
> >> Jernej, Jonas & Andrzej.
> >
> >> Jonas could have some comments on the overall patchset.
> >
> > The ASoC bits look basically fine, I've gone ahead and applied
> > patch 1 as is since we're just before the merge window and that
> > way we reduce potential cross tree issues.  I know there's a lot
> > of discussion on the DRM side about how they want to handle
> > things with jacks, I'm not 100% sure what the latest thinking is
> > there.
> >
>
> Thanks Mark.
>
>
> Cheng-Yi can you resent this serie without the already applied
> first patch with Jernej, Jonas, and Jerome Brunet <jbrunet@baylibre.com> CCed ?

Hi Neil,
Got it. Sorry for the late reply.
I will resend this series without the first patch, based on latest
drm-misc-next, and cc the folks.
Thanks!

>
> Thanks,
> Neil
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
