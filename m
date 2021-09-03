Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24FD3FFBB2
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 10:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8148817D9;
	Fri,  3 Sep 2021 10:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8148817D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630657138;
	bh=idolhbfXtsldlDzAjwHMF2vIvM2cnmGfUO4MzDevPM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MyMzigc6UkLVffC0mfis0yC1g6zNuL7uljH8GVJTAIc9UhwMaTOIrggCgZvSCSWAZ
	 im+NxWEwx9Mi3cFIk+0pbnLU0kkMSRhbmpqxtxIGTc0ZGzgdE4sSYMSVar8FFTzcUN
	 m+VCdBV5js1sjrNpmeqYsL+BotCQwFOgREjXvNQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8514F80256;
	Fri,  3 Sep 2021 10:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4BBCF80254; Fri,  3 Sep 2021 10:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3939AF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 10:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3939AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n9PpkIC0"
Received: by mail-pg1-x532.google.com with SMTP id w7so4815401pgk.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 01:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAeC81KUlAnRYRLFkJk3KLXL9sj5AZ7x5m11QJb5mho=;
 b=n9PpkIC0IKaP59gxBQpmGUOJHg8z3DFqkYNEvh9rkNki2UuDdyKlYBjdrN7QlNYGjG
 X+yifB0u26HelBa5jnANffOS4IXQmI5yrd0AEYgYTFOnVah+k/ekKsHPdtswzqFyu7od
 4imWsIA36JvhNj+PB0hOTMZXJeZz3r5aHdoVWqWY3ct/lVPolYmaZRQa6lzQI0fXmB81
 RWan4tguzbbnv1uQ4Wcv/sCIKRMC7kvsR0T7/vV8LGivLHXrCmYjlbAxTu5tBGJKDsCp
 M2eHfXbdWlMVCEhQF3La5hNJ8uPvLrASOCofl8wdEnX48s+Wqos7q8kUAE2lw4vUazmK
 6bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAeC81KUlAnRYRLFkJk3KLXL9sj5AZ7x5m11QJb5mho=;
 b=pcuh0vfe07f2KUtBtbxK100ldOfM6qe+v9z2RAnc22n/81s92m93wyxWCfCapAYn3Z
 yq7zxE5MHrJO5mIvaCKD/jcdLum1M7+LVgUzxBvRA08bsQy+NZAFSIpBweKSUj6ZIvja
 Yo3vCQ4p+yNWn5gUYIjzVlMgoDSo8+nKW3ry9RKh3Mwwt2MMIah/r1aLyKO+jtf9aXn8
 MmYNuFL4buCs6pHDeWdB/7I0ccehiR898nu8ewojf+JQuLUPZSz0OJYhx2LMlpy5mgPG
 nDBgLWZuSVuyMM8/O9BLZ6J2Ohsoxz6Arm1vue5Ud03psuzqDzda0ZgGQgOySXJQ/oYW
 T9LQ==
X-Gm-Message-State: AOAM530aJ+CtWjkjQqE6hnXmF+v0H4ujmB2YC5/31D4/gT1f/aVxlR2D
 auwczHr4LurMczsQisZAE8E+TBnt81aw9dubhds=
X-Google-Smtp-Source: ABdhPJzvwTggkNf9YhTyZ3ARwr277fUCscEsy54Q9WJxOIhW0MYZUQq9mzsnRCZIiHeVo8SGR5ZdC9hzT1FtVwpHyiA=
X-Received: by 2002:a65:5a81:: with SMTP id c1mr2578227pgt.74.1630657048948;
 Fri, 03 Sep 2021 01:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630632805.git.atafalla@dnyon.com>
In-Reply-To: <cover.1630632805.git.atafalla@dnyon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 Sep 2021 11:16:52 +0300
Message-ID: <CAHp75VdOw7fS055q9eccm9dP9nuAK8rcLXf4vuzA=-UnbqoUfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add reset-gpios handling for max98927
To: Alejandro <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Fri, Sep 3, 2021 at 4:51 AM Alejandro <atafalla@dnyon.com> wrote:
>
> The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) require

requires

> hardware-resetting the codec by driving a reset-gpio. This series add

adds

> support for it through an optional reset-gpios property.

Where is the  changelog?

>
> Alejandro Tafalla (2):
>   ASoC: max98927: Handle reset gpio when probing i2c
>   dt-bindings: sound: max98927: Add reset-gpios optional property
>
>  .../devicetree/bindings/sound/max9892x.txt         |  3 +++
>  sound/soc/codecs/max98927.c                        | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
>
> --
> 2.33.0
>


-- 
With Best Regards,
Andy Shevchenko
