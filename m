Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A900C2555A7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2131873;
	Fri, 28 Aug 2020 09:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2131873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598601073;
	bh=0tjlBtvKkul42khLrBsQqQgWErMtE09glUlRUTYCCew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVZe1ScZ5yQY8zXwelxhwG5v1oWjmw5ZwIVscKAftrYFew+OFJwEjFsFswieyeR5p
	 YQ5gfMfCB7kWuS00eCkGNx0PZP/xY6yYMtAKBwkn5MD0GnGZ06h6wFbrHILQuhL3dT
	 3GXpUDjtu3ZbnnYo9dn2XbYuxF8gnFihdTYq5oXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18309F80118;
	Fri, 28 Aug 2020 09:49:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 347D3F8016F; Fri, 28 Aug 2020 09:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A89AF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A89AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VqrnaPtR"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4AAE2078A;
 Fri, 28 Aug 2020 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598600962;
 bh=0tjlBtvKkul42khLrBsQqQgWErMtE09glUlRUTYCCew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqrnaPtRoobZq9TXSgog8vE3JTy6fqzJTUpBC6OTs01lYX4RtXxLE3RLFokwkcx7t
 HbNkkNEIJdvesNgWMu5FZf0MPvc1VJuiuBb9QjGXZjtuO/Ajk9lU909es7h794cIdy
 JNdJAw3OxZihqgPqeCUO4lbm69gUq9DsCAXNSV5s=
Date: Fri, 28 Aug 2020 13:19:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for
 the first cpu_dai
Message-ID: <20200828074918.GN2639@vkoul-mobl>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
 <20200826094636.GB2639@vkoul-mobl>
 <5a7b75e5-4d64-9927-df81-68164ef2662a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a7b75e5-4d64-9927-df81-68164ef2662a@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
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

On 26-08-20, 09:35, Pierre-Louis Bossart wrote:
> 
> > > -	ret = sdw_prepare_stream(dma->stream);
> > > +	/*
> > > +	 * All cpu dais belong to a stream. To ensure sdw_prepare_stream
> > > +	 * is called once per stream, we should call it only when
> > > +	 * dai = first_cpu_dai.
> > > +	 */
> > > +	if (first_cpu_dai == dai)
> > > +		ret = sdw_prepare_stream(dma->stream);
> > 
> > Hmmm why not use the one place which is unique in the card to call this,
> > hint machine dais are only called once.
> 
> we are already calling directly sdw_startup_stream() and
> sdw_shutdown_stream() from the machine driver.
> 
> We could call sdw_stream_enable() in the dailink .trigger as well, since it
> only calls the stream API.

Correct :)

> However for both .prepare() and .hw_free() there are a set of dai-level
> configurations using static functions defined only in intel.c, and I don't
> think we can move the code to the machine driver, or split the
> prepare/hw_free in two (dailink and dai operations).

Cant they be exported and continue to call those apis

> I am not against your idea, I am not sure if it can be done.
> 
> Would you be ok to merge this as a first step and let us work on an
> optimization later (which would require ASoC/SoundWire synchronization)?

The problem is that we add one flag then another and it does become an
issue eventually, better to do the right thing now than later.

-- 
~Vinod
