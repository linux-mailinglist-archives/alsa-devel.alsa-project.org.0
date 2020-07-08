Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8E218879
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9531682;
	Wed,  8 Jul 2020 15:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9531682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594213682;
	bh=+ZcEixGGyXNx/rGI0cDyhMEYBIC0HZVRlgM5r67B0/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHyu7gCADa1KCDo6L27i5x2v1/Pfhhjojh/cMHhX7rrCwDnbSFPXiRgyRkfIpfyLg
	 Y/wzTJhFiJkdV/wQvCCoxBJqBP+SAr9u4W4DdGG0n5E56V6s0sSIP1ST97y9ljtzTH
	 s+pTWwDSrtcv8OIwLlcmT9Djm2BsVIvdfRDawv44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35996F8015C;
	Wed,  8 Jul 2020 15:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F0EF8015A; Wed,  8 Jul 2020 15:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC81F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC81F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vcs0lIKG"
Received: by mail-wr1-x443.google.com with SMTP id q5so48884865wru.6
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mNKCLmCbwMQS6p1jtUSXl2rKJQGQDSOEjrDKNkTmf9Q=;
 b=vcs0lIKG7KmSx2lDcQMz76MgotwWDBzdwD4mga1beApwOkExaw/zkQVWeUtMianeaC
 QcCg430g3Q5yaTL4LcV4BO2Cx/lnwW6M3/cNFFfqEkopRZTgkfT8rTnRnyfeL6EHmpd0
 vd+snH7q03KXfcg0H5a5PP7aPwilMKk8/JANzt1bUGx0uAMqawIHnYhrI4b6J8wojbIH
 xj6DGPt2uVWtRu1EQvabuCOcxU8eI61wpLGxT3hTbpCIUHLPAJK3HFu8C0NoTENLYhGC
 /zBOVOffZ38XoahttSAFnMogbisXyXxOm0DJodkWGyWUmP3E4LnKMp21l2osiVlMa8HK
 7ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mNKCLmCbwMQS6p1jtUSXl2rKJQGQDSOEjrDKNkTmf9Q=;
 b=A++0Ln9gHh7phILVVzyiuKVl6GMu8zTw/JAy0Tr/K21uBMkKm6FRnIWJi3m4wIvtfv
 uJtWEZCN2lXuxwK2sFK58KwxKsVFodjJfdDNHeI0BS4V6k81eMis2rbOjtTTDybNsKXc
 TRwBKgxPxgzF9Miv1Ov5wS3zqwe1rnR1N03b2//Kig1HfLt+cKEz6yqZf/Lj+icYs3z2
 09B0NQFSvy1ZQ9rRNctDNlaF02D1U79RbIgNPEzFolHQu3Gg3LUSVSYhxcy7ofk2dM/H
 +iH2efpG77iAubwGwpq88yFReIGfa+E6j2uTdMvkB4XmQJCKJXomKE+Jaoo4FTM6E3uC
 8p4A==
X-Gm-Message-State: AOAM531gJqNJsRqCVO82tGaKrNoRlM7hUHjCCsTcHJ6KzCqHvYarO/uk
 4LY6hGUj3jRQRkGqClfDS4+rZA==
X-Google-Smtp-Source: ABdhPJxGAM/C0FnXyCE6FocAVlACjRdgrK+tj3pdqIR1dc1kqQx9e/LaC34AsT2tuKTUwBGVSCfdJg==
X-Received: by 2002:adf:f04c:: with SMTP id t12mr55512843wro.382.1594213569073; 
 Wed, 08 Jul 2020 06:06:09 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id q188sm6222627wma.46.2020.07.08.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:06:08 -0700 (PDT)
Date: Wed, 8 Jul 2020 14:06:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 00/10] ASoC: =?utf-8?Q?Clean?=
 =?utf-8?Q?-up_W=3D1_build_warnings=E2=80=8B?= - part2
Message-ID: <20200708130606.GW3500@dell>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200708063900.GJ3500@dell>
 <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Wed, 08 Jul 2020, Pierre-Louis Bossart wrote:

> 
> 
> On 7/8/20 1:39 AM, Lee Jones wrote:
> > On Tue, 07 Jul 2020, Pierre-Louis Bossart wrote:
> > 
> > > Both Lee Jones and I submitted separate series, this is the second
> > > part of the merged result, for which no feedback was provided.
> > > 
> > > I picked Lee's patches for rt5659 and ak4458 and added the pxa and
> > > ux500 that I didn't fix. The rest is largely identical between our
> > > respective series, with the exception of the sunxi which I documented
> > > and Lee removed. I don't have any specific preference and will go with
> > > the flow on this.
> > > 
> > > Lee Jones (4):
> > >    ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
> > >    ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
> > >      'reg_val_TSTDR'
> > >    ASoC: codecs: rt5659: Remove many unused const variables
> > >    ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
> > > 
> > > Pierre-Louis Bossart (6):
> > >    ASoC: qcom: q6asm: fix kernel-doc
> > >    ASoC: sunxi: sun4i-i2s: fix kernel-doc
> > >    ASoC: sunxi: sun4i-spdif: fix kernel-doc
> > >    ASoC: codecs: rt5631: fix kernel-doc
> > >    ASoC: codecs: tlv320aic26: fix kernel-doc warning
> > 
> > Would you mind elaborating on "fix kernel-doc".  Some tooling relies
> > on the fact that subject lines are, at least for the most part, pretty
> > unique, and if we have to fix another kerneldoc issue in the future
> > with the same thirst for simpleness, I'm afraid there might be
> > clashes.
> 
> which tools? seems pretty bad to me to rely on string uniqueness, isn't
> uniqueness defined by SHA1s?

SHAs don't work across rebases/cherry-picks.

Sometimes subject lines are the most reliable way to 'match'.

> > Take a look at my patches, if you require inspiration.
> 
> I have a minimalist style for commit subjects but ok, will update them.

I'd appreciated it.  Thanks.

> > >    ASoC: sti: uniperif: fix 'defined by not used' warning
> > > 
> > >   sound/soc/codecs/ak4458.c       |  6 +++---
> > >   sound/soc/codecs/rt5631.c       |  8 +++++--
> > >   sound/soc/codecs/rt5659.c       | 37 ---------------------------------
> > >   sound/soc/codecs/tlv320aic26.c  |  2 +-
> > >   sound/soc/pxa/pxa-ssp.c         |  2 +-
> > >   sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
> > >   sound/soc/sti/uniperif.h        |  2 +-
> > >   sound/soc/sunxi/sun4i-i2s.c     | 10 ++++++++-
> > >   sound/soc/sunxi/sun4i-spdif.c   |  2 +-
> > >   sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
> > >   10 files changed, 27 insertions(+), 52 deletions(-)
> > > 
> > 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
