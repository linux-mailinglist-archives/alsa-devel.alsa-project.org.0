Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017339E764
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 14:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73745166F;
	Tue, 27 Aug 2019 14:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73745166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566907889;
	bh=i+kdkRjpm1dR0CnRqgBfq3UxGKeKopRUCiaouDUYVYQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7rF9wyLKuzQCWgQQ1KDO67UREDLFY1r0008GVgfAlJpIB4broM1VdAHZsIDOIPVq
	 zP/U35g0OISpIxG0bB9sWES00xyWVO15aqUzD+TTK/flEKJ0ozNo02BNkfEwZPFMhv
	 Ma9jnnbERrRQy+fuEiXEpEy1/+owphMzHmK8gsrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E81DAF802A0;
	Tue, 27 Aug 2019 14:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE97F80274; Tue, 27 Aug 2019 14:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A7E7F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 14:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A7E7F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kOw/3B7+"
Received: by mail-wm1-x344.google.com with SMTP id p74so2815621wme.4
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kG73YssMPFpHboph8IgubAuVgxjSOuHAqxxT96cCM2Q=;
 b=kOw/3B7+sid32pB59rUZflzkjSnwP23rI6gbVyEXcR21a7bnWm2Kx/la6Hir1r3Z/k
 XyolpsAJmnUxv2wcRAuSXQ/EG9L3udHbjTh2D7NxYKZmkQoiU5zLMdtrLtXaydiTwiTE
 vMla6o/QueM+UE8coc5gOvzeT3SKVYfHGg/rbVjF86kQl9Qg20rHbkF/8axYE6hudP6W
 pE3i3V+5F29DRWsO4rcO5AubA4QMLS1tuury1DwIFVZmc9/hn2a/fCPLz8T0WyXculA9
 wMNM2GCd/m2sBA4JmgUj0Rb6IMKW8DIHS5wTAtSaflT01n/6kulKNxwtwllyUp4TL+BB
 mieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kG73YssMPFpHboph8IgubAuVgxjSOuHAqxxT96cCM2Q=;
 b=LSQlLxtgsXWaEtAyaMwU3WEtPC5j3YzsJ7vC4znNBs+6dWZ4Fq2I2VxuJv5CODTuQO
 dRwOwq82r8pY6Z0yfb6FRJwRGriOMfCNXK36q5+JkF2OoPPab3WZp5nIJpiTPeSvLhx3
 SOgBwzpCQB6+KUMsADJJ8DE4ZUaYrJ7XHg+zC3qHnnQIbiSViN0w1PG6hMt4bBXhJAdh
 k5LKsJn1iixcenxJ4KxkYgtrbkNK32jZKVRou0mVXk++5J0oMFNMJu96nZ23DyENXb2C
 01bv93VtaH7IXQScprjAU980/87BKWosXI2FPFSgd7Jj99dPSAROzVr5B+9ICht5ANER
 07WA==
X-Gm-Message-State: APjAAAVtJT7cMETgycWnMo+moGbse+aoyi9EOehCR+9Dq536NIMjCK8M
 wK2JD3Aienb4b9YWxipQZ13CexOePFy4BhYBk74=
X-Google-Smtp-Source: APXvYqx1mySRuuMcf6ImCtUwR4sdXMy95MXfkCQCRN+9owUbpXAKxVScFgRvPxIpEPbW/FiNmjurcC+CkKlR4cQ/EBs=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr28903280wmj.13.1566907775637; 
 Tue, 27 Aug 2019 05:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Aug 2019 15:09:23 +0300
Message-ID: <CAEnQRZC9+ZiEUq-X34xv0L-QV4k1_XDbnBgdu8b8Kqo7wiT7CQ@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: brian.austin@cirrus.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Paul.Handrigan@cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42xx8: Force suspend/resume during
 system suspend/resume
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

On Tue, Aug 27, 2019 at 1:15 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Use force_suspend/resume to make sure clocks are disabled/enabled
> accordingly during system suspend/resume.
>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/codecs/cs42xx8.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
> index 5b049fcdba20..94b1adb088fd 100644
> --- a/sound/soc/codecs/cs42xx8.c
> +++ b/sound/soc/codecs/cs42xx8.c
> @@ -684,6 +684,8 @@ static int cs42xx8_runtime_suspend(struct device *dev)
>  #endif
>
>  const struct dev_pm_ops cs42xx8_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>         SET_RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
>  };
>  EXPORT_SYMBOL_GPL(cs42xx8_pm);
> --
> 2.21.0
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
