Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232218A317
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 20:24:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C678B1723;
	Wed, 18 Mar 2020 20:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C678B1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584559449;
	bh=gBgAC4MCUjENfutwBUEEVOlspLJiECAVxxJALHkRwGw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gR/eRj6nPuwjYeZtw8lvCZeUm3xvRYIZtEL2uDS7rjYQ1PICi4IdqeasU63OuYrHu
	 OuemgSOPVj14jrFIMP+Pe4Y/L1SeFQsxlVlc+jP/HR9x1+HMnz1pDTXTkGh7MEfbL2
	 OonTYAlntDrlSaz7fznJOGmjyLlz916It6W576Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED82F8015B;
	Wed, 18 Mar 2020 20:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA8EF80139; Wed, 18 Mar 2020 20:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C77E9F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 20:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C77E9F800C0
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 60256200B3F;
 Wed, 18 Mar 2020 19:22:17 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 2602920B1A; Wed, 18 Mar 2020 20:22:13 +0100 (CET)
Date: Wed, 18 Mar 2020 20:22:13 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200318192213.GA2987@light.dominikbrodowski.net>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
Cc: alsa-devel@alsa-project.org, curtis@malainey.com,
 linux-kernel@vger.kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On Wed, Mar 18, 2020 at 07:27:58PM +0100, Cezary Rojewski wrote:
> On 2020-03-18 17:20, Dominik Brodowski wrote:
> > On Wed, Mar 18, 2020 at 10:13:54AM -0500, Pierre-Louis Bossart wrote:
> > > > > > While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
> > > > > > some sound-related trouble: after boot, the sound works fine -- but once I
> > > > > > suspend and resume my broadwell-based XPS13, I need to switch to headphone
> > > > > > and back to speaker to hear something. But what I hear isn't music but
> > > > > > garbled output.
> 
> > 
> > I had (see 18d78b64fddc), but not any more in years (and I'd like to keep
> > using I2S, which has worked flawlessly in these years).
> > 
> 
> Due to pandemic I'm working remotely and right now won't be able to test
> audio quality so focusing on the stream==NULL issue. And thus we got to help
> each other out : )

Sure, and thanks for taking a look at this!

> Could you verify issue reproduces on 5.6.0-rc1 on your machine?

It reproduces on 5.6.0-rc1 + i915-bugfix. I'm trying to bisect it further in
the background, but that may take quite some time.

Thanks,
	Dominik
