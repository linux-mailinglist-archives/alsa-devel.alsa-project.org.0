Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6B18F46B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A551654;
	Mon, 23 Mar 2020 13:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A551654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584966228;
	bh=Q6UWJ6CTMLxIdDC18ljrZ1TmH7PiRKcFcEA8DiZf0os=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lxb5jn2Ykm2I4aFmAQiZQGmYnX+f6v+a0iwb0VHhXWgx8bqLL2dRbsd1X7Hz4ForF
	 jOjcDhV5BnDeWruA583UDuM1aPvaFk4Aq/zF2Sd+6/RA9zsy4yrQZ6qm1krW7bvot8
	 kD5MWlBSGsD6rx00yvmeOccgzp2LtnlFjLWV7UhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D46DAF800B9;
	Mon, 23 Mar 2020 13:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A531EF80158; Mon, 23 Mar 2020 13:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5831FF800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5831FF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XwTG6U8l"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE26220637;
 Mon, 23 Mar 2020 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584966120;
 bh=Q6UWJ6CTMLxIdDC18ljrZ1TmH7PiRKcFcEA8DiZf0os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XwTG6U8lgG7fX9ExmzfknEd8tI4N7M6X3Z8LIsRWjn9z+jg3NShSw0hGd/d96d/KV
 ghILVin2zzwR1GleB8xK2PChlCQk0DXv4BdsNDOy7Zn44jHZLds8rD3fgzXRXFS5Gm
 pK/pE1jKHZBQPW4n+1AjQIVZFq6eGUjEflYpz6DI=
Date: Mon, 23 Mar 2020 13:21:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [GIT PULL]: soundwire updates for v5.7-rc1
Message-ID: <20200323122146.GA862622@kroah.com>
References: <20200323121151.GI72691@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323121151.GI72691@vkoul-mobl>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Mar 23, 2020 at 05:41:51PM +0530, Vinod Koul wrote:
> Hi Greg,
> 
> Here are the changes for this cycle. Bunch of stream related and pm
> related changes to core and Intel drivers. Few changes to QC driver too
> Please pull.
> 
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
> 
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.7-rc1

Pulled and pushed out, thanks.

greg k-h
