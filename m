Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5E2441A02
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 11:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3674816E6;
	Mon,  1 Nov 2021 11:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3674816E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635762968;
	bh=JOChUqOIQ09Mj4axUXhDIt0M6CFbhk5gNnWD2MW7lKg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjOomELsgXPZYnTqht0clNNvJT277xFDKsHCAC0mD4NrPu9hMPSjZ4oWcHXNZ48Fq
	 epM3Pvwk2h660w4Akc3MdeG1xk0mEIRchpRxwja+3ZIqhbeBu7Opd46KjsoGbXFQu6
	 HJN9+++lUSh5Asseym81RFlg2ROLWF5NJ0ZpeDhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82304F8026A;
	Mon,  1 Nov 2021 11:34:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5262CF80269; Mon,  1 Nov 2021 11:34:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10C5BF8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 11:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C5BF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TWgZd0lH"
Received: by mail-wm1-x32a.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso8677094wmd.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Nov 2021 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SMxVE993gd6+Fa5JpVknnvYvOLxz+iLd5q1Fx2KECxk=;
 b=TWgZd0lHH9CJqqOc3dgYEzoC6RktC0gVtYMX5f3/f4jLpjBGFCOiH/HfdnVKITYfJt
 Ung48t8EZS6G6q6tRDp4ofGxwrTBvLWPgpZA4ZPIL2NxVg3A5JLfddOb7aJPZ3fP/WJr
 yJKTqo7+MXBMfPoqKYOXKtT7I3a6PfQRFmKZ/pdVgDtbN3EgdJdfUGNJESWZIKq2OPHR
 YTnqIgLin2GL9f81aNkwTrKpPoPxAWHrGQNK8gkDKWdDhpxEgi06O977kuEuNYIerq2s
 IZHcxAqIa4xpbPS0pEXump22JPdbgy39Sp/S3QmC5SD/UiOyUHQUMyV5fc+9n9y9EjB2
 sUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SMxVE993gd6+Fa5JpVknnvYvOLxz+iLd5q1Fx2KECxk=;
 b=cvImHQR8oJk8iWhwJWeix2VHFrnFIFl/l3K6FlGQZLokxSz+xDrSTLfpxSBRj2e/AY
 NiCvF+d3N7ngKR7zG2JjfsfrLkQoXTSUhlDVqZpJBkNg1OfjuaXFpE+uppeG3567fD8+
 PwEf1yAsn/BLGCtU4uECxY9HgNcLETVCnCJs8bW3QaoyBapMQKvTsTD3u7RnCi/dlMqh
 M5wf8kleamxg6jJFUuxYKlZ4IfgaZY4+tqPVjZzcUOYAzpt91iDs3LWqb3XUcKU/JXg3
 FB8tGv6eZW5D4y5ThzPBQ42WBqHmmr7Sr+QljJLI1VaQX2m82vww2syN1DNIkiCMSqkB
 L4vQ==
X-Gm-Message-State: AOAM533HX057xZoeiMxHq2LJq5joqR4PEn08q37h3AhdSYkNpYwoc2Oh
 pf3GGEd0FLct2Of3OXz8p/yXhv/cBhwt
X-Google-Smtp-Source: ABdhPJxkfcWWxu0T1+SSX5tU5BJoP92EPP6ZG6PjzKeKR2VibuhpKhrJB0ZVt77ZGv3L+tMWdFmYWQ==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr30044230wma.72.1635762880402; 
 Mon, 01 Nov 2021 03:34:40 -0700 (PDT)
Received: from rampage-hp2 (static-90-251-248-205.vodafonexdsl.co.uk.
 [90.251.248.205])
 by smtp.gmail.com with ESMTPSA id p188sm12294386wmp.30.2021.11.01.03.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 03:34:39 -0700 (PDT)
Date: Mon, 1 Nov 2021 10:34:45 +0000
From: Jonathan Clarke <jonathan.a.clarke@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] Make top/rear speaker, mute and micmute leds work on HP
 x360 14-ea000 laptops that use Realtek 245 codec
Message-ID: <20211101103445.GA1064130@rampage-hp2>
References: <20211029154313.1005394-1-jonathan.a.clarke@gmail.com>
 <s5h35oisug0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h35oisug0.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

Thanks for taking a look at this patch so quickly, Takashi.

On Sat, Oct 30, 2021 at 12:01:03PM +0200, Takashi Iwai wrote:
> Could you give more descriptions?  The patch isn't trivial at all, and
> it needs more explanations.

Yes, will do.

> > +           /* output mute is set via SET_COEF_INDEX,SET_PROC_COEF */
> > +           spec->mute_led_polarity = 0;
> > +           spec->mute_led_coef.idx = 0x0b;
> > +           spec->mute_led_coef.mask = 0xffff;
> > +           spec->mute_led_coef.on = 0xa02f;
> > +           spec->mute_led_coef.off = 0x7774;
> > +           snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
>
> I guess this COEF isn't only about mute-LED but actually does mute the
> output?  IIRC, the bit 0x08 corresponds to the LED.  If so, it's
> better to split.  Basically this snd_hda_gen_add_mute_led_cdev() and
> mute_led_coef stuff are only for the mute LED control.  e.g. you can
> change the mute LED independently via sysfs.

Thanks for suggesting this.

Having tested, I can confirm that setting this coef only affects
the output mute LED, and does not affect output.

I will therefore assume that current implementation in my patch is OK,
but let me know if it still needs changing (maybe I've misunderstood).

For reference to other users, the commands to test are:
# output LED on
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x0b
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0xa02f

# output LED off
hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x0b
hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF 0x7774

Many thanks, Jonathan
