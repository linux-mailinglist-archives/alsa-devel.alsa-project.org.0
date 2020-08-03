Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D33239D5F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 04:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8AF31669;
	Mon,  3 Aug 2020 04:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8AF31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596420543;
	bh=CV467UfGisEu6prdIxKqHjHh6NAObZLby17uWScVW/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fm3iUeWPAbubzL3Fnt93nL5BLQ9UzwlX4E/lBRxUQh1UXKkw4G6dJIWjK4i00nz/m
	 iWuHmjESHwouP1RP/kjjUsqCREObKq9cUzi2ZcyNaENG0CtLiqtDG6/7cWINp899ap
	 3c3bYS1RwHFUWNzCPJeZAkoL2QKEOHTeabI3ewvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FF0F80234;
	Mon,  3 Aug 2020 04:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 860E0F80218; Mon,  3 Aug 2020 04:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4EFF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 04:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E4EFF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="auQoPZSR"
Received: by mail-qk1-x742.google.com with SMTP id l64so27131714qkb.8
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 19:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5Fjctdm+14XYGV7/o/ih8xd8x5Rf6Wf7Ol2ZBz9Npo=;
 b=auQoPZSRQ2XBQSbvMFKhVymOYnmqQdYyc8Xf9DXx/W2IHrItoyvjaUM6P0/+9+lALd
 yrY2NSLeyBinulthHAtRyf8kMKRIkyHy0v9toizhLMyFKah/afa1SCbMPWe5RbCIQJsR
 XvFtnlaGfTXix79UEwNBLAX/E8HNgIsL/LG7fzk/g9Y1wjVaeygXnMWr2NnWwwK6fS2B
 dBTgBblHljIOIYaHdWNhGOUnfyluQ869djs5ufVnVJTEDYB0SNYnYT81W/b831dPnvhM
 ngwnfjDCz0UKa3n1tG4LznQNC+hfhC47yPh0BqPNu/S45SZeyjl31+XBC5tEBvtYhhrT
 3qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5Fjctdm+14XYGV7/o/ih8xd8x5Rf6Wf7Ol2ZBz9Npo=;
 b=AXAJdDMLoEJX6gAzRpIg1sLTZSfzxgbp13oyx4usTolf7CcDlUMs3XUwkml+bSULJ6
 ArOvHSjWoUfnShPXsIJD2PiZMf/x9nVYvETcpmtJO1snv22RfAxSdaxRTAP8191KFh6n
 T0sz3y34BweXVaINWA/VirXKYqBGZXo2pr2THi6yl+IrR3mWuZ6H+FQZYE++AExi4xZZ
 de9h0KNQIUthWOTLQI87Ma36o5lsTgNw31smIJYBqdeUon+KezDURYYTRs2i7LfHtj7B
 yX010tcvMGsS9M83aQXpJ8TJvoDdW6yNSLD9eO7lAr4SL75RnJMAKWPMM/kVtwqSmsoB
 5fbw==
X-Gm-Message-State: AOAM531EJTM4T2t8gi9rAu9q2vbTEqRpXnCiLGrF9BT/Tj0igRFwUPhr
 HNbCZOrobqQ/dz+kzf1r/a5orXGqNfWvH0ZI1LU=
X-Google-Smtp-Source: ABdhPJw1YQpdGRnsYDGw1HuvJycocvJdDPc8unhwjyHA4KqpzDo+aWjD5gQtyD9BE2ZlWIJXjPfDFebEMYH2H17oiG8=
X-Received: by 2002:a05:620a:150f:: with SMTP id
 i15mr14354323qkk.152.1596420437060; 
 Sun, 02 Aug 2020 19:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200717135959.19212-1-festevam@gmail.com>
In-Reply-To: <20200717135959.19212-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 3 Aug 2020 10:07:06 +0800
Message-ID: <CAA+D8AM8EKowXs_0nyNKMa0odyEAF=Sgu8y2n48pGFnEbE0Mpg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Hi Fabio, Mark

On Fri, Jul 17, 2020 at 10:02 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> According to the WM8962 datasheet, there is no register at address 0x200.
>
> WM8962_GPIO_BASE is just a base address for the GPIO registers and not a
> real register, so remove it from wm8962_readable_register().
>
> Also, Register 515 (WM8962_GPIO_BASE + 3) does not exist, so skip
> its access.
>
> This fixes the following errors:
>
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi,
>
> There is still one more soc_component_read_no_lock error left on register 48.
>
> I can get rid of it with the below change:
>
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -151,6 +151,7 @@ static const struct reg_default wm8962_reg[] = {
>         { 40, 0x0000 },   /* R40    - SPKOUTL volume */
>         { 41, 0x0000 },   /* R41    - SPKOUTR volume */
>
> +       { 48, 0x0000 },   /* R48    - Additional control(4) */
>         { 49, 0x0010 },   /* R49    - Class D Control 1 */
>         { 51, 0x0003 },   /* R51    - Class D Control 2 */
>
> @@ -841,7 +842,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
>         case WM8962_SPKOUTL_VOLUME:
>         case WM8962_SPKOUTR_VOLUME:
>         case WM8962_THERMAL_SHUTDOWN_STATUS:
> -       case WM8962_ADDITIONAL_CONTROL_4:

WM8962_ADDITIONAL_CONTROL_4 should not be removed
from the readable registers,  after this change, there is distortion
on output sound. but this patch has been merged.

"[PATCH RESEND] ASoC: wm8962: Do not access WM8962_GPIO_BASE"
that patch is correct.

best regards
wang shengjiu

wang shengjiu


>         case WM8962_CLASS_D_CONTROL_1:
>         case WM8962_CLASS_D_CONTROL_2:
>         case WM8962_CLOCKING_4:
>
> I haven't submitted it yet because I don't know if this is the correct
> approach.
>
> Please advise.
>
> Thanks
>
>  sound/soc/codecs/wm8962.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index df8cdc71357d..8159a3866cde 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -956,7 +956,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
>         case WM8962_EQ39:
>         case WM8962_EQ40:
>         case WM8962_EQ41:
> -       case WM8962_GPIO_BASE:
>         case WM8962_GPIO_2:
>         case WM8962_GPIO_3:
>         case WM8962_GPIO_5:
> @@ -3437,7 +3436,13 @@ static int wm8962_probe(struct snd_soc_component *component)
>         /* Save boards having to disable DMIC when not in use */
>         dmicclk = false;
>         dmicdat = false;
> -       for (i = 0; i < WM8962_MAX_GPIO; i++) {
> +       for (i = 1; i < WM8962_MAX_GPIO; i++) {
> +               /*
> +                * Register 515 (WM8962_GPIO_BASE + 3) does not exist,
> +                * so skip its access
> +                */
> +               if (i == 3)
> +                       continue;
>                 switch (snd_soc_component_read(component, WM8962_GPIO_BASE + i)
>                         & WM8962_GP2_FN_MASK) {
>                 case WM8962_GPIO_FN_DMICCLK:
> --
> 2.17.1
>
