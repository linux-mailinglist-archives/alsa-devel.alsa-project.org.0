Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F323B6AD
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 10:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 437CC1685;
	Tue,  4 Aug 2020 10:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 437CC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596529052;
	bh=C6Mmq1t0yH3MRwY/GwVOVy5HMKCguTxWUhvV4Sy4Ftc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VY4TbxtnHwJmWAm3o9vma6XzaPzHbQaYGINWJF0ZOOa8avy/Y83+vnc/bS2atp2dT
	 7/iErKfF9iJG3dKeVcAbesn8IxJb2a24Z/mLHM58NJQYPE1kFs884noI720jm5r8dQ
	 0MrBslbsVMZy9FNQAYRc8AyOtVUDa00g+PTImFQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D849AF80148;
	Tue,  4 Aug 2020 10:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 663FAF8015C; Tue,  4 Aug 2020 10:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0EC7F80150
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 10:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0EC7F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DYdif+vR"
Received: by mail-pj1-x1043.google.com with SMTP id i92so1226333pje.0
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QTZfG/kR29WZl/QqtrKhHeYkzxPgGUcbCVsRoqYuMCg=;
 b=DYdif+vRQ34VCrII1rcRURMIr1UR4eoarWbg2ONWRx2uRCdkqrY/8JzU46Oa5nbfS1
 uzfdNROpnO06HKpLdfpbuCQ6FGlq1Q5agZp+uGKZ5nqXoP26nuPN6pGHOUvRcoyQ5bfG
 Qx/B/rXOjGtqaGu/9kKoQQZm1SZEHot04BYIN3+aFdQAblXL7A87TG51b8LtSNB5EETn
 /UOZrqg0fsXd/BPGQy1t9OVN/S/GLvcqnKP5beN4UKBBmJY+KZhj5C/MnD9to9XjnKka
 UQ5K8pRSkK4hmoSUUGWd4okRUmae3379DE7RgP2SDmoISUxFqIE48oXwWhe4UDm+zj0M
 HtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QTZfG/kR29WZl/QqtrKhHeYkzxPgGUcbCVsRoqYuMCg=;
 b=ohLALKkK9ahsoSB9c8jLP90FPZRUUEcweA42IfYg1uCU4B/gqb5jS2F4EhJOQtWk6A
 E64kUNzBsWhfnd7qqscE8D7iJsDSUSt3+VtVulkUOS+Pk6kXQV5umcE/zYSy2/uLmjEN
 RQAHI/Wm+lat+xOW0qzFIiVTrDGMfCrGnWWugvcLCZtBGp6NvquKfMgDsd7J/NFxbEJd
 syuMSXJrQ9dv43lmfB41eCP7/DsNVW2gVDj6rPnVgoPxowhUSZCVKRTvubXqAIiOWjY5
 uX5cSVn1oiDKaRzlam+Cpc+5F0c1tuRujqRckcfA3rv5OLorkf3wMojZWOFgruuqVkKs
 V/4w==
X-Gm-Message-State: AOAM532BGp7TOf4VnJ0FJ8gdtKt2nQyurYmJIk2BZVuHeRlZjGmT1+Mk
 iqGLJTLHXKhtXMsMbzChabA=
X-Google-Smtp-Source: ABdhPJz+uClNx0qLTPNR0v0kaWetuL5qHIA7MjIEAIYLOMnWp36caMp4FKmFAUV7cMJ+CR83l1o0Dg==
X-Received: by 2002:a17:90b:c90:: with SMTP id
 o16mr3081175pjz.79.1596528827041; 
 Tue, 04 Aug 2020 01:13:47 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c10sm18237720pfc.62.2020.08.04.01.13.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 01:13:46 -0700 (PDT)
Date: Tue, 4 Aug 2020 01:13:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804081333.GA664@Asurada-Nvidia>
References: <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
 <20200804070345.GA27658@Asurada-Nvidia>
 <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Tue, Aug 04, 2020 at 03:53:51PM +0800, Shengjiu Wang wrote:

> > >                 /* Check if the opposite FRDE is also disabled */
> > >                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> > > +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> > > +                       fsl_sai_config_disable(sai, !tx);
> >
> > > +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> > > +                       fsl_sai_config_disable(sai, tx);
> >
> > The first "||" should probably be "&&".
> 
> No. it is !(!sai->synchronous[tx] && sai->synchronous[!tx] && (xcsr &
> FSL_SAI_CSR_FRDE))
> so then convert to
> (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> 
> if change to &&, then it won't work for:
> sai->synchronous[tx] = false, sai->synchronous[!tx]=false.

Ahh..probably should be
if (!(sync[dir] && !sync[adir]) || !frde)

I have a (seemingly) correct version in my sample code.

And...please untangle the logic using the given example -- adding
helper function(s) and comments. And, though the driver does have
places using array[tx] and array[!tx], better not to use any more
boolean type variable as an array index, as it's hard to read.
