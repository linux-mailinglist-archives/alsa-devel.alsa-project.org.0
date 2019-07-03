Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F25DE5F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 09:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6F51699;
	Wed,  3 Jul 2019 09:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6F51699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562137460;
	bh=zJdhZW0AYdhm/DOGBuMKeHUskfeUWVGQBiBWh4wMfH8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5Ru8VfzAj1l7/cCv5hVogMWThRM5TSk1pqJHwxqRNAS7Iu+FlrgzoNooCNB8opCr
	 2vZfU50+hLsFoq2SKOFqvLUnj2GLlv2p+CZ1HKZ8VDb0AMpbcW+HaZvBwisTRZsdYK
	 j8QVuloHhvNVKY4HfnHNJcP7UmomoGjI3vtyRvT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD660F800EA;
	Wed,  3 Jul 2019 09:02:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9DB6F800EA; Wed,  3 Jul 2019 09:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EA1EF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 09:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA1EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GvbwfAKj"
Received: by mail-oi1-x243.google.com with SMTP id l12so1217260oil.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WQavmQ7naRZV5RTRJZ1vjqTMI46hmuQ0lloKSYHxQug=;
 b=GvbwfAKj/BZGrW5fSAyFzB7M0fk8xgnxZ2o2UHEUh9UzP1VCHfan1gk1nLWSfDgKsu
 VK+ZivbZhGvU/ZEAvoQmZw7AzIpBBS9zBOFEUud4mbOhY2jHiyXmwwHLCBsxFfVen31F
 9K9kXzsXhAZyL/cJdcNgZdB5Im3mV5D4srUkv68n6nPd8cXaei+0ofEIem0gPrQCLXln
 1Yu33JRmhdkA9TT6V/PcFiRmhjoxFVf/CjoRFpmsgQV9q7A8CN9SqpOx4AZSim6sxKzF
 vRL9Sd7dtvYBFGXCIJCxUMBJidWZr/2Dv7DYQuuPtpEiKlZUZ5yxL/X4OuJ4BeOI9X3D
 Ac8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQavmQ7naRZV5RTRJZ1vjqTMI46hmuQ0lloKSYHxQug=;
 b=APBc0fwhgBN08k1I6WlbHsmhbj+hhgB+YmF0UObn3IjS1/DO58B4ICXJI56AYRyLv6
 bFudKKmHrhTSviRGVDN4C7wmb/VjSwuP/26AKcMczJOt5NtDQNspx4VrbSmCNKzDuwzA
 XtGWmfQ95OH/y7EeoubNev1BYOMmt2eu5xH81TMwT6zhmrDZXbpPkNSHn5of5OsKvdSE
 qbUkfLTuzDxBRzUsjKuNpMFqvvfpYkjldePo1GGJHkSAb4mH1o8hAGigN+hz8REsFB7i
 fGRUxPMQr46zHFm3HxcvXIWt8Vk8OvBHyoLbYYes0KVWOSwTrhoQwXmMFYXb9OiHRkWq
 DRqg==
X-Gm-Message-State: APjAAAXo8EmEfvQoxnq5CHWP8caSTuTSNsvJ0KMU+pksiqirLHuU+mZs
 R2tKhZZipqi2+UXojhK1TTMBm5iJtqfJces8LIi7Mg==
X-Google-Smtp-Source: APXvYqyoBdXeYtuppV8/YlRCgG1weUigQkPdo0vSRxYylRYsZYD189YggkNEPsynlDhSoxWjb0An27PeqdjTTGj6+08=
X-Received: by 2002:aca:4d84:: with SMTP id a126mr6104437oib.23.1562137349773; 
 Wed, 03 Jul 2019 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <87a7e2wkll.wl-kuninori.morimoto.gx@renesas.com>
 <87ftnutr9i.wl-kuninori.morimoto.gx@renesas.com>
 <CA+Px+wVH0ypoeY+CrWTHmQf-LYBTB9gOFwnMY8pQ5Q3K-urCrw@mail.gmail.com>
 <87wogzpq0e.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wogzpq0e.wl-kuninori.morimoto.gx@renesas.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 3 Jul 2019 15:02:18 +0800
Message-ID: <CA+Px+wUE_HW6tqHVTy4HxVKhcL9R895fZmkSPidwNN_Ysg-w-g@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 46/46] ASoC: soc-utils: respawn dummy
	Platform
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

On Wed, Jul 3, 2019 at 2:56 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> > > commit 64ee5067cf64 ("ASoC: soc-utils: remove dummy Platform") removed
> > > dummy Platform from ALSA SoC, but it is over-kill.
> > What did you mean by "over-kill"?
>
> It means we need to keep it.
>
Ok, I see.  I overlooked it and just realized that it is a revert series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
