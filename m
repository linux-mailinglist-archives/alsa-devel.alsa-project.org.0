Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EAD17522
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A131939;
	Wed,  8 May 2019 11:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A131939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557307776;
	bh=JvyWcanWBLZINgz8fofKjtdj04u1VJymJDhBNY6OLH8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIBcbNfzJsrnydPc7+gN0DVhoYVI49sPVfacUM0uBOYZNTTyrmmHNHaYBBxkwNHC5
	 zfy0TAJbEMaZrA9NwsWaFjv/C1Bfk+vn+yheYG9nL4OsWOzC1hKBEPl+8TkKHDLP3v
	 1gGVx4RLLbZaVWpDuyiakj9lI7ONhjUbIhRnDiSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D06AF807B5;
	Wed,  8 May 2019 11:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5179F896F0; Wed,  8 May 2019 11:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA74CF807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA74CF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="oLYovJpQ"
Received: by mail-ot1-x344.google.com with SMTP id v17so9645338otp.13
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MSqNgrsLtNBXLGznGmoFRunkzRNXPgUP8J7R97TT8p4=;
 b=oLYovJpQrqaO3PpZd84JU3tCT81WxtoMOQ1vWPDk8+t2uiOHPU7mJKWIwqCVfHyXX1
 Q0d0HGlQ+9K+3fedxGDFMo863SH/bXuWpTxcEx1fKxAW46QFdmawwpxpnWEw8/UzUpzI
 UbX6UEBIr6wdOTVGcQZQ3Xn7aU8xsiPbamE74sUcpz8CuOqsOrgKo27xJA+L7B8njF8u
 03OPz5c7fFL15hQ+OmSYYrOwbGM5Ui+41YQAt4Pm4x4zYbcW6BToVMDmrcYAyga+BDaS
 NLJ5mEn8ll9Yk+h1TpYqR6FxxIGYLzqNOY98G1Y8LyjPYm5UtthaE0l4FdW8D1mROkKB
 /P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MSqNgrsLtNBXLGznGmoFRunkzRNXPgUP8J7R97TT8p4=;
 b=JwGEkA2Jb+Q5dsh4wmO3RtTztPBExetuWwBP8JprP3PrzYrgWIFxTLGYvE8wF3hLZJ
 P1v60MMHpbNN1l9uiZ3bts8hUEllDvV6nx00le9N7sPbOnWA89Vdzwejx1wRavFyYsgI
 4FKPDKyfFygKikMgb6NB7lmBV7ZKgh3QtOBnNqGniY2A2ZxPLRfh6uOIRDwR8KBqVf6p
 qeclXcBQcT9Lj+TuZfZOxDerx9ibaCLSap//ZJynoR/uzUi6EiSGU0GHSynhqh18dJBm
 sfFnsEHs/NLVpqA3MlZDp8/4BTk08Ij84hOIEL44CSgVAJC6CrQL+kHS6zDLG9cZzBfW
 og9Q==
X-Gm-Message-State: APjAAAWpy7cavhRHSvX1BTCkMFnnPzbBgjAAmS4LCdsH2yoO8DtZvj2h
 X5IYgTAqRRafLccBaN13+9tLWxeCenzge+XXoJW6+Q==
X-Google-Smtp-Source: APXvYqwfLpqE90W7yODVkoAdC6x1Rc+hA7QnAOYlFzofQsgaYLv+CD0faEA2A8WcfsFVZMYBwjtw6NGMr7s6KkcXeEc=
X-Received: by 2002:a05:6830:16ce:: with SMTP id
 l14mr24920428otr.108.1557307666684; 
 Wed, 08 May 2019 02:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190507051140.240245-1-tzungbi@google.com>
 <20190508063318.GL14916@sirena.org.uk>
In-Reply-To: <20190508063318.GL14916@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 8 May 2019 17:27:35 +0800
Message-ID: <CA+Px+wWQpvE5H=vM+0u_c3xpuZ8ivfgy0_xB84Ty_dvMAqBSVg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Dylan Reid <dgreid@google.com>, tiwai@suse.com,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: release GPIO when
	component removing
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

> On Tue, May 07, 2019 at 01:11:40PM +0800, Tzung-Bi Shih wrote:
>
> > +static void max98357a_component_remove(struct snd_soc_component *component)
> > +{
> > +     struct max98357a_priv *max98357a =
> > +                     snd_soc_component_get_drvdata(component);
> > +
> > +     if (max98357a->sdmode)
> > +             devm_gpiod_put(component->dev, max98357a->sdmode);
> > +}
>
> This is an obvious mess, if you're explicitly freeing devm_ allocated
> resources in the common case something is going wrong.  Just move the
> initial allocation to the device level probe so devm can do what it's
> supposed to.

Move the GPIO allocation to max98357a_platform_probe() should work but
I am wondering the difference between device's probe() and component's
probe().  What do we expect to do in component's probe()?
As component's probe() is later than device's, I thought we tend to
put resource allocation in component's probe() for reasons:
- to speed up the booting *maybe* a little
- to allocate resources when really need them

I am using devm_gpiod_put() instead of gpiod_put() so that I suppose
devm_ should take care of the rest of cleanup.  Do you think this is
still a mess?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
