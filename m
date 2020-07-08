Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C221898A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B781C166E;
	Wed,  8 Jul 2020 15:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B781C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594216334;
	bh=50WfCJpofBL1SYdqpkVRPeMWrIfNI/ATizqCXd6zFsg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcjEh3ZYyDG3P6FKFXKB0bvjZLvFjkh6L2TA0vmZaunOorSMegLujWObZY6OBHNeS
	 srHJ6L+T4+m3Qz39Ui9y8fERXf8hgY+k9JuvOA+0sSPjTCT6Z9LrScBI0F0xboGoAD
	 nA6e4hT7FUb08oKmjHv0c2Gf5QYvq8FZ0/WZrL1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0DFBF800AE;
	Wed,  8 Jul 2020 15:50:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8033EF80150; Wed,  8 Jul 2020 15:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E63EF800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E63EF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gJ7wmMYJ"
Received: by mail-wr1-x441.google.com with SMTP id o11so49134503wrv.9
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8lHrceqJXb/mkLYeI8FBGxk6DvEc2eMTSc2t0E7UjQQ=;
 b=gJ7wmMYJ5XLMLGo1oalgDqse6A0rlPdMgH2mtw/ZFPzattCsAWnXMIWzDT+12v5pV6
 j2LAoN0ohozz9KWjS8+yZOKhzy/EItkjt0YNL6ZYba7KmpWFjtP2ef52IGWXmIhQo9ib
 k3QcjJxeAPj1TA+u0mgm6vsRVN7SsOjtXaL2oca+LhnYy664gc0hM83/zU/0CmuDhpdd
 fuBRho6lNPcMwSk9gZQ/csbK8IQFK94b4SclwuUS+zsPKryNEVYjnqe15AouDLIZEYjv
 DehNIFNrGmpmLuRtTEj24O4oTKeaj7BxMC41oIAxAnyoYqiTVTcfalaHIuMWR+Z1yVks
 JmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8lHrceqJXb/mkLYeI8FBGxk6DvEc2eMTSc2t0E7UjQQ=;
 b=jxOqJ76E024qU9T135fdurd8ymMjm4nt6XleAxe+Ga80eg+H7F53oPFlaw/oa+foSb
 uE/0t8tp8Ez70LbEpKvRhbVGOukMpibyCYI5oMxprzNnjm9Grf8NiLn51s2pXaJX6uTD
 qLz2lHx+lWrmhTfqSvjJ8W9Xn2P4SKSshueRyI1xECYVdz/sDbNHTINrfg/EoL9Wdh7T
 erbKKU6+2b9rTVOf6+Z2FU3cgbL/rIAV/14UdBaOJZ7gjR3oR6CRU+JY70JIRLE74cu/
 dV/wW4qsLDDPs9/ecwMC8mQaK1AwFJx41XUXHiVMqrwCmyrfvcWA8zS6m5AolEU6CwOr
 mGQA==
X-Gm-Message-State: AOAM5300F6mvjBgKnzP61pjoKn9A0hj3UKLctxgDSIPzmn4ZNMDzMIZ/
 LZmjB17qkEicmpk3wafp3jA9JQ==
X-Google-Smtp-Source: ABdhPJwSsrkmAU33M2XHIGGqqR0DTSPDfhqGY8G7leUqAS0g57m679UaChTXxr9XxRZK75OqRV5T9w==
X-Received: by 2002:a5d:6987:: with SMTP id g7mr58130023wru.79.1594216219855; 
 Wed, 08 Jul 2020 06:50:19 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id t2sm6274790wma.43.2020.07.08.06.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:50:18 -0700 (PDT)
Date: Wed, 8 Jul 2020 14:50:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 00/10] ASoC: =?utf-8?Q?Clean?=
 =?utf-8?Q?-up_W=3D1_build_warnings=E2=80=8B?= - part2
Message-ID: <20200708135016.GX3500@dell>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200708063900.GJ3500@dell>
 <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
 <20200708130606.GW3500@dell> <20200708133833.GQ4655@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708133833.GQ4655@sirena.org.uk>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Wed, 08 Jul 2020, Mark Brown wrote:

> On Wed, Jul 08, 2020 at 02:06:06PM +0100, Lee Jones wrote:
> > On Wed, 08 Jul 2020, Pierre-Louis Bossart wrote:
> 
> > > > >    ASoC: sunxi: sun4i-i2s: fix kernel-doc
> > > > >    ASoC: sunxi: sun4i-spdif: fix kernel-doc
> > > > >    ASoC: codecs: rt5631: fix kernel-doc
> 
> > > which tools? seems pretty bad to me to rely on string uniqueness, isn't
> > > uniqueness defined by SHA1s?
> 
> > SHAs don't work across rebases/cherry-picks.
> 
> > Sometimes subject lines are the most reliable way to 'match'.
> 
> Note that all these patches have unique subjects due to the prefixes
> saying what they're modifying, this is a common pattern for these sorts
> of repetitive serieses doing broad cleanups.

Yes, they're unique within *this* set.  The fun starts when you
conduct another pass a few months/years down the line and have the
same lack of imagination. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
