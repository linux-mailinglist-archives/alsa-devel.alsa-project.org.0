Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B15180ED
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 22:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A561AB3;
	Wed,  8 May 2019 22:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A561AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557346751;
	bh=n63kFSBkTAxlclnaJ81KdxDY6s/frNk78U1qg7yetmc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njZmhNlN8aT0iic4Lto4yZlLzz9i7fEhJQGHJYscO0rb1EKZS6AkcIod3u4roNXNn
	 e+UkWIuz0wv00sKPsVYfPPtjFQCmiBaPvEkorXqClBEI+f1WYaS1XDwt1IqYl3qv6U
	 c2C/dj3KI9Jqlwq5wh8WIv3FJIrIRxKKERoxxMnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4268BF896FF;
	Wed,  8 May 2019 22:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D2AF896F0; Wed,  8 May 2019 22:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22407F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 22:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22407F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PrEZemy9"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D8BA204FD;
 Wed,  8 May 2019 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557333442;
 bh=NlfKCG9jMJHSiy8XCNRv8HGi94api0Xr6KGSgF95ErU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrEZemy9MtO/iEofqPEh8w7QHvYH99dcTl9muPhmYkwmsEKmo4wsjiWvkyet2/LLK
 pvtJur3xU27oyW2UjY9GH3lnz2MQ2a4F/YX8/YFjOnLU/i1lJOWYOwXX0fof2AxGcz
 ktwHSrHnkwWayX1d+jUlPzV8BZ3aLxRQRDYsRyyA=
Date: Wed, 8 May 2019 22:07:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190508163717.GX16052@vkoul-mobl>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
 <20190507122651.GO16052@vkoul-mobl>
 <47fd3ca6-6910-f101-9b63-f653cd1443f9@linux.intel.com>
 <20190508050853.GT16052@vkoul-mobl>
 <a6b3f1d1-c815-3c6b-7f35-ac5cc98960b2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6b3f1d1-c815-3c6b-7f35-ac5cc98960b2@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/8] soundwire: intel: filter SoundWire
 controller device search
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

On 08-05-19, 11:20, Pierre-Louis Bossart wrote:
> 
> > > > > +	/*
> > > > > +	 * On some Intel platforms, multiple children of the HDAS
> > > > > +	 * device can be found, but only one of them is the SoundWire
> > > > > +	 * controller. The SNDW device is always exposed with
> > > > > +	 * Name(_ADR, 0x40000000) so filter accordingly
> > > > > +	 */
> > > > > +	if (adr != 0x40000000)
> > > > 
> > > > I do not recall if 4 corresponds to the links you have or soundwire
> > > > device type, is this number documented somewhere is HDA specs?
> > > 
> > > I thought it was a magic number, but I did check and for once it's
> > > documented and the values match the spec :-)
> > > I see in the ACPI docs bits 31..28 set to 4 indicate a SoundWire Link Type
> > > and bits 3..0 indicate the SoundWire controller instance, the rest is
> > > reserved to zero.
> > 
> > So in that case we should mask with bits 31..28 and match, who knows you
> > may have multiple controller instances in future
> 
> yes, I was planning on only using the link type.
> 
> > I had a vague recollection that this was documented in the spec, glad
> > that in turned out to be the case.
> > 
> > Btw was the update to HDA spec made public?
> 
> Not that I know of. The previous NHLT public doc has actually disappeared
> from the Intel site and I can't find it any longer, so currently the amount
> of public documentation is trending to zero :-(
> 
> > 
> > > > Also it might good to create a define for this
> > > 
> > > I will respin this one to add the documentation above, and only filter on
> > > the 4 ms-bits. Thanks for forcing me to RTFM :-)

Yeah about that someone was indeed complaining about that on IRC, it is
shame that link is valid but doc is gone... check with Rakesh or someone
they might have a copy...

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
