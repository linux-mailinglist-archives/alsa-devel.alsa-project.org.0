Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38700ADD98
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 18:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1220E1614;
	Mon,  9 Sep 2019 18:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1220E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568048127;
	bh=2vXjhB86CFyCOgSe1nGXjxQrkslKOf4Wz/PM8aVbKsw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvSGA7iYla5IDCP3PGoaXl4XxYhg2xMunRBgdM3rmCOY32WDy0DA+f/fdjZCr21mr
	 YNQhSmJ3/CzEvh/1Y7WR29Q7a/ctX+CKo+Dno4+1QLeK3+M4E051SA46d+3v19hgnH
	 nyAq80J1i/M2aL73W1hub9Cj9qE9DGKBrTrzYYkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EBD7F80519;
	Mon,  9 Sep 2019 18:53:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3843FF80507; Mon,  9 Sep 2019 18:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84319F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 18:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84319F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cL+Wmncy"
Received: by mail-qk1-x744.google.com with SMTP id q203so13773741qke.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z/RE3sZOS52OCIJSlMNFYYijY8PwSY3et1eyqWvBz8k=;
 b=cL+Wmncy6oma6eGrC+nFfOyFGs5a34R1pq28OBucKpjREQbhoJ83FOvJ6z+ttgaLR5
 uzO/ozehjX2/sP4emaM8xvhUcorC8O8636W0riEg2SWgZxMtZ7C/BpzZ8Udmr37EIS2H
 SFXWtMomfYQZGQuQH819eu2PB+vqPIhdZG7HFPe6YY6GYIrSvgLB93RuqEEkw+L8MRrK
 8VDDHPoeU4ZnPfWr6hIOmNwtEd/SSU7T19jZf1zziEXgty7MOid+F2XIQZpmK+YrrYzM
 M5Q+bZQoI/D77ZKFw71MyYxdjavBaZt0cTROWM0rEotLxurT8aGwA7OcST6j4iRxS1DW
 9IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/RE3sZOS52OCIJSlMNFYYijY8PwSY3et1eyqWvBz8k=;
 b=iL4o0f5oetNWc89W7GETEpeEMN3AmcGW9hLDDfZftxEpQmVO79opjN0b+ruM0rWdEG
 EnoACoQEXmlJgx/NIWw6rboh1Dootl5iH/XoGHH3itQcA75E1/m0xJD5WuSBsj+JwPxr
 URqF90d6o9nXqA17IL6DCzHhRV9jTJguH5NCSomX3YaZtjfmKSXJn6JTbc96SDr4LhcJ
 nAkYbSgs9sFJUUN66hwtPRAFfzoOoBOf5W6hKr3E1BTsTQ3tycVG2eSFcMekX0t/0Scc
 7a90YH1sV8dN16e2/E9xlhTFZ24sla8a24Y9D5a1OlC59B97TCq0yuqsnNxf4WmtNa6A
 XKYw==
X-Gm-Message-State: APjAAAW2eCOgZUAk+uCw9GjaamVnc14QPsegF+gCM0PGAuP9CBL+zKkN
 zVX1yCIyDEsaIRdxBhUgdMo/tIq0YXqPq+SiYb8VwUFv+VU=
X-Google-Smtp-Source: APXvYqxwAZWroFLVcfNe343lPZl/2BAtJmVCE09I7A+LHZAT9SAMZDwd0/vQQYCdGUC+XgcEuerMW04kWt78xvxzLLo=
X-Received: by 2002:a37:8b46:: with SMTP id n67mr24488223qkd.36.1568048012633; 
 Mon, 09 Sep 2019 09:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-7-cujomalainey@chromium.org>
 <87y2yy5nl8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2yy5nl8.wl-kuninori.morimoto.gx@renesas.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 9 Sep 2019 09:53:21 -0700
Message-ID: <CAOReqxh3BLCnJOJJbTcbBv83r2yF8_Df7d_Z6bg=3V+qnHPeDw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Steve Winslow <swinslow@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [RFC 06/15] ASoC: bdw-rt5677: Add a DAI link for
	rt5677 SPI PCM device
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

On Sun, Sep 8, 2019 at 5:18 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Curtis
>
> > From: Ben Zhang <benzh@chromium.org>
> >
> > This link is needed for the RT5677 DSP to do hotwording
> >
> > Signed-off-by: Ben Zhang <benzh@chromium.org>
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > ---
> (snip)
> > +/* Wake on voice interface */
> > +SND_SOC_DAILINK_DEF(fe_dsp,
> > +     DAILINK_COMP_ARRAY(COMP_CPU("spi-RT5677AA:00")));
> > +
> > +SND_SOC_DAILINK_DEF(platform_dsp,
> > +     DAILINK_COMP_ARRAY(COMP_PLATFORM("spi-RT5677AA:00")));
> > +
> > +SND_SOC_DAILINK_DEF(be_dsp,
> > +     DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-dspbuffer")));
> > +
> (snip)
> > +     /* Non-DPCM links */
> > +     {
> > +             .name = "Codec DSP",
> > +             .stream_name = "Wake on Voice",
> > +             SND_SOC_DAILINK_REG(fe_dsp, be_dsp, platform_dsp),
> > +     },
>
> If you don't need to re-use CPU/Codec/Platform definition,
> I guess you can use more short version?
>
> SND_SOC_DAILINK_DEFS(dsp,
>         DAILINK_COMP_ARRAY(COMP_CPU("spi-RT5677AA:00")),
>         DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-dspbuffer")),
>         DAILINK_COMP_ARRAY(COMP_PLATFORM("spi-RT5677AA:00")));
>
>  struct snd_soc_dai_link link = {
>         ...
>         SND_SOC_DAILINK_REG(dsp),
>  };
>
Updated, thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
