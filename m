Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098563AFABC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 03:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8054A1683;
	Tue, 22 Jun 2021 03:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8054A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624326903;
	bh=Chh5pFDO9joCNsao3M0cBsb3fODpOEzzrpv4zmZ2lmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9nEYSU5s5haG6W5tOry7RvD2fnYTU9a8i7n5SiPLOhAoHr4T38BBU7xqYk2BKStU
	 SoBaCWml0slcclnApV1VQKcin7LuBwsxE3s07ZswZS/7vdMS2Pr/XH28rgJct27cZV
	 ldvserIBm8Yi8VAW2BHHAdZF0H7R2/27DEI5uF4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0281FF8026A;
	Tue, 22 Jun 2021 03:53:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B43AF80268; Tue, 22 Jun 2021 03:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89576F80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 03:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89576F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oJNrVUa2"
Received: by mail-qv1-xf33.google.com with SMTP id x6so8520501qvx.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 18:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QTuaNj1iCRevxIVn07f/kyH2pwUNv2dSDLfnl7sJyA=;
 b=oJNrVUa2XPX5TJqSmRrTkm0n3hiPddmWMVfa017B9LAUrPBpxAncFYkrkGZSDEXRBh
 AuBhSk3qcrWUlGNDCJjmssf0Vk2JApDxtoHkB8G5ja/M6VeMZY+8N/ION8pueo4oDD8o
 rmTqTefG1n90ow3ol+EgjrvPq7onL/saU9cSB/67IW4CvtGGZslQVe83NKXOUyVoAArx
 qvfF42EXyE1DH2ZONycGLVvneo844q60/iV+zKH6trXGym0Fj+myF39tCVrVHtk5aBCg
 O+F7XqYFobhmmUUI7+t1OQcOIgxsRytAJWE4aLtt42PXe8tEqlbq+o5xzwE0pQXi6Q6u
 g/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QTuaNj1iCRevxIVn07f/kyH2pwUNv2dSDLfnl7sJyA=;
 b=dUSh0BGw/NoGOYutku+vAfze5uZavWlwlsl9HhFoDAC3xUvkxVhEWF+y3pPBstR+om
 Ejqoa6BLhQZwR1s0j5S8jlbfr/KLm0+CejC28+/lhJq4QJ/L+o1BMLSQQCua+/1JRbwC
 PBbTNQHVIn7Wk2ibe3tAL/3w9JEINSAUrzjiW5S0EBB6yYnxth4DYeUyrUyRgPxI8x//
 +NRAEfClMRtdgRuTtdt2362DlkZz+cvNQw0VSPOmaGnLRmaDEvr65Vl2xdMFqmqPy9pq
 kMcoyl6dqzl0QNymdWJqK7CXkXgdPLHveA+KVJkBHYI+54lqrRV+GkOXvqzhMG7Dhhal
 I18g==
X-Gm-Message-State: AOAM532vokHNbB9xzI94AqSYFxGo/xm9/DcaaylSMw6NQrrsul27xwXI
 usn7cC8azshjUBjtoGgF+ZD9ne7bXPJVhjqwK68=
X-Google-Smtp-Source: ABdhPJyK+ME4U390q9Mvxhn4yyQjnyEwb5J4Pk64Y4liLe7WtySvGp22/bO45BpXK3lsvidSxjOvxgDpVOZE5wPUYJE=
X-Received: by 2002:ad4:4bc9:: with SMTP id l9mr9578935qvw.36.1624326801992;
 Mon, 21 Jun 2021 18:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
In-Reply-To: <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 22 Jun 2021 09:53:11 +0800
Message-ID: <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Tue, Jun 22, 2021 at 9:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Jun 21, 2021 at 10:31 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > Don't need to print error message for defer probe
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - use dev_err_probe instead of dev_dbg
> >
> >  sound/soc/fsl/fsl-asoc-card.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 121e08c2af2a..24c890d76da0 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -708,8 +708,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >         of_node_put(framemaster);
> >
> >         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> > -               dev_err(&pdev->dev, "failed to find codec device\n");
> >                 ret = -EPROBE_DEFER;
> > +               dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");
>
> I know I suggested dev_err_probe() before, but looking at this again, I realized
> that the error message will never be printed.
>
> Maybe the error message could just be deleted?

so I think we can use the v1 one,  use dev_dbg instead.

best regards
wang shengjiu
