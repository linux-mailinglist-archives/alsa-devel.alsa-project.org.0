Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B92CFC0A
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 17:32:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5F71927;
	Sat,  5 Dec 2020 17:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5F71927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607185921;
	bh=Go2i9I5GYis0bcDmAK3eXZgV1WFDP4tUKeevAYtLQJs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/M+pyh6OezMRRm8ku6qjBZUZP0KnQDK7Fnq336WTHCccARBadmRilZHDihnwOjxK
	 5z+2xtSl6y3a62yKi3TzXI6cl7uz8NABiH8VtjWu0bX0vTz2ou4m1+vqatwxoUifuZ
	 mX79fRzdlN4OR2W7/N9nXrVjNst4cLheEK6lsoXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08850F800E2;
	Sat,  5 Dec 2020 17:30:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57580F8016D; Sat,  5 Dec 2020 17:30:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AEAEF800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 17:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEAEF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="OUPABwyZ"
Date: Sat, 5 Dec 2020 17:31:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607185817;
 bh=Go2i9I5GYis0bcDmAK3eXZgV1WFDP4tUKeevAYtLQJs=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUPABwyZTw922my5NtydwlJm7wnfm6+/Ljby83zLRdPoMSaj1GJRrUhMHF3kViv+k
 a2QmQ0k77SEr5lBT+5vXR3k9NEBJmkXF69r5tXCDn4yJ1SUflhOZqRvD8AvO0DMQKB
 myFLRZkmcrZ9R3SRwWK2FRuPNygDhO1gC5F7ww2w=
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/7] regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
Message-ID: <X8u147aZbdrj6qN7@kroah.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-6-yung-chuan.liao@linux.intel.com>
 <20201205074630.GS8403@vkoul-mobl>
 <e4e3d7ea-0825-2c8c-4182-6d1b578200a3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4e3d7ea-0825-2c8c-4182-6d1b578200a3@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Vinod Koul <vkoul@kernel.org>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On Sat, Dec 05, 2020 at 08:52:50AM -0600, Pierre-Louis Bossart wrote:
> 
> > >   MODULE_DESCRIPTION("Regmap SoundWire MBQ Module");
> > > -MODULE_LICENSE("GPL v2");
> > > +MODULE_LICENSE("GPL");
> > 
> > Why do you want to change this ?
> 
> We only use MODULE_LICENSE("GPL") for new contributions since 'GPL v2' does
> not bring any information on the license, is equivalent to 'GPL' and only
> exists for 'historical reasons', see
> 
> https://www.kernel.org/doc/html/latest/process/license-rules.html
> 
> 
> “GPL”	Module is licensed under GPL version 2. This does not express any
> distinction between GPL-2.0-only or GPL-2.0-or-later. The exact license
> information can only be determined via the license information in the
> corresponding source files.
> 
> “GPL v2”	Same as “GPL”. It exists for historic reasons.
> 
> We should have used 'GPL' in the initial regmap MBQ patch but didn't for
> some reason, this change just realigns with what we intended.
> 
> That said, this is unrelated to this no_pm patch so could be in a separate
> one if you preferred it that way.

It should be separate as it does not have anything to do with the real
reason this patch was submitted.

thanks,

greg k-h
