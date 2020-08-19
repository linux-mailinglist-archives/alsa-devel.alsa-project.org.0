Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C811249B42
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 12:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB4D1838;
	Wed, 19 Aug 2020 12:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB4D1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597834450;
	bh=GMQuIR5UNmYVb35mgBzzxYImDXnf+cB3ASaEIyHK3t8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUi0SdDsfx5y2jd7ZPZtIs0nJAJUg2RP/1r8az88R68snxBgkX4Mq6KDGdNqlwVwL
	 vL9/+b/lUjqbrKrGPF1zTm8ZjaF4QkuNdogRgpZd7gBJmgvRzPQJmtS0SEgMyu/SJ5
	 SwEfIvHKaEK4QVOjtlmb8Ooohkjz3Te2n8bD4TPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C6BF800D3;
	Wed, 19 Aug 2020 12:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54397F80218; Wed, 19 Aug 2020 12:52:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A5CBF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 12:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5CBF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gso9pMxr"
Received: by mail-oo1-xc42.google.com with SMTP id a6so4788602oog.9
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVVSOWbVhc+1jDHdFns3ZSzRukenY167RTrEndwbU+M=;
 b=Gso9pMxrOQWdMFS4oUDFDQopnA2DpTpiZCJFqq/B2ZEoa859lMA5DG1q5AfyFRQC2K
 0BbOOMsaxojyLaYamQN/hpqRKPyyNI6tYgVnrQEOZwypkcXjeXNYOcmggJBzwWOAPH2t
 uDby8ZfkUfgPuCVQ1hjydyCXloT/GD+ySll0NBJQxEcqa5ZYkvWZC8QcBYu6LNGB6qmy
 BNwFxRP4pWhEXUL9/E4VkRndasu5/0pLNTSDu1EbLLgbuQ4nsZFmlQPPbC5atEOXRxVR
 X7KawI1aJh0oYRDXgKsXSAYl9gDpUeMspxL/faww8IWo5Ubp2AZ/wAk+H184A02WZfBJ
 /6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVVSOWbVhc+1jDHdFns3ZSzRukenY167RTrEndwbU+M=;
 b=NunJ+sd0TOst9/x8E5dIeVdYeLScqK897XgDgvD92bdyvv67YwBFowupkCdVFRq9Fs
 DehfYAc274am1F+vNYDhb6QBlGEL6ECjNkEXOZxyuzjib1pi3aexZGLRRRSb1Hb72frQ
 5xnHEJmIYs9hBdayeESLKpSvwO7Pqp8OLgQaqtPm/VczovirGpaJCtPmDgsLfFY6Dlbh
 goEVRYm6nOn8UHIn3uEui0NqufuibLCxQZYkrf62X8h9mctzrRnizRspmbx9jHa3rtJF
 wkPQqKCJrwWfh7UBBJb7MCY+1cYYWrjq6mTavjFdFp1VwbpUeX8r/vDBQZJ6kMO1XHlH
 OgXw==
X-Gm-Message-State: AOAM5301whuvI7xXeTBmvqiMe4sxEsBWRabBztMYtlVDSSwxLwql6NwW
 xjjOFCJruLI0rN3jW1m6K9IKPD7nupNH/9KqlI8=
X-Google-Smtp-Source: ABdhPJza8N+paiL7BVopPlHy+EmjenRyRlSSITcfsn9ivsKXVK0GX/mlG+WzET1CjkKeuuz0KvlkntNnGGj9jJ4neCo=
X-Received: by 2002:a4a:d62c:: with SMTP id n12mr18112364oon.38.1597834329556; 
 Wed, 19 Aug 2020 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hsgckl084.wl-tiwai@suse.de> <20200818104432.GB5337@sirena.org.uk>
In-Reply-To: <20200818104432.GB5337@sirena.org.uk>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 19 Aug 2020 16:21:58 +0530
Message-ID: <CAOMdWSK79WWsmsxJH9zUMZMfkBNRWXbmEHg-haxNZopHjC1cGw@mail.gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 timur@kernel.org, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, clemens@ladisch.de, tiwai@suse.com,
 nicoleotsuka@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
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
> > Mark, may I apply those ASoC patches through my tree together with
> > others?  Those seem targeting to 5.9, and I have a patch set to
> > convert to tasklet for 5.10, which would be better manageable when
> > based on top of those changes.
>
> These patches which I wasn't CCed on and which need their subject lines
> fixing :( .  With the subject lines fixed I guess so so

Extremely sorry. I thought I had it covered. How would you like it
worded?

> Acked-by: Mark Brown <broonie@kernel.org>
>
> but judging from some of the other threads about similar patches that I
> was randomly CCed on I'm not sure people like from_tasklet() so perhaps
> there might be issues.

Yes, there is a new macro by name cast_out() is suggested in place of
from_tasklet(). Hopefully it will go in soon. Will spin out V2 with the change
and also re-word subject line.

> Allen, as documented in submitting-patches.rst please send patches to
> the maintainers for the code you would like to change.  The normal
> kernel workflow is that people apply patches from their inboxes, if they
> aren't copied they are likely to not see the patch at all and it is much
> more difficult to apply patches.

I understand, I'll take care of it in the future. Thank you.

-- 
       - Allen
