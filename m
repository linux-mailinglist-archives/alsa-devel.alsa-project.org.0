Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 240C39E425
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 11:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E40E166B;
	Tue, 27 Aug 2019 11:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E40E166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566898045;
	bh=wpMuDVrLzaE9z8Wqk2HcZe5NoxGLsvGQwU872LWis2w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSZ4n35tl8dAM1uiBEo0ZWBfUgQF/cdH2PDPTbmv4K2RqHWtAwJ5gc40o4Bjufhqi
	 QNqwxijRdx0kjZ9cewZNATdlWzjUtbCWs5L1zTdzN6mUibJgcUuJFzgOHJTy6ArVSD
	 V+VHXv7EhE6N9a4SrDawUWRDzwH/nS6tigXIJtCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C818F802A1;
	Tue, 27 Aug 2019 11:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E441AF80274; Tue, 27 Aug 2019 11:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B136F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 11:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B136F80142
Received: by mail-ed1-f67.google.com with SMTP id h8so30470690edv.7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 02:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1Hq21GWlHfVsAHB0YA3+1WJiGcX5YVFh0QLDfo8rZM=;
 b=MgbEUnGu8vNEZaFfzHgrgJTQQ4qv5U9A6zdSsB5tJPcL5hMajjPJW/W7o+gEiWnYQ0
 EYcr+4EmcVqJHy9+K7BErEM61AIjRRwcW9uTc+w9DJjOYqO7FZ5FrjxRePxq6tsYMDUn
 swJE81IKGj5utA2yKGBZZ02iwK7fE9BuHw9oF6+rMbOnVXlUvDgra/3oq6vO/rDn5pin
 BP90tir1nq9mPyBjqkwX/m9kPZ0NzWvCwiFA5+ICohkttcMyrrPd+l/rzOHjaaC+dWpM
 2x+iT42jEy490v2q6VuNGKIq/nSZ/hxETmy1iSrDgPi94tn9RRItSZMQ7sgbLaCMCRli
 CZcg==
X-Gm-Message-State: APjAAAUyB17PbtOMY7TCezO5e9i+5xoQeJpY3ws3JZa6INO5JnMG7Jtb
 szxgQLr9pZvKgH69StaE0l/9P2OJjjM=
X-Google-Smtp-Source: APXvYqwwNjIs2b+pRMPn+IQmF+lnSH0kNsVh+n95HVSNC72txlO32wOPfphZFXyul2Tnn+KbkdOS1g==
X-Received: by 2002:aa7:da4c:: with SMTP id w12mr5402775eds.199.1566897933678; 
 Tue, 27 Aug 2019 02:25:33 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id c15sm3481682ejs.17.2019.08.27.02.25.33
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 02:25:33 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id k2so18051372wrq.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 02:25:33 -0700 (PDT)
X-Received: by 2002:adf:e941:: with SMTP id m1mr2612297wrn.279.1566897933029; 
 Tue, 27 Aug 2019 02:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <0e5b4abf06cd3202354315201c6af44caeb20236.1566242458.git-series.maxime.ripard@bootlin.com>
 <20190820174105.96899274314F@ypsilon.sirena.org.uk>
In-Reply-To: <20190820174105.96899274314F@ypsilon.sirena.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 17:25:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vzcZbXqfW27cgobpQ-AXQjb2zanqotAR0ezw+6KCdpw@mail.gmail.com>
Message-ID: <CAGb2v64vzcZbXqfW27cgobpQ-AXQjb2zanqotAR0ezw+6KCdpw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Marcus Cooper <codekipper@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix the MCLK and BCLK
 dividers on newer SoCs" to the asoc tree
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

Hi,

On Wed, Aug 21, 2019 at 1:41 AM Mark Brown <broonie@kernel.org> wrote:
>
> The patch
>
>    ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs
>
> has been applied to the asoc tree at
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
> From c1d3a921d72bd21f266ca28c15213fbe78160a4b Mon Sep 17 00:00:00 2001
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Mon, 19 Aug 2019 21:25:16 +0200
> Subject: [PATCH] ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs
>
> From: Marcus Cooper <codekipper@gmail.com>

The authorship of this patch looks to be wrong. Maybe it's a tooling issue.
I imagine it might have happened if Maxime created the patches using
`git format-patch` with his @bootlin.com address, then sent them with his
@kernel.org address, and `git send-email` swapped out the "From:" header
and prepended it to the body.

Either way the "From:" line looks odd in the commit log.

ChenYu

> The clock division dividers have changed between the older (A10/A31) and
> newer (H3, A64, etc) SoCs.
>
> While this was addressed through an offset on some SoCs, it was missing
> some dividers as well, so the support wasn't perfect. Let's introduce a
> pointer in the quirk structure for the divider calculation functions to use
> so we can have the proper range now.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> [Maxime: Fix the commit log, use a field in the quirk structure]
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> Link: https://lore.kernel.org/r/0e5b4abf06cd3202354315201c6af44caeb20236.1566242458.git-series.maxime.ripard@bootlin.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
