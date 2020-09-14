Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155E268997
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 12:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB801686;
	Mon, 14 Sep 2020 12:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB801686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600080551;
	bh=2C3L4m6JqJ0nZHVMbLFTQl6O6Q77c7uYhw5iz1pa3p8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxIDnL/dqRtIWcGEaNaF9jiRfp0POlUUaZ1yu4x5QZcbDM0idQ83kuH7813YKj5tM
	 pnO2lrP5q6jUF1BOEaQ8S9LZEyK4eYTGBSGew5fINTsiG41Sc4KB/G+3xvsIxNsf2A
	 5a4DDXmWjPAK3cpZaiuL/NP2IdVxqo587Rsreoz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE1BF800F1;
	Mon, 14 Sep 2020 12:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E2BF8015A; Mon, 14 Sep 2020 12:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7510F800F1
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 12:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7510F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X/Y6K+/P"
Received: by mail-qk1-x742.google.com with SMTP id o16so16317644qkj.10
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZH/jMrnhxDGa2Hx9c9vkwQ/mFENngwhEAvrQNpRWk8=;
 b=X/Y6K+/Px0NX64zhrgpov07rhAb/tILbtnASBoeej1aI5ScBxpo/mnlgjj7vuYarQ4
 y6Qkv0cYAUFZ9xB2u37kJqwQXa5NywisM6th3uUySuMR8Nw34d2/DVrq7eF+V01xN1vW
 3jPnRsqB3QIieaSp2g/iC1jpElLi8cWI6e5G13o0gLY5NVoTHt3Jqj/u3YEPH+c70t7N
 55mdYrppINs2ssqSaGPTwIVE/SHkI3atkB0Pl9ThjOf4FTg5K+WQlb58tPb+OMomCfPF
 Tl0jNND0MoBQAwWdUr2JRQXj55oxaFg3B99WKXRFDxpW8kxuo3qcgmI+tCe7KvfeZU15
 lxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZH/jMrnhxDGa2Hx9c9vkwQ/mFENngwhEAvrQNpRWk8=;
 b=uhqsfwrwPYCt0MhP81UMsIwLLsremT66bgDf3BHZ4GUpJUtaotrjdbPWShclTti2ET
 RMSWx8Z50+GSdq5gfp+7Uw3n1gN/cjM0CidZvswq79x2kS5egDvEQnfuBr/gdS0HHbP2
 QMceJnB1ymtysEw8HzhLAcIg/SvPRDg/tCbgq9b9+oFRZ4KgiZBD5ik8U7ySa8foQ4Vy
 Xh9eSPgMFdkfF4NGs2DzPCIkTi9AkGR8VHjupmFMknMtHUifAm8pxEF27Hl1uLb3o92j
 /8TMAnRaEtjflck02cU3FYqVedDGeQMC3erXpX9EDnaWjX0LRQ/2CMXHnbAZD5EC9fqr
 b1rA==
X-Gm-Message-State: AOAM532II0QLmFx0tdcBNFih8mAWzoKuWudGI7SNNpGP4ZnowDqCtvuu
 sFkelCvkKJ3zZOzdImKc5EksJ2DY+XEMVVs6XeI=
X-Google-Smtp-Source: ABdhPJzpfag3UOMHPurYcykEgT1/WEh/BxCPmhjQDi42pmbr6hedv9Uzlg/KKTAbj2ctZhjEMjMmU0kre6J17dYlBlI=
X-Received: by 2002:ae9:eb57:: with SMTP id b84mr12199593qkg.450.1600080440994; 
 Mon, 14 Sep 2020 03:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200911083048.29055-1-shengjiu.wang@nxp.com>
 <20200911104042.GC4895@sirena.org.uk>
In-Reply-To: <20200911104042.GC4895@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 14 Sep 2020 18:47:10 +0800
Message-ID: <CAA+D8APvRMXkrYPdGd7H1+hj8AFP7=nvZ0QbpnH8o52-sh50GQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: ak4458: Add DSD support for ak4458 and ak4497
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

Hi Mark

On Fri, Sep 11, 2020 at 6:43 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 11, 2020 at 04:30:48PM +0800, Shengjiu Wang wrote:
>
> > Add a new kcontrol for ak4497 codec for ak4497 has a specific
> > pin selection.
>
> What exactly is this pin selection about - is it something that will
> change at runtime or should it be configured by the board in the DT?

It is to select which pin group is used for DSD. it won't be changed
at runtime.  So do you think it is better configured by DT?

best regards
wang shengjiu
