Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6608221006
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D8A51665;
	Wed, 15 Jul 2020 16:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D8A51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594825148;
	bh=lrNRkt13NGiLheLODHAuypzRcATSBn2PkvWyezW3ik4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9RYnXecUvjnTa0aT0gNu4pnbTwOfd7xzhmMqCvIBt0nlzaTmDg+NEk2tcE5CeV4p
	 xHgFuJGc5O3ecPWvgjiDfVfP6XPuCjs20obhIyeT7NZzsUju5kzngx7tlLpObZMl2Z
	 1mK+Xb1oCKVIUL372q7qniXU1Mpo6cPbZrexbZsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE99F80227;
	Wed, 15 Jul 2020 16:57:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC18F8021D; Wed, 15 Jul 2020 16:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C22F80217
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C22F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZsjT0iHq"
Received: by mail-wm1-x343.google.com with SMTP id q15so5915613wmj.2
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f2CbQp7JxGal1BdX0jNapHeOunGDBGdvrvEEUG5tMLY=;
 b=ZsjT0iHq1P3/z04/ctVDlAEdshwpCt+0LY1xJUraexpA6ESa5Cm58MH/VggfjMie2p
 DOXKxhzgpER0jwoId2TfiZ7bP2lxQamHk6c00FR8KAo3oRjGLunRTgHaTiaWwJ1RoBye
 NT2cC3p2k719f8CdUvoM00VKA07EH+SwOqplybI3qZ5o0OTFHyFwQutxrvDQFS1Fv7hX
 aiCn7Z1/PH66m09Sjab0iSZeCdbwagDQwX2flcM1C75VDJu6POrFGhk8WYATSbMbSA2F
 tCMNIbyhqfX3pLEYCnPjB/pKUTz76+kzImWY/838nep6Gfa00aA6aa3s740UTDF8Jcdd
 IxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f2CbQp7JxGal1BdX0jNapHeOunGDBGdvrvEEUG5tMLY=;
 b=o/57d0FiSV0yUNXzOS/9y+/0rIX4cecKpHlWEjHeIUlN7gI1XPUJRQZLeKcqXg2gHW
 E+CbuGfDuue70iRVvmcROvau+tWiHbvd870FGdfEEGcc9Kj+j0OJsYB9yXiJVc1L953p
 JwjbTd4ZcH+cLrTDOC6dGKgcMFdGncA2NBU+vXxT2Isb/Rt2RRvQH+R0TYQNtexLuJg+
 1hzTW/gSJuJueVsnFHZWTnLjDrRNHFsbBz2W0djeKF5M/Lh0A4Qzs3le7XtmSFOP5HkL
 fA5VsDPFdeX6KpShKVA9uSInk6CwfZbCv1A2NJz/CKqmj1ou92kFYuoUc4FjsA2FahBI
 c+HA==
X-Gm-Message-State: AOAM532kAUvRZ4A+8FumZU3emmAknZEqv/7KK+T/63u4OS4ynzE1oIMc
 FkUmGEMbxyiY+k1pyKddf4LE1A==
X-Google-Smtp-Source: ABdhPJwcQKIqBh34jcnUoTZ3kXw7R8fUZWe+6TCuYehKA+AQH/THmFlpQIeXdrAeHkNAbd82o6RElA==
X-Received: by 2002:a1c:5581:: with SMTP id j123mr8828248wmb.75.1594825033869; 
 Wed, 15 Jul 2020 07:57:13 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id a22sm3624918wmj.9.2020.07.15.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:57:13 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:57:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling
 of 'exists'
Message-ID: <20200715145711.GI3165313@dell>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
 <20200715142651.GA44014@sirena.org.uk>
 <20200715145516.GH3165313@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715145516.GH3165313@dell>
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 15 Jul 2020, Lee Jones wrote:

> On Wed, 15 Jul 2020, Mark Brown wrote:
> 
> > On Wed, Jul 15, 2020 at 10:44:47AM +0100, Lee Jones wrote:
> > 
> > >  /*
> > > - * This dapm route map exits for DPCM link only.
> > > + * This dapm route map exists for DPCM link only.
> > >   * The other routes shall go through Device Tree.
> > 
> > This doesn't apply against current code, please check and resend.
> 
> What is 'current code'?  It's applied against today's -next.

Hmm... something went wrong.  Stand by ...

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
