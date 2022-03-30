Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA34EBC1A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 09:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A991727;
	Wed, 30 Mar 2022 09:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A991727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648626647;
	bh=ECjZ01Rfd2F0RI/wJYDUt8UpRLRvFVVgDdRIGej91AM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6t2XLUN1MqpF1E2+Ob8qFUE3RW1uBJC/rqc+WcybmfAAP7ys0/grtUzS6pfnxSPo
	 RQvIL2/EX7ar3tyjWrWoINP+g6wa504G6MlV7cWVT/ZC5EwgWQHpIg7Fs0xjhpcKeq
	 Qrt8rHXEHG68dFzMdRnYT+VZT9KqhFbOwO2vFjqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95A70F800B8;
	Wed, 30 Mar 2022 09:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B903F80254; Wed, 30 Mar 2022 09:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BF3BF800B8
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 09:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF3BF800B8
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZT57-0005qE-LM; Wed, 30 Mar 2022 09:49:29 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZT56-0002Md-T7; Wed, 30 Mar 2022 09:49:28 +0200
Date: Wed, 30 Mar 2022 09:49:28 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220330074928.GY12181@pengutronix.de>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
 <CAOMZO5B3TdYMhvYX55H5c+tSgaR8mgUKPo=hOw2xKvd+b+X8=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5B3TdYMhvYX55H5c+tSgaR8mgUKPo=hOw2xKvd+b+X8=g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:48:24 up 109 days, 16:33, 78 users,  load average: 0.10, 0.10,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
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

Hi Fabio,

On Tue, Mar 29, 2022 at 07:55:45AM -0300, Fabio Estevam wrote:
> Hi Sascha,
> 
> On Mon, Mar 28, 2022 at 8:28 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Please add a commit log, thanks.

oh, sure. Will add this:

    The i.MX SDMA engine can read from / write to multiple successive
    hardware FIFO registers, referred to as "Multi FIFO support". This is
    needed for the micfil driver and certain configurations of the SAI
    driver. This patch adds support for this feature.
    
    The number of FIFOs to read from / write to must be communicated from
    the client driver to the SDMA engine. For this the struct
    dma_slave_config::peripheral_config field is used.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
