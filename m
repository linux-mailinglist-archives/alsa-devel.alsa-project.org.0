Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F108A20F5A5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 15:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762501695;
	Tue, 30 Jun 2020 15:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762501695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593523981;
	bh=1Kk79Q52cAIO65q0azqDxKHEsMTAHPfL86wQno0CVbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuVWuYkJib3HTKOcr1XUtI84p146c/DxzLP7guTKr5lD2G5HD9jDJdQQOjxr/heBc
	 Co0sjcv8b3Xi8869Zshw5arHX1i3u9kYtUvOqdnumgpcAxz9tE6D9lOmp37Lvai5Yc
	 cG60pw6BjS9ydu1zlg1xQgMgYdPCzk128DXEg5HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A93F8022D;
	Tue, 30 Jun 2020 15:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45BFDF801F2; Tue, 30 Jun 2020 15:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4271F8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 15:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4271F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uewoGiRO"
Received: by mail-qt1-x843.google.com with SMTP id q22so9005564qtl.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GrXmMzhrfpzqEnud4K6uwivgEJVrHc8/GZLkP2z6bGw=;
 b=uewoGiROevRWGxnXkAJqkTKhBwCX3F01qbv8NnE285I74F2oy/ioesvxP5bb2T6UyH
 tK4BUrjPZkT3l4FbvbPaBf+QFdlQHVs49OU+NBHS5cw7kQdRDjj8TN+6Gadcxk8Etx8Y
 mITwoEduSsKLQKCp7zgxCWsrBXbxgsqL/mf3ojHw1E7V9C9dC+UNfLld+VnHi6emvQUr
 zrJR18Di74bbcPB1YeeSAbCaT63eDCDQfdtc9W1jY8beAKws1KKSVXXJJU+SI/OlHNan
 3jNsvQruSMsuQm29+GuAeqJv/nsrMBVdIqQNzT9jhXOL4G4G/0y50BvIVFp5xgTTz6QO
 ORbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrXmMzhrfpzqEnud4K6uwivgEJVrHc8/GZLkP2z6bGw=;
 b=fkuXhL6qFy6Ohx8U9ux8ngw/8ITvbwZd8oLgFORIanSVvCJg5qeDeFBFVkvIblrirC
 4x21AZK2Vcf/M2zdb9mVphzAtYqysbzb4z9BJwAoutJ8mQ11Te0kTe0zIf9dxq9+ySho
 Lm7Zv8rYFf5U9lGGZrMCUYK4MbZdoaf4YBsZolYRtFrNCmQM7YuCfwUU7+jIO0CqmTlL
 sMI3qWeolyYJv4GvHvmNn0GbJ/pC4Mta8Ulc4E87MKdTgjqq1C5Y8N3/GwDwpO+rYN5c
 K9Bq2z8Co+3Tjew5P/5AbFaSTya3gHzlF/GyEUFpP5rF0FLQq14nGjSPmTntmIAnfrDq
 8Q3g==
X-Gm-Message-State: AOAM530M3R7PtUuiQGh+/AICZ5dkJiFrWJqH5BPJDhO8p7kEznSUuF+u
 NEzNYrQTnM7ZY0+s52rTZ6WHTw4twUZ30gK+X3c=
X-Google-Smtp-Source: ABdhPJzbw0kxobiFSnBJYHLfEBJRiSlARc+7whjl3exLQbRiQRZccm04A+6k1vp0Q3HVYgqQUwCYSu/yQFTxlTOddSo=
X-Received: by 2002:ac8:4316:: with SMTP id z22mr20775262qtm.121.1593523867006; 
 Tue, 30 Jun 2020 06:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
In-Reply-To: <CAOMZO5DRv4jkHsCkAmwV4BC1tO3O1nNdZgctMcorgK0WCA86tw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 30 Jun 2020 21:30:55 +0800
Message-ID: <CAA+D8AO5iGZjJ8MHhG=zfyu+N5JO0PnvcHYY+3BEY0Lz5xyxKg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On Tue, Jun 30, 2020 at 8:38 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Jun 29, 2020 at 11:10 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > +/**
>
> "/**" notation may confuse 'make htmldocs". Since this is a single
> line comment you could do:
>
> /* Select proper clock source for internal ratio mode */
>
>
> > + * Select proper clock source for internal ratio mode
> > + */
> > +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> > +                              struct fsl_asrc_pair *pair,
> > +                              int in_rate,
> > +                              int out_rate)
> > +{
> > +       struct fsl_asrc_pair_priv *pair_priv = pair->private;
> > +       struct asrc_config *config = pair_priv->config;
> > +       int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> > +       int clk_rate, clk_index;
> > +       int i = 0, j = 0;
> > +       bool clk_sel[2];
> > +
> > +       rate[0] = in_rate;
> > +       rate[1] = out_rate;
> > +
> > +       /* Select proper clock source for internal ratio mode */
> > +       for (j = 0; j < 2; j++) {
> > +               for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> > +                       clk_index = asrc_priv->clk_map[j][i];
> > +                       clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
> > +                       if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> > +                           (clk_rate % rate[j]) == 0)
> > +                               break;
> > +               }
> > +
> > +               if (i == ASRC_CLK_MAP_LEN) {
> > +                       select_clk[j] = OUTCLK_ASRCK1_CLK;
> > +                       clk_sel[j] = false;
> > +               } else {
> > +                       select_clk[j] = i;
> > +                       clk_sel[j] = true;
> > +               }
> > +       }
> > +
> > +       /* Switch to ideal ratio mode if there is no proper clock source */
> > +       if (!clk_sel[IN] || !clk_sel[OUT])
> > +               select_clk[IN] = INCLK_NONE;
> > +
> > +       config->inclk = select_clk[IN];
> > +       config->outclk = select_clk[OUT];
> > +
> > +       return 0;
>
> This new function always returns 0. Should it be converted to 'void'
> type instead?
>
> > +       ret = fsl_asrc_select_clk(asrc_priv, pair,
> > +                                 config.input_sample_rate,
> > +                                 config.output_sample_rate);
> > +       if (ret) {
> > +               dev_err(dai->dev, "fail to select clock\n");
>
> fsl_asrc_select_clk() does not return error, so you could skip the
> error checking.

ok, will update the patch

best regards
wang shengjiu
