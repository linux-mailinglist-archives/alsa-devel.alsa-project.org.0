Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E5925B4
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 16:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9311680;
	Mon, 19 Aug 2019 16:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9311680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566223296;
	bh=aoXIUhpkrx9yS4wCuop5z7rIkFn5L4lmYclI1tJB5b4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeQl35OXQnbZ7qR6pA1Pk71c1CUVYfBqfvsUGg4g9IgzgmH/kJYV3XbrgkjfSH/1n
	 REbpPO/Rv2+LTEkSq59zkv3MG8BIEnwbw92KZ+auYCCUr8LmSq48GZ2Y91yBuBlAZl
	 1ZvCFP1fYIwwwDd30fHZ8amR/dcQKUHQmq4DkAlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3166AF80307;
	Mon, 19 Aug 2019 15:59:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 200E9F802FB; Mon, 19 Aug 2019 15:56:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE2DF802BE
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 15:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE2DF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cQX2N7gf"
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8CB62086C;
 Mon, 19 Aug 2019 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566222387;
 bh=13q1x7AykpFWcHNnf6/8IJPLQU7HhLxu+8U0C2nXZSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQX2N7gfLgKB0KTTA7/eKHh0/Qeko04sBDd1SMjOaSbSjKPpBy5oS2nBSHgWNC/yp
 2UvoR+ansR1Bm5lTgiIWtx6mXhLoTpijhXnRRvEl/GnCYf04CIxM/Lc1DfDRvNUCsq
 VO/IuYTe9W+Yqf1RjUgq8wmJTb/f/ESU3zMaHTJM=
Date: Mon, 19 Aug 2019 15:46:17 +0200
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190819134616.GR5999@X250>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
 <20190815164942.GB4841@sirena.co.uk>
 <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: SOF: Add OF DSP device support
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

On Fri, Aug 16, 2019 at 11:43:13AM +0300, Daniel Baluta wrote:
> Hi Mark,
> 
> On Thu, Aug 15, 2019 at 7:50 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Aug 15, 2019 at 10:44:58AM -0500, Pierre-Louis Bossart wrote:
> > > From: Daniel Baluta <daniel.baluta@nxp.com>
> > >
> > > Add support for device tree based SOF DSP devices.
> >
> > I'm not seeing any binding documentation here.  Binding documentation is
> > required for any new device tree bindings supported in code.
> 
> Binding documentation together with the actual dts nodes were sent
> to Shawn.
> 
> https://lkml.org/lkml/2019/8/7/682
> 
> Shawn,
> 
> Can you pick 4/5 and 5/5 patches from series above? 1-3 are sent to
> Mark to go through to alsa tree.

I just picked up DTS patch (4/5), but DT bindings should generally go
through driver/subsystem tree as preference.

Shawn
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
