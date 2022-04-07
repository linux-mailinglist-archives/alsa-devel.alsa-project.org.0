Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B54F7765
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BCA8174A;
	Thu,  7 Apr 2022 09:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BCA8174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649316220;
	bh=N2nJu0EwTss7YFSrIyrH6tLvVjqb41sQdY+lLkKIc9o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3TgZfKkAqFGYGZwZ+htE2pN43kwtq9BhJoR9viVgpmXh0HieSjn171ShS0rEBL0s
	 mSdza7OWYeGjdOmLXmSnYPvOOCPZdtcEIHxmsX7w7pMWZHuTzjFlhe6vIxHfrZfG9d
	 6X2IkBYkXoaWkMAY0yoBgOhSrxdGL1TpESgTG0hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A9BF80085;
	Thu,  7 Apr 2022 09:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B7F0F8024C; Thu,  7 Apr 2022 09:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B83AF8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B83AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AT13b0IE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD76561DFC;
 Thu,  7 Apr 2022 07:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657C7C385A0;
 Thu,  7 Apr 2022 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316147;
 bh=N2nJu0EwTss7YFSrIyrH6tLvVjqb41sQdY+lLkKIc9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AT13b0IETGGWBdE6PQu39zTmw7Zz6Ux7CCNZ7zUw3Z+9cOU+IA+UNW/7UciMi4tDx
 Il2mD7lxxYSsTo1lviawsaY0vYQTEohe2cb0KPwVJywXnA2qtJz4ppT1C5EMdN/1O8
 qxWgSLKX6fz6XuCXSFcRZReLGKDOGOGipu4wQmyHAXFj008EgbHqHXQro/W5trI4NL
 1VdatM6wcxYihu6IzeqC2VK0AjSyQpyIezIf+EwA1tfJeoMEuy4JOeMXQXy8oZEkQx
 b/g+HOgMnqge4cQL11o0g+F2bBorAnCse5Dpe+0JaG/DcWlP5h2b051pdpXbm/c3t6
 6925EKUUoRY/Q==
Date: Thu, 7 Apr 2022 12:52:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <Yk6RLyQg/RzuZFhg@matsya>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
 <YkU7cYhZUuGyWbob@matsya> <20220331064903.GC4012@pengutronix.de>
 <YkVQNhTpeIT7qO/7@matsya> <20220331075828.GE4012@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331075828.GE4012@pengutronix.de>
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

On 31-03-22, 09:58, Sascha Hauer wrote:
> On Thu, Mar 31, 2022 at 12:24:46PM +0530, Vinod Koul wrote:
> > On 31-03-22, 08:49, Sascha Hauer wrote:
> > > On Thu, Mar 31, 2022 at 10:56:09AM +0530, Vinod Koul wrote:
> > > > On 28-03-22, 13:27, Sascha Hauer wrote:
> > > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > 
> > > > it is dmaengine: xxx
> > > 
> > > Ok.
> > > 
> > > > 
> > > > Also is this patch dependent on rest of the series, if not consider
> > > > sending separately
> > > 
> > > The rest of this series indeed depends on this patch.
> > > 
> > > > 
> > > > > diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
> > > > > index 281adbb26e6bd..4a43a048e1b4d 100644
> > > > > --- a/include/linux/platform_data/dma-imx.h
> > > > > +++ b/include/linux/platform_data/dma-imx.h
> > > > > @@ -39,6 +39,7 @@ enum sdma_peripheral_type {
> > > > >  	IMX_DMATYPE_SSI_DUAL,	/* SSI Dual FIFO */
> > > > >  	IMX_DMATYPE_ASRC_SP,	/* Shared ASRC */
> > > > >  	IMX_DMATYPE_SAI,	/* SAI */
> > > > > +	IMX_DMATYPE_MULTI_SAI,	/* MULTI FIFOs For Audio */
> > > > >  };
> > > > >  
> > > > >  enum imx_dma_prio {
> > > > > @@ -65,4 +66,10 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
> > > > >  		!strcmp(chan->device->dev->driver->name, "imx-dma");
> > > > >  }
> > > > >  
> > > > > +struct sdma_peripheral_config {
> > > > > +	int n_fifos_src;
> > > > > +	int n_fifos_dst;
> > > > > +	bool sw_done;
> > > > > +};
> > > > 
> > > > Not more platform data :(
> > > 
> > > I'm not sure what you are referring to as platform_data. This is not the
> > > classical platform_data that is attached to a platform_device to
> > > configure behaviour of that device. It is rather data that needs to be
> > > communicated from the clients of the SDMA engine to the SDMA engine.
> > > 
> > > I have put this into include/linux/platform_data/dma-imx.h because
> > > that's the only existing include file that is available. I could move
> > > this to a new file if you like that better.
> > 
> > Lets move to include/linux/dma/
> 
> Ok.
> 
> > 
> > > 
> > > > 
> > > > Can you explain this structure and why this is required? What do these
> > > > fields refer to..?
> > > 
> > > The reasoning for this structure is described in the commit message that
> > > I have forgotten:
> > > 
> > >     The i.MX SDMA engine can read from / write to multiple successive
> > >     hardware FIFO registers, referred to as "Multi FIFO support". This is
> > >     needed for the micfil driver and certain configurations of the SAI
> > >     driver. This patch adds support for this feature.
> > > 
> > >     The number of FIFOs to read from / write to must be communicated from
> > >     the client driver to the SDMA engine. For this the struct
> > >     dma_slave_config::peripheral_config field is used.
> > > 
> > > I can describe the individual fields of struct sdma_peripheral_config in
> > > the header file if that's your point.
> > 
> > So you need to know the number of fifo right, what does sw_done imply?
> 
> Honestly I don't know. Setting sw_done results in the DONE_SEL0 bit in
> the SDMA engine being set. This is described in the reference manual
> as:
> 
> DONE_SEL0 Select Done from SW or HW for channel 0
>           0 HW
>           1 SW
> 
> I can only assume that the signaling when a channel has transferred
> enough data (the generation of the channel done interrupt?) can either
> be done in hardware or in software in the SDMA engine. What I can tell
> for sure is that I need this bit set ;)

That does sound like a mechanism to tell that transfer is done aka
handshaking aka interrupt line.

-- 
~Vinod
