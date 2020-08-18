Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187452480B0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 10:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898CB1705;
	Tue, 18 Aug 2020 10:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898CB1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597739615;
	bh=cjUtFFEhvcQwQkw1VVlJuHM2ITwJUHRyNQQzIFZR3Vs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q+aWckDijp9k4Paf6051U0anW6JGzBuQnnJ1X+PY/S0Ej8DZk8VE57TGrXf+1SIVt
	 vv6fehJJnxsQ7BA6eX7936w8Pavs54BXRC0l7rPOGuJ6gfWa+yAW7N+GEcrNSSKEGC
	 pK9FbUMCq8WPxmQ9klZE/b6ADF3DSpiVF6a60rTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D60F80104;
	Tue, 18 Aug 2020 10:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3417F8023F; Tue, 18 Aug 2020 10:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7ECFF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 10:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7ECFF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rS9YImYI"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CACB2067C;
 Tue, 18 Aug 2020 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597739500;
 bh=cjUtFFEhvcQwQkw1VVlJuHM2ITwJUHRyNQQzIFZR3Vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rS9YImYIwCC+kc9eRT1/QzM2OjBOFNhgOyh7n7hkABGdbsnSLinFAOHFB5Z4HTCiK
 mChIGSni7plQROsSHXIiVtJcPO2ivbqH/f9kXEoeAWTdKJ5mHMrB7KUQoho54RI7uN
 BSxuKNU76veor9YUNXy4RG9R7Tq7Yrb6nXaK/YHE=
Date: Tue, 18 Aug 2020 14:01:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH 1/2] soundwire: add definition for maximum number of ports
Message-ID: <20200818083136.GX2639@vkoul-mobl>
References: <20200817174727.15139-1-yung-chuan.liao@linux.intel.com>
 <20200817174727.15139-2-yung-chuan.liao@linux.intel.com>
 <20200818063538.GV2639@vkoul-mobl>
 <DM6PR11MB4074A817AEBB4636095581F2FF5C0@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4074A817AEBB4636095581F2FF5C0@DM6PR11MB4074.namprd11.prod.outlook.com>
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

On 18-08-20, 06:53, Liao, Bard wrote:
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Tuesday, August 18, 2020 2:36 PM
> > To: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; tiwai@suse.de;
> > broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> > srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> > ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> > louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>; Lin,
> > Mengdong <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> > Subject: Re: [PATCH 1/2] soundwire: add definition for maximum number of
> > ports
> > 
> > On 18-08-20, 01:47, Bard Liao wrote:
> > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > >
> > > A Device may have at most 15 physical ports (DP0, DP1..DP14).
> > >
> > > Signed-off-by: Pierre-Louis Bossart
> > > <pierre-louis.bossart@linux.intel.com>
> > > Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> > > Reviewed-by: Guennadi Liakhovetski
> > > <guennadi.liakhovetski@linux.intel.com>
> > > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > ---
> > >  include/linux/soundwire/sdw.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/soundwire/sdw.h
> > > b/include/linux/soundwire/sdw.h index 76052f12c9f7..0aa4c6af7554
> > > 100644
> > > --- a/include/linux/soundwire/sdw.h
> > > +++ b/include/linux/soundwire/sdw.h
> > > @@ -38,7 +38,8 @@ struct sdw_slave;
> > >  #define SDW_FRAME_CTRL_BITS		48
> > >  #define SDW_MAX_DEVICES			11
> > >
> > > -#define SDW_VALID_PORT_RANGE(n)		((n) <= 14 && (n) >= 1)
> > > +#define SDW_MAX_PORTS			15
> > > +#define SDW_VALID_PORT_RANGE(n)		((n) <
> > SDW_MAX_PORTS && (n) >= 1)
> > 
> > What is the use of this one if we are allocating all ports always, Also, I dont
> > see it used in second patch?
> 
> It is used in drivers/soundwire/stream.c and drivers/soundwire/debugfs.c.

Ah overlooked that it is modified, pls ignore this comment

-- 
~Vinod
