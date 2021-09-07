Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6F40224D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 04:45:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B72172F;
	Tue,  7 Sep 2021 04:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B72172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630982703;
	bh=wl5Df63sGQWY19UtPTWqLV4WCYugqDPR1Bw6pBH8Kfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwVLCMyVfGP1Paxh2+fAj+JYqvnS32bTqPDX3bbTdhBLQ1IPo5VYHhZYQYgb4TKRi
	 +COYyUx06UsUu4HjQEkOrapN9GLP3bkPJYdD2Q9yNedGvWB6HENGGWE2DR5epkIHin
	 qCYxigVOR1pk7/Ik/R6OEddXNbL7gD2D8vDuq7GA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A20F80253;
	Tue,  7 Sep 2021 04:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 886E3F80224; Tue,  7 Sep 2021 04:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76ACDF800C7
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 04:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76ACDF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pmo+uYbb"
Received: by mail-qv1-xf2a.google.com with SMTP id z2so4966191qvl.10
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q8EAvjumu/OJAeJcXbA7H2hzcYUuPTK9t0l5alooUiY=;
 b=Pmo+uYbbkBqdBVNpqse5shcoez2d/H1Qcdv6h/Vy8RLiSqPrt8ejRjpujP6T4rMWVF
 nEHi0dy/D8Lh6jma63/OfIqutDyThbpRrGfGBDeYn2EziRF76UZ0vJwEtdvXsFaIedOU
 5/7HSqX1DusB+O1PybFEHlRET0OpfZqdnUjZRSXKbOaHTl71kmakb0Db4Xk3Ag/uotCK
 EsieL1LsCU4XtvjH/axVR/XfGyr68lBQ+SyJR0Ibp3l+odmIUi4leYeW5V6R0+nTTRhm
 tuP220jYFGk/ksKx0KA8KsvNZbO3lLUNu5bLE4wcIQ2HNA3NlXQhG4f1SRYueNRTagEh
 IE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8EAvjumu/OJAeJcXbA7H2hzcYUuPTK9t0l5alooUiY=;
 b=fmu3798jNUoKvKjpdXHdr6CJyREbw0PKyCEvNkgVovOw5wa7fX887IZf03fBLJINE1
 J0jQ1hoygrhLUgRWIO8yZi8MuVBX4icYff+QU/FuUFkuE2HXUmyUK1jrIKZDwOVpeTML
 eiMeaGzi+8RhLMwc6iy6rmySNvDqr9I4Ivlw/7VK29ffvFSm0HPCClp1ZIC7KZKYrRmK
 XiUHB2OEYg2HCUjy02OUYjbL50ldlTYpuBPA2/f3z+LjJb1aKyxuAa0Fzy5QFRzn8FKU
 ySlVwH+JQGbOCqBARtkCd3dfLFwWr5TO277feHda85f6ng1lQ50o+eQKAjRnjhADxQNj
 CUFg==
X-Gm-Message-State: AOAM530Ha8BJdgzXBCLHlojqWBcT/WgNuTGSdQ5G32EsD+YP4KPuR/KT
 KMg+0Sj5YRHs+whVvkP1L0NcfgyR8uiRLxegD1M=
X-Google-Smtp-Source: ABdhPJyjPbrX3ue83Z7GFZ6Rrf6Te85hNnUz2Ud9JAzgWqPZ2jaz9QxhFZQk5FOxkPsinhqn+KuRgte7q2aYk1iO95g=
X-Received: by 2002:a05:6214:11e5:: with SMTP id
 e5mr1131874qvu.55.1630982616853; 
 Mon, 06 Sep 2021 19:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
 <20210906114701.GC4309@sirena.org.uk>
In-Reply-To: <20210906114701.GC4309@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Sep 2021 10:43:26 +0800
Message-ID: <CAA+D8APjyq74FECmH6ZzyVKHOz6MEV0bt+D4-Xkfc-6C5n9hZg@mail.gmail.com>
Subject: Re: [PATCH for-5.15 0/5] ASoC: fsl: register platform component
 before registering cpu dai
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Mon, Sep 6, 2021 at 7:48 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 03, 2021 at 06:30:01PM +0800, Shengjiu Wang wrote:
>
> > There is no defer probe when adding platform component to
> > snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()
>
> ...
>
> > So if the platform component is not ready at that time, then the
> > sound card still registered successfully, but platform component
> > is empty, the sound card can't be used.
>
> This sounds like a bug which should be fixed there?

It is hard.

In cpu dai driver we always register two components, one is for
cpu dai, another is for platform, so for sound card platform and
cpu share the same node.

        /* Find PLATFORM from registered PLATFORMs */
        for_each_link_platforms(dai_link, i, platform) {
                for_each_component(component) {
                        if (!snd_soc_is_matching_component(platform, component))
                                continue;

                        snd_soc_rtd_add_component(rtd, component);
                }
        }

Above code in snd_soc_add_pcm_runtime() checks components
for the platform,  because there are two components for the node,
the first one is the component of cpu dai, which is added by
registering dai, it is already added in the beginning,  so it is
duplicated,  but the second one (which is for platform) is not ready,
then issue happens.

It is hard to add conditions here for defer probe.  And maybe
some drivers need the same components for cpu and platform.
Do you have any suggestions?

(The easy way is to fix in each drivers:))

Best Regards
Wang Shengjiu
