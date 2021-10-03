Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0A42046F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 01:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F1A1677;
	Mon,  4 Oct 2021 01:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F1A1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633302808;
	bh=r5gIKOLQunxxyYjlzMEAZHlr5RmpR5G5yh8n26QBLhk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0pI9+1p90nMuDG2YeHzPO817KFCPhx4Jws2QrDdKN0CuS+3FZKHj5ZjJFG09j4gZ
	 pMwzEX13bY08G7ACqJR9GMXA/VPt5JfpoJJ1Ghz3EQvJc8xFSSA69Ajz+VnZvLbJm6
	 G7AyJOqaWnbq4s7twgsuxY3oKtEDMwVgz5GechOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796E2F8028B;
	Mon,  4 Oct 2021 01:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F2DFF8027D; Mon,  4 Oct 2021 01:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A0B6F80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 01:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A0B6F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QkXTiIR3"
Received: by mail-vs1-xe29.google.com with SMTP id l19so17501689vst.7
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 16:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mMQIV6iy/YcB5GjonDB7HSdfPpKfOSD7BW3xn+YP/DU=;
 b=QkXTiIR3+QNbtk78cJbJtsNqnJQf1vPk3ReN5Z/IsCuN+ld/6Y8+SyjR/sSNObHrvy
 LuwIIfiTgyLmDaVPkhz88u8/lmQxA27XGwZcsb0S0nOHIx8h1yFrgLaurz5EJtxUxH+Z
 kDtuPH/tB7mrtMZB0/2saB1PT3ODQNBwlUAyfdI6Rbi5qDdWhK59KNV8ElrjleNny4aL
 JYefwlQ2doHpniLrfKl03S/vFCtOPJfxz/pUOw/bPcXaXIIxh4wGelE/u0M90x8qXTYU
 YGnandWgE7gO/FTbroftj6bhHtNiQiqlPCWQY7DaczTEDmgAeWhzWNkQdQNjclseSgA3
 Cv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMQIV6iy/YcB5GjonDB7HSdfPpKfOSD7BW3xn+YP/DU=;
 b=8L+YYV27PS1Ah9UQj8iRwJOFVAz+IpYDSBqPmMEAxV8mEOxRIm9DIwkEICPEIaD2Sm
 +prCRWR9xXwrRCf5nXB8KywID6ew0IMMky0KHUcJh1vnE7B9oahtNa6MPEAyGXfgyVO/
 FOUwnM1VM20CqGW5anzeIngPiB2ufHKFT9Y8bkgWC2+mj8H9Lloz6dvYvnwEnLouPdz7
 OB5vhgTMLAVcXk88uIgwjx+Z5Z2DrkXSF/B1CPAthczKF9wsG43Qr/DE0mxt9Rrq1EkW
 IcFd60VezMdSGRbTICOYYNHrX7k+O941/Rr2T1YGhaxKRGX2FvAMjDIBje7dTgYi5aKT
 q0Tg==
X-Gm-Message-State: AOAM532iB+ClIF6MkoHi03mTjZxqUOnkEmJU49H+PjFH1u3JYzsCIfEl
 +9RC3hFgs9b2o7bWKvGSsuA=
X-Google-Smtp-Source: ABdhPJxZFZJ00cfx/JjWexY4Yi9Z65BWyW0WPxPc+6iP9/jByvYrihDArkBL5WNBLxsnACqlUzbi6g==
X-Received: by 2002:a67:d00d:: with SMTP id r13mr10866961vsi.23.1633302719105; 
 Sun, 03 Oct 2021 16:11:59 -0700 (PDT)
Received: from geday ([2804:7f2:8280:9a0f:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id t5sm6100912vsk.24.2021.10.03.16.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 16:11:58 -0700 (PDT)
Date: Sun, 3 Oct 2021 20:11:54 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVo4uuKJy2QIQ77n@geday>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
Cc: alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Sun, Oct 03, 2021 at 05:57:34PM +0200, Jerome Brunet wrote:
> 
> On Sun 03 Oct 2021 at 01:43, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> 
> > Hello Jerome et al.,
> >
> > on Amlogic Meson SoCs which use the AIU audio controller we have the
> > so-called "machine gun noise" (MGN) issue, reproducible for example in
> > Kodi. So far nobody was able to identify the cause of this issue. My
> > idea was to at least narrow down the issue so we can categorize it. For
> > that I wanted to get the SPDIF output from AIU to the HDMI controller
> > working.
> 
> Ok, I'll clarify (again) about this issue.
> 
> This issue is on AIU only (not the AXG series), on the i2s encoder
> regardless of the output (HDMI, internal and external codec)
> 
> This encoder support either 2ch or 8ch mode, nothing else.
> As long as only 2ch was supported, there was no problem.
> In order to switch between 2ch and 8ch mode.  AIU_RST_SOFT_I2S_FAST and
> AIU_I2S_SYNC shall be "poked" (check iu-fifo-i2s.c and
> aiu-encoder-i2c.c). Without this, the switch is not done.
> 
> What these do, how and when it should be done is unclear. I tried
> several combination. At the time I found something stable-ish but it was
> not perfect.
> 
> At the time, It was completely new driver. Even if was not rock solid,
> it was still progress and I opted to upstream it with an imperfect 8ch
> support so people could help debug it. This was mentioned in the
> original submission.
> 
> The other solution is to restrict to 2ch mode and remove
> AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> anymore.
> 

Hi, Jerome,

Thanks for the extensive clarification. I have compiled 5.15-rc3
commenting out the pokes for 8ch as you have suggested, both for
AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC in both aiu-fifo-i2s.c
and aiu-encoder-i2c.c.

It works, the bug is gone just like you said it would be.

My suggestion is that, for the time being, until someone can solve
this properly, you restrict enablement of 8ch configuration under
an EXPERIMENTAL kernel option, with a big fat warning in the help
description, saying it will break 2ch.

Last but no least, thanks for helping Martin out.

Thank you,
Geraldo Nascimento
