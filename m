Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D449122F703
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 19:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E3516A0;
	Mon, 27 Jul 2020 19:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E3516A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595872197;
	bh=LSJU3X5A9YcZD/wAGRBlsn4lUm/2qrC4q+4OL1NgTZ0=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eRHImFbzfp7GTZgdakhx70HU0UsObCa1R/teiW53v17ZT/1E5c+LAR0WdZVSfEkpw
	 nR8gQvLQL+Vhm0BHUs3rnxvJaMG+v85izoAMF8tMorEeZJokWm7A3+jx7Z4Uz4Y2nL
	 z0rUbrmjkf7u1dtbfmxMgXueexy0nC8jlIaPoDU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F543F801D9;
	Mon, 27 Jul 2020 19:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5771F80171; Mon, 27 Jul 2020 19:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 726FAF800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 19:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 726FAF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cvU1zYSn"
Received: by mail-pg1-x52d.google.com with SMTP id l63so10198191pge.12
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LSJU3X5A9YcZD/wAGRBlsn4lUm/2qrC4q+4OL1NgTZ0=;
 b=cvU1zYSnBLaWSbLmsr5/VkSuyl3IzBzi+JWK4FHRmlLvPuIvH2dNmX0vTxEJfrKJ43
 tX4Sebvg2jzc5nJqSSgLIdy2D2AvGilRpYfaqv4Kr+1B+tK3AyvIMmykOItpqAG5oOWR
 aMwWg9CRE7253Agtw6gpXQgxES3nu8OWozOR/FIK7i/CAKanpBLTkyt4i9Ny+UHq5Yah
 YLh32w5ccM/96IKjaW73x4nKmfXWehzwwMUh2SJ9wBMy9mqQt6ooQHeuj6dMeJ4JdlNL
 qWs4UDHAwPzl1pX8QUW+v8N2B/14rQCR2dxjAhn5Jlm7CPwfvc03nvX5Ibta88aaxMg1
 UhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LSJU3X5A9YcZD/wAGRBlsn4lUm/2qrC4q+4OL1NgTZ0=;
 b=ppsfzwY+EP+ze3bjmj/IEz7HY/eg1jnzYclfVZEdmZ/pmKVAIU7VF0/fOYh9PhgWjY
 mp2COiwwOapQBDtrGXv3NSrEPR+tETq1vFhPvO9IMpL3YSGD8yM7v1JyVspA5I7a6P2m
 IXeO6scWJZyNqAa8rUgx+q+8CL6kY41U8q3A522dajiNUJKwHp8mnJ8QL1R52NRRN27/
 jbwNhPfdCHqV/WiRDKeZMWldIvUlJUq5YR7YXmVCV5RVppASG7Aao/Pgak9uN2CyKeMO
 uNpbtG86Z68HKhvqNRxFUA1TurNTsbU7Rzc++z0ylwn/FtaG1jlzmzcQR+D0XiwbQCHR
 +QFg==
X-Gm-Message-State: AOAM5327iBqp7vji6HAb3D67lgg1fwNbWCWplga1NBCZIb6jsOMRjCRF
 k/tc9hFsW1ND1eQxvjxKNMEvAEeGo15WVRj3+wcFmw==
X-Google-Smtp-Source: ABdhPJxdY6ON9/mRPO49l2bxNq7NSlaofKRFaGXv+4CGVL78LNl6z47HFLDdAa8UCDbsZlixv4QX6wDYpvVD9uTQaiI=
X-Received: by 2002:a63:2241:: with SMTP id t1mr20624120pgm.440.1595872085215; 
 Mon, 27 Jul 2020 10:48:05 -0700 (PDT)
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 27 Jul 2020 19:47:54 +0200
Message-ID: <CAAeHK+wM6_3tS9Of8GDpxGBX=XqHDTW042=EYbmagFaZ0o228Q@mail.gmail.com>
Subject: /dev/sequencer descriptions
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Nazime Hande Harputluoglu <handeharputlu@google.com>,
 syzkaller <syzkaller@googlegroups.com>
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

Hi Takashi,

We're working on syzkaller descriptions for /dev/sequencer [1], but
have some troubles understanding its functionality. The main question
is: is sound/synth/emux/ code reachable when tested in a VM (we're
using QEMU with -soundhw all), or does it require some specific
hardware to be present?

In our setup (with Debian Stretch userspace image) we have
/dev/sequencer with SNDRV_MINOR_OSS_SEQUENCER and /dev/sequencer2 with
SNDRV_MINOR_OSS_MUSIC. For the former, there are no synth devices as
reported by SNDCTL_SEQ_NRSYNTHS. For the latter, synth devices are
there, but the load_patch() callback is not reachable as this check
[2] fails.

Is that code impossible to test in a VM at all? Or are there some
specific kernel options/drivers that need to be enabled?

Thanks!

[1] https://github.com/google/syzkaller/pull/1952

[2] https://elixir.bootlin.com/linux/v5.7.8/source/sound/core/seq/oss/seq_oss_synth.c#L452
