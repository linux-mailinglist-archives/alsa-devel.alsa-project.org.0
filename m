Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F0204D0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9AA216DA;
	Thu, 16 May 2019 13:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9AA216DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558006768;
	bh=FBF5oMM92pu3wdTiPHv/lAzvDbwqE/LcRHvm9tUs5Bg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCRl/0scZ9yo4SUK00ZxvBZc8di7YcarTRnc9zBOCuzhrNHBj7UiwmGIVUrjQeRPO
	 I1dIXDau/pZNKshdYvGuOdNVcrK2sgV9PasHZr+xaTiqDOG/1VG0XiyUWp9IxfCZWn
	 kSpeFJ5Y+/4u3/Y9BHnnqPJr2kLmYDopBQq0OIlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA625F896B6;
	Thu, 16 May 2019 13:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C0BAF896B6; Thu, 16 May 2019 13:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE8F6F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE8F6F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GAB2TByb"
Received: by mail-lj1-x243.google.com with SMTP id k8so2760601lja.8
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tXUeXWtueI/SRp2XGDGI4tujyZJgGWV3Vx6BdAbE6Tw=;
 b=GAB2TBybwnrbbzz5U5edahybkOdVxbKuvBTTOpS77XmomE3UDRw4K6CZe10rKBfmR8
 xz/yUaXuq41PR6WRwc+6ZtJ3UPU0POOUybLoNNa/74XANRIjpuuEAlTJ9l46jk9kErpj
 2+YfBHk1klTbBCtw+pGROHC3P9nfbhaKLA+ZP+lt5mtkg7fVJ73s7iGCK0EqH6podywm
 BSm8S2XF5eRoBbBmNoBF+fvGBeJLU9fV95sicaz7a86J+o332NpDNl4QMSlQ2+O568Ed
 p8KEe8qJgf2EBzSVIxAS8/P+zdlZUMYs5hMepoHfgtVKphlNL1aNcp9j1dg0TxX4Orn2
 1rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tXUeXWtueI/SRp2XGDGI4tujyZJgGWV3Vx6BdAbE6Tw=;
 b=nvh1BirORwbWv8gdqCLQqydsSRzoEi7f2xAFFeCSgngLcA0+Ahzkg3eMSvKxMM9H78
 RKJRdSh4c2N8O5+pp5AdQ3eF1zrQ4BubHwQ80CBclnGkCguX+J1eJA0ZzWeX4QxPpzn0
 B+Hyhq7fQ4Vi/C+QS2Gw/ga6R/y94inWHvOnAEVFCMVReMQiWeryP7GqmUnr0tYZTGO3
 tTIUixMurFZD7CzrV8fc01EX4kUC5LxMJjNM4cBvV0eX26F3ssDUAfDqYrYIh8KyAATm
 TMEFBxwphZRuIE20CDdq3nLUjYug0upkstCFRDBNTN/wFmDICwx7AKuhUJ7KSk91pjDo
 7Seg==
X-Gm-Message-State: APjAAAVfCfUsI0OfAZINGSowjejGMk2aWFadQK2Mgpm+MIfNKFb5TYKE
 AbtEA4D6t9Zcf4SrdsM/TIgbgfiave6oje/K4bM=
X-Google-Smtp-Source: APXvYqy4pZiMsXLPP+8UUC1PaKtH+ASVj8jh2pfOHOV5iIG7bDaF2KsjBwAoumu9NlWyONEjLzip8qU2dkymVwrFzYA=
X-Received: by 2002:a2e:2b81:: with SMTP id r1mr22051601ljr.138.1558006657987; 
 Thu, 16 May 2019 04:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <7df2d60911f6c4323c9d11b5fe5341ee31e3940c.1558006342.git.shengjiu.wang@nxp.com>
In-Reply-To: <7df2d60911f6c4323c9d11b5fe5341ee31e3940c.1558006342.git.shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 May 2019 08:37:27 -0300
Message-ID: <CAOMZO5DhbsCqO4ePKRXm=s=5Vf6rhBJgfeXKUe1w+_RRV5YWQg@mail.gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Cc: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH V4] ASoC: cs42xx8: add reset-gpios in
	binding document
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

On Thu, May 16, 2019 at 8:36 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:

>  cs42888: codec@48 {
> @@ -25,4 +30,5 @@ cs42888: codec@48 {
>         VD-supply = <&reg_audio>;
>         VLS-supply = <&reg_audio>;
>         VLC-supply = <&reg_audio>;
> +       reset-gpios = <&pca9557_b 1 1>;

 reset-gpios = <&pca9557_b 1 GPIO_ACTIVE_LOW>;  please
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
