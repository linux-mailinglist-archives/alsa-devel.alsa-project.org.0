Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700C21BC9E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 19:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26CC1678;
	Fri, 10 Jul 2020 19:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26CC1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594403582;
	bh=FKzgQBYZv/PK/G/IUgSmwUHTgTBuy/oGk9Ug+Mz6cjw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/PzTl1W/pSQ9/8nP0yIF6oyJZ0BIlu7GKnn+FouVQ7t+nRpFr6lFcBFotpl9T49F
	 fHg3X3BDh2rXogI7De11fOGKkRf3VGVua8cLwRkv+F8ibcFYoQGbSdNJGtak1i8GVB
	 uN8yuTPqZARZaOo92LPJ8z4wbaPeAZTRQTIIdh9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED38CF80112;
	Fri, 10 Jul 2020 19:51:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C84DF8015A; Fri, 10 Jul 2020 19:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=PRX_BODYSUB_18, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46896F80112
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 19:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46896F80112
IronPort-SDR: 8NQg83Z9x6u57SoRwORmk6EQ4NZQDoXMG5F1h2ECpiZwl4Osf2zyn0mhY0XuzDei44GAnrHNcr
 13dB+bvTJFUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="209791896"
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="209791896"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 10:51:06 -0700
IronPort-SDR: nQXf3tSP92kHGhdi/SqvQjlrZ9hiQ74NTkOkK9mIs16ibqheGjNiaDM9kEA1Mudn3XXZ6Hy3FX
 FOarLWB4ar2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="484248267"
Received: from unknown (HELO buildpc-HP-Z230) ([10.223.89.131])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2020 10:51:03 -0700
Date: Fri, 10 Jul 2020 23:25:10 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: change SoundWire maintainer
Message-ID: <20200710175510.GA25404@buildpc-HP-Z230>
References: <20200703192644.751-1-sanyog.r.kale@intel.com>
 <20200708073020.GA34333@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708073020.GA34333@vkoul-mobl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On Wed, Jul 08, 2020 at 01:00:20PM +0530, Vinod Koul wrote:
> On 04-07-20, 00:56, Sanyog Kale wrote:
> > Add Bard as SoundWire maintainer from Intel and change Sanyog's
> > role as reviewer.
> 
> Sad to see you go!
> 
> > 
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> Need ack from Bard (i think he is on vacation)

Yes. he will be back next week.

> 
> > Signed-off-by: Sanyog Kale <sanyog.r.kale@intel.com>
> > ---
> >  MAINTAINERS | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1c1527a34d99..9559e947bf67 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16012,8 +16012,9 @@ F:	sound/soc/sof/
> >  
> >  SOUNDWIRE SUBSYSTEM
> >  M:	Vinod Koul <vkoul@kernel.org>
> > -M:	Sanyog Kale <sanyog.r.kale@intel.com>
> > +M:	Bard Liao <yung-chuan.liao@linux.intel.com>
> >  R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > +R:	Sanyog Kale <sanyog.r.kale@intel.com>
> 
> Do you still want to be a reviewer, I would like folks in this to be bit
> active for reviews etc

Yes Vinod, will spare time to review patches.

Thanks

> 
> Thanks
> 
> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> >  S:	Supported
> >  F:	Documentation/driver-api/soundwire/
> > -- 
> > 2.17.1
> 
> -- 
> ~Vinod

-- 
