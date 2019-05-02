Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6111C81
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 17:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4452A17D1;
	Thu,  2 May 2019 17:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4452A17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556810486;
	bh=pq8wVdMSVxp8J7XHESOLzfpPkxlJvJOBlTAg8/ROVFc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrKjKsjUIaCgTgSa37m89dqaGdjMzcMZ+benNFhaLmTzEvxjdMCD6lgajSdYcSAY+
	 L3acbph1CPnuwECTze/s2eHqcbcc3jHSOprEbb8n6FS11SqTcnom5b0UZnzDywNxb4
	 oNQWM6UwZ5KpnQrV2O9gVR0WdVW7vL3BywNiHh48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CDFF896AA;
	Thu,  2 May 2019 17:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2BE7F896C7; Thu,  2 May 2019 17:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B35DF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 17:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B35DF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jnwMR4RZ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A22220675;
 Thu,  2 May 2019 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556810375;
 bh=+8qEsuCHaZrMRG+V++/Uz5BxQxtwwBclvz8xEdWjKgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jnwMR4RZfBk3R55orLhj3VVbW61l/17ZMrhZk50RcKgdLdaKtM6FwjWg3GGvoCR+y
 G3XH2LmqPvMHtv2H8knA5Lm958DnFoE6ieTa64YU9Iclgcn8wPGwX4yxqQ1DFBbR6H
 e3U7M3tNbU6u45bmfRU3nDkgoTIOPJm4cay526Jw=
Date: Thu, 2 May 2019 17:19:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502151933.GA32285@kroah.com>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, Shreyas NC <shreyas.nc@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 00/14] soundwire: more code cleanups
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

On Thu, May 02, 2019 at 04:29:16PM +0530, Vinod Koul wrote:
> After applying cleanup from Pierre, I realized few more things can be
> cleaned up as well, so fixing these instance in the subsystem.
> 
> Looks like bool is no longer encouraged, but I have skipped those and few
> alignment as they caused code to look worse.
> 
> Greg,
> if you are okay I would like to add this as well (i know it is late, but
> they are cosmetic changes and no logic ones, let me know and I can
> send a updated PR)

This made no sense, as it was on top of Pierre's patches.

I've applied both his, and your, patch series to the tree now, hopefully
this type of mess doesn't happen again in the future.

Please be a lot more specific as to what you expect me to do with a
patch series, and what exactly it is for/against/after, as this was not
obvious at all.

ugh, someone owes me a drink...

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
