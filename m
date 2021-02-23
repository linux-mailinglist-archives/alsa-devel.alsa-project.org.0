Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF583231DE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 21:09:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 737C41676;
	Tue, 23 Feb 2021 21:08:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 737C41676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614110985;
	bh=6Wle4SB8JkEciTJoSbHWn9QseV5fiz5zIuZ34q5zF9M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XbuVdD6WeQ+faeIESEjBhvMza4C5ABF4Le/YEF9eyi+EHB69IWY9qaWjRjeyIpI2D
	 yo17t55g1+Fo0NfuntuhHH97yQ7tmmMjXimWG3ARzvTLDCzzN23mHb143735hL4qwB
	 DgmXptRBTMUh+OxbVnt3QpNo58StbwKNtgo/Wct4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8652F800B4;
	Tue, 23 Feb 2021 21:08:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A28F8016A; Tue, 23 Feb 2021 21:08:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7BEBF80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 21:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7BEBF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="k9pVaMUP"
Received: by mail-qt1-x82e.google.com with SMTP id a2so7288414qtw.12
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 12:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQUYQ27nPyJMXB0WKNuBlp5AO0z1jSw5GxCLfQWZ070=;
 b=k9pVaMUPSqgj8GmzPF/bT+W0Rbe6+Xw+LEmCM8GsevQW0xjmedhF4WBUjDHZUnZJ0M
 64IvURRpX3U4C71LOMNe8hkPELHMmVNtETuqzstABMAApzNJmt04dSRG17u5qa4zYd5k
 iGU4tG7yVyiA6mFNGG1Pevl7kvLoALYELC1NM/x++GhFHHBx2Lpq+0vtplNcYuiLS1Vu
 mHNZZ0a3PAK+QOSd7egTSvfumGJB9I1bGgVbNt7p3vd3nCf7YKPG/tlQAMlz/b5/CTHs
 aigHCAGc0ZB4qN2n75S8AuCkfmU+nZn3YT8kbdXRhlMTnoujaYEdrtZACh4nmFZh3BPb
 KbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQUYQ27nPyJMXB0WKNuBlp5AO0z1jSw5GxCLfQWZ070=;
 b=aImVlusWdau6fijysY30dl/W5sKp6EQ6bn5JqyyBByuDsvFYycJO520ZrkeJIktuOl
 Jgs4tIpYTCbh/zGNgwahqg/8EOP6DT7p0LeRNzwwz7wdwx9q1JyYEI6rDlUcO7Ji42Z1
 CLYDotfjqAuuerEQ26mcvFbI0kH53BmbLrkuvC1ZdW7Ocnb332QJwLkhiu3oIoRKNAx8
 76gKrYiST/eRtDEU/r0qcjTZKm/lNxCeErOqPj4E60u22GK1dyDfPgqNbZlPntg9PLlG
 mkhhbHD0otDPAlHjkfmjhC4I2uv48AP+ajSrdOEianwJcah7ZPWi4boLxEYDJciHRnja
 fR9g==
X-Gm-Message-State: AOAM533i0oW2eyZ9okCEfAoVoJW2rn9FLWYWv5mCxs2YLiQX5HH8ScRg
 cHlCn/9RiowEJIzpfS5BU9Xpj9I5jOorbFSXLROAjg==
X-Google-Smtp-Source: ABdhPJwng2mDFEpeIkzE5H0ErOGOt+cgDU7rc1aLtbV0G6CkOSM9sspijYjjxZNDpIA7qYFIs2Q/XO0Nd2MZQcfGFd0=
X-Received: by 2002:ac8:528f:: with SMTP id s15mr26177686qtn.355.1614110883243; 
 Tue, 23 Feb 2021 12:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20210217214914.700751-1-cujomalainey@chromium.org>
 <5b90530b77744937b87bbbd35901e320@realtek.com> <s5hr1ld22a9.wl-tiwai@suse.de>
 <CAOReqxibmAQNQe8PuHkUSW5Kb2L986X9DDqia-aN=ZrS8VJysA@mail.gmail.com>
 <20210222134551.GC6127@sirena.org.uk>
 <CAOReqxhRi9n-vxayVDNp-9R65s79OAqX8=YweCddFHTDJbbjGw@mail.gmail.com>
 <20210223124230.GA5116@sirena.org.uk>
 <CAOReqxjhWD5V7UtH5-fYpiK-h5cF7fC2WqmtnYz1qdn3yt7+LQ@mail.gmail.com>
 <20210223190439.GL5116@sirena.org.uk>
In-Reply-To: <20210223190439.GL5116@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 23 Feb 2021 12:07:51 -0800
Message-ID: <CAOReqxiH9Bdwz6oe+hW9hOfO2w7+ic3FMLWOq_g+0-YfeXoKfg@mail.gmail.com>
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
> > Would queueing two separate jobs with two different delays be the
> > simple way to go? Realtek does this sound fine to you?
>
> Possibly just queuing the same job with different timeouts?  I don't
> have particularly strong feelings assuming the resulting code make
> sense.

And just track how we were last scheduled so we only check the correct
thing? Sure that works too.
