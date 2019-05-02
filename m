Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46328112AA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30EF177C;
	Thu,  2 May 2019 07:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30EF177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556775717;
	bh=dlSBvXa+uObLbAYXwV1YM7ehXDSPcmA0D0oXU/1z20c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3h33HbJDgswDzuOM+OgkqkRnSwE+Zp8o2AJA46uNuC10OKR/hYs7ZNkRLLL/wq5U
	 U1RvND0PAFWRCdW2YDrsrUiDFpUgscCzVS6f73iqD/5+q2P2nztpPaHcsNdoL+1WW1
	 WVQk3Xa37hGHTPsoVSjBksYjR0/fBc5SCUO+t5I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5460F896EA;
	Thu,  2 May 2019 07:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A04DF896AA; Thu,  2 May 2019 07:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD1CF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD1CF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lU2gW1eM"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30DE020873;
 Thu,  2 May 2019 05:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556775605;
 bh=KaJg4Insj81qVuOaZzwgno+jYYq4b7sV6fPvH+HM3jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lU2gW1eMhYpYLQ7+0t2kSId0hdhuewCytT3VArPYkYF3mOS5YHZ3wFMeUImT5mUDM
 E5O33ekz3+qslsnqioQr1RjwCceW3+yO+xS5k9pw7BXm+LaMnUlH1R5XFdK7GqG50q
 ZOcxujVjPMAbittO8IQ5zjf+KcKKnlbHaQS88sNY=
Date: Thu, 2 May 2019 11:09:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190502053956.GF3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501160755.GC19281@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501160755.GC19281@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com
Subject: Re: [alsa-devel] [PATCH v4 00/22] soundwire: code cleanup
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

On 01-05-19, 18:07, Greg KH wrote:
> On Wed, May 01, 2019 at 10:57:23AM -0500, Pierre-Louis Bossart wrote:
> > SoundWire support will be provided in Linux with the Sound Open
> > Firmware (SOF) on Intel platforms. Before we start adding the missing
> > pieces, there are a number of warnings and style issues reported by
> > checkpatch, cppcheck and Coccinelle that need to be cleaned-up.
> > 
> > Changes since v3:
> > patch 1,3,4 were merged for 5.2-rc1
> > No code change, only split patch2 in 21 patches to make Vinod
> > happy. Each patch only fixes a specific issue. patch 5 is now patch22
> > and wasn't changed. Not sure why Vinod reported the patch didn't
> > apply.
> > Added Takashi's Reviewed-by tag in all patches since the code is
> > exactly the same as in v3.
> 
> These all look good to me:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Vinod, want me to just pick these up from the list as-is so we can get
> them into 5.2-rc1?

Thanks Greg, I would still like modification to patches that touch core
subsystem parts and drivers in a single one. Otherwise changes are fine.

So I will go ahead and apply the rest and send you a PR tomorrow giving
a chance to Pierre to update these (ofcourse they will be in linux-next
tomorrow)

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
