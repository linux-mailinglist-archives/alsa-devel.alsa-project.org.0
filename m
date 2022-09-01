Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298945A8DD4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 07:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC43C15F9;
	Thu,  1 Sep 2022 07:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC43C15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662011920;
	bh=dxrEam9ukSKuQjRvt0di1XGhWiieELRWDTgE8De+xuA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfFa3mt7QpiHhQG6boKI4Uf8Jw35S/GFHPvUkUZW1I4pt9Z0isIxFHkr2yCOcmrgC
	 nWt2AhUXSdCucbG0zbycLc3CsJxaR/8BlTBnjZJJgigXl/Cj6k7UDgD0Ibsgd/i+CQ
	 JuK6FPkJEpLSqgy8h+Qf9+JKMrhPvPXGtm9f4rTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC68F804A9;
	Thu,  1 Sep 2022 07:57:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2731F8026D; Thu,  1 Sep 2022 07:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D024BF800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 07:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D024BF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j+6RvxtE"
Received: by mail-il1-x12d.google.com with SMTP id s11so7231295ilt.7
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wB71mxz9sZZ6MrmdLLN+L5oPjA7Db42fd3yvoP7ITlE=;
 b=j+6RvxtEzxfiZJ0UDAc2gOcGkw+uqI/fHvxwZRPA/yeDT/9+LAM2FKCYcpM3qzlM8p
 WVeYFURqEbCwWULAdBoQzm8/q+Rfh9N77Kt1TiUyZR4lwvo67VqtHUYWDXlEUnXvNA+6
 x36A4UWfqj7sGb4Nq9Yp8Bke2h1VGpTk0jTRwwDdZu8joaUwmUYvuhLU4WBqMHhSC9Au
 RJzwA582AIrJ5JettZNKAEvLa/F41Ftr3g8fl/KN5gySYEhTSmijWO8351pmtqMXBB02
 nX3DoKqj9TAl+ZDdTE/UunFi6XZUVmlazC16PiiQ9O6Cj2dEpk8qhVb0W9n/YCdeUTb4
 EegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wB71mxz9sZZ6MrmdLLN+L5oPjA7Db42fd3yvoP7ITlE=;
 b=5JwEnTMTKviIbFzdcyyrNfLKYCoX4cT7XTY8elnjkV207b3TRvdytxAZERcfkBmBdj
 850jrzYsdtYpgX+SyeEuVYqgJliBxf1tt5/mWcny1lssWIloAwqzzOySOxHBntbEpP4M
 FGxsQfaeLV8jkPTV7Uk7kXurqFQ8FyhMM9CS5wQuTJeCt9FSOAKfIFExqXuErJYab7L3
 ugcoUQnpl4SXDmmO4vzNP/1nmOGTvo8Xq7wglCiSSc7augBcfc4O4CjJkzbR6EACDS0D
 mnPy7Ar45cJrq94pVCJPl3v3LWIYmTr+HjAE0l0CzD5kn+t0VWq+McXyYBBuKJUunUMk
 qnGg==
X-Gm-Message-State: ACgBeo2pnktWx920io7eKAO9DKgtyv0aNWgXXWS4G3pc45eaCpsScfSt
 5Se0e+bCIj6c9RmSwAO+fhu4Fd+zlSAXKtg02Bs=
X-Google-Smtp-Source: AA6agR6xefaf7USZwlxLIWwGM36QJLwI5omqHhij2aogBV5iiU+XyfDLWU4vSFCNsu66cWa2lzNQlpEszhPDJ1qoMUA=
X-Received: by 2002:a92:d5cf:0:b0:2e9:4cb4:57e4 with SMTP id
 d15-20020a92d5cf000000b002e94cb457e4mr15618513ilq.224.1662011852348; Wed, 31
 Aug 2022 22:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220826023504.6183-1-steve.lee.analog@gmail.com>
 <Yw+OCnOgYUOWdIEx@sirena.org.uk>
In-Reply-To: <Yw+OCnOgYUOWdIEx@sirena.org.uk>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Thu, 1 Sep 2022 14:57:19 +0900
Message-ID: <CA+Fz0PZStYOZhNpRQCCVKxaDmPPq_PwvWrxfWbq=sBNKrZzzNg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Remove unnecessary amp on/off conrtol
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, tiwai@suse.com,
 ryans.lee@analog.com
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

On Thu, Sep 1, 2022 at 1:36 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Aug 26, 2022 at 11:35:04AM +0900, Steve Lee wrote:
>
> >  The Amp is already control in userspace before trigger calibrate function.
> > Remove unnecessary control in calibrate function.
>
> I can't see anything which ensures that this is the case?  Should there
> be a check which returns an error if the output is not enabled, or
> should the function check the current state and preserve it at the end?
> I can see that this would fix problems with it being disabled when
> callibrating.

 As your comment, this can fix amp being disabled when calibrating.
And this also fix the case that music play right after calibration.
Actually, calibration process should start mute playback before
trigger this function.
AMP disable/enable control in calibration function can break sync with
userspace enable/disable control.
