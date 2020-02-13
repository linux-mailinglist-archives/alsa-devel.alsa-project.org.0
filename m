Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE615B890
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 05:25:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7639166D;
	Thu, 13 Feb 2020 05:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7639166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581567940;
	bh=UklSzqsIizfb2ZqVi/STRFoQZ51NdIBaypk0QEOPfzc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqR0IG00ysdYywrr9a6l1fHFH7vXzJlfF+39fXUQVDZsLMVh8jylbX3isx4s5nEnG
	 GpZjGo8pKehsAM1UOXW+dzcyxHaXkqV4oNU8AQFPAOuhnLNk4T5zirmY9JhlDSJUPE
	 FQJmRRRExQxmtKk97rqldm9mTBjaqedmVLQLH4zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB59F80139;
	Thu, 13 Feb 2020 05:23:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA68F80145; Thu, 13 Feb 2020 05:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33691F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 05:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33691F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lMpVF6tI"
Received: from localhost (unknown [106.201.58.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93A87206ED;
 Thu, 13 Feb 2020 04:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581567830;
 bh=oFuIKIBbpfNJBIKi9hk26HAIHYBy5AhoYQE6BtbHQ9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMpVF6tIkzuSqTk30LsQb7Tf+42ncsEE9P1Dn7O+0GWQ/HLAEtHpecBJaBseE/iJJ
 7UsYE+9ClL8TrQAnSG+ARtHxSvTfTVEhLF7sz5s2dfMHW/FhSS/CSc1S0niFxNkY/e
 nVZTLYtnEYnA+2Vf0pq9rbPMp+hhNwYPr3oHdD2Q=
Date: Thu, 13 Feb 2020 09:53:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200213042344.GC2618@vkoul-mobl>
References: <20200114234257.14336-1-pierre-louis.bossart@linux.intel.com>
 <20200114234257.14336-6-pierre-louis.bossart@linux.intel.com>
 <20200212101554.GB2618@vkoul-mobl>
 <c8219635-30be-9695-a3f5-cd649aa6fab7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8219635-30be-9695-a3f5-cd649aa6fab7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 5/5] soundwire: intel: free all
 resources on hw_free()
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

On 12-02-20, 09:37, Pierre-Louis Bossart wrote:
> Hi Vinod,
> 
> > > +static int intel_free_stream(struct sdw_intel *sdw,
> > > +			     struct snd_pcm_substream *substream,
> > > +			     struct snd_soc_dai *dai,
> > > +			     int link_id)
> > > +{
> > > +	struct sdw_intel_link_res *res = sdw->link_res;
> > > +	struct sdw_intel_stream_free_data free_data;
> > 
> > where is this struct sdw_intel_stream_free_data defined. I dont see it
> > in this patch or this series..
> 
> the definition is already upstream :-)

Oops did i look at wrong branch, sorry!

> > > +	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
> > > +	if (ret < 0) {
> > > +		dev_err(dai->dev, "intel_free_stream: failed %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	sdw_release_stream(dma->stream);
> > 
> > I think, free the 'name' here would be apt
> 
> Right, this is something we discussed with Rander shortly before Chinese New
> Year and we wanted to handle this with a follow-up patch, would that work
> for you? if not I can send a v3, your choice.

It would be better if we fix this up in this series :)

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
