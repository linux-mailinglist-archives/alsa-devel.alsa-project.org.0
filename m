Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467CE48F1CF
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 22:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01681AC5;
	Fri, 14 Jan 2022 22:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01681AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642194175;
	bh=bW8X2Pdy9ckQYck7gRN8WUVyiUvb3vT2nCPb8e1QEWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eImXr3B/03aczJSNApu4L0FFPWd2MzwoxpQWfy1LrjzxEh7TJiVVp5e5U8s/7OqwM
	 QmvnzoxX/cNVwFMnXdoxWBep636NGPN+39ZJtrj5wKBKo2n1huEF6XHepyEb13Q38M
	 51q8j14FAO3cGKn7mZI1V13wmLPH8nsDVBYr8Jms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC4BF80310;
	Fri, 14 Jan 2022 22:01:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F289CF8030F; Fri, 14 Jan 2022 22:01:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D2BF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 22:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D2BF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="M2yojZLr"
Received: by mail-ot1-x335.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso11536564otd.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 13:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ev8VAWLABgcwjAWOJiwrx2eFMwjFEQ1Ark3f35TvFjs=;
 b=M2yojZLr84nstQZUzNRXprG2/FlU5DJXCa/4lDGpMbgAipBAIr2iB5N9qqsMfwqQkT
 g4yO681gHnyAaJL2H39tZR29z9AG/zWpTNG5WQvh3V4qvQUnEZJgbHJLq89a6QFbmj7U
 T13OJuE02K3CvAEpRN/RzVBWxyp6maN+0PkJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev8VAWLABgcwjAWOJiwrx2eFMwjFEQ1Ark3f35TvFjs=;
 b=lAgcJHJuehoJ0hLsznlyT/ZLZJhpxU29eVdpPTfsoqRVSzglxtoO5NJmuzmVle+woi
 0osrdEfhPS9BiEMwdUeZ5KpSW2JfYNFGQo0cDlLtNfvQMgqp/HukQJSrlCx8Mx+4+qmu
 nCYsCOthUfGFrMaROkBRASwXNXPvLw0Z+EEMy789WUg/PWOwm6+EGt6MhJ3tkgCB05Td
 s70zjzKQx/mpxyK0jgQdDMOskCCoVKKWz58oYPKJNmFWdSCum8txx7d+luqCc9Ks2tgA
 Dyoc4TlZrUBcGYAAzLXwoJyxuQ4q5N8Uer1Nk0f7R+qZBFKZJ+aJ64Os7QhFKVt7wJIg
 /pvg==
X-Gm-Message-State: AOAM533bS4KjpwrNfxBIBLJaJ+BO0NvjrJI8iezkuqMniU8RemPJHNAm
 8/Onrlmt17JjINwsUf5TKtFXsYhiYVPG8w==
X-Google-Smtp-Source: ABdhPJxrtZK+iyjOqyyWqYdSc0u1FSwCLI8tiNYuwecPZRxRXHfxOKHFZBhDfWFHkZ7GBTOoBxA5VQ==
X-Received: by 2002:a9d:63c3:: with SMTP id e3mr4702374otl.30.1642194098316;
 Fri, 14 Jan 2022 13:01:38 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id v12sm263887otk.43.2022.01.14.13.01.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 13:01:36 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id
 g1-20020a9d6481000000b00592d01f2b6eso7451327otl.5
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 13:01:36 -0800 (PST)
X-Received: by 2002:a9d:5908:: with SMTP id t8mr7723553oth.186.1642194095619; 
 Fri, 14 Jan 2022 13:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20220114201652.3875838-1-briannorris@chromium.org>
 <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
In-Reply-To: <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 14 Jan 2022 13:01:22 -0800
X-Gmail-Original-Message-ID: <CA+ASDXMO3sPta-vhMCqAPRFFkNa-nmY+wK6PXJaSUEXBHETG+A@mail.gmail.com>
Message-ID: <CA+ASDXMO3sPta-vhMCqAPRFFkNa-nmY+wK6PXJaSUEXBHETG+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF
 output
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Sorry to send a self-reply so quickly, but I noticed an error and want
to make sure this doesn't get merged _too_ quickly before I get to
send a revision! See below:

On Fri, Jan 14, 2022 at 12:17 PM Brian Norris <briannorris@chromium.org> wrote:
>
> Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> switched the platform to SPDIF, but we didn't fix up the device tree.
>
> Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 45a5ae5d2027..21ec073f4d51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi

> +&spdif {
> +       status = "okay";

I need to fix up the pinctrl settings here. rk3399.dtsi has a default
that is incorrect. That's OK for several variants (Kevin and Bob,
where the pin is actually unconnected), but it breaks Scarlet (where
the pin in question is actually connected to something else).

I'll send a v2 after waiting a bit, in case there are other comments
worth addressing at the same time.

Brian

> +};
