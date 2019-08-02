Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22147FFED
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA3616DF;
	Fri,  2 Aug 2019 19:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA3616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564768694;
	bh=BXGrBstt19RWs+AIrhy7FuXt5JkfsO2/aE9lyXfE/vI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amHMMQ471CWbnp1z8zgZa86CZc1VmqLVhh9M/zzNbWzF1ZeL0m8IMr2QNpSCb6zub
	 YZp/NTe6MyZXBpzWX76PFyzO78dVEKxXe6U8rQvhIpeDT8HdMsddFIBCgOy+1+o5V1
	 KVUWvs7bhwTWeSvoAo+YTDfrjK1J4ceAfSrtbJAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C13BCF8049A;
	Fri,  2 Aug 2019 19:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C0A5F8049B; Fri,  2 Aug 2019 19:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2365CF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2365CF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1YRuXRZ2"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A8B32171F;
 Fri,  2 Aug 2019 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564767525;
 bh=JFlo0hd8b2cvmNPi8HS4NNA9dAnHWTxHjhwDFVTzlpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1YRuXRZ2R+4pLMF8Lug3V25dSOvWufl7EejpqZTLSoid4tLvge3J8qYdX8iKCFuL/
 OONHBsH0512YwnLTxQ6/VvfV56HGnj3Wbxu72/DHGfh59gBnWWPvczkkikZoeuDwrl
 SzT80OHXJACPyOufg374ip7DeDf8YIMtij8kglz0=
Date: Fri, 2 Aug 2019 23:07:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802173732.GF12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-7-pierre-louis.bossart@linux.intel.com>
 <20190802115537.GI12733@vkoul-mobl.Dlink>
 <6da5aeef-40bf-c9bb-fc18-4ac0b3961857@linux.intel.com>
 <20190802155738.GR12733@vkoul-mobl.Dlink>
 <884a13fc-08eb-10c9-de9c-50cf38ff533d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <884a13fc-08eb-10c9-de9c-50cf38ff533d@linux.intel.com>
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

On 02-08-19, 11:52, Pierre-Louis Bossart wrote:
> 
> 
> On 8/2/19 10:57 AM, Vinod Koul wrote:
> > On 02-08-19, 10:16, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > On 8/2/19 6:55 AM, Vinod Koul wrote:
> > > > On 25-07-19, 18:39, Pierre-Louis Bossart wrote:
> > > > > This should not happen in production systems but we should test for
> > > > > all callback arguments before invoking the config_stream callback.
> > > > 
> > > > so you are saying callback arg is mandatory, if so please document that
> > > > assumption
> > > 
> > > no, what this says is that if a config_stream is provided then it needs to
> > > have a valid argument.
> > 
> > well typically args are not mandatory..
> > 
> > > I am not sure what you mean by "document that assumption", comment in the
> > > code (where?) or SoundWire documentation?
> > 
> > The callback documentation which in this is in include/linux/soundwire/sdw_intel.h
> > 
> 
> /**
>  * struct sdw_intel_ops: Intel audio driver callback ops
>  *
>  * @config_stream: configure the stream with the hw_params
>  */
> struct sdw_intel_ops {
> 	int (*config_stream)(void *arg, void *substream,
> 			     void *dai, void *hw_params, int stream_num);
> };
> 
> all parameters are mandatory really, not sure what you are trying to get at.

It would be good to make a note that argument is mandatory!

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
