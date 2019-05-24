Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAAD29F25
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02FE51788;
	Fri, 24 May 2019 21:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02FE51788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558726538;
	bh=8XW9Ck31gL7NREss+vGwFdXNJ2fVdwbdh/J8IOlc21c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0+MHZ9h+HOqenmmB06b+IkqKkkdaE88rFUUCh9jVphP1lxq12PKAhuOsJLzRovlp
	 Tz6mqAim2SAuEyQ86WKsGGNgKNM/i0JAHw1K1hKV5wkWL5r+SO/EjzgFYwYOZ671Ak
	 Z10FpO4Dcjmli7YkagFs/rDok3y6FmV6m5X/iTdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57875F89630;
	Fri, 24 May 2019 21:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72009F89630; Fri, 24 May 2019 21:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF35CF89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF35CF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="PQX6vdao"
Received: by mail-qk1-x741.google.com with SMTP id w25so9151473qkj.11
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 12:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ruzmONK94pQ7r2XtlvRV3qoOZG4epR4AnJ24kzc41ks=;
 b=PQX6vdaoCzk+M6s3ahYA96Nr8aNfegynW/lGGdNkk4rT76oMmW3Bq2kQAPhBZMC/Kx
 4kcIuke2j5SbAmD8ZEaY0UxYwuaY8xaJXUWHVVhSLBRmwo0a+XnItkTrUdn1HiLMCkd3
 SUFNh0s2X8hK3yKxOV1KkPAhn/jG6IpvjSdNKLm6puK30b1+deu0C9XJrtLYkelnFeZT
 1OTZfuaBQdKgIAts4cqK0NLDgGnDADuj0dEFpSXdLcgJg6bFm/NfNhSZ14kI3gbiALS8
 Lk39Xh8Mu5HFIXLqGyGQEqYKwvYzHLRAQTtFvc+vF320J99WdhGTi3UI5tR5RUXsoYaP
 QcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ruzmONK94pQ7r2XtlvRV3qoOZG4epR4AnJ24kzc41ks=;
 b=GC3+ScZ1+36Z374iG+DSCppbffHXPdhaf3kZBpU+XJvKvRIuQtxlCQkqCpZbJcu0HF
 R9WFHv17dNuChIXPdHlfeFB3uz90gC/ovO5vZCTq2UFXUpKH31mp+DKd6HgLIOOScs5y
 EHaZk73Z9vDJ+72CNJSlZ17R0ZoflMc918Yq0Vzd6mG4gGJOu4ISwwQG4QO1bTQxzhzi
 6fpzg2ONETDJgdTWm964oiuv9+monHVYWvDULROjduHTTNCNf9JEC+jX0943XVnruPpk
 1350NLks7rslxC6pGoYreWICyBsR8c5BSkhREfsSxUUG7OMbLNwxDJBu27kNtmwsBMfQ
 v0uA==
X-Gm-Message-State: APjAAAVUNdqHuAcwlpium8MMwyjlctgAtoacp7w6VN+c/FraOKUZe5f9
 l2kd977JxCbuJ4f+Jh2Dv05QWyVF9/4Iyr8/j54n7Q==
X-Google-Smtp-Source: APXvYqzNMq4QiSeMoa1rpXZIyoLU68AesCFbomA5dob2bjgLBRz2nSh6Vruy3gdL9hne6r8I2U7sdTwvHq5JrI2Bm0Y=
X-Received: by 2002:ae9:c106:: with SMTP id z6mr19669835qki.65.1558726425900; 
 Fri, 24 May 2019 12:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
 <CAD8Lp47Yc5CwkM-y=eqXdPDZ7+1=qa6m1sCELhBsidsYYSzfQQ@mail.gmail.com>
 <d399bbcb-c094-d0b9-5ae3-8267ee613d6f@linux.intel.com>
In-Reply-To: <d399bbcb-c094-d0b9-5ae3-8267ee613d6f@linux.intel.com>
From: Daniel Drake <drake@endlessm.com>
Date: Fri, 24 May 2019 13:33:34 -0600
Message-ID: <CAD8Lp46B523hZ5jRya5HFcRK6ZHL7JxRFj=FiGPf47aaVuUbog@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
	are detected
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

On Fri, May 24, 2019 at 12:38 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> > In the case of DMICs attached to PCH and BIOS/NHLT reports DMIC, is
> > the HDaudio legacy probe aborted by default or not?
>
> no.

Thanks for the clarification. The plan makes sense to me! I'll check
if we have any more devices available with DMIC where we can test.

Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
