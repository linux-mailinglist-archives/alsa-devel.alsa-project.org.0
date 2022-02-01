Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC84A673E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 22:45:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825541751;
	Tue,  1 Feb 2022 22:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825541751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643751903;
	bh=ybUwJLv9qYoNwgxi4kWj8u67FB7i27/cKLyFBZdUDDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCsObH+6QkeCAuZXgXh3g+g8HVrwyGPnxqL2PFMLvplCxBFSzs8s1DRVWkCbcsfmR
	 BC3SHxxP3Le+IdmuVvWsNG032YZphmM4eywep5mnrwF8ONPYIKPhBfnObNGwv82MFd
	 Q5B8Vn5vaVRKNVp2S6cKsepVk6FfbBTShOjdXwO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D55BEF80139;
	Tue,  1 Feb 2022 22:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAE18F80130; Tue,  1 Feb 2022 22:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD2BF80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 22:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD2BF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="b9BgcXMS"
Received: by mail-qv1-xf2c.google.com with SMTP id e17so8586690qvb.8
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 13:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+mAcFAcbyBszsXN3/NgIUpqHIBliIiifG7mp3GXGbE=;
 b=b9BgcXMSncv17JHEDhnOzkHw0nRL2RywNKVr2K0qJei+Zb8LTy9UiNrKnprc0mwvx/
 BPDZxGjhCDDV19HEwJwT/poVjkdjeoqOOx3ceF4gHbQkjZ7qHI0IqJU/WUvedmxMbQfO
 CIbCGB8JqYUKZjwSCb+TcNpW3TAt6ufT0h5oQvEjWAsHl7njwQftTZ6ue44y8/cOVu+l
 RgNxYi+5Jf74hRxvf+MGnOiGOOMafaQyBr+5lUTHXWcYtVfXt7QEuDCzxIOahYQKDbTh
 riCPBtDoNpKwA8asxVHEbRHdWSLH9kBpQXGjLw8MKavkD0O66u8RP2WpyVx+U4wC1HGP
 ogSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+mAcFAcbyBszsXN3/NgIUpqHIBliIiifG7mp3GXGbE=;
 b=KYp2gunY1sed/BK/VDk4X0p3hcXBqOrkw8OwdtGRZ0SoKwAbdr5IX7qwPHQVZpC39F
 wBktnV2FPPkS6nA/2y3OwqF3f9meOgKuvz+/Dt8K4AanivcQuCB0qMZEK/ZtP1OCwW9e
 xB4kP1qBqbtQNkGJbR3LrLDPDfMyRm/njho0cW8B1Sr4XoEXq2X5GY5AofAYd0wn1trw
 w4uklqnxLmozUi2Pz0I7GPNKCrF+QVTcebiPH9B/zb6lX8+xu5iHLV6okydQa7Wwq69U
 KBYIyJ/41pLWzJUMX5LEy6IKE+UCc2lxkm0FQ5Mb+SeBDDdpti4CFfUQTdH0fMsTtQWs
 VX3Q==
X-Gm-Message-State: AOAM532O4yx5eJ2g0qN2tgD18Tlr5uj0a0bqUdK15D0Q3js9VOd8+E9B
 ADBvEDRixxg13bhIdP/Y3EGYxxmkSc7Mhl9P8cM9tQ==
X-Google-Smtp-Source: ABdhPJzy4KEvuEJ0e35E06ab4IJotqMmxZ09tClGNfNzICcszftHhCxs33z02NpnF9dVL6VePfg5x3WK/kvf3K9ijKM=
X-Received: by 2002:a05:6214:da2:: with SMTP id
 h2mr24368654qvh.49.1643751829350; 
 Tue, 01 Feb 2022 13:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20220131203225.1418648-1-vsujithkumar.reddy@amd.com>
 <YfmCWuD88sT8YxfG@sirena.org.uk>
In-Reply-To: <YfmCWuD88sT8YxfG@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 1 Feb 2022 13:43:38 -0800
Message-ID: <CAOReqxiGW+8BR5VRVHDJuBXxkpB_oQ_4TTNBqm1tuK6shUKLpg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: Set gpio_spkr_en to None for max speaker
 amplifer in machine driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Pandey,
 Ajit Kumar" <ajitkumar.pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
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

On Tue, Feb 1, 2022 at 10:56 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 01, 2022 at 02:02:15AM +0530, V sujith kumar Reddy wrote:
>
> > Maxim codec driver already enabling/disabling spk_en_gpio in form of sd_mode gpio
> > hence remove such gpio access control from machine driver to avoid conflict
>
>
> > -     .gpio_spkr_en = EN_SPKR_GPIO_NK,
> > +     .gpio_spkr_en = EN_SPKR_GPIO_NONE,
> >  };
> >
> >  static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
> > @@ -56,7 +56,7 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
> >       .hs_codec_id = RT5682S,
> >       .amp_codec_id = MAX98360A,
> >       .dmic_codec_id = DMIC,
> > -     .gpio_spkr_en = EN_SPKR_GPIO_NK,
> > +     .gpio_spkr_en = EN_SPKR_GPIO_NONE,
> >  };
>
> This looks like a good fix for the immediate issue which fixes the
> MAX9360A systems without breaking the RT1019 ones, however as I said in
> the thread about Curtis' revert it's not clear what the ideal thing is
> here.  There's no documentation about the RT1019 that I can find so it's
> not clear to me what exactly the GPIO is controlling, if it's part of
> the RT1019 or something else.  That influences where the most tasteful
> place to control this GPIO is.  Curtis noted that the RT1019 driver
> includes gpiolib headers but that could just as easily be cut'n'paste as
> intentional.  What's the story here?
>
> I do also note that the current code just turns the GPIO on and leaves
> it on which presumably isn't great from a power management point of
> view.

Yes that is correct, this is the quick fix that will alleviate the
gpio contention issue. But I think there is a better solution here.
According to the sheet I have, the pin for the alc1019 is the same as
the max98357a and its a shutdown pin for the amp.
