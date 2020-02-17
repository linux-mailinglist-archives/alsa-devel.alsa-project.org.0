Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF3160B86
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038F0169B;
	Mon, 17 Feb 2020 08:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038F0169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581924171;
	bh=ss0MZDR/bu5HR/qkF4Ms+11ImT3EIiK9nKjzdEIdaZs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNHnm/PxjJk/69PtapA32OvNnSg5Dl+9mfqZXXn2F6zsAo/3UmGlGTNuNfDs9Hobz
	 Lwshvm4NYWF97s5sg255Lwn06ZkUdS9U3z36Pos7S7x6lemxR4+93KBk9x/xBaQdg7
	 W+4dOzwyKSR591D4yXeb7w1C47k7BGfG7H0VjeWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F036F800C4;
	Mon, 17 Feb 2020 08:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D61F80172; Mon, 17 Feb 2020 08:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E223F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E223F800B6
Received: by mail-ed1-f54.google.com with SMTP id p3so19491373edx.7
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=scxVOt7vJ8XADBjS9Kw7nULEogoDx5VlxsaehXEQC7Q=;
 b=Pjaomhwt8W9die7c8Q59v7cNcUipzKNc2o+NVpDLCk67S03jenx4I5e+AVydn2Kl0R
 rEIIjgebFJRIBE9JS/n8dhm+MqHYDJ3hzO3puaLAn/Cah/4jKAjtE0ZgR1hj/5oj+M4z
 3CTKSxpTHZczBpbbx+y5pun7NN2360kaGdoXWBux2/Kbtn0n/ARBzLuIxgZAE6stym6x
 2+1YBEEApe9vqJu2HszIbCH4dxKphRrjx7vLHJ7a0eWIFZlLQotcydAeTjuFGsFKaR7f
 6tKJ2WZSio6EUZ5+KS9YJfBZny4p9hserMbIsIifSTNLMub/DQB4iviQwpnksZhxcRY3
 B5RQ==
X-Gm-Message-State: APjAAAWgQ0JiLy6XdVvWhokx6PP68jl21WLU8IrQ6jJDXpjiq+WXzIuB
 j8fAY2uXeJId2Y3UQLdO8cU3tDOOPHA=
X-Google-Smtp-Source: APXvYqyOxETbM3wqT7iocScOs7wJ7q+NlU7U+VhaNrh+nuJ7cbMJBE9EDWg8j01PvvU9z4XtozwMOA==
X-Received: by 2002:a05:6402:3046:: with SMTP id
 bu6mr13167701edb.139.1581924059135; 
 Sun, 16 Feb 2020 23:20:59 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id ga21sm815205ejb.72.2020.02.16.23.20.58
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:20:58 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id c84so17198604wme.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:20:58 -0800 (PST)
X-Received: by 2002:a1c:7915:: with SMTP id l21mr19642112wme.112.1581924058371; 
 Sun, 16 Feb 2020 23:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-8-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-8-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:20:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v67R7ObOSnU3o400PWNtnSFouNUait9ULP_1NQs4YnDccA@mail.gmail.com>
Message-ID: <CAGb2v67R7ObOSnU3o400PWNtnSFouNUait9ULP_1NQs4YnDccA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 7/8] ASoC: sun50i-codec-analog: Enable DAPM
	for line out switch
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

On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> By including the line out mute switch in the DAPM graph, the
> Mixer/DAC inputs can be powered off when the line output is muted.
>
> The line outputs have an unusual routing scheme. The left side mute
> switch is between the source selection and the amplifier, as usual.
> The right side source selection comes *after* its amplifier (and
> after the left side amplifier), and its mute switch controls
> whichever source is currently selected. This matches the diagram in
> the SoC manual.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
