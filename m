Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F31D05C9
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 06:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959A31615;
	Wed, 13 May 2020 06:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959A31615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589342860;
	bh=QyQu3O4TKvyKwmoKMYQOEElVYuGfAgiE7KcBxZB9/MY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oala7/CAz6ycwAiCXxaXoCDVaiNCCGcTsJ9y5MiqVTdA2hkH03Ug+/gH49gzwG/Hz
	 +ENqg9N+KR68vctHBjh49NPG1qb0IQzpRfBpJGuFTUQTiaepkIZGVRH+XEGu4IZDLx
	 UfYqj+vXhHLFXeR5uBJKB5q9VCOHN4Cv4SgsNR20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F152DF8022D;
	Wed, 13 May 2020 06:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FD50F80247; Wed, 13 May 2020 06:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E6D9F800B7
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 06:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6D9F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X0lx+5Vg"
Received: by mail-lf1-x142.google.com with SMTP id u4so12390336lfm.7
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 21:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5DfVl3UTVTePHaLcFBtqqP4Bgt2fHKIIZV0vLdJMfw=;
 b=X0lx+5VgRKBUjgcLIUXo0l4kNqa+HWCEuwieMLGfX7R6gJsysKdNLip/Z5aNBtqcKq
 ZHyzngzkgSh1+R7lrCgnXihuggnUozIwQkMfxmHQW6hSS4p5Aj+8n2I+E1ahRsJ5MeYK
 Ai74UTj4c+mDLjVlXVmkmNqcLpiXu8oLZBO4pVDmpfbtMtFyGCpm9v7QJkiiH++B1SEB
 n2Hj93K25HcZa6GUD4ZboQ6N6RK1Wt3GxC7VdWH0JZkvdhzUKCghhPDXrnLTZ57nq3MQ
 pJ9v2W9pKM2atx1b86GIUD+h9q7wAQeKMfPHQ5Tt5MsuX5KxcwRsAS4grZGt83d7kAfy
 wSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5DfVl3UTVTePHaLcFBtqqP4Bgt2fHKIIZV0vLdJMfw=;
 b=FJXAMt6VzCQaCLGZKaLohUDzVFb0oi7m1qnf0X5GyQPMbw9CwYyjLxgQ/Ie81XAm28
 ZwIBsfxJ4h0UxO1JX8ZCrfSE0vTn9n1zzWCbJ5ZtpayT6a4ShGnBUwMSglg1lP+vY6xn
 IyPRNoRRL6kXTrDOMLMVRv2iWlv9NFxLSmUmeTqKoOBZ5QzuCTa8gb5ZPs+gH+XMrxFE
 IojHpYnL3j3gz8x0p36nTXTOBUNz9hffOgp6LAYgoWc+0DhsKrNy80/fxc4FRw8h1k9Z
 y83Sq0y+z0+IIL/EDyPglILZzEMMit26tw4z9dPVbS0oWC/m7VdXyW2BIlQhQ95hpsTI
 YkuQ==
X-Gm-Message-State: AOAM532LpzpEIigj3WMPswG2ZOlAMi0Cs+tyvlCk6TiLHp/gFhUVa1pE
 T6LuGiX+NxTa4fVHtCx4tvYbjcbvHc0AUqoBQSM=
X-Google-Smtp-Source: ABdhPJwVbX814H5PlLygUc2P4zM8+ColDOjxqNR+yG2t1A4WZKHAtcZSofnK2cs+OTZUhXgYDydXDZcxKnwkxgsdP0k=
X-Received: by 2002:a19:4a97:: with SMTP id x145mr16471976lfa.66.1589342744155; 
 Tue, 12 May 2020 21:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200509031919.9006-1-steves.lee@maximintegrated.com>
 <20200511110346.GE8216@sirena.org.uk>
 <CABff4NQXs622x1X6ZvNABHNZoTMS57f4Y5sdo1Cng3JeTgboCw@mail.gmail.com>
 <20200512103316.GB5110@sirena.org.uk>
In-Reply-To: <20200512103316.GB5110@sirena.org.uk>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Wed, 13 May 2020 13:05:32 +0900
Message-ID: <CABff4NTm77Cr+FwO8p0-3AKBCWOvzXaHfdbP8guzWQ2Zzcrobg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 steves.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Tue, May 12, 2020 at 7:33 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 12, 2020 at 06:13:05PM +0900, Steve Lee wrote:
> > On Mon, May 11, 2020 at 8:03 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > > +static const char * const max98390_current_limit_text[] = {
> > > > +     "0.00A", "0.50A", "1.00A", "1.05A", "1.10A", "1.15A", "1.20A", "1.25A",
> > > > +     "1.30A", "1.35A", "1.40A", "1.45A", "1.50A", "1.55A", "1.60A", "1.65A",
>
> > > This looks like it should be in DT too.
>
> > Since this control  is needed while running system according to system
> > battery situation.
> > I'd keep this mixer for further use.
>
> That's...  interesting for a current limit, and sounds like it would
> have issues for the common case use of current limits to protect the
> hardware.
>
> > > > +static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
> > > > +             struct snd_ctl_elem_value *ucontrol)
> > > > +{
> > > > +     struct snd_soc_component *component =
> > > > +             snd_soc_kcontrol_component(kcontrol);
> > > > +
> > > > +     dev_warn(component->dev, "Get dsm_calib_get not supported\n");
> > > > +
> > > > +     return 0;
> > > > +}
>
> > > Just don't implement the operation if you can't implement it.
>
> > If this not exist as dummy operation and all mixer was not working and
> > could not implement better idea.
>
> Could you be more specific about what you mean by "not working" or how
> simply not initializing the value returned fixes things please?
I mean that xhandler_get pointing to NULL makes mixer list unexpected operation.
I will do return fixed value without warn message.
>
> > Could you consider it as with warn message ?
>
> No, if there's a problem here we should fix it properly.
Thanks for feed back.I will do return fixed value without warn message.
