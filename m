Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663232310A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26031679;
	Tue, 23 Feb 2021 19:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26031679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614106329;
	bh=i3IObm+DY6v9t9rgpYgMLiue/2JiqWoOZdDMrH8NXW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UY9bq3BywYcfKhhlCKU52q6wgCk9InRcfIq/oYT6haiMC7AjxIDjJwv/HWlqUDq3A
	 58F9Mz1ciTwLTiqRKVW6YPrPRcGfkP0hbLJKCXyirgDSyGXF68Xs3j1p/YmWawH4ah
	 T2cZO+DSOxBmpqpr3AD6/nA1y+MW4q9Lfp8CZyRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0655CF8016D;
	Tue, 23 Feb 2021 19:50:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D663BF8016A; Tue, 23 Feb 2021 19:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7247AF80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7247AF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="T7VfT35c"
Received: by mail-qk1-x72d.google.com with SMTP id t62so17222534qke.7
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 10:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3IObm+DY6v9t9rgpYgMLiue/2JiqWoOZdDMrH8NXW4=;
 b=T7VfT35c2/6k5HWFTw2XO3jxmkBrmxECepjhLq/aao5Otb2ywG8I9JGi0CiPnpvNu9
 f72xHZz4a1HIH5IfP3NHXKi3dkGFocLS5yODHKgcIoR5YmkF00cN/JoRHxecVZnpRfTa
 Igo4jRI50Ee20sHSZeHiPuR5Zmjl/e5Wc3t5jAW1QWtpnMwKetysQNXdKnS7I4YsZm9C
 4lKHFE45LBU3L1hGzIBE71TIdigt2MZ3bgo62xc7EpNT53uHTEvdV8IjePkLv7nFPJEq
 KOUVeps0edBzEU3H98hyYbDKSCqlkZKKLs7kMbNn8m8vVeCwijVmN2pttnL14qHnK/Id
 wp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3IObm+DY6v9t9rgpYgMLiue/2JiqWoOZdDMrH8NXW4=;
 b=JQyZTdQ5bLkv2v1S26FXqX0PzpYSqoMW+ctp2lSuxk6Oe2GF4r32UNc7UqbnGE7unF
 uf+D6ed7Ge8rKz1ECruCJlC4hHz0GWrIm2ZZJkHxoYhz7A6N80qbDmg0x7+dKuU0DAqz
 EoeFIG42luG4bXAiUQgvY7IPV8C5enkLUvv5buVJg3yI5gWqCg3jH985FEru653OTw65
 GJCECwxMrSYXgRQ29/cWZkwJHbVnCljaZ6CtrBMHy8AeIA49rZBhlD5in3IFD/7uxI8T
 fvkIx7E6qJHF4ZyrZYgqFiLUq96mP8jdpkO5Wu+GAp6FZI6/bvxPSZGMmi7y5hY5EOCM
 WO1w==
X-Gm-Message-State: AOAM531gG+7cKXmE+QybbNNeY8fN+AtYfgn4cceDlxKxLxCDTEx346QT
 nfFEOWxN3VTH2G9WMTBctUW4ujDGS8lGSAwfQxuRRA==
X-Google-Smtp-Source: ABdhPJxJgPkkpXcmA/4XAgmBHi1YOqpFlC5jtaYZRTvpQOWYGm/OFjL9ouBxszvZs/0AFDVgSxppJYPx1KEodnw8zUQ=
X-Received: by 2002:a37:5943:: with SMTP id n64mr2824352qkb.127.1614106230491; 
 Tue, 23 Feb 2021 10:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210217214914.700751-1-cujomalainey@chromium.org>
 <5b90530b77744937b87bbbd35901e320@realtek.com> <s5hr1ld22a9.wl-tiwai@suse.de>
 <CAOReqxibmAQNQe8PuHkUSW5Kb2L986X9DDqia-aN=ZrS8VJysA@mail.gmail.com>
 <20210222134551.GC6127@sirena.org.uk>
 <CAOReqxhRi9n-vxayVDNp-9R65s79OAqX8=YweCddFHTDJbbjGw@mail.gmail.com>
 <20210223124230.GA5116@sirena.org.uk>
In-Reply-To: <20210223124230.GA5116@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 23 Feb 2021 10:50:18 -0800
Message-ID: <CAOReqxjhWD5V7UtH5-fYpiK-h5cF7fC2WqmtnYz1qdn3yt7+LQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: remove jack detect delay
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

>
> Are you sure that *zero* debounce is needed for the button presses?
> 250ms does look like a lot of time but zero might be going from one
> extreme to the other.


Fair point, I was looking at some other codecs and why they respond so
quickly, it appears they have no fixed delay and just call schedule
work. That being said, I can easily double tap <100ms. So Ideally i
would like to keep this on the order of ~50ms at most. I am guessing
Realtek will want to keep the 250ms for jack detect still.

Would queueing two separate jobs with two different delays be the
simple way to go? Realtek does this sound fine to you?

Curtis
