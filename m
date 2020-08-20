Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AAF24AF72
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 08:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC97167E;
	Thu, 20 Aug 2020 08:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC97167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597906466;
	bh=Wts9YUneOFOepJtboJgVvggU/nJoptY4HHCaKffVgeI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sMYNUeOsWhMq/0RIHlg/6OQqK/21PkJ3vjouFzlkkZKvD5qrlDEF8MrBPI25cc1un
	 q4OwZFqy/9HyfYKZxbPJsUljDRMhZ1brXRqSViyBh5GHsySJO5OxvAJ0xuYLhOzAXQ
	 LmayXCHVQ5aC9noEdPx7ZYn45dGEEuK7NA+80lAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7BBF801F9;
	Thu, 20 Aug 2020 08:52:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61AC1F80228; Thu, 20 Aug 2020 08:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BA02F800D3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 08:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA02F800D3
Received: from [2001:67c:670:100:1d::c0] (helo=ptx.hi.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1k8eQz-0000f8-L0; Thu, 20 Aug 2020 08:52:25 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1k8eQv-0003ht-Hg; Thu, 20 Aug 2020 08:52:21 +0200
Date: Thu, 20 Aug 2020 08:52:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: pcm|dmaengine|imx-sdma race condition on i.MX6
Message-ID: <20200820065221.GF19745@pengutronix.de>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:19:09 up 182 days, 13:49, 135 users,  load average: 0.10, 0.14,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 Robin Gong <yibin.gong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
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

On Wed, Aug 19, 2020 at 01:08:29PM +0200, Lars-Peter Clausen wrote:
> > For the first option, which is potentially more performant, we have to leave the atomic PCM context
> > and we are not sure if we are allowed to.
> > For the second option, we would have to divide the dma_device terminate_all into an atomic sync and
> > an async one, which would align with the dmaengine API, giving it the option to ensure termination
> > in an atomic context.
> > Based on my understanding, most of them are synchronous anyways, for the currently async ones we
> > would have to implement busy waits.
> > However, with this approach, we reach the WARN_ON [6] inside of an atomic context,
> > indicating we might not do the right thing.
> 
> I don't know how feasible this is to implement in the SDMA dmaengine driver.
> But I think what is should do is to have some flag to indicate if a
> terminate is in progress. If a new transfer is issued while terminate is in
> progress the transfer should go on a list. Once terminate finishes it should
> check the list and start the transfer if there are any on the list.

The list is already there in form of the vchan helpers the driver uses.

I think the big mistake the driver makes is to configure fields in
struct sdma_channel and also the hardware directly in
sdma_prep_memcpy(), sdma_prep_slave_sg() and sdma_prep_dma_cyclic(). All
information should be stored in the struct sdma_desc allocated in the
prep functions and only be used when it's time to fire that specific
descriptor.

More specifically sdma_config_write() may not be called from
sdma_prep_slave_sg() or sdma_prep_dma_cyclic(), but instead must be
called from sdma_start_desc().  sdma_config_ownership() also must be
called later in sdma_start_desc(). 'direction' must be a member of
struct sdma_desc, not of struct sdma_channel.

Overall this sounds like a fair amount of work to do, but should be
feasible and IMO is a step in the right direction.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
