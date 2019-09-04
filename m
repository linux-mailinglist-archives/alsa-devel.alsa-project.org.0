Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355CA86B8
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 18:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1DB1678;
	Wed,  4 Sep 2019 18:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1DB1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567615963;
	bh=+68TWcIzGTuSgqCl/2Jmhv+7uoRpokuIKJ6TZeXjXzM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcQgZMNRS/71VeATEap/5QznN4bk0/htS1iRxVevrtOfXWrkKKSpn3+ufIspb3akR
	 ImN+Y9Z2wDRZf6fNRL1S1dRyWAVwnGhxATlmTCdZ+IsU75ppVrOAmSTjregtMXLFN/
	 mgz3ACYWlEAmgsw+CNbgqNFCwFoPUFp2dydUXTPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D54DF803A6;
	Wed,  4 Sep 2019 18:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B634F803A6; Wed,  4 Sep 2019 18:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5FFF8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 18:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5FFF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jOM2Hxu4"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB1BF2087E;
 Wed,  4 Sep 2019 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567615836;
 bh=b/x7QUROWv0yxoBVITIFYudbm4LpCcqr2OJ2VY0gqq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOM2Hxu4umgWpQLtVXuFiGxx/FAXv3Gc+0G9Scdok9NzK6wiXb7aZyhPC86JhhrP4
 ijcxucrMe5zDGbFGP5vOjqO71gAR9JVMAP4mVLfHiWe+fa/AjDnmrlRHK8kte29lSP
 6PMctjjHWvLuhrkRDCt3sRRoRiHn4upxzLqmSh00=
Date: Wed, 4 Sep 2019 22:19:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190904164926.GA2672@vkoul-mobl>
References: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
 <20190813213227.5163-3-pierre-louis.bossart@linux.intel.com>
 <20190904071317.GJ2672@vkoul-mobl>
 <71411347-93cf-2617-4edd-f6b401fe7a9b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71411347-93cf-2617-4edd-f6b401fe7a9b@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/6] soundwire: cadence_master: add
 hw_reset capability in debugfs
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

On 04-09-19, 08:18, Pierre-Louis Bossart wrote:
> On 9/4/19 2:13 AM, Vinod Koul wrote:
> > On 13-08-19, 16:32, Pierre-Louis Bossart wrote:
> > > Provide debugfs capability to kick link and devices into hard-reset
> > > (as defined by MIPI). This capability is really useful when some
> > > devices are no longer responsive and/or to check the software handling
> > > of resynchronization.
> > > 
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   drivers/soundwire/cadence_master.c | 20 ++++++++++++++++++++
> > >   1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> > > index 046622e4b264..bd58d80ff636 100644
> > > --- a/drivers/soundwire/cadence_master.c
> > > +++ b/drivers/soundwire/cadence_master.c
> > > @@ -340,6 +340,23 @@ static int cdns_reg_show(struct seq_file *s, void *data)
> > >   }
> > >   DEFINE_SHOW_ATTRIBUTE(cdns_reg);
> > > +static int cdns_hw_reset(void *data, u64 value)
> > > +{
> > > +	struct sdw_cdns *cdns = data;
> > > +	int ret;
> > > +
> > > +	if (value != 1)
> > > +		return 0;
> > 
> > Should this not be EINVAL to indicate invalid value passed?
> 
> Maybe. I must admit I don't know what -EINVAL would do, this is used for
> debugfs so it's not clear to me if the user will see a difference?

Well user should see "write error: Invalid argument" when he writes
anything other than valid values :)

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
