Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB45571230
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 08:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9CE3886;
	Tue, 12 Jul 2022 08:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9CE3886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657606734;
	bh=ix9bcsCAsQj+Va0NGRLdukXVSShcusv6YPHE7WjL9YA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdRz34Dt3Cd7aU2cEaEhFyLXidSEWsxHvI3s4E9iwuWcZrv32SLDQ6BRXGXLPRxsJ
	 uTe4UV+CZatc4cqfVy+g8yDkJei/+tFOSCsIQkKpWsyo4rSdAPXuNG1o5hMHCvm+VK
	 a5uJ+lEIhGfZLOvbL3uoOml5uA9CbRaKNn0Y4T40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48B8BF80279;
	Tue, 12 Jul 2022 08:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75425F80246; Tue, 12 Jul 2022 08:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23EF8F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 08:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EF8F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="etIBGOqV"
Received: by mail-yb1-xb36.google.com with SMTP id f73so12291773yba.10
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+tVmDDck7T/cZxiwVknHMh8X5rW+h/EefcIcAYgjjk=;
 b=etIBGOqV4zmw5qML3Li06W9MtEs0Yeu1BAM4ORmerDksekludUat/PG3Ub4MDLOKw4
 0xL8J9JIn1Y4p5H33MOw40kP/OsYyEB7R0tRINe1k9qVcp2I9dJjJrgmtcQi1XSl0wr5
 6k3nFOnYND/ywPv4P5NKwn8bGvkpIaWdRZ0no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+tVmDDck7T/cZxiwVknHMh8X5rW+h/EefcIcAYgjjk=;
 b=rNyz/pXfLiRYLiqn/CsnYjyHK8+4N2Ena0xnfU2zR83JiFWBhbnANwVf4uY00EUt8c
 EEYqxQSmCrlUkBq8QTcjltJBk5KjvSlnodTpekB0Z140F40h08L6HfmlOcqVI/QrNpMD
 fGS0+ll6wvC5WEaMvRK9kOVEHqwiaOR+IMt0tA0KhOixxksBwNIlqJQgSyMpr/waZCex
 ppklfrmdtTLqf932ioJPuP27dCmetk+zogqnTdtvFIYwxD0Ed8bJpBo5zoTPaA5BHU1Q
 65KbhQmmZ0RMXo7PvSdsZLptWUBDO/vIDNE6QrxSAotwB+++z1BdUkeXh6e4Fk581lhl
 xalg==
X-Gm-Message-State: AJIora+WBf6fBL7oCBs472tuFkn7gvwzntQBc5PCdM8P65ymsCKRNgPf
 /ybFG/fWXxy41bRnC+mCEg7LAWzM3eezIImwerSGog==
X-Google-Smtp-Source: AGRyM1uVGaCPPnWptquSDGCvLC/yQ8kQPMEDUNB5Mmj8CD6m3m9WHg7jU8Kz5JAeFeAL1W1Am77cXNzq22XT8WBft9Y=
X-Received: by 2002:a25:81c5:0:b0:66d:55b5:d250 with SMTP id
 n5-20020a2581c5000000b0066d55b5d250mr19869835ybm.501.1657606663555; Mon, 11
 Jul 2022 23:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
