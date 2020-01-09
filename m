Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7541352CA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 06:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB61F175E;
	Thu,  9 Jan 2020 06:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB61F175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578548305;
	bh=re43v0I2paeyl1NmMcsW40rlmiAcotJ+2aDSRfVvyQY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNTbEcV25wIELA92Hawnu+MVExX7vxkazpu/dNAj/8m6p/C9E7w6h2UsCZP40MP+n
	 vcpNHE5X6p1fvRaO0A1e0MUwer0WHb/zwUL3n5QlhnAED4AE7UZ+6z72SczBsd7iNE
	 +UINytmHizoLrgDWc9tjlulgCdGCtgqB4+YgIqYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28270F8015B;
	Thu,  9 Jan 2020 06:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B4A2F8015B; Thu,  9 Jan 2020 06:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A19AF80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 06:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A19AF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="huiN23DI"
Received: by mail-il1-x144.google.com with SMTP id s15so4727908iln.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Jan 2020 21:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sAHhoFZ0iYCPxYt+rh/Px3+8GOp5DO3V29oeS42DXAM=;
 b=huiN23DIYcPHVv1KglkNFE9hwhktEqKgtWXiSkSJK5LmJDTbV3ps3AzdNKFwbVyRLU
 j6622puSU0EYgKiTBzKbjnldBj6p+SqrQ5IAZDpUi8Mwg/UESiWJuv042WLDon1jb0fb
 eG6eNsVZVo3F6z3ivbqJ842nbgPQHAGVoqVTN2RjedMNDHo32ifXrKlI4YvixtBl7NHU
 2st3DsieNEM8T0b4/zNVLJJWvpkuCbrnmBaRNyYuw+F/Eviulg7v7aA8N2/pQkL2Ybet
 g/9n823BtG2EUxnmgbY6Vzbo5Id0yUpX+Kfy4DlJQVetjj4ZGHYyMnjKI3X+dy7LGIYJ
 LJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sAHhoFZ0iYCPxYt+rh/Px3+8GOp5DO3V29oeS42DXAM=;
 b=gF2WRvK54GoGkcq30n4Yjk0HkhhqpM0eZJD1CdfJXrpbZ8z87F5B2lIMxekcyOtwNy
 fpG8lSHoNcz1W3Y1MLZ3RL8QsJ3UMsWKx/StX1J5tw1m6z2LKRtE9Pa8vcb5dDPrNOG/
 ovh8dyTi73v7yyrpY2obFiUV4VtNddK+shuTB1Q2XL3uSKsZFv6R0uSbaINVTW4x9oGN
 lW9LpeaCsyHcFEI7Y9l/2O6VTpfgvW44jDe7zuNEj82kzq91h7Jm8Ik+B/sZZO3WKb0K
 ecGj9Gwi/slPmooXWo2sMj0qzpjbkZsFE4hQLEBl6f5Jr8Jm8ys8vrQmNyMTzDeS/6CH
 nTBA==
X-Gm-Message-State: APjAAAVC98gtlCsIJmin5Iaai4HPBQjgYnYQNDSC8oQ77LMhlsD83+VZ
 Dj1emd16enchaYZg1O1dr2s0LsBl9z+cZ+TjmtkdvA==
X-Google-Smtp-Source: APXvYqzFc89SrQMcMWBXOOpciBA/UbRyMnmDTvKUFY09Y6diFKdpRQB/cIzzntYu/ZXrqm6Imlk1zgpmom3NbH7Nup8=
X-Received: by 2002:a92:981b:: with SMTP id l27mr7483819ili.118.1578548194052; 
 Wed, 08 Jan 2020 21:36:34 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
 <20200108115007.31095-1-m.szyprowski@samsung.com>
 <20200108115007.31095-2-m.szyprowski@samsung.com>
In-Reply-To: <20200108115007.31095-2-m.szyprowski@samsung.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 9 Jan 2020 13:36:22 +0800
Message-ID: <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: max98090: fix lockdep warning
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

On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Fix this by introducing a separate mutex only for serializing the SHDN
> hardware register related operations.

This fix makes less sense to me.  We used dapm_mutex intentionally
because: both DAPM and userspace mixer control would change SHDN bit
at the same time.

> This fixes the following lockdep warning observed on Exynos4412-based
> Odroid U3 board:
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.5.0-rc5-next-20200107 #166 Not tainted
> ------------------------------------------------------
> alsactl/1104 is trying to acquire lock:
> ed0d50f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28
>
> but task is already holding lock:
> edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8
>
> which lock already depends on the new lock.
>
> the existing dependency chain (in reverse order) is:
>
> -> #1 (&card->controls_rwsem){++++}:
>        snd_ctl_add_replace+0x3c/0x84
>        dapm_create_or_share_kcontrol+0x24c/0x2e0
>        snd_soc_dapm_new_widgets+0x308/0x594
>        snd_soc_bind_card+0x80c/0xad4
>        devm_snd_soc_register_card+0x34/0x6c
>        odroid_audio_probe+0x288/0x34c
>        platform_drv_probe+0x6c/0xa4
>        really_probe+0x200/0x490
>        driver_probe_device+0x78/0x1f8
>        bus_for_each_drv+0x74/0xb8
>        __device_attach+0xd4/0x16c
>        bus_probe_device+0x88/0x90
>        deferred_probe_work_func+0x3c/0xd0
>        process_one_work+0x22c/0x7c4
>        worker_thread+0x44/0x524
>        kthread+0x130/0x164
>        ret_from_fork+0x14/0x20
>        0x0
>
> -> #0 (&card->dapm_mutex){+.+.}:
>        lock_acquire+0xe8/0x270
>        __mutex_lock+0x9c/0xb18
>        mutex_lock_nested+0x1c/0x24
>        max98090_shdn_save+0x1c/0x28
>        max98090_put_enum_double+0x20/0x40
>        snd_ctl_ioctl+0x190/0xbb8
>        ksys_ioctl+0x470/0xaf8
>        ret_fast_syscall+0x0/0x28
>        0xbefaa564

As the stack trace suggested: when the card was still registering,
alsactl can see the mixer control and try to change it.

We have a discussion on an older thread
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160454.html).
It is weird: userspace should not see things (e.g. no controlC0) until
snd_card_register( ).

I would like to spend some time to find the root cause.  It would be a
little challenging though (I have no real runtime to test...).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
