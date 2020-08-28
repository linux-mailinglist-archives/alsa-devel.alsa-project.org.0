Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C2255590
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565FD186E;
	Fri, 28 Aug 2020 09:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565FD186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598600861;
	bh=/YlQq3kq0scE8VOOqA9neEBCKThA211wcq3Ihbr6a8Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLXeS1nz/d/qs6V7YSd2GShvBM43SErNt68mGSlfPew+CvkNXnWys/JHzUQDc03H2
	 BTrnOYCD1NITKDTd56fb5SDpM9po+RLjq3jHwFVTlxVqTjAdJq2ZIcKpQUnZmSiAPG
	 vRSRQxW4dOoJhohmnKyznwges0CnKSXRDFLc6gB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECE2F801D9;
	Fri, 28 Aug 2020 09:46:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA017F8016F; Fri, 28 Aug 2020 09:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31C12F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C12F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pbww8oqm"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3CDD206EB;
 Fri, 28 Aug 2020 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598600748;
 bh=/YlQq3kq0scE8VOOqA9neEBCKThA211wcq3Ihbr6a8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pbww8oqmOt9a4DplZPurSROVGyyNuGnD1BkYUy3UmRwQjlX94Nn5MDdbp0Ghx/GCx
 bIfpyWE7amwwYs8tyIwiIcrLyTGZ3F+rNV27azj2jIyh9q0xYfWsxscDNNHWB+FN/4
 XisAOqb3R4iWKmdJ7saU5dQahEpCuuyRCZgZL4TA=
Date: Fri, 28 Aug 2020 13:15:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for
 the first cpu_dai
Message-ID: <20200828074544.GM2639@vkoul-mobl>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
 <20200826094636.GB2639@vkoul-mobl>
 <DM6PR11MB407494AEF6D05EFF627CFAFBFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB407494AEF6D05EFF627CFAFBFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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

On 28-08-20, 01:47, Liao, Bard wrote:
> > snd_pcm_substream *substream,
> > >  			goto err;
> > >  	}
> > >
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
> Yes, we can call it in machine driver. But, shouldn't it belong to platform
> level? The point is that if we move the stuff to machine driver, it will
> force people to implement these stuff on their own Intel machine driver.

nothing stops anyone from doing that right! machine driver is another
component so it can be moved there as well

-- 
~Vinod
