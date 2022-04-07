Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D84F77E4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF31174A;
	Thu,  7 Apr 2022 09:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF31174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649317356;
	bh=bNdeKkzRb0i0ccuyBaOWaqtHMj18A9THpfzA6HlRVJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/HOkGONnyYjnRlEFAI6IdjwSF1TzHue5I/faGNeenmbk8evEVAUOdhRu6ejhvTJD
	 /lBKZ1attn+8GmYsX3Nz8z7wfIyjoGxrlS8jXk1QgddI//WRqjJ8jaGTuNfbHSVb7P
	 jF6sHpEIrW5m7G6VHqqbZYya0KHN5pnRQgAJJ4RY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3410EF8026A;
	Thu,  7 Apr 2022 09:41:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2617F8024C; Thu,  7 Apr 2022 09:41:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB382F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB382F80085
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMll-0000GK-LM; Thu, 07 Apr 2022 09:41:29 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMll-0005uT-7e; Thu, 07 Apr 2022 09:41:29 +0200
Date: Thu, 7 Apr 2022 09:41:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220407074129.GC4012@pengutronix.de>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
 <YkU7cYhZUuGyWbob@matsya> <20220331064903.GC4012@pengutronix.de>
 <YkVQNhTpeIT7qO/7@matsya> <20220401120137.GK4012@pengutronix.de>
 <Yk6RV2xEVqYOjhZN@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk6RV2xEVqYOjhZN@matsya>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:40:02 up 7 days, 20:09, 63 users, load average: 0.56, 0.51, 0.34
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

On Thu, Apr 07, 2022 at 12:53:03PM +0530, Vinod Koul wrote:
> On 01-04-22, 14:01, Sascha Hauer wrote:
> > On Thu, Mar 31, 2022 at 12:24:46PM +0530, Vinod Koul wrote:
> 
> > > > I have put this into include/linux/platform_data/dma-imx.h because
> > > > that's the only existing include file that is available. I could move
> > > > this to a new file if you like that better.
> > > 
> > > Lets move to include/linux/dma/
> > 
> > What about the other stuff in include/linux/platform_data/dma-imx.h,
> > should this go to include/linux/dma/ as well? There is nothing in it
> > that is platform_data at all.
> 
> Move that as well please, perhaps a move patch and then the new addition

Did so already in v3 I sent on Tuesday ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
