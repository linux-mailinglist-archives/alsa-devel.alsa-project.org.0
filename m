Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A911C94
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 17:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40041172C;
	Thu,  2 May 2019 17:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40041172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556810567;
	bh=pv5cXNb8IigNeo2hm38oFjOGKfgjgj6MOWXw9XvmJNE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EPeG3AecqFQFJXAXNvdrB6MPAWKXrTGwjQDqX/TCfgNICvYbsqLiAW4CZNb7zHETL
	 U+5ZJlxKjXNOt8oDuizERxnsYnhORh40PbTwZYySkEfiAAh3dPZjc3mS7NBHBkaVyv
	 YgOLFuyo53JA31dnYAAeRLGpDn918mwU1czTDZ14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AFC8F89723;
	Thu,  2 May 2019 17:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F39F896EC; Thu,  2 May 2019 17:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15A0F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 17:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15A0F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SPED1nB2"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9FB720675;
 Thu,  2 May 2019 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556810441;
 bh=VwVv5pkVJxxYiHP9++DNcTTZ93XIjWNMwembG0jFXGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SPED1nB2+LklDy1rMxuMbgGZRKeuokCGJ1iXrBKdLyWnuUMPrRqwU6G89vMsHvfWV
 8Raysc0bYnCvKGOrB4xeFTQgOjePvunnhkgTI6ZgS2EcZ1iykoLWqYrTuYwzEZrFAs
 p9bzc69JINerVNCCuyLuzFaaTwlCltDvEzQ6Hk00=
Date: Thu, 2 May 2019 17:20:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502152038.GA32631@kroah.com>
References: <20190502105930.9889-1-vkoul@kernel.org>
 <20190502105930.9889-2-vkoul@kernel.org>
 <20190502150754.GA17197@kroah.com>
 <20190502151502.GR3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502151502.GR3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, Shreyas NC <shreyas.nc@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/14] soundwire: fix kconfig help format
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

On Thu, May 02, 2019 at 08:45:02PM +0530, Vinod Koul wrote:
> > That's a really really shitty thing to do, I'm going to go take his
> > version of these patches instead, let me see how they line up...
> 
> Honestly, this is a terrible accusation, seems everyone is quick to jump
> and yell at others. I asking for an apology.

Our emails crossed, I already sent it, sorry about that.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
