Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3250967EFFD
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 21:54:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826AAE99;
	Fri, 27 Jan 2023 21:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826AAE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674852844;
	bh=EI2Cd7DddQ4cHwZUEfRyPJFASLDITgFJfNb4SBvJYLw=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NDhlVwRNvLBgsJzO5TESHVMAppjbUxEbKZvbS9sX1JiSTuX1mzXIez9dfLLI+aLEL
	 dX8jFqupSXeToHbPA7VVrBOuaaKPrYGdtPqJki61ImWpz9kMFX05/Apjn//jViAPOX
	 qr/wKsRMyDAf3EMdWE3BkOsvuBuUD1zw5qJEiXTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E736EF8007C;
	Fri, 27 Jan 2023 21:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2373F80272; Fri, 27 Jan 2023 21:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C44BBF8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 21:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44BBF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=R5OFcqos
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADE0CB821E5;
 Fri, 27 Jan 2023 20:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0AFC433D2;
 Fri, 27 Jan 2023 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1674852774;
 bh=EI2Cd7DddQ4cHwZUEfRyPJFASLDITgFJfNb4SBvJYLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R5OFcqos3HQAWVVDc/HnM15Sr+c+WZRBXzeCBu/YpesDbR+NFyB63Ki/LLNuDBZ2f
 hS07f2aywYK3zr3NoQh8p+ko9QG+Q9imfg82EVJHMXw1fLXczGfnCKUiEsrdNG86js
 60MpZ4Ka+SfAAhLTam2Bm0hf/FhlTGzPly4haWIM=
Date: Fri, 27 Jan 2023 12:52:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo
 instances
Message-Id: <20230127125253.0cee02d6e286b5f7ac63dab6@linux-foundation.org>
In-Reply-To: <20230127092708.43247f7e@booty>
References: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
 <20230126155526.3247785a@kernel.org>
 <20230127092708.43247f7e@booty>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: dev@openvswitch.org, alsa-devel@alsa-project.org,
 Leon Romanovsky <leon@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Pravin B Shelar <pshelar@ovn.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 09:27:08 +0100 Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > On Thu, 26 Jan 2023 16:22:05 +0100 Luca Ceresoli wrote:
> > > Fix typos and add the following to the scripts/spelling.txt:
> > > 
> > >   exsits||exists
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > You need to split this up per subsystem, I reckon :(
> 
> Ironically, it was the case initially but I have squashed my commits
> based on several prior commits that do it together. Now I rechecked
> and it seems like this happened only until July 2019, so apparently the
> policy has changed. Will split.

It's not worth the effort.  I'll send the patch upstream as-is.
