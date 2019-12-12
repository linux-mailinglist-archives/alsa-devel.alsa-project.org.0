Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23011D4E3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 19:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BB11700;
	Thu, 12 Dec 2019 19:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BB11700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576174055;
	bh=ZbQ+Mlj1mfwKPBO7mHt2eDqZ0MRssvimzRorn5+Tkes=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pkou4GxyBeDz7LzZtvtWP89Z6YVhjkCHk0L2tnTU2YyvPTgJIK8cHQv351i34F68g
	 FinPwEKMyNoYNAsCT8DuB+gSpMPWW7y2axizUQndfQxSJUjXAgMlanRMOoC+/a0OS9
	 jZnmNWi+gjg9tXlF9Or8tdgvayEJVMXez6eXHgCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED23F801D8;
	Thu, 12 Dec 2019 19:05:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A57F8020C; Thu, 12 Dec 2019 19:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A198F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 19:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A198F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="uGZeFuek"
Received: by mail-io1-xd42.google.com with SMTP id b10so2980379iof.11
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 10:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1PVTShbmTWPWoLzVKljKHRYw3rcqIPLwvlis0wSDhc=;
 b=uGZeFuekrv7Zc4MOO091PIYsKXyeF/FwZfUf/VmtefCFnn3KJuevQ9b60DYdCvVANm
 YBcNPL8S18NsVx5OehjETWmnBCr9ClopD0+tYCggVhw8nb5V/aDb9hTxM2FGbaI/8EZa
 YVt1Lsdqbw8s8P8O9f+owG//TiP/QV8bqIl1MIu/BbdJi7vFA8tZCGDu1tZ26OZs5PQm
 ipJRSK7FQGpgqpAIpMdteIJFpm0yMC8nXzV4V8+JBoLubSmQvU74ibd69tlx2GsfMxxs
 rg2dremhaK3wWiRDM0WvEBj4Ew10byui7WDibVI5AF3QfeRZ6MD/RDo4J9kysPzbDFAn
 D/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1PVTShbmTWPWoLzVKljKHRYw3rcqIPLwvlis0wSDhc=;
 b=BEu9aH/z76J55ivPi+iQol57otRZrTzFU81xPu3+NRFcS1MM5seBa1qdR/OIeSjwWi
 azn3I7iJv0bgTCXasxhEzgIEEnxCTbQCXL7Bi3hgK8BB107bZUsaVo9LXAKAmfPq5gOF
 qimlpDAca4Zzs1dLpGrFZKIyovNAtqaIoFM6Cm9wzMv11BLy/m8mgBFlhAKCW39jDHlP
 afwhgmYVRzvONEe0aMVjp+4pmMbhMECgO0ZLxBFRfXocA2hW+0CNdVeTbnXk//Q7uJhG
 ZY69AOCqwNwWrbehjp/bRDdsDWx7RtTRdouamKpmT9g7N2uNCs15EcIsWVu8xELxAtov
 Iy3Q==
X-Gm-Message-State: APjAAAUih4guRq74A5gwT81pJoyvydk7gDxIKIZFLqUbhZGFO/A7rJQM
 /a8v49PTDaJVH9cdu3Ae674wrw/2T72BR3wx8t4Eaw==
X-Google-Smtp-Source: APXvYqwk0AUqlLisz5L1ubxtjt4aBWDgQPfRFolNYD7szCHBfjyDpPgFqHnAhng0q0VqeOrf2zrZi/b9oaSoCMmcH0M=
X-Received: by 2002:a5d:9953:: with SMTP id v19mr4153981ios.118.1576173945200; 
 Thu, 12 Dec 2019 10:05:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
In-Reply-To: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 13 Dec 2019 02:05:32 +0800
Message-ID: <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

On Thu, Dec 12, 2019 at 10:09 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> -> #1 (&card->controls_rwsem){++++}:
>         snd_ctl_add_replace+0x3c/0x84
>         dapm_create_or_share_kcontrol+0x24c/0x2e0
>         snd_soc_dapm_new_widgets+0x308/0x594
>         snd_soc_bind_card+0x80c/0xac8
>         devm_snd_soc_register_card+0x34/0x6c
>         asoc_simple_probe+0x244/0x4a0
>         platform_drv_probe+0x6c/0xa4
>         really_probe+0x200/0x490
>         driver_probe_device+0x78/0x1f8
>         bus_for_each_drv+0x74/0xb8
>         __device_attach+0xd4/0x16c
>         bus_probe_device+0x88/0x90
>         deferred_probe_work_func+0x3c/0xd0
>         process_one_work+0x22c/0x7c4
>         worker_thread+0x44/0x524
>         kthread+0x130/0x164
>         ret_from_fork+0x14/0x20
>         0x0
A key observation here is: the card registration got deferred.

>
> -> #0 (&card->dapm_mutex){+.+.}:
>         lock_acquire+0xe8/0x270
>         __mutex_lock+0x9c/0xb18
>         mutex_lock_nested+0x1c/0x24
>         max98090_shdn_save+0x1c/0x28
>         max98090_put_enum_double+0x20/0x40
>         snd_ctl_ioctl+0x190/0xbb8
>         do_vfs_ioctl+0xb0/0xab0
>         ksys_ioctl+0x34/0x5c
>         ret_fast_syscall+0x0/0x28
>         0xbe9094dc
And this is an ioctl( ) on a control (e.g. controlC0).

I have no enough resources to test and trace the code temporarily.
But is it possible:
- snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
can see the control
- code in later snd_soc_bind_card( ) decided to defer the probe
- soc_cleanup_card_resources( ) may forget to clean the control?  (not
sure about this)
Then, when the card is instantiating next time, some userspace program
tries to ioctl( ) to get the deadlock possibility and the NULL
dereference.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
