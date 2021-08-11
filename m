Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69B3E9471
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 17:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4423176B;
	Wed, 11 Aug 2021 17:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4423176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628695249;
	bh=PTbZTB0OggPkXAxfHZ6VcjTpKi0pARGB5K9rQpw80Ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DiimsHvteoXl/a70lJOh8GMvlPga6CHnkVFzxut4EGwRpAsvOdfpqz8lG8bXSOKG2
	 roeoALB25A4Bsyyen2NZHbnhlPD3PMAQt7wLXcirEdZqkiBxFzwQ4NMqsE/RMBxUf+
	 lTBsSkfCj0VTxz7o+gHrI7B0d9R2N5QNdN8w8LAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B134F804AE;
	Wed, 11 Aug 2021 17:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58670F804AE; Wed, 11 Aug 2021 17:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073F3F80148
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 17:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073F3F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FqBrCE1C"
Received: by mail-qt1-x82c.google.com with SMTP id c6so2364378qtv.5
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTbZTB0OggPkXAxfHZ6VcjTpKi0pARGB5K9rQpw80Ro=;
 b=FqBrCE1C6bKWw4lmcwBR4rx6mFcqiMBN7iKQCz4ZMcW0+Yvah7IpY8WsGQ8xGinZFb
 v8MSypdJ4RlYSnsHekMoKjfsdntcqaPm9g7AJNSucqgB/kAspGIodBNXaCAJ5W21tPUf
 0J+ruriImy6cMSCdkp1m+UYWZw/8XJgK+b1UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTbZTB0OggPkXAxfHZ6VcjTpKi0pARGB5K9rQpw80Ro=;
 b=sb8nZZZEqrzJrfFB2ObFD/Hs07FDmCumQ5uoMV4qyyDAlnGDLffwEIbyz5Knkm7mtN
 NtqDzZ8PgcrIQwkWylCJuLWxbkR+oCK7ohP6nSNSiOyWTo0Z2+p0sIzsmy8PQRBx1rae
 FpOYCF2xaQ3NieDIHvxb2uFhAEyO6pcvlIgxS87Z+FKZnD/nuPFD2aVYKc2Ru3SZdanG
 A4zeNmlbN1vPaa95UJ+UTy54YP+sC4SwB0C0KC7Cb/+OZQCmwhPRSBNhBxXx7N8VUVhV
 RqPoDqnrZCyYBwhyUsdT9HMTEF38EFjSXxhJte7Brm+OunRRuqlTOL5nuzPsuz9S+gj9
 smHA==
X-Gm-Message-State: AOAM532LEJwgl28LBsA5xVMbpxjzZbQkpM/5UB1sDutk3jPs1ON3IS/S
 tT3BiLBcZnbeYYYeW7hLU2atppp5jTPsQg==
X-Google-Smtp-Source: ABdhPJyLTie7+TyfG4AbrO0hs7Ga15L1bfXGINutYbP3v1jaXpApHF5KqJbJxrOF8Zls84pU1BAWPQ==
X-Received: by 2002:ac8:6d37:: with SMTP id r23mr28585530qtu.372.1628695184417; 
 Wed, 11 Aug 2021 08:19:44 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id f12sm9560371qtj.40.2021.08.11.08.19.43
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 08:19:44 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id a201so5300129ybg.12
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 08:19:43 -0700 (PDT)
X-Received: by 2002:a25:ba44:: with SMTP id z4mr44554834ybj.476.1628695183483; 
 Wed, 11 Aug 2021 08:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210810165850.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
 <CAE-0n50K+gAa0U9-kswTCdt+UAkxhuJ8BMg-D4sQayP1xqWTyQ@mail.gmail.com>
 <CAD=FV=VdjTYvLmKfGONCZhpbyrzM_tG7uXkm5==-X6-uO1gTVw@mail.gmail.com>
 <20210811150340.GG4167@sirena.org.uk>
In-Reply-To: <20210811150340.GG4167@sirena.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Aug 2021 08:19:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0rS0-EZQn3i1GxgYy2A4OhnMNk=W0WUSrFOssjnUOYw@mail.gmail.com>
Message-ID: <CAD=FV=W0rS0-EZQn3i1GxgYy2A4OhnMNk=W0WUSrFOssjnUOYw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Properly turn off regulators if wrong
 device ID
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bardliao@realtek.com>,
 Stephen Boyd <swboyd@chromium.org>
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

Hi,

On Wed, Aug 11, 2021 at 8:04 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 11, 2021 at 07:40:59AM -0700, Doug Anderson wrote:
> > On Tue, Aug 10, 2021 at 9:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > Nit: Add newline here.
>
> > How strongly do you feel about it? I purposely left the newline off to
> > try to tie the devm_add_action_or_reset() more closely to the
> > devm_regulator_bulk_get(). I wanted to make it more obvious that the
> > two of them were "together" and shouldn't be split up. That being
> > said, it's no skin off my teeth to add a newline if everyone likes it
> > better. ;-)
>
> TBH the newline looks off before I've got as far as reading the code.

Fair 'nuff. v2 is posted with the blank line.

https://lore.kernel.org/r/20210811081751.v2.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid/

-Doug