In-Reply-To: <20220711130522.401551-1-alexandru.elisei@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Jul 2022 14:17:32 +0800
Message-ID: <CAGXv+5HyD63MSmnNSoHX6euR2qpnqh-Fn9rdRYRYz4Ci90+w8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
To: Alexandru Elisei <alexandru.elisei@arm.com>, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 11, 2022 at 9:06 PM Alexandru Elisei
<alexandru.elisei@arm.com> wrote:
>
> Commit a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO") switched
> BCLK to GPIO functions when probing the i2s bus interface, but missed
> adding a check for when devm_pinctrl_get() returns an error.  This can lead
> to the following NULL pointer dereference on a rockpro64-v2 if there are no
> "pinctrl" properties in the i2s device tree node:
>
> [    0.658381] rockchip-i2s ff880000.i2s: failed to find i2s default state
> [    0.658993] rockchip-i2s ff880000.i2s: failed to find i2s gpio state
> [    0.660072] rockchip-i2s ff890000.i2s: failed to find i2s default state
> [    0.660670] rockchip-i2s ff890000.i2s: failed to find i2s gpio state
> [    0.661716] rockchip-i2s ff8a0000.i2s: failed to find i2s pinctrl
> [    0.662276] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000005
> [    0.663061] Mem abort info:
> [    0.663317]   ESR = 0x0000000096000004
> [    0.663658]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.664136]   SET = 0, FnV = 0
> [    0.664171] mmc2: SDHCI controller on fe330000.mmc [fe330000.mmc] using ADMA
> [    0.664409]   EA = 0, S1PTW = 0
> [    0.664415]   FSC = 0x04: level 0 translation fault
> [    0.664421] Data abort info:
> [    0.666050]   ISV = 0, ISS = 0x00000004
> [    0.666399]   CM = 0, WnR = 0
> [    0.666671] [0000000000000005] user address but active_mm is swapper
> [    0.667240] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.667742] Modules linked in:
> [    0.668028] CPU: 5 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc6 #300
> [    0.668608] Hardware name: Pine64 RockPro64 v2.0 (DT)
> [    0.669062] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.669689] pc : pinctrl_lookup_state+0x20/0xc0
> [    0.670110] lr : rockchip_i2s_probe+0x1a8/0x54c
> [    0.670527] sp : ffff80000a17bb30
> [    0.670829] x29: ffff80000a17bb30 x28: 0000000000000000 x27: ffff8000097c04c8
> [    0.671480] x26: ffff800009871060 x25: ffff800009871078 x24: ffff000001c11368
> [    0.672129] x23: ffff8000092dc850 x22: ffffffffffffffed x21: ffff8000096f7e98
> [    0.672776] x20: ffffffffffffffed x19: ffff000001d92480 x18: ffffffffffffffff
> [    0.673423] x17: 000000040044ffff x16: ffff0000f77db2d0 x15: 0764076e07690766
> [    0.674070] x14: 0720076f07740720 x13: ffff800009e129f0 x12: 000000000000038d
> [    0.674717] x11: 000000000000012f x10: ffff800009e6a9f0 x9 : ffff800009e129f0
> [    0.675364] x8 : 00000000ffffefff x7 : ffff800009e6a9f0 x6 : 80000000fffff000
> [    0.676011] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 0000000000000000
> [    0.676657] x2 : 0000000000000000 x1 : ffff8000096f7e98 x0 : ffffffffffffffed
> [    0.677304] Call trace:
> [    0.677531]  pinctrl_lookup_state+0x20/0xc0
> [    0.677914]  rockchip_i2s_probe+0x1a8/0x54c
> [    0.678297]  platform_probe+0x68/0xc0
> [    0.678638]  really_probe.part.0+0x9c/0x2ac
> [    0.679027]  __driver_probe_device+0x98/0x144
> [    0.679429]  driver_probe_device+0xac/0x140
> [    0.679814]  __driver_attach+0xf8/0x184
> [    0.680169]  bus_for_each_dev+0x70/0xd0
> [    0.680524]  driver_attach+0x24/0x30
> [    0.680856]  bus_add_driver+0x150/0x200
> [    0.681210]  driver_register+0x78/0x130
> [    0.681560]  __platform_driver_register+0x28/0x34
> [    0.681988]  rockchip_i2s_driver_init+0x1c/0x28
> [    0.682407]  do_one_initcall+0x50/0x1c0
> [    0.682760]  kernel_init_freeable+0x204/0x288
> [    0.683160]  kernel_init+0x28/0x13c
> [    0.683482]  ret_from_fork+0x10/0x20
> [    0.683816] Code: aa0003f4 a9025bf5 aa0003f6 aa0103f5 (f8418e93)
> [    0.684365] ---[ end trace 0000000000000000 ]---
> [    0.684813] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    0.685500] SMP: stopping secondary CPUs
> [    0.685995] Kernel Offset: disabled
> [    0.686310] CPU features: 0x800,00105811,00001086
> [    0.686736] Memory Limit: none
> [    0.687021] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Check that i2s->pinctrl is valid before attempting to search for the
> bclk_on and bclk_off pinctrl states.
>
> Fixes: a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>
> Full log at [1], config at [2] (pastebins expire after 6 months).
>
> I'm not familiar with this part of the kernel, I did my best to come up
> with an explanation and a fix for the panic.
>
> Read Documentation/devicetree/bindings/sound/rockchip-i2s.yaml, which has the
> definition for the i2s nodes with the same compatible string as the i2s@ff8a0000
> that is causing the panic (which is, "rockchip,rk3399-i2s"
> "rockchip,rk3066-i2s"). There's no mention there of a "pinctrl" property, maybe
> I'm reading the docs wrong, or maybe the board devicetree also needs fixing.
>
> [1] https://pastebin.com/vuRVDsKk
> [2] https://pastebin.com/3yDMF7YE
>
>  sound/soc/rockchip/rockchip_i2s.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 99a128a666fb..c9fedf6eb2e6 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -808,8 +808,11 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
>
>         i2s->bclk_ratio = 64;
>         i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
> -       if (IS_ERR(i2s->pinctrl))
> +       if (IS_ERR(i2s->pinctrl)) {
>                 dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
> +               ret = PTR_ERR(i2s->pinctrl);
> +               goto err_clk;
> +       }

This would break audio for HDMI audio, which uses an I2S interface
to feed the HDMI controller and does not need or have pinctrl, but
here you make pinctrl a requirement.

See https://lore.kernel.org/alsa-devel/20220621185747.2782-1-wens@kernel.org/
for my fix, which is merged for 5.20.

Maybe your patch (which Mark already applied) and commit a5450aba737d
("ASoC: rockchip: i2s: switch BCLK to GPIO") should just be reverted from
the for-5.19?

Mark?


Regards
ChenYu

>
>         i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
>                                    "bclk_on");
> --
> 2.37.0
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
