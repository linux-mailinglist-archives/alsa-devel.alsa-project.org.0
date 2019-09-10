Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CEAE507
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 10:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2403166A;
	Tue, 10 Sep 2019 10:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2403166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568102500;
	bh=vHtGHzSfcWt3SCxqzLzjUFmPjmav41ppyaXX5icwrN0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HmJnYPHMP8iRCLzx2GQzPCdc/+xiaVcEeLWcn8Oh7c8PAmdJxqCwgzWB00U6VXrHe
	 AAy5WSFdPNErlKszGRo+xoMgoN3Xq267AgnzXgu1Dejm9eTUQHo3HlNefsb2BiNfGV
	 aVNBT7FE3oZxj9MN67lY9E/xyDmTXq3mMP03vsWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1107DF80368;
	Tue, 10 Sep 2019 09:59:56 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9921CF80368; Tue, 10 Sep 2019 09:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B111F800C9
 for <Alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 09:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B111F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HXEpGhEh"
Received: by mail-qk1-x72a.google.com with SMTP id s18so16112421qkj.3
 for <Alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W5gcz4QaQSGZ+1H93kQ3ciD8SjYEg5F7bPAXL+lIaVg=;
 b=HXEpGhEhRyuoyLTzAKTjcr8V3Dr7STnOeg1iZ/hx9ftnW0RILYkGpZSMkkFYKgUatB
 +9aI6VZwp4wCwA2qtQNJcI6tKW073OFxAJySSLOLiuAUxvZEwpUIU0ORQT1dRKux9iID
 YJbV+y2U4dZKoRQbN6BpaZfCWglO2ekOVHopGTONNxYBFfNVdyHmEc+L7vRYexfZyvZD
 oY+GT/XzjSlb5ZhEcE5govisjxANGWVgwmn5MlzUgQtAh0vjPJnxXpUJel6OlKts4R6+
 BtkGoOpBpwBaZLIVQlVvz7cwyvE3aJ4rcBSOtGuIu8dYFnPdhqB4W2FNAlMgjo3ZqOEx
 5Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W5gcz4QaQSGZ+1H93kQ3ciD8SjYEg5F7bPAXL+lIaVg=;
 b=nXuA0d9RQRy2h0qiyytU5Q2WqAZG8M/fIgKShhAtr/wbaIzvVGwbh/TZ8+okDjp8x6
 DAQFZNuQjmLOj7l+/2zQES4MgM2BUrL57bUs+wN6m7kdCfZ/vAd5Wmqab+HNYxkL1EFW
 bEcFsoT+iJsjD6BD2i04yggwJpHCWCRKUb5RBiM/F/T/spV2UHaFgGi7Rb+8ghk4+mhv
 ZDhrT5hPyHUUAaqw9PiRpjSgLFn3Z/CN+e2avy2kwcB5BMW7DRc1b8WOBtKupr70gRNo
 kKtx3eu372fRkfP+dHBs2kjrpLHxr6zsCY0pjJbRAqzH/nj3C9MA4r3naCfj0wXYs3ay
 /fSQ==
X-Gm-Message-State: APjAAAXLwna2gWFSI0cFjXJQAxkTwZQBQALbdTkHbf+rjRBfGzrcwPYM
 eK3/ph4/cCGzUjHtaWSftSrDGE0ZImlD8ecs7XE=
X-Google-Smtp-Source: APXvYqwkR5eFyFjVRKBzE/H5bYMM0PzafmwKkRrdQHKH2Ks4GfQfOvskBPzrih6CkO71J2lEW+XjudYiJYPhFPEDsuU=
X-Received: by 2002:a05:620a:1356:: with SMTP id
 c22mr25432991qkl.119.1568102390758; 
 Tue, 10 Sep 2019 00:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SWvNx9hGJN0v9erykioJUKyd726VzfP4b77u0RUHh_mgFooQ@mail.gmail.com>
 <CA+SWvNyUAyBQd9ktaZpvV8R7XcK8opA1_VQeMEnPfmr6jcSANQ@mail.gmail.com>
 <s5hzhjd9xg4.wl-tiwai@suse.de>
 <CA+SWvNw_=Fj_3M3sqVP767OOR+YDY=6-rPtPgmGXg+BcvuG3oA@mail.gmail.com>
 <s5h8sqwaabt.wl-tiwai@suse.de>
 <CA+SWvNwLUzPknid7ZDq114iX8zxMhayRvdxmLMxdDtq9AV3FbQ@mail.gmail.com>
In-Reply-To: <CA+SWvNwLUzPknid7ZDq114iX8zxMhayRvdxmLMxdDtq9AV3FbQ@mail.gmail.com>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Tue, 10 Sep 2019 09:59:39 +0200
Message-ID: <CA+SWvNxRbC+9BRcSM9R5D8uH9D9M8ROCqinXgJku3hQ+O3E0PA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Measuring Device Throughput - MMAP vs. RW
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

>
>
> divide the increase of status._ptr
> https://github.com/michaelwu/alsa-lib/blob/afb2fbd0e554e42e51325c3197a176ea96a74203/include/sound/asound.h#L422
>

Of course meant the hw_ptr
https://github.com/michaelwu/alsa-lib/blob/afb2fbd0e554e42e51325c3197a176ea96a74203/include/sound/asound.h#L423
, sorry
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
