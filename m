Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2661ED534
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 19:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79419845;
	Wed,  3 Jun 2020 19:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79419845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591206263;
	bh=viykfmMIYbwLosxhlfoGJ0sOwURkwQd3eLoVKUH4Z14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDrY0c90T17FjjQPCSx07td/4irrObJKILAep7C9E+hq/Ap/dXiLgEjc5E2VKqVQs
	 0tVnTafPbHPvMgFs4/XWweFor5R7W6d51BUmLMBqNaa74aRzpEQDV529KoNtK++r6v
	 JWq5gPIOt6VBOtEayzFuR7sXLEhDLnwhyu05kpRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CE0F8013D;
	Wed,  3 Jun 2020 19:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B186EF801F5; Wed,  3 Jun 2020 19:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4769F800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 19:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4769F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FjvdkIGn"
Received: by mail-pf1-x441.google.com with SMTP id z64so2086541pfb.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Jun 2020 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=11EqLqigawu5AuEW1gFIrsexclHL8DCzdN7DBjvUYqA=;
 b=FjvdkIGnkijqmFETxqkZf5cAQNGKa8CDBDXF341jBrf8KsuUMNBzJ29u/nR6jxPLo4
 NiRWSZCxY3INhSncwcwGBs6uJcXk3VO2LUAjvY+bypo+TwXm5kjCMoUmsMcNefMAopvf
 y2hkLrMDXaiYxZE4t+TNnzG75E8fNRxWptRgs6pYZhmQCbfGFpXXa0TU/yMAF9g/pU30
 WatGmVvuokLk4Pn6dw4TACOawdbu7wjZWRpOAhOhiFS+OTMDm+/I6XkxHh8iTPqzed4N
 3lNZzWqg7uuRHCAnNwAO359O9bioWtq2WciiPOqUNQm3sPq2KvFC4ZsB8QA3qOR3tRzQ
 hlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=11EqLqigawu5AuEW1gFIrsexclHL8DCzdN7DBjvUYqA=;
 b=ufQfmBkpONixFkGMcRRDfOjfwIVyooncr0BbbTP7tpnFLxJO1Cq7RTAc9HO4UiWMDT
 EU0B9pWXIjrfp6XGAXzlabLunPQavfOMH2fOaK94KA01uw/rS/QXpYv3w7GgCkNm822F
 F9wumjF+PO1ld2iR3wX36xoHG9EP6TkokzgwzVmPBGp4dbUgA5Fpn9IOJ1puQdIhvsrB
 eDbtS2RAwesFH7wuz7nXz0zBua4u3ilGACY0bnBrgZBOhcrMbhUBK8Cv/jR7J6ESIpRS
 3SOkCIdVOgKE9mkAkK6VcEdAodCHAZZ489HKwTNRMQTpfHHE8t57JzdNRGhLS9CtcmUM
 bqBg==
X-Gm-Message-State: AOAM530JrUgcdvgh7UCD1mOgKkIV4sFv6y6fRFT7YMoBlUIqKdOdcgSZ
 LWY3TqtnypSe+JMta66Ks8Q=
X-Google-Smtp-Source: ABdhPJzyIQBGa1ntOKSqo1SvAnBFrCrm6S7cNpV+bs4hx8uQCJMs5mKCao88L4qsI/tdDw36VJZWCA==
X-Received: by 2002:aa7:9431:: with SMTP id y17mr238635pfo.33.1591206154354;
 Wed, 03 Jun 2020 10:42:34 -0700 (PDT)
Received: from gmail.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id nl8sm3772210pjb.13.2020.06.03.10.42.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 10:42:33 -0700 (PDT)
Date: Wed, 3 Jun 2020 23:12:25 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [RESEND PATCH v1 6/6] staging: greybus: audio: Enable GB codec,
 audio module compilation.
Message-ID: <20200603174222.GB21465@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
 <20200602125715.GI30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602125715.GI30374@kadam>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Jun 02, 2020 at 03:57:15PM +0300, Dan Carpenter wrote:
> On Tue, Jun 02, 2020 at 10:51:15AM +0530, Vaibhav Agarwal wrote:
> > Currently, GB codec and audio module is conditionally compiled based on
> > GREYBUS_AUDIO_MSM8994. However, audio module is not dependent on MSM8994
> > platform and can be used generically with any platform that follows
> > GB Audio class specification.
> > 
> > Also, GB codec driver corresponds to dummy codec represented by I2S port
> > available on Toshiba AP Bridge. Added config option for the same in
> > kconfig file and accordingly updated Makefile.
> > 
> 
> This commit message was a bit confusing to me.  Just say:
> 
> "Currently you can't enable the Grey Bus Audio Codec because there is no
> entry for it in the Kconfig file.  Originally the config name was going
> to be AUDIO_MSM8994 but that's not correct because other types of
> hardware are supported now.  I have chosen the name AUDIO_APB_CODEC
> instead.  Also I had to update the dependencies for GREYBUS_AUDIO to
> make the compile work."
> 
> Otherwise this looks fine.

Thanks Dan for sharing your valuable feedback. I'll make the suggested 
changes for the complete series in v2 patchset.

regards,
vaibhav

> 
> regards,
> dan carpenter
> 
