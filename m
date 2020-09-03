Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E117D25C9EE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE29D1933;
	Thu,  3 Sep 2020 22:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE29D1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599163481;
	bh=fGULVC05C5sCXhEYpC/+9Z2Ga4C2yVjc8ZyDOioAvkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sv05Zfk5XtfjggMGF7Ivm+iZF3e6gjc3kvLqaYG7Ui5e922Fo8CRIp9olMpGS9Yw6
	 GNSkOvhvKReBoUPAF+361J9OonpFjxHtYyH2dOx5Jxgw7g+elRR+ZhNJoVNP35dF70
	 necZdaamUxi3ZaK/Hsz/tuU8jWwFmOu3FufCGnYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6483F800BA;
	Thu,  3 Sep 2020 22:03:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B96CF80217; Thu,  3 Sep 2020 22:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3008F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3008F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EdP0J4d6"
Received: by mail-io1-xd41.google.com with SMTP id r9so4729319ioa.2
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fGULVC05C5sCXhEYpC/+9Z2Ga4C2yVjc8ZyDOioAvkU=;
 b=EdP0J4d67KA9Z04eQwpbg4AXblH4icfhJzxrgoDtGi1drJDGJZ6A1Cc4lOOZIzbNQ7
 I5oHurAQmm31BoHE99b0/vAeN27X5keXUvspjNeUF3NExOMeX8nHcTYWD66/Ve4AIA6r
 SNdpPYGHzM1H5zjZLGS2JkojrO7wAYpaoASrSbD73tj0yV8MHn9anwOlaR9JvBpuuBSH
 dwVFzH8iIlZSc6AL7/IDSjNNK0Y5jutH+tWMLDjsgRlCbgcvmitZdBDP5TADNPhsTkcK
 0m8KsTKjWyKXWMNKR8FcDXiyc4WQ8gIqNigZkMFg376s4xEo45c5wIz8GCbZI5LlCaxG
 90kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGULVC05C5sCXhEYpC/+9Z2Ga4C2yVjc8ZyDOioAvkU=;
 b=dhqNl3jQoadJUfmDvzFDhJU7PQKBw/oWfmFjZpP6gBQsQ26KKsVM9in4FaKBWMTCWZ
 zuWey11wzqZZgTQQXHUluEmNYH0XeEMI+abZiSmREEuBJ1sDv3+fe/SKuvTfydyPxHef
 98KS6dPfhkhwxXwk8uZzY0w6OxbVCcdwfMtDF51BMdE2moshMAR8ff9cnJHxS21b87ny
 xAteTdvsgdz15wwu2/oYaB1Df9AErOiR6Hs4dvWiCusYZN1RNYBe1Pl7M6bn2FhHFU2U
 bmp4CcvO7mJfocVJMlUqYkllXRVn/Bn0BdXmFcS0aB3RHm+R9Q9z5PAh1N58Bz5ZBrJg
 /F5w==
X-Gm-Message-State: AOAM531VNxJGP+x2mv2WwikNoCSzwTHgLZS6Zp9XSrxRyoQdDEPp0q6p
 oHzPoBlfTP8yVcJ4ih+UCeypj6zpwG/wc+uUu04=
X-Google-Smtp-Source: ABdhPJw2fUBB+yaKwX5FZLc8HuO05Z9/+K7Ld3VyqD0BtRUWO7C/9O2RbrunRj9dOgQNqO3na4R8IxFkbgn6AW3k32k=
X-Received: by 2002:a6b:908:: with SMTP id t8mr4535957ioi.124.1599163362945;
 Thu, 03 Sep 2020 13:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
 <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
 <20200729151548.GB5612@sirena.org.uk>
In-Reply-To: <20200729151548.GB5612@sirena.org.uk>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 3 Sep 2020 22:02:31 +0200
Message-ID: <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Maxime,

On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:
>
> > It really looks like the polarity of LRCK is fine though. The first word
> > is sent with LRCK low, and then high, so we have channel 0 and then
> > channel 1 which seems to be the proper ordering?
>
> Yes, that's normal.

Thank you very much for this test.

So I will revert the following commit:

ASoC: sun4i-i2s: Fix the LRCK polarity

https://github.com/clementperon/linux/commit/dd657eae8164f7e4bafe8b875031a7c6c50646a9

Regards,
Clement
