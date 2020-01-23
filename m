Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8517146B63
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 15:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABF61670;
	Thu, 23 Jan 2020 15:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABF61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579789962;
	bh=4imz5D1cUo3H8/dJUmVWhP1A0ua5yoKWvYdT6Pskun4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVg2wNI/FqGhu3nq0CPzAaM+7SpJ0CITACwIw+fOm74m4yMoAMwn4/swxWB+8nZl+
	 i1GMysKuMjtID77KAPICFXeq8BEoYPWnHp/E2DhvpuUvSH/IG9BPPq3hdkemaJmegr
	 nzVuTU/2iDjpMh8cwIliegZo6K8vuWMbRW3FO7I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B26A4F80112;
	Thu, 23 Jan 2020 15:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C0FF801D9; Thu, 23 Jan 2020 15:30:51 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id BF75EF80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 15:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF75EF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="h0QkYri9"
Received: by mail-io1-xd42.google.com with SMTP id h8so3163443iob.2
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRpZc2K8rtySt0g/Uf8aZHkLQ6/PNDol3SnEb8AWinM=;
 b=h0QkYri9Yp7KyFw2sOYrAifNEyLvX5ywLuinybzXcIUOmd4e1uZBvsVyzisS86YZO7
 OgQstHaMhtJEOXG9MPrKD9NY9n2aCYvR6l+kPDQzy3XFRmLFGiPSWRlYOenRMkXpqyu8
 qZpAdmyLek4GTQWSQCQJi7/V/yWmflq1KpLceyUgd15LQH6zb+cxAlmX26JxuM89M9bY
 ahysNYOoybucdUTaqxWWfuHfkMzqMtGcF+ZnZ+g8jUYW+Jfvwj3kt654o2gOIysbm7kM
 IUZQMMNYeLOK99R1l4OjYrBKnvgeSk7Mjvk1AfklqkDqSCAVJfsLPllunCf3Uz7NTcXs
 oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRpZc2K8rtySt0g/Uf8aZHkLQ6/PNDol3SnEb8AWinM=;
 b=feCvOSdKtmE5lbQTtEOJGmv476ak2H2tV9lxAueNkDPToC1zf5zW5ArIsiYKADOK0o
 6atvoyfkExiaIAf6QYDLPS8HZjMtb9bGGgF16Oq9joLt9juerelzXj24nz+zE/uhwhS+
 yz30D0WVD/vCRvOPQpbqlb+DQTSAqHoGfg+0GHwrE3aKPFZyL9PyZkveTINwjHdKxDvt
 AtI2dJ/mV5eL73yazwa926lcK+BxEabDxHB/NGP7QB/WSrUft+7qkrmSi1G9FdgyLKfC
 vWgMCRcRI1fn9bKRGNEqEK8GD51pcLRmekC8bTGdGy5kTBPT/BBkNBfxqI/scFmbnOmX
 HEcQ==
X-Gm-Message-State: APjAAAWU3KF4CkjN6pr6AOMdflgqcJXJAFEj2hwaAoWKPv11qxiAiyS4
 GMhFgxiXwNk6yS0MsC2oKdcqGXB9bPaEEgi6q0Jj2Q==
X-Google-Smtp-Source: APXvYqwSf3MBFy40L9z7Lsg8cTAKdWiFqdm9ffUU+sKkZ74cwURCcHJaChpJcdQvwur/o0JvjpEI0xQyxnEzylJxsC0=
X-Received: by 2002:a5d:8989:: with SMTP id m9mr11378201iol.118.1579789845058; 
 Thu, 23 Jan 2020 06:30:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1@eucas1p1.samsung.com>
 <20200123134046.9769-1-m.szyprowski@samsung.com>
In-Reply-To: <20200123134046.9769-1-m.szyprowski@samsung.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 23 Jan 2020 22:30:33 +0800
Message-ID: <CA+Px+wUHzCixCh7JYu=Reqwx=D+-4aV9Mi8jGzxKYV9LGjjxvA@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98090: silence lockdep warning
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

On Thu, Jan 23, 2020 at 9:41 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Fixes: 08df0d9a00f7 ("ASoC: max98090: revert "ASoC: max98090: fix lockdep warning"")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Thanks for fixing this up.  I guess I can't see the lockdep warning
messages because my environment is based on v4.4...anyway, thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
