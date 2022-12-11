Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B144264966C
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Dec 2022 22:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4573A21AF;
	Sun, 11 Dec 2022 22:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4573A21AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670792965;
	bh=64XueqOby368css7O2JpVo06M4v62cuzKvHKLtGpVu8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q+u978WrWv87yalfgdQJpL3nhloNITK01dCXNzbLOdamqxdHiE8eUAcYpOujad8lw
	 pRy0o9Mx3imhf0ynzTH14jcSsYfy9Hd4ynrKNsLYBqTgWofRAjCdBS7+vhjETk+Ebo
	 3KpMPdzErvYuy/Aj16B2cMXokwl/3nk19pnqtkaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8459F80149;
	Sun, 11 Dec 2022 22:08:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F53AF8022B; Sun, 11 Dec 2022 22:08:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B4E6F800F8
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 22:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B4E6F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KAGFQq2l
Received: by mail-ot1-x331.google.com with SMTP id
 q18-20020a056830441200b006704633f258so6194078otv.0
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8vifsZPL/uSmOP5c+94X7tNHmPA5SoXukMkeFh3kXHE=;
 b=KAGFQq2l/628dVhYGlxLCF4QzjyIQdSGaQhO6I15I/xjCfYvvvhOj2Et+dL+dwKo/V
 nFOvZnqi0O5WlhQoZW3ZaXR1G4jzjJDs4gSzxtnpJRMTQFMk1WBQijorrxAyTN9ueEpa
 OULSj8lV6TFu2Wg458lLgtmBuWBKqx9C9cy4N82hICzZHM6DO4BD5+BfEE8Z/0iDCY1N
 gm67KQgulZDMQVh8BxZ6yW/Q6qMvfRTgvlkoKjWzjGReq0LMCYfeNlSsUPnlWuy258rM
 +a8Xuc/5K2FK/r/8M7ffO+0XgrXpCZTdyr2nSKldeSDQeXYHczo1YZ9bin8w5mxdHgu7
 K1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8vifsZPL/uSmOP5c+94X7tNHmPA5SoXukMkeFh3kXHE=;
 b=lEtPgwK1LB8Eb427XRfdxPkoHeSJ49ftfPc575f9qgc/vlHCzQHYXKL3mIQpQNMTVz
 6z6IBjJMQGRkwRv6j0cv+ZqKXNUZbaPsF/dbuy6nophAGe6YcEA1QrDHvNOzsTQAby7I
 8zuiWW7cM8VA/PVv5/u21nXfx9tX+40H1jXQquuXKNweD1jbnHRewrw+ulDzGlE3LuKu
 l/4Tog4wEl8iaoTuYiAx/X1F9cFI80/LbSfgel9Ps4B+E7ekpw/W3XSubD5Pn7gfFp4t
 C45YGvaAKU7MWpGqWFGSn/wyRVfu9g6qdMmlSBKlxGH9hGpoBdBz7B4elrzkUal7UhVq
 OZnQ==
X-Gm-Message-State: ANoB5pmwc7G7B2xkkeOvbFD+WkIJP7yzoJWgUWAticWAvOXw6znXoHpw
 3Zwf+O+jGVMLnfWCnCqZ8hs=
X-Google-Smtp-Source: AA0mqf74rO2+AMwyq8NQpoRd0wnPmpeyktdF47wuWFhyqasrNQmXGqq/d1lsnFlxWxoLtCDCgUpofQ==
X-Received: by 2002:a05:6830:2789:b0:66c:4d30:b69f with SMTP id
 x9-20020a056830278900b0066c4d30b69fmr4834383otu.24.1670792901132; 
 Sun, 11 Dec 2022 13:08:21 -0800 (PST)
Received: from geday ([2804:7f2:8006:6cb9:e45a:b470:6c4f:e7c4])
 by smtp.gmail.com with ESMTPSA id
 e92-20020a9d01e5000000b00670668c2e7bsm3287351ote.62.2022.12.11.13.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 13:08:20 -0800 (PST)
Date: Sun, 11 Dec 2022 18:08:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ruud van Asseldonk <ruud@veniogames.com>
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
Message-ID: <Y5ZGw/3GHXSUduEc@geday>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, Dec 11, 2022 at 04:30:11PM +0100, Ruud van Asseldonk wrote:
> Hi all,
> 
> This issue is still present in 5.15.82, is there anything I can do to 
> diagnose this further?

Hi Ruud,

Sorry for your troubles. You could use "git bisect" to try to pinpoint
the exact commit that introduces failure for you.

Thanks,
Geraldo Nascimento

> 
> Best,
> 
> Ruud van Asseldonk
> 
> > Hi,
> > 
> > I have a program that configures a Behringer UMC404HD 192k USB audio 
> > interface for playback as follows (pseudocode):
> > 
> >    snd_pcm_hw_params_set_channels(pcm, hwp, 2);
> >    snd_pcm_hw_params_set_format(pcm, hwp, SND_PCM_FORMAT_S24_3LE);
> >    snd_pcm_hw_params_set_access(pcm, hwp, SND_PCM_ACCESS_MMAP_INTERLEAVED);
> >    snd_pcm_hw_params_set_rate(pcm, hwp, val=96000, dir=0);
> >    snd_pcm_hw_params_set_period_size_near(pcm, hwp, val=513, dir=0);
> >    // If I confirm at this point with snd_pcm_hw_params_get_period_size,
> >    // I get back 513.
> >    snd_pcm_hw_params_set_buffer_size_near(pcm, hwp, val=2052);
> >    snd_pcm_hw_params(pcm, hwp);
> >    // If I confirm with snd_pcm_hw_params_get_buffer_size,
> >    // I get back 2052.
> > 
> > On Linux 5.10.94 (specifically Arch Linux ARM package 
> > linux-rpi-5.10.94-1), this succeeds, and I can play back audio just 
> > fine. On 5.15.21 (specifically linux-rpi-5.15.21-3), all the calls 
> > succeed apart from the last one, which returns EINVAL.
> > 
> > (My actual program is written in Rust and uses a Rust wrapper library 
> > for libasound, https://docs.rs/alsa/0.6.0/alsa/, but the calls should be 
> > the ones listed.)
> > 
> > I confirmed with snd_pcm_hw_params_test_format that the S24_3LE format 
> > is supported. On both kernels it is successful. I confirmed with 
> > snd_pcm_hw_params_test_rate that 96 kHz is supported. On both kernels it 
> > is successful. There are differences though. When I query these:
> > 
> >    snd_pcm_hw_params_get_period_size_min
> >    snd_pcm_hw_params_get_period_size_max
> >    snd_pcm_hw_params_get_buffer_size_min
> >    snd_pcm_hw_params_get_buffer_size_max
> > 
> > Then on 5.10.94 (the good version), I get:
> > 
> >    period size min/max: 12/32768, buffer size min/max: 24/65536
> > 
> > But on 5.15.21 (the bad version), I get:
> > 
> >    period size min/max: 13/71332, buffer size min/max: 26/142663
> > 
> > Also, after I set the period size to 513, if I then query the buffer 
> > size min/max, on 5.10.94 I get:
> > 
> >    buffer size min/max: 1026/65536
> > 
> > But on 5.15.21 I get:
> > 
> >    buffer size min/max: 1027/142663
> > 
> > In lsmod, snd_usb_audio shows up, and from lsusb -v, the UMC404HD 
> > appears to be a standard USB audio interface. The lsusb output is 
> > identical on both kernels.
> > 
> > Please let me know if there is anything I can do to help further 
> > diagnose the issue, or if I should report this elsewhere.
> > 
> > Kind regards,
> > Ruud van Asseldonk
