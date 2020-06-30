Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5B20F4D9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4798168C;
	Tue, 30 Jun 2020 14:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4798168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593520766;
	bh=bc6UmlLfqa2J7kddPF/2F8zTC7WaujZ7FVQ2SfBOxAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1lpVp0OD5GKfRSmKIEca3D8IdLAg/ZQIA8Jy6pqhpcrloJwGF/U6IKsqKguWIQdg
	 PxhEpqD3RHugKfW7Ey2vWMXzB5vnogYYgzKJCRPJaCiFilRamLkg1BQpD77KEcwy0U
	 kI4HojCILA36CaVGamlIsQ3ikETMAXTTiFG4FbNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A699F8028F;
	Tue, 30 Jun 2020 14:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5AE0F80247; Tue, 30 Jun 2020 14:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E067EF8022D
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E067EF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p+1avq+W"
Received: by mail-lj1-x244.google.com with SMTP id f5so6371143ljj.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 05:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pjZ6pxTtSr9uxy/gwY+hSwq1zDBqrweQsuZnBCKIprM=;
 b=p+1avq+WJ5MS40d96OKyqyYSxO3pkEL1n6EmXdtseZ+6YX4nfvKqMa9GJEsluECWqU
 cd+Uy1Ua1W6INq+V0RwNjtjCT2Py5m+g7rZ7r8whvJIFmOdgL1wUayXf+08iCfAqvbNw
 pyWc9kpmPofFDJRC4avDXqO6o3bt8kYMZRPsjGYXIT7Io7+4q1ZBQDSCjuEvPfeBc1L/
 UsnZWXHMdtJw+fksTbIw3xGp5ZXbb02J/igC66udsYra3yAWTT5ru/Ai54aJEGelYwxX
 MbNlevxnzE0EWj5nsBlgNvo/Zf67PxhRRvv/1l+84WKLCy9oCiyYQC1NBBH6qIa6VonX
 lHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pjZ6pxTtSr9uxy/gwY+hSwq1zDBqrweQsuZnBCKIprM=;
 b=Wo9tcANUYTIBGVKD9uM+A9G4MUs6LJYztSzm4xuNGjJAPONUIL9k8/yhMoLiAjkl7l
 XqTivnsf7i1h9A3Xg9UYx7GBBWNCQUOIKDyn+4wYrfYXzb/S6TBMSm2vRDVEvqe5aMEA
 RaT7BpIHwWC+11aLHDvJnsNinONlN9QKeK/zW8y3Nkoff5OJIZFujj4V86RSkFJnieeR
 rVBXAESMaL71aWBGHULG2IUyCEGPF5YDlEr/b7Q+2ziHZZQ63INVGlfkoE6y/q3jtkvS
 mu/ssIYbBiddeIjCwwv627G1JD6qoDHm8HMu9et3Hu6ubZlOAVKNZh+bIHgyjZ4i77r3
 Z5kw==
X-Gm-Message-State: AOAM532eAqbQw7voe7LuLz+bFZewQfLWnzmIdm/RqGrJJjysIi7swPhT
 fzUKtz3qsZwMj+bc07KmK9laAbgFlgC0I5rG7gY=
X-Google-Smtp-Source: ABdhPJyiv4tKOT0Q7iWTJRY3kT7Jhr0Mk21hdtaLMTH/M7qtgYtfElYU9Hc4r3jz/dO6EKDkddNJs9EkeqCM9iN55yc=
X-Received: by 2002:a2e:880e:: with SMTP id x14mr745594ljh.218.1593520628813; 
 Tue, 30 Jun 2020 05:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Jun 2020 09:36:57 -0300
Message-ID: <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

Hi Shengjiu,

On Mon, Jun 29, 2020 at 11:10 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> +/**

"/**" notation may confuse 'make htmldocs". Since this is a single
line comment you could do:

/* Select proper clock source for internal ratio mode */


> + * Select proper clock source for internal ratio mode
> + */
> +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> +                              struct fsl_asrc_pair *pair,
> +                              int in_rate,
> +                              int out_rate)
> +{
> +       struct fsl_asrc_pair_priv *pair_priv = pair->private;
> +       struct asrc_config *config = pair_priv->config;
> +       int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> +       int clk_rate, clk_index;
> +       int i = 0, j = 0;
> +       bool clk_sel[2];
> +
> +       rate[0] = in_rate;
> +       rate[1] = out_rate;
> +
> +       /* Select proper clock source for internal ratio mode */
> +       for (j = 0; j < 2; j++) {
> +               for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> +                       clk_index = asrc_priv->clk_map[j][i];
> +                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> +                       if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> +                           (clk_rate % rate[j]) == 0)
> +                               break;
> +               }
> +
> +               if (i == ASRC_CLK_MAP_LEN) {
> +                       select_clk[j] = OUTCLK_ASRCK1_CLK;
> +                       clk_sel[j] = false;
> +               } else {
> +                       select_clk[j] = i;
> +                       clk_sel[j] = true;
> +               }
> +       }
> +
> +       /* Switch to ideal ratio mode if there is no proper clock source */
> +       if (!clk_sel[IN] || !clk_sel[OUT])
> +               select_clk[IN] = INCLK_NONE;
> +
> +       config->inclk = select_clk[IN];
> +       config->outclk = select_clk[OUT];
> +
> +       return 0;

This new function always returns 0. Should it be converted to 'void'
type instead?

> +       ret = fsl_asrc_select_clk(asrc_priv, pair,
> +                                 config.input_sample_rate,
> +                                 config.output_sample_rate);
> +       if (ret) {
> +               dev_err(dai->dev, "fail to select clock\n");

fsl_asrc_select_clk() does not return error, so you could skip the
error checking.
