Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2B49C24
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 10:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7CDC170F;
	Tue, 18 Jun 2019 10:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7CDC170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560847114;
	bh=Dr4oxC1uHjZv4+x6AjRQr2KwlMN67u1/GU3WwJ0wJk4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUUwm7WOXGquZUiOoy7Mpu+qeIgMEVZMjTteEpFf0WJ50MMi0v3lM36IMGMt6ITXh
	 DWf4mKugBQGr5KiR294qcYuFa8oIBxKHqmcgI36q/y99PnCI3eDcJyR4d7FQgfB+Oy
	 KQRmw7Ke1gYDvkOyoFcjzNLiQcxfXIB31ueyIdEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19935F896F4;
	Tue, 18 Jun 2019 10:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3918FF896F4; Tue, 18 Jun 2019 10:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 695F9F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 10:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 695F9F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="p0WPnBbl"
Received: by mail-ot1-x342.google.com with SMTP id i8so13167810oth.10
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbI2arzCVB15iIHFaXJeK2OXjaF6EvzNPl33ojaSqJg=;
 b=p0WPnBblUtd0qMo69IDfSj1ocjF5blFjAnv2yH/8FPkiuR3GiN3qOKy+m1gZ1ACgAB
 UY2yVFu7ZKMG1s9S7hqhVC04j1LIBPKY+8e+hi3LKQdn8cKAC8u+jnhDAH7177JWrwmB
 0cFtE17rm1eqkKPLx/roa2PSNSxdr2IohIogF3F2MCMdWh3tztg7r0JLN8FAGl26loRY
 vtVsvd/XFHQ/knLffpCDKUIQ3sKZztfjCzdla7wVEn79jtyle35G8YUKE1YkfA5K7HYa
 kvK4WjvehQH41ivD3XsJVDiOQzDSeI1f+pnkD/R8Q2TElG46jCWMoZPvn3tJmOFaTJi0
 TH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbI2arzCVB15iIHFaXJeK2OXjaF6EvzNPl33ojaSqJg=;
 b=W8iNhfo/C+LNZmnqhdHVuydNjUAWT2PSpqTDb054WyHR2DJT7gPx1jXmyyIB8boEdo
 u9qs+NOUeUYa5RWgfdHVGO5NNHY1oQ2PwDhWNKRHwLRW7nlhgiVM73WsdNq1Q0ssY0CY
 v06QU6FZT/9sLuhGcX62mp9njg8GQ947qVbeZZ0vaG5Jr5ZEZmJ+z35lzwQOxFUT9RP3
 qysPvEQ3ZiZuboV6KXdjXbY753hzYKTELURLrIuZcDeYqwN51fytvF7zJhFwwHwNvVNf
 mLzR9twxk4Xz87cm3ZXnE9FufdEQeI5UwtFjOIgy3Nl7XzZhYWgaPEkT9Tq2Lm2LWmnO
 u47w==
X-Gm-Message-State: APjAAAUn5L5hIgjBhL9PcKyaIRCI/RJ1XPj21JfWMoma4Ql9wyb3IA7+
 ETV3JINbGRROrtaZkc7MuMRqhRkq6W6pz/EGmNjgQQ==
X-Google-Smtp-Source: APXvYqwJHA+l65cr7Qm4XvzkJ/OvW0fnAlKcWpx6iwFeTXj3WL9Scho1vx1wH7dilslT5POm36lvreXRf14XMkA5zvs=
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr3447698otl.328.1560847002104; 
 Tue, 18 Jun 2019 01:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190618070503.36310-1-tzungbi@google.com>
 <f3ccd6a2-a9b1-15a6-6b0f-b044a2def5d7@linux.intel.com>
In-Reply-To: <f3ccd6a2-a9b1-15a6-6b0f-b044a2def5d7@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 18 Jun 2019 16:36:30 +0800
Message-ID: <CA+Px+wX+KwV8e9ugoB_pkdvWBJD_A26v4JTNmA0nTC_S8oSs4w@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl: extract common function
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

On Tue, Jun 18, 2019 at 3:46 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> HDMI support is a mess for sure, but I am not sure this is the right way
> to refactor the code. See e.g. bxt_da7219_max98357a, a single init
> callback was used. you can use dai->id to manage the right offset,
>
> pcm->device = SKL_DPCM_AUDIO_HDMI1_PB + dai->id; or
> pcm->device = dai->id;
>
> instead of hard-coding the values in a parameter.
>
Yeah, I noticed that and I am very confused.

But after following the call sequence, _late_probe() ->
hdac_hdmi_jack_init() -> hdac_hdmi_get_pcm_from_id(), it seems the ID
is merely a unique key to perform linear search in
hdac_hdmi_get_pcm_from_id().  It looks like the follower
snd_hdac_add_chmap_ctls() does not use the ID too seriously.

TBH, I am not very sure either.  But if either way is fine, simpler is
better (i.e. pcm->device = dai->id;).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
