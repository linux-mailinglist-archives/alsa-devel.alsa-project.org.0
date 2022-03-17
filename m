Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC24DC914
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 15:42:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E9E190E;
	Thu, 17 Mar 2022 15:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E9E190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647528141;
	bh=hxdofN2BPr2wGB36uoStlDdxkKMsJNBlXp5qDw4a4/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyafrXWF9pPNBYjWzSx5+Ezm2QVFQ7TJEKJlCAi7VXlV5GL2OM/W22U4d+CXKuCS9
	 HQgCpoYYGmUAE5Hk29tIW9nQxNwRov5OWxdkjTxstnNRluBkzuYH5nB1pc0QDTaIUE
	 BmI+v1Hb5WWlcE0UX65RvU75ulXtfgawibDL+HJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F800F80125;
	Thu, 17 Mar 2022 15:41:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FBCFF8013F; Thu, 17 Mar 2022 15:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11643F80125
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 15:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11643F80125
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUrJI-0002Oy-MK; Thu, 17 Mar 2022 15:41:04 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUrJH-0001RD-3X; Thu, 17 Mar 2022 15:41:03 +0100
Date: Thu, 17 Mar 2022 15:41:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220317144103.GV405@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
 <20220317082818.503143-11-s.hauer@pengutronix.de>
 <CAA+D8APw-OHdz4s=oy9bWZOw6kj8mD8nss3OKXsYQty52=tb2Q@mail.gmail.com>
 <20220317101950.GU405@pengutronix.de>
 <CAA+D8AMdTzqfEQCH4pcQE3K1P-4oo71ctiGW1DD7XJPQDcVbTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMdTzqfEQCH4pcQE3K1P-4oo71ctiGW1DD7XJPQDcVbTg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:38:07 up 96 days, 23:23, 78 users,  load average: 0.12, 0.16, 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, joy.zou@nxp.com
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

On Thu, Mar 17, 2022 at 08:20:22PM +0800, Shengjiu Wang wrote:
>    Hi
>    On Thu, Mar 17, 2022 at 6:19 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      On Thu, Mar 17, 2022 at 05:08:55PM +0800, Shengjiu Wang wrote:
>      >    On Thu, Mar 17, 2022 at 4:28 PM Sascha Hauer
>      <[1][2]s.hauer@pengutronix.de>
>      >    wrote:
>      >
>      >      +struct sdma_peripheral_config {
>      >      +       int n_fifos_src;
>      >      +       int n_fifos_dst;
>      >      +       bool sw_done;
>      >      +};
>      >      +
>      >       #endif
>      >
>      >    Hi Sascha
>      >    This is our internal definition for this sdma_peripheral_config.
>      >    Could you please adopt this?
> 
>      This structure is completely internal to the kernel and can be adjusted
>      when we need it. I don't see a reason to add unused fields to it just to
>      be compatible with a downstream kernel.
> 
>    Yes, it is not used by micfil. But the fifo_offset and words_per_fifo
>    is part the multi fifo script support scope, if only add fifo_num,  it
>    looks
>    like this feature is not complete.

No, it's not. I only added the parts that I am interested in and that I
can test. I have some multichannel audio stuff in my pipeline, I might add
more pieces later.

>    By the way,  which multi fifo script version are you using? seems it is
>    not the latest compared with our release, right?

I am using the latest firmware from linux-firmware.git.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
