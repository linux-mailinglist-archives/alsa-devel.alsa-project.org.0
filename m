Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B0265B73
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC8F1675;
	Fri, 11 Sep 2020 10:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC8F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599812499;
	bh=yel2rF5B8kDMFykOlJKNju/GmkzsvZY5ie/2xsyd/GY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g23TVoHo8S7NVUzASBQH394X29f/8xTPBnODWUz6/aOqoIQTlmleb5B1X/dcy6+cg
	 /h96rRKQWgyZi4Uzgxhnpa0TFLJNlwPFSPwJX+a+vvqaqHsc7eerGdHABsFNjkq+R6
	 d19rfBw0weOhWmfq/KS8J/C+B2RM/C66WkA7uAAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA51F800E9;
	Fri, 11 Sep 2020 10:19:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A91EBF80227; Fri, 11 Sep 2020 10:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD7FF80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD7FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fYQMaZJN"
Received: by mail-qv1-xf41.google.com with SMTP id ef16so4793069qvb.8
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LyN0IjmsHwavnL72AyGhxA2PceM0193RLDzNcCwxkJw=;
 b=fYQMaZJN1SXjCj1hdOHLPagG/CreN9QGAkYOR+hfQDg6i9OhyTAWOkscNnnVOhTjrL
 TLqcdwU0JQa6sg0ka1Dt/X8vF86qF6/aaf30dU3YLpbX7C5DT0i1MOgwqUMhAGBXYhHS
 R8fApsrN7FdU6FVy66n/Bcqabpyc6M4i0as4+mM2L7NP/zr6bQqnGWiBdDa6dg/OTom/
 Lv/pD/efWe5L54+mSGhYmm8ydWDitlTtTWqCeVLgi2YKqdLHEHBO7XAIvkSJVL/lB47a
 EjOsG+tyfcVyHW9yLOpPwkU4zAgDYp8UAcrf2U87yTjoLoho9RMXjP5Ow3DZw49nZgP9
 TptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LyN0IjmsHwavnL72AyGhxA2PceM0193RLDzNcCwxkJw=;
 b=H/3BR3vawb69Ho9RnnfLfLM+UUS5IX55HBX5PckQFzgKg0T233KAKCsGk06sOSWQfD
 50WzwArz+LJcpQ7PuT6MuzOE2lqBpGxrk0oOqVdPN4Sz9s7lSrgi0iBOBNsnJfUhGXvI
 uEmyIWZ4iJDmMZ+YZJGLgoXxBBb7thGmzYGNs+oVu23Xzd9kude5dTQdW5QkqBCYPfwb
 Jgx5PaYUrPBt5YmI/rU6sJxwJQllse3k/HY6dNUiC2ZqpABghp4pOltz7EUGkyetTjKi
 y5E0fgPKf55CIcFwMXU+3bttdTODQ2XSfz/84x+5uzihiUvyj43OzY8mpvdYIAajqe84
 GfGg==
X-Gm-Message-State: AOAM533VcBP0NR5CxlhbjPkSG3mq3dfVI5E0ByNnXCE0O/fuj+pOrWUL
 fJb8bdEgSZGOoupuIwQeMMUM/VvUxgxG+NiR7+A=
X-Google-Smtp-Source: ABdhPJyw1iphmZfPMSSJgI+rjWnh80T1rlqRDKzKA880DDYs84dQJcIkakAuHD7UmnAAzMXhKQsnB6YceJDThmis2qA=
X-Received: by 2002:a0c:8485:: with SMTP id m5mr875942qva.22.1599812387007;
 Fri, 11 Sep 2020 01:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <1599747032-20055-1-git-send-email-shengjiu.wang@nxp.com>
 <20200910142121.GC4898@sirena.org.uk>
In-Reply-To: <20200910142121.GC4898@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 11 Sep 2020 16:19:36 +0800
Message-ID: <CAA+D8AOo7rV0omvZdXNRK15ZdK+H-oU8SVxinZTGPusAzfv-Kw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4458: Add DSD support for ak4458 and ak4497
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, Sep 10, 2020 at 10:23 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 10, 2020 at 10:10:32PM +0800, Shengjiu Wang wrote:
>
> > ak4458 can't support DSD512 format, but ak4497 can, so add
> > a new variable in ak4458_drvdata to distinguish these two
> > platform.
>
> > In hw_params(), calculate bit clock according to different DSD
> > format and configure DSD register.
>
> > +     SOC_ENUM("AK4497 DSD Data Input Pin", ak4497_dsdp_enum),
>
> This control name doesn't seem to match up with the description - it's
> talking about a pin but the description sounds like setting a different
> format for the data?

I will add more description. Thanks.

best regards
wang shengjiu
