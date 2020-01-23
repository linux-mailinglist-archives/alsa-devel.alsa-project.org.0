Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89056146221
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 07:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0907E1681;
	Thu, 23 Jan 2020 07:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0907E1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579761901;
	bh=BmoIQNOCORmUCbDs5W8DADyK5hhc2lmoK3rAPlWrSzk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CM5Pyhj51s13LukTGl45TIZJtM8X1eTb0FI/0bWcDRP1+621/RG+r/codc2brfpNK
	 ObGO3imTjdcuwRMyOitrzKvc6hEpa0VaY2zHubX3B/gbVguyJy6b08jUEZMlL0I9/x
	 xXg0CNY0HzjjIC80IPC28n88788foQOjf69ikfQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F197F801D9;
	Thu, 23 Jan 2020 07:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62C7BF801D9; Thu, 23 Jan 2020 07:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E66AF80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 07:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E66AF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w1p1nQD4"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1835217F4;
 Thu, 23 Jan 2020 06:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579761788;
 bh=xAQZj9tFY1FT0CiNNJlEJTsbJX8801qGcsw3AFIuivc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1p1nQD4PvUFTg70UDMsv9EfZ/21Xb6vHclyPaNttcT2tmD7Nkl/6CbAKlx5qkAJ9
 IW/7KPBbFReuNQLWbmkkfVtwEjSBeCcX1Uj/WQPg0Pb6f9RjRKYTpfjwtVmqj2VStA
 cn5Mk5b6cLr/6f3zZXgg4BX7uMkzS9J9srW/Y6Cg=
Date: Thu, 23 Jan 2020 07:43:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200123064306.GA124954@kroah.com>
References: <20200122190752.3081016-1-perex@perex.cz>
 <26ae4dbd-b1b8-c640-0dc0-d8c2bbe666e2@linux.intel.com>
 <20200122202530.GG3833@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122202530.GG3833@sirena.org.uk>
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, Sasha Levin <sashal@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: topology: fix
 soc_tplg_fe_link_create() - link->dobj initialization order
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

On Wed, Jan 22, 2020 at 08:25:30PM +0000, Mark Brown wrote:
> On Wed, Jan 22, 2020 at 01:28:57PM -0600, Pierre-Louis Bossart wrote:
> > On 1/22/20 1:07 PM, Jaroslav Kysela wrote:
> 
> > > The code which checks the return value for snd_soc_add_dai_link() call
> > > in soc_tplg_fe_link_create() moved the snd_soc_add_dai_link() call before
> > > link->dobj members initialization.
> 
> > > While it does not affect the latest kernels, the old soc-core.c code
> > > in the stable kernels is affected. The snd_soc_add_dai_link() function uses
> > > the link->dobj.type member to check, if the link structure is valid.
> 
> > > Reorder the link->dobj initialization to make things work again.
> > > It's harmless for the recent code (and the structure should be properly
> > > initialized before other calls anyway).
> 
> > > The problem is in stable linux-5.4.y since version 5.4.11 when the
> > > upstream commit 76d270364932 was applied.
> 
> > I am not following. Is this a fix for linux-5.4-y only, or is it needed on
> > Mark's tree? In the latter case, what is broken? We've been using Mark's
> > tree without issues, wondering what we missed?
> 
> He's saying it's a fix for stable but it's just a cleanup and robustness
> improvement in current kernels - when the patch 76d270364932 (ASoC:
> topology: Check return value for snd_soc_add_dai_link()) was backported
> by the bot the bot missed some other context which triggered bugs.
> 
> Copying in Sasha and Greg for stable (not sure if the list works by
> itself).

How this was marked-up is fine, our scripts can easily handle it,
thanks.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
