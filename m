Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 021084EECBF
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7521B1779;
	Fri,  1 Apr 2022 14:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7521B1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814578;
	bh=Yebd5Py/7Eaqu/6iwM6VyGTdcUOFCIH8/Q5V9hxu3Rk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wz7ChjZAfBHIbAqaFgl+wG9ruALJ4MDh4fLEd/dtNEtbh1alo/k4/8o0Mh+Il+G/J
	 St90Vr7Y+6Z4gAvydHD+V9UT+TCrkGsuf5ojoveJ4CRlAWe7JC/4RCp1Axpe2Al/zF
	 gSGn45b1uGrmQGSGxWUbPIw7xp5HoBUs9/YKwVNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA0CF8032D;
	Fri,  1 Apr 2022 14:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE20F80279; Fri,  1 Apr 2022 14:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BC8FF80100
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC8FF80100
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1naFyE-0001Oy-0a; Fri, 01 Apr 2022 14:01:38 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1naFyD-0007yd-3A; Fri, 01 Apr 2022 14:01:37 +0200
Date: Fri, 1 Apr 2022 14:01:37 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220401120137.GK4012@pengutronix.de>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
 <YkU7cYhZUuGyWbob@matsya> <20220331064903.GC4012@pengutronix.de>
 <YkVQNhTpeIT7qO/7@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkVQNhTpeIT7qO/7@matsya>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:58:17 up 2 days, 27 min, 56 users,  load average: 0.01, 0.05, 0.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Thu, Mar 31, 2022 at 12:24:46PM +0530, Vinod Koul wrote:
> On 31-03-22, 08:49, Sascha Hauer wrote:
> > On Thu, Mar 31, 2022 at 10:56:09AM +0530, Vinod Koul wrote:
> > > On 28-03-22, 13:27, Sascha Hauer wrote:
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > it is dmaengine: xxx
> > 
> > Ok.
> > 
> > > 
> > > Also is this patch dependent on rest of the series, if not consider
> > > sending separately
> > 
> > The rest of this series indeed depends on this patch.
> > 
> > > 
> > > > diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
> > > > index 281adbb26e6bd..4a43a048e1b4d 100644
> > > > --- a/include/linux/platform_data/dma-imx.h
> > > > +++ b/include/linux/platform_data/dma-imx.h
> > > > @@ -39,6 +39,7 @@ enum sdma_peripheral_type {
> > > >  	IMX_DMATYPE_SSI_DUAL,	/* SSI Dual FIFO */
> > > >  	IMX_DMATYPE_ASRC_SP,	/* Shared ASRC */
> > > >  	IMX_DMATYPE_SAI,	/* SAI */
> > > > +	IMX_DMATYPE_MULTI_SAI,	/* MULTI FIFOs For Audio */
> > > >  };
> > > >  
> > > >  enum imx_dma_prio {
> > > > @@ -65,4 +66,10 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
> > > >  		!strcmp(chan->device->dev->driver->name, "imx-dma");
> > > >  }
> > > >  
> > > > +struct sdma_peripheral_config {
> > > > +	int n_fifos_src;
> > > > +	int n_fifos_dst;
> > > > +	bool sw_done;
> > > > +};
> > > 
> > > Not more platform data :(
> > 
> > I'm not sure what you are referring to as platform_data. This is not the
> > classical platform_data that is attached to a platform_device to
> > configure behaviour of that device. It is rather data that needs to be
> > communicated from the clients of the SDMA engine to the SDMA engine.
> > 
> > I have put this into include/linux/platform_data/dma-imx.h because
> > that's the only existing include file that is available. I could move
> > this to a new file if you like that better.
> 
> Lets move to include/linux/dma/

What about the other stuff in include/linux/platform_data/dma-imx.h,
should this go to include/linux/dma/ as well? There is nothing in it
that is platform_data at all.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
