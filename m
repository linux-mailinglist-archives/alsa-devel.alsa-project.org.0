Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B773C9689
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 05:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6816F167F;
	Thu, 15 Jul 2021 05:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6816F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626320486;
	bh=OkgS2pB7a5nCaJU52FqWdJQmG4zQ/8g/w43wr4FQkrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9X64A8izc/8pvHo9NXrmjCd2S53eYzm5DMbbMjPCBuBRIuEDGEl6EMPE5UihMtHb
	 sQuYmh66HH+vzVx7CON2H84W7Pz6B1wXj3n20Bk9/dyxhUrU/zmcK9x1GG9fb66ALc
	 4JtWe8YV1TX8zIFpG0A181SFWBPURcTh8WvGwse4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3756F80229;
	Thu, 15 Jul 2021 05:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8DB7F80217; Thu, 15 Jul 2021 05:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7501EF8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 05:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7501EF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XiXaXbDt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E84C36128B;
 Thu, 15 Jul 2021 03:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626320390;
 bh=OkgS2pB7a5nCaJU52FqWdJQmG4zQ/8g/w43wr4FQkrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XiXaXbDtUlBTMqBPheN6vNia0Zqm9MwrIRv6laAGKq13IBny+WE+lKjamRRm+A1Zd
 XcIlhxz4YwV1ghxgaR+mOifcC7QOi/aYbd+gPchZLVSsGfPBNRDrNr61wj8/Nv2+KG
 y2yJYdFfiq6PcvOvaEs8T6HFSDVPL5NcT7ms23FrihgIq6v0kjJN6C3QbUsZByWoLb
 VgrjPTA0Hxnl+IpsiewME4q8UAhIAl8jiVFAVODryG0pTflEfh4MLNzEZC7MDmYiGu
 gdNYIsR9dOR0Baj9HTqnwNDvIr0Lz9sF1acE/e7QCtWtD0MDy03H+ryxibTJQowWwN
 mMH677nkSsvhQ==
Date: Thu, 15 Jul 2021 09:09:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/2] ALSA: compress: Cleanup and a potential fix
Message-ID: <YO+uAyrdT1xzLFIa@matsya>
References: <20210714162424.4412-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714162424.4412-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On 14-07-21, 18:24, Takashi Iwai wrote:
> Hi,
> 
> this series contains a couple of patches for compress-offload API, one
> for a cleanup of unused API functions and another for the proper mutex
> initialization.  I stumbled on the second while doing the first.

Thanks for the cleanup. We never have a compress only device and it is a
mix of PCM and compress FEs mostly :)

So:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
