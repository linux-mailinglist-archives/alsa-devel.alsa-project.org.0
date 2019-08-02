Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3C7FDF9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1F21741;
	Fri,  2 Aug 2019 18:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1F21741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564761653;
	bh=2QJZiiHyoGxVVACdA8lS1DmhukWtSbOPvQHXGlu/wRo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAzJc7zVELlo2+5wCe4aXTszOLjweDWDFjmJbaZGHU7ztBsSDJi/mrGAc5M77MIc9
	 fu+DuLYE7UnZZOApVChXLIbTdQtF2Q2KHAK5GuTLEEfSiqAbrn+L+/14YjR/ScG2nv
	 ugLCvy9wfBMadLrGDXlSfcMfQCg7qE2yjW6ers7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E1DF80114;
	Fri,  2 Aug 2019 17:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA9DF8048F; Fri,  2 Aug 2019 17:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D9CF800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 17:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D9CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i07x/1lH"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71CC020B7C;
 Fri,  2 Aug 2019 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564761542;
 bh=E21+I1H59V6MsCfH6Fg5TnD0nRNFBekeAOLaNaiXMhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i07x/1lHjnA1/3bX90ONRyLaOlC349ccqPsirmEZhaaII6jwBVQO7oOAhanUx1tD9
 dxTwA5wvpLpxSehkUn8snlb+JVRCdYIoFX/IyEOL9zUCbsyouQA1oFUgLSvhFzwixj
 VhRZboa1ONpanDiL9lANnGP9pDoNPZun7UgZzPXA=
Date: Fri, 2 Aug 2019 21:27:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802155738.GR12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-7-pierre-louis.bossart@linux.intel.com>
 <20190802115537.GI12733@vkoul-mobl.Dlink>
 <6da5aeef-40bf-c9bb-fc18-4ac0b3961857@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6da5aeef-40bf-c9bb-fc18-4ac0b3961857@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 06/40] soundwire: intel: prevent
 possible dereference in hw_params
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

On 02-08-19, 10:16, Pierre-Louis Bossart wrote:
> 
> 
> On 8/2/19 6:55 AM, Vinod Koul wrote:
> > On 25-07-19, 18:39, Pierre-Louis Bossart wrote:
> > > This should not happen in production systems but we should test for
> > > all callback arguments before invoking the config_stream callback.
> > 
> > so you are saying callback arg is mandatory, if so please document that
> > assumption
> 
> no, what this says is that if a config_stream is provided then it needs to
> have a valid argument.

well typically args are not mandatory..

> I am not sure what you mean by "document that assumption", comment in the
> code (where?) or SoundWire documentation?

The callback documentation which in this is in include/linux/soundwire/sdw_intel.h

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
