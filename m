Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79853363B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 314471665;
	Mon,  3 Jun 2019 19:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 314471665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559581937;
	bh=+GqyJQUPkLShidbcuWHiL8T8mdOhP6JAuiJactbOHn0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlmBv2P/0JKMyDvTIMpi66Vl9WO/d1WQqHSselxLMLpPCkr6r31G3d8DTAcEx6h1h
	 X5CiFS6ur7mENb5GAbPNfPqYlJvyLdNUvgu2qnXeGylAYXCu1BR87ciLPMYhzdqhDC
	 kuKLYgljBwd0xMFVJPvYhy8OpafOGVPivFbamUa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60ABCF896DB;
	Mon,  3 Jun 2019 19:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44246F896DD; Mon,  3 Jun 2019 19:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E30B0F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E30B0F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NvI77T/+"
Received: by mail-lj1-x242.google.com with SMTP id r76so16948892lja.12
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZsN9HG9HjEyR8IrJFhRj2g1KzQHpLRd3VpPZwVw3IAw=;
 b=NvI77T/+Ln9f7yXRrQq/R/B6q0m3x53rYz+G2Po4ek3Ma/WjW4Jb7k1RbO/X+G3s/u
 R0kcOiuq47pX1WDvBHiKPdf4JyHFTCKhz8DJSEYS6f6AxkwjeddfjFPg+uJanFDBnX+6
 owIK3Qvv8gT93fWoxIOwyYoYEZz45cU3vJIZeXVgQzzzABCKXhPAQYwpDS6/sBmISh0s
 gh7ZU5x1qIj4kg52sz/WkNnQDEgeoAPr3etkw9ODbbqSiFUoAVnptCFEDz06Ghsh6t9S
 52KZGzPq9A6BQ/nnLSxeU4ak4C8aW4b7UVKTKve3BJYFKyVgGz0uo4EissTDbBwE5gWN
 TOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZsN9HG9HjEyR8IrJFhRj2g1KzQHpLRd3VpPZwVw3IAw=;
 b=Z8AEiSId9Y0aowDQdvZlMesCRAHsgItrbl2D+atGdalvvJv1SphH35gK7DW5BG6gtr
 91Ee13zhcRF1hL5vbq+c62DJPcl+ZPcjT8XFsCV/yIJbo4df1S57ypyNpZjz03Bd8ZyE
 eWY8flg8b57+D9cjHfTw2hXYyfdVCwDgTh9ZOdXH8EiBqgGdbYAZ+oMgwDLJsYXQcZ32
 YtPC9ZJb69Hxe6/HaPU9Thj6e0YE4rpyyaK6Chk9Jvuh8vG0k6zqZTVHgx6o9T3jPPHj
 b/djVSzOWXe0Ch+oClylJls4TdzxApf8DgRC3Mp0uwJHo4FsFY41wHnXeznMq665A218
 4EZQ==
X-Gm-Message-State: APjAAAUr+piOtM0lGOf0hyrctacVispyfRKCL6AlU1IZNg7FTbjRMliY
 XpDhnwsBY8QrGtaODfMut/ZIR3M3f1SdhgaEAGXQnA==
X-Google-Smtp-Source: APXvYqymzuUiwEvArl5FdLkcPDI/5B2Ms0/hVxy6vClPb6B+ireFwfq3MOpkmu3T7PT6MifZ3jJtzvajyTrGv5ygQN0=
X-Received: by 2002:a2e:9bd2:: with SMTP id w18mr916163ljj.120.1559581825395; 
 Mon, 03 Jun 2019 10:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190530073229.121032-1-tzungbi@google.com>
 <CA+Px+wXJsar1X=1EdDvMDvPv4DzDG+BmOgSopAqU48Y3Qa=acg@mail.gmail.com>
In-Reply-To: <CA+Px+wXJsar1X=1EdDvMDvPv4DzDG+BmOgSopAqU48Y3Qa=acg@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 3 Jun 2019 10:10:14 -0700
Message-ID: <CAOReqxiJGEsEBR7g3sK57d_b3SZJZBCmfrARpCSWBiEm6sNk6w@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: move DAI pre-links initiation
	to snd_soc_instantiate_card
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

> >  probe_end:
> > -       if (ret < 0)
> > +       if (ret < 0 && ret != -EPROBE_DEFER)
> >                 soc_cleanup_card_resources(card);
> Should not call soc_cleanup_card_resources() if soc_init_dai_link()
> returns fail.  Some context has not initialized yet in the case.
Why not? You need to clean up the platform naming if links fails which
will causes a use-after-free bug if you don't clean it up.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
