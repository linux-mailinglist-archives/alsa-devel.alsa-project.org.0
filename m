Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073A490313
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 08:46:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3B0177F;
	Mon, 17 Jan 2022 08:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3B0177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642405565;
	bh=JxYgoPbkndzvmKJRNxA42LNvG043BEkPzvQ8KZ9Km0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMyrReayBHovGRv+1a1Vt30bFXpotwPPhuwisV8Vw05n20vq/nB+vvlTiGDSMjkO3
	 PWKe4q3w1IjBnQdUu+GyM4x7yP7ZFuHMONI+W93R4pi2oq69XlJwauW/TmuokOPCCq
	 Oz6O/uYV5hCsW5HKAoAXivpWbMCFH5IUjJjM+21o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D256F80254;
	Mon, 17 Jan 2022 08:45:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F8CFF80249; Mon, 17 Jan 2022 08:44:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99329F80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 08:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99329F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KOLLcV/F"
Received: by mail-lf1-x136.google.com with SMTP id br17so54307958lfb.6
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QF777/sKyHmB6kHdk8pAKes+SVv1gG+ocuwj9sgpRQ=;
 b=KOLLcV/F7XHmTeu4hItqu7+3uEtWlS6N+dsCP614S1MOSzmMSxoYjGpur5i1Y0f5of
 6R0ZuL1Gz5Mg1jiAkXKtDUZCFLosWZiLjo9xhfp6ovoAfvs4Cl/WPuvWvhJW5K/UOhW4
 ++Fvm3jtJK8eWY40Gfmu6WzYuye6hLY8yTocY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QF777/sKyHmB6kHdk8pAKes+SVv1gG+ocuwj9sgpRQ=;
 b=4q/5umVgWvYPN2BHs3CPwFN0Rumb7bshgvdLMe+5weaMP6fTmMZQ8wnu2AxN/QhMzL
 S1xnx73FXg7I2dA2d17X3DRihrUW2oGGDj5SLSVdaIlDQw7/64zh+ZJzNYhEP+PQLEPT
 WGJOABtnqMM8HTEbPBj3aL22r7jpcHPDeiAsNDrYH1Q5DEHpgFQYS8C1wEu6hyL5HNKX
 szS3qOh+pnAtusH3tWTqbUqLgclxTMtFp5y6jPVEwUVh3NqM1tfWNlmTDLRDQNWTv2VA
 rVe/9+raX6FquXOZgK4bvVmfl1w50hm2WPlA2ZpW34DrLQN2lIefO3L3mBFGotL1tBNi
 utNw==
X-Gm-Message-State: AOAM531haV6PL19vIeImKEQQ4OaZIB5mby1ICaXIPgcjErS+RykV3vq3
 OwlF9ht+UPaGpjztGu3CSX0k75cxfGRsVnGGEuWKaA==
X-Google-Smtp-Source: ABdhPJy2y5w2Mgw1aXOAzh5xS6yKz737iKCVZw+kmTNKVPku08/RsSvDn73bBL7Kehh87ZNxsL8F9iFaH25KR8AyLpk=
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr3530683ljp.201.1642405488740; 
 Sun, 16 Jan 2022 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
In-Reply-To: <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 15:44:37 +0800
Message-ID: <CAGXv+5H0-dM28YQj_orS1_14NLcJve8VtO6oLcBiRpJFjaf5KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to
 SPDIF output
To: Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> switched the platform to SPDIF, but we didn't fix up the device tree.
>
> Drop the pinctrl settings, because the 'spdif_bus' pins are either:
>  * unused (on kevin, bob), so the settings is ~harmless
>  * used by a different function (on scarlet), which causes probe
>    failures (!!)

I suppose that means the default pinctrl should be dropped? Or maybe this
use case is the outlier. Up to Heiko?

> Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
