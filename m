Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3B225CAF
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 12:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F39B1612;
	Mon, 20 Jul 2020 12:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F39B1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595241378;
	bh=1RAYPNMLe0El3wV6vSORMFVaG0k9RDajv+fSBgeCyGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgOCS4CoSQStf7w9vaWu4jw5sXBaBLqYj036g+NFKmHO1F9AEs3exXieLJPNbYB+/
	 upvj+lQdV7/OSrR7wKdxgZOJb73VIbHm/t3BqX9qlwgaZVWQh/76aOLjCWt9kTpglS
	 dnHj/AN/w9K6vejQJkrXFLjanqsofjd782YFlWNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D39F800BF;
	Mon, 20 Jul 2020 12:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A80DF800F5; Mon, 20 Jul 2020 12:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFC6F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 12:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFC6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xw1t7clZ"
Received: by mail-qv1-xf44.google.com with SMTP id e3so7092197qvo.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VKpYBbrlnZWFZ3b9/7gPTVvr7uUXN2uw4/yc1h13XyM=;
 b=Xw1t7clZzNAezWxkwn6uMU0INMdckgeJj/r5KWBOP378438MNB0l3z/9VRnhE1E2qq
 tzaKFj3rmwyD2Dwft0ESb1tjUlGoovmduHcJ7jGDN9fkY3X16C+hN7+RLDZfc+U0J3rM
 NRcFsn8ALuGmUfT8cYHONuBWuepXrWm08QgmHEouegAHcD6fBjt9YVpUxT4Xo1QoU0Up
 0m58/28f30BkP/vYkU8yKlITL5F0hl5xLUmGofmKs8boxHsL79OMmW7VPvOEzddgO+DV
 FyIcM86Z/mI1/iMd7f8YtgiF1TMy0AWxj5Mbb/YW0hDh1F6cOjktTPPke8SzVaG3tL3x
 43nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKpYBbrlnZWFZ3b9/7gPTVvr7uUXN2uw4/yc1h13XyM=;
 b=gQITwTSqNE6aY0zkqY1ij4tcJodVVlmqmfzbyPhQxkP2VW4XOazOKG8VrpzRxf/QoG
 FBmt7POjGumDrXjGpQg5SmdZ1nguOl9OT62sFGGtklmD2XhPNq+9NLK+/m4GQD3g1j1H
 vg7NsM2SWPwdkFOYNOtw1kw2BFZw+cR0N3ur2uocCMf7n8+b+7+zOWi37Db9Xk8BMDCo
 9iM+s2ZOIyd5vf5s2yTgZy6BYUKnHi93MYtN+fuxcPPoCPUfJHP/bN+rmHEtgHuWjr5O
 5m/bJ1tVpnvNDtvossnMC92m3z0t8y7ca4u0766MO8pNV799Rj60g4yrkX9/LH3aUQmb
 iMyA==
X-Gm-Message-State: AOAM532pZgIU9guHTSecZsCbOyD5q4ayGjJJR2w2TMfjLtRJ4nWcT60n
 zDIuMJx4M+x7vueIL0dGfE+wIpcfn/S7x5u8jrY=
X-Google-Smtp-Source: ABdhPJycw37x1nzlr7P53atdMWdi6e2oUYQ8kUhWmklSym5hek24o6IxjZ9bBdyZEH+X8XPvUZykq3x46DwKcA8caag=
X-Received: by 2002:a0c:eac1:: with SMTP id y1mr20806707qvp.32.1595241261541; 
 Mon, 20 Jul 2020 03:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200716232000.GA27246@Asurada-Nvidia>
 <20200717103857.31877-1-arnaud.ferraris@collabora.com>
 <20200717103857.31877-2-arnaud.ferraris@collabora.com>
In-Reply-To: <20200717103857.31877-2-arnaud.ferraris@collabora.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Jul 2020 18:34:10 +0800
Message-ID: <CAA+D8AM9S6UThwyM2vWcXBzysY+3EgnzxToyk4kQ4e9rs3ch1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ASoC: fsl_asrc: make sure the input and output
 clocks are different
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

On Fri, Jul 17, 2020 at 6:40 PM Arnaud Ferraris
<arnaud.ferraris@collabora.com> wrote:
>
> The current clock selection algorithm might select the same clock for
> both input and output when, for instance, the output sample rate is a
> multiple of the input rate.
>
> In that case, both selectable clocks will be multiples of both the input
> and output sample rates, and therefore the first of these clocks will be
> selected for both input and output, leading to miscalculation of the
> dividers for either the input or output side.
>
> Example:
>   Input uses clock A (512kHz) and has a sample rate of 8kHz
>   Output uses clock B (1024kHz) and has a sample rate of 16kHz
>
>   In this case, the algorithm will select clock A for both input and
>   output: the input divider will therefore be calculated properly
>   (512 / 8 => 64), but the output divider's value will be only half
>   the expected value (512 / 16 => 32 instead of 1024 / 16 => 64).
>
(input divider, output divider) = (64, 32) for the same clock source
(512kHz) looks no problem.  could you explain more detail why
(64, 32) can't work?


> This patch makes sure it always selects distinct input and output
> clocks.

There should be no such constraint for this IP, do you have any
evidence for we should use distinct input and output clocks?

>
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 02c81d2e34ad..de10c208d3c8 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -608,8 +608,8 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
>  {
>         struct fsl_asrc_pair_priv *pair_priv = pair->private;
>         struct asrc_config *config = pair_priv->config;
> -       int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> -       int clk_rate, clk_index;
> +       int rate[2], select_clk[2], clk_index[2]; /* Array size 2 means IN and OUT */
> +       int clk_rate;
>         int i = 0, j = 0;
>
>         rate[IN] = in_rate;
> @@ -618,11 +618,15 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
>         /* Select proper clock source for internal ratio mode */
>         for (j = 0; j < 2; j++) {
>                 for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> -                       clk_index = asrc_priv->clk_map[j][i];
> -                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> -                       /* Only match a perfect clock source with no remainder */
> +                       clk_index[j] = asrc_priv->clk_map[j][i];
> +                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index[j]]);
> +                       /*
> +                        * Only match a perfect clock source with no remainder
> +                        * and make sure the input & output clocks are different
> +                        */
>                         if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> -                           (clk_rate % rate[j]) == 0)
> +                           (clk_rate % rate[j]) == 0 &&
> +                           (j == 0 || clk_index[j] != clk_index[j - 1]))
>                                 break;
>                 }
>
> --
> 2.27.0
>
