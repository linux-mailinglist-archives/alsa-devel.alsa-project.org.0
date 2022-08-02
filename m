Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD59587C5C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 14:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EDD844;
	Tue,  2 Aug 2022 14:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EDD844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659443098;
	bh=+NE1RkS5Z94IiGB4KTvSa/3dRoxVomEF7sjmfJD8bG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fi2NJbcNc8zBKaD9rBxGliqSPyFybGk1tj1Yt8OSZzDgifhZ9rRlSHJ6HlMjeHxLq
	 ouMdNtF/kGFQAYCkhodCVmc74lW1sEydbwr4X6+Si/njjWO24rCyrcjygef0h1JjnS
	 xuJQeaTPWCZNrL0//yoXJZitXGl7+K08f0efliCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3FCCF8026D;
	Tue,  2 Aug 2022 14:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2352F8026A; Tue,  2 Aug 2022 14:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBBCF800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 14:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBBCF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nAUJOzW2"
Received: by mail-lf1-x136.google.com with SMTP id u1so11437869lfq.4
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8iU8kfebQDkNy2quOtfHbt5JTFBcMDWk7S1Y1FMIEA=;
 b=nAUJOzW2d7uHBTe+utSc7B5AArAmSPiNqSWk3LgVILrna8pYuTKTBFhopTkzlcj8Sp
 18UuNu3VkugB4xrsxBM3zsF0635H57j5/vnEHTiX+Rp8yQqCIPrMFTTl5STXpJFfMP9H
 OTsI/CMCppggpD+k9+NaghRqiu9weWlJjWxG6EXgGGsVh56dse4MIQpM0kAAAjdeAKt6
 /plslovwC3d5oqJj7gC5imn+Qmq/9e1PbnbGgTzMQfSKQyho0OlXJ5O6WiryvlSWm9kU
 fUynprXAKOT005duHihm9kR3AajD/IL0PiMYe/Lle4SC3+MwTlcH07KrQeIxXtLDKWNl
 9+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8iU8kfebQDkNy2quOtfHbt5JTFBcMDWk7S1Y1FMIEA=;
 b=jfkCAnP5EaxrqI+qwbhljYKHfMBMkPICAu2tICZj6IDXPG8JFs/hNpnm6RCw4TxnvX
 Vw4t3iPAS7WAaaItQoR/aR7aXN6wZo4NJ6uZVvZ8ndqs0oICc6GO0+0DsXKFIjeTWv6t
 hvVlWSwp4IDtp/7DBFKJri6wDmG+2d2/260oNATJ+199RSjpL1spuPdKkXRJwJpOl/Ww
 W9MybcHf7St+4vBUzRC2Wm3dO4f2nvv8fQhmVhRPtWrMR681IuE33vrcvAUhlrl0OfbV
 51SkzDIvcsP2bovxhB1L8RO5pXHaQBLb4tVjeDMLj2AAOecwCeooywie2ZFhnfDzW7qh
 BOgg==
X-Gm-Message-State: AJIora+F3aVAz6EcXJQ83ZdbkaUwaqaZKX/y5p0iA/QBKaI+K91IBbTg
 +WN7M089VitwRBTZrtwbvD3G1GsLfC4aAhQg6z4=
X-Google-Smtp-Source: AGRyM1sazR2KHd2eKOWEvLs7r81gJTxkmWsTrtToJBx5aIOdSqblZ+OOPIXFjFUUVVOVLdG/k2+WLidxq4dUgqHwi0U=
X-Received: by 2002:a05:6512:3186:b0:48a:c33e:f5e with SMTP id
 i6-20020a056512318600b0048ac33e0f5emr8157688lfe.531.1659443028519; Tue, 02
 Aug 2022 05:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
In-Reply-To: <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Aug 2022 20:23:37 +0800
Message-ID: <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Aug 2, 2022 at 1:47 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
>
> >  struct imx_rpmsg {
> >         struct snd_soc_dai_link dai;
> >         struct snd_soc_card card;
> > +       unsigned int sysclk;
>
> unsigned long?
>

Seems int or long are all used in the kernel.
I am not sure which one is better?

Best regards
wang shengjiu
