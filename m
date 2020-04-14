Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF01A70F2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 04:23:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE16169D;
	Tue, 14 Apr 2020 04:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE16169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586831034;
	bh=d6mc59AeCN9oEd35uDtwHY945NH1yteJGJynNRDgE3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbYNwKSQKW+VpxcKP1f8g1teeXf1rQRlPV5xjipLemMgrz5fkDUsNFE2zCjS9gtTp
	 0vNa2dqPXgDveWdCgl9rT+6voqVKDOCn9FVAZzZdyoeHZDrEW/nvZkCrHXclZqrSf4
	 q5lU7G4xRanJfrVzsCwD3laBcHReuArb7kUEgCxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0970F800B9;
	Tue, 14 Apr 2020 04:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 390E5F8013D; Tue, 14 Apr 2020 04:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D17F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 04:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D17F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GG1kscR7"
Received: by mail-yb1-xb41.google.com with SMTP id i2so6378452ybk.2
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 19:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awmGrwmcz5aeG6k8MhFEgBaKuoZUeZk5jIB18zmrVt8=;
 b=GG1kscR7x6EajZgB+6nk3ksaoiMBiXTRMW0RaFD4RVIzeNEG4w0De5NWOLiD4ZLDG1
 gh7sO3nE30kQm9RhUlQU2nmzKEFmx7yhpYtim9eaTvXRuoNDSKjvdZIPvkGEg5RU1yjy
 4xjPgyvrVc/mhQNNfQhayQTfJt46Qo5ykXU7RJfGw5LrK/i3oSo66RQfghLTbMgxMwzr
 TdLVAi8sOZMxaIg1oDg9vLTkiXtPed9UEulCMmWT503xsa430fas5vWruFU2s5+Mkk4n
 2QLA8SAJiaMSgRY5Yn66oRn2D6mpzmti3qOgFglKKGr5u62ckvtW6SopqvesdvS3oEPS
 bfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awmGrwmcz5aeG6k8MhFEgBaKuoZUeZk5jIB18zmrVt8=;
 b=WKAy4D+pL4o2Ho1CCoIV4fZjrVuiQL3g3Gkjr/lO5yhXRlwHLdyM9/CLiRkIX38/Rt
 UzMK8ze02KSur8ioIMt/QEE32JnKB79hb03ie85GeDkSoteKqz99cuczzSlgh5fAdEbh
 8qLRNezmkinVlLjoTpcGHTHuRWOewm58KuNqHxegS0EuspjcXdHtid2iA/0/bADrT2wX
 Ii4u/E3vy593sni7mQwYarBavPBvCV0Kz4zIx7jLH8B9+4iqb+bF2CdU8nvg+DjKl9nF
 osoN7Jjd0JGDEpNyE8/Tg3dAi6v1MC+r0B3pw0uBQy1TVBZ07vszerLOhEmqqihyAMVL
 Ht0g==
X-Gm-Message-State: AGi0PuYFUA3IwrvRksOr/y0usEpCLlpP6Ga/GaTENxdYBigygjdzqWRc
 XghYz0K5CFyY+c//vmQ0wSOenBEIXkAGWT4t8ew=
X-Google-Smtp-Source: APiQypLMHH0a+6ypkNMRaTXre5eZdgyn24IXJp/BZeN67bbx+T1wgzVcBrLvf9iDyZK21J6aJ/AflIrlpoPaR0RLk+8=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr32195235ybs.60.1586830923366; 
 Mon, 13 Apr 2020 19:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
 <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 14 Apr 2020 10:21:29 +0800
Message-ID: <CAA+D8AN8OUtTftc_So-Z0_sjWt4RXq6fr4GpSy3Xh+YbkryfpQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Apr 14, 2020 at 10:09 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Apr 14, 2020 at 08:43:07AM +0800, Shengjiu Wang wrote:
> > There is a new ASRC included in i.MX serial platform, there
> > are some common definition can be shared with each other.
> > So move the common definition to a separate header file.
> >
> > And add fsl_asrc_pair_priv and fsl_asrc_priv for
> > the variable specific for the module, which can be used
> > internally.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > +static size_t fsl_asrc_get_pair_priv_size(void)
> > +{
> > +     return sizeof(struct fsl_asrc_pair_priv);
> > +}
>
> Perhaps we haven't understood completely each other's point.
>
> Yet, would the following change work?

Should work, almost same, or do you want me to use variable to
replace function pointer?

best regards
wang shengjiu
