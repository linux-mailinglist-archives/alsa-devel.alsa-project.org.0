Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940E700C8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB05017FF;
	Mon, 22 Jul 2019 15:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB05017FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563801509;
	bh=DJOzXseA/A/j3axl7oMAWLtuVZbu/XMgV8aYMfMnu0s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1lIZq9WuvXSfHs9+YJ7gD2+ItPg4fDyrzHZiaaO9O2CSgW7iZ5yYLKtOMkiW6jSg
	 83Fnutzd8mF/xwT6H/QmhGmc1gDvJatqVbW0b+wXfN7/mlyz1HNI/O946wRzIa6r4x
	 bCISdUPP6tTj0CcoVF3W/l7Ni4mq5z/aghoy32/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16641F803D7;
	Mon, 22 Jul 2019 15:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36DEBF803D5; Mon, 22 Jul 2019 15:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D537F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D537F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rlLgYExD"
Received: by mail-lf1-x144.google.com with SMTP id b29so19365661lfq.1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=spLZy4EnGWitJ/v6ZKxBDhVYkllk2oMh3daO4ymlTxc=;
 b=rlLgYExDYhc6+ThDbSN2xTigWKoUnIZmbsKF2BnUjfkcr+oDqQeeGrPUcTYQxsnBMJ
 JR58cyOcZBNwVgVgp1QmOoGRT3lqZWhxTsVOv0r1/YI4DQXi8aWpfi0LoUIUeuu5B6da
 AOu/b6VOvdNulf+Fo6A4gOifl7m9/CjrCPTFXih2IcU3WA1/tPMM72U6V8QrtuJDC2a/
 fPjE5/QtI/cQn9FVdpzkTHFCbTSNeeys4uYE39Jcv2QYc9ZwqASjCPuCPfR8l3AowJuO
 9jBEEb7HzObctRWavYYCybmAHOIxxzaE8L+NaYk/Q9OX3pcpC4F8JBYZgOc5ep60rxVe
 dRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=spLZy4EnGWitJ/v6ZKxBDhVYkllk2oMh3daO4ymlTxc=;
 b=n2hLnzrqJQNjqlb3qHViJav+4p93Z1HL9juOxmX+UZoW0LHjvaiNpM/WxJ3mDJHIlK
 h7nJqdNguKHaaTRR3l5lqCiohBvx1kznOkwI27OtQRFwgmvj4kz08Bm52tW0jkymGlwo
 +QDZR0Jp5B6ZVJZWih9aI2ktJtJhyKU/c5PH/1CGdCHBt+bGffNb3J6OqW5iEir39p2I
 dQNDvmu/OXdyUJ4Qp3zX/gw9BO4kApAiEhMO91FHBbFkWoWYW714RMP9sfIjIpVAPSpz
 u9uyyKgrX3zmFXM5tCHqsTBqytzt/gVeCIK1TzeZ1WHuy1DnV9oNkSJvwKfHyBExnVRa
 I9lQ==
X-Gm-Message-State: APjAAAXWIsMEhCL/YjHUQNlOGslDTGZ8maXjER0+2Mkp6p1CNWYzhmLf
 3F8z7u+C1nxkOIWw0Zf2YS9j18oZVS4xlbjX8x2QJw==
X-Google-Smtp-Source: APXvYqybdYEIslFhP9D3LKSvaFAg1LyYZqyHefacCttpDLqzBv5w/AZxk5X3HVX8A60gqEX4vECBo3+qjY9J61whClM=
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr31150139lfg.163.1563801399138; 
 Mon, 22 Jul 2019 06:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190711002838.35363-1-cujomalainey@chromium.org>
 <20190722122208.F2A0427429D9@ypsilon.sirena.org.uk>
In-Reply-To: <20190722122208.F2A0427429D9@ypsilon.sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 22 Jul 2019 07:16:28 -0600
Message-ID: <CAOReqxjuZW8SP2JaReQNVej5=8qx7J_JfHPUAE9UhhME6_yVrg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] Applied "ASoC: rt5677: remove superfluous set" to
	the asoc tree
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

Hi Mark,

Can you please remove this patch? I made an error in my testing and
the patch should not be applied.

Curtis

On Mon, Jul 22, 2019 at 6:22 AM Mark Brown <broonie@kernel.org> wrote:
>
> The patch
>
>    ASoC: rt5677: remove superfluous set
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
> From 4dc057a786dc23fd1ed70e6bcab691c0f26daa1e Mon Sep 17 00:00:00 2001
> From: Curtis Malainey <cujomalainey@chromium.org>
> Date: Wed, 10 Jul 2019 17:28:38 -0700
> Subject: [PATCH] ASoC: rt5677: remove superfluous set
>
> We define this variable with the same value, no need to set it twice
>
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Link: https://lore.kernel.org/r/20190711002838.35363-1-cujomalainey@chromium.org
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/rt5677.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
> index c779dc3474f9..deaed5132dc9 100644
> --- a/sound/soc/codecs/rt5677.c
> +++ b/sound/soc/codecs/rt5677.c
> @@ -5098,7 +5098,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
>                         goto exit;
>                 }
>
> -               irq_fired = false;
>                 for (i = 0; i < RT5677_IRQ_NUM; i++) {
>                         if (reg_irq & rt5677_irq_descs[i].status_mask) {
>                                 irq_fired = true;
> --
> 2.20.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
