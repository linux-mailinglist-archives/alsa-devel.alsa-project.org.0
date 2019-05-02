Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC085121F7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 20:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5561835;
	Thu,  2 May 2019 20:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5561835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556822159;
	bh=yP/gzFQXoBSD0mWEThHCP8PzmUMLJroJej1VxoBkWOk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqSYSpJzQrtGS1nqlZ3WOeIocKykIJUbKEk2mEV5VbKX4kMGnFIz7c4KOH1HT6MPG
	 tEXVJYImkISjEbCmFpCWn/7nCA4nU9Sg5/pivMxHsWZeiHXzWaxJ/+749myooPFYLf
	 qKjPKPDSH8y3jQ2NNRBrsNrrMBVw49I6KQfRrCiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3B2F896EA;
	Thu,  2 May 2019 20:34:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3598CF896C7; Thu,  2 May 2019 20:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3BE1F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 20:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3BE1F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L9VDpZd7"
Received: by mail-pg1-x541.google.com with SMTP id d31so1441393pgl.7
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 11:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9pb3Jn+Vd+nDYRO/WKHx1a5dMNfMG+2SwDRrQcgz14A=;
 b=L9VDpZd7yhW7D4dES1p8F41DXoL4cI3oVP+xeAgaVLAPRICbbOmA8zCIYc8C7R10Ze
 aCmnVONmStqlxASn958ixGMTiMe42NqhfrNP+IeyeHPz2U1dvNMIducxvXB5BrKhRFNT
 zFlkpyzKVJRe9BvjM2tdiX78/f+qY+6yrjlCPuDfuiIRnEKQddP5LNl+3KwMh7QhYB0p
 Qy/FnzYhkVHiPrnt9wPbeHn0ZbMyZtpwYNuRyfwfzQ4kCnnS6/XX1bWAsy8psDCMq6b9
 BdAZe1Ovpcb4kKWCP4t8G8K/7CJlXKC2fhUlMn2PklQX4oPYNEiPuLfsvnp1XZAEL0sD
 0aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9pb3Jn+Vd+nDYRO/WKHx1a5dMNfMG+2SwDRrQcgz14A=;
 b=i6yRMSDorvwuQVsF/A70yksmCMsku0383T3qpAGEuEsDX+T59U89DNpkmTt3ZVymSz
 NBpyhYtNjXMEy0CWVYGELuOQlG3TBjegrLxmp/ZFK3oGEVeglFji1mfzgvoWmwg5Y2TB
 L3NKkisnA8llG58R+RuYi5ibl49bkP6f0VjihAKgMKvquOhHO+eHdjXv27oObj+rfYvm
 2C7mVZjhGM1r7Zbz4nwZWPNQZjGtXYzI4wfGaDcnGz/Eyj8PGZnIakvlUIrwkRVEpenK
 CAUvANamCHbjCXUnTKFxLTjYbDBdaa5NjDWpUhNA3/2Ddu3yaaYUw3lGtWjNRaKZyl3w
 ocaw==
X-Gm-Message-State: APjAAAX4LZ7Xj3HY3qBwgqjca24jeufpDQsOdQi3rMGSrLz+1WWG0Jwa
 mz4WM3wWp988zmno9zjjd5M=
X-Google-Smtp-Source: APXvYqwJitXju3fizMVEW7pWswOKDMbqed3Yj6lTTZT5fp0epxAX+wzjtiPHMb8hQMZDeFkYoswyMQ==
X-Received: by 2002:a62:e501:: with SMTP id n1mr5757562pff.17.1556822046126;
 Thu, 02 May 2019 11:34:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id n15sm34696825pfb.111.2019.05.02.11.34.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 11:34:05 -0700 (PDT)
Date: Thu, 2 May 2019 11:32:31 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190502183230.GA25229@Asurada-Nvidia.nvidia.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
 <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm
	runtime function
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

On Thu, May 02, 2019 at 09:13:58AM +0000, S.j. Wang wrote:
> > On Sun, Apr 28, 2019 at 02:24:54AM +0000, S.j. Wang wrote:
> > > Add pm runtime support and move clock handling there.
> > > Close the clocks at suspend to reduce the power consumption.
> > >
> > > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > > fsl_esai_resume is replaced by pm_runtime_force_resume.
> > 
> > This doesn't apply against for-5.2 again.  Sorry about this, I think this one is
> > due to some messups with my scripts which caused some patches to be
> > dropped for a while (and it's likely to be what happened the last time as
> > well).  Can you check and resend again please?  Like I say sorry about this, I
> > think it's my mistake.
> 
> I am checking, but I don't know why this patch failed in your side. I 
> Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, all are

I just tried to apply it against top of trees of for-next and for-5.2
and both were fine on my side too.

> Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git.

Btw, this git link no longer works for me, not sure why:
# git remote add broonie git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
# git fetch broonie
fatal: remote error: access denied or repository not exported: /m/korg/pub/scm/linux/kernel/git/broonie/sound.git

It started to work after I changed "git://" to "https://" though...
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
