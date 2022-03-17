Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED544DC3E2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 11:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 540E81A2C;
	Thu, 17 Mar 2022 11:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 540E81A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647512469;
	bh=MBDy7LKuR5988UVWQgbrOMGAP1dUArZTKzmhxoJiuJ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdLLetrkZ4jhd63y6KNjQ5f43r3ra7Bn31XN5yn1DWS4lDwNITO6i9K8v0LEVBPk/
	 jyYbrRJSFvhIO1EpKHAy5615bwRTpbCJQ+/+/KXqOsP/mmdM4ef3zxvnUGdEw2bUNy
	 OQ8QeYWNmfg/3YwKLoxpCBPJFSmLPTd1pTPBrggk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D265AF8014C;
	Thu, 17 Mar 2022 11:20:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF316F8013F; Thu, 17 Mar 2022 11:19:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4862F80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 11:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4862F80124
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUnEV-0004ft-VH; Thu, 17 Mar 2022 11:19:51 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUnEU-0002Qv-Pz; Thu, 17 Mar 2022 11:19:50 +0100
Date: Thu, 17 Mar 2022 11:19:50 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220317101950.GU405@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
 <20220317082818.503143-11-s.hauer@pengutronix.de>
 <CAA+D8APw-OHdz4s=oy9bWZOw6kj8mD8nss3OKXsYQty52=tb2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APw-OHdz4s=oy9bWZOw6kj8mD8nss3OKXsYQty52=tb2Q@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:42:35 up 96 days, 18:28, 78 users,  load average: 0.19, 0.14, 0.15
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

On Thu, Mar 17, 2022 at 05:08:55PM +0800, Shengjiu Wang wrote:
>    On Thu, Mar 17, 2022 at 4:28 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      +struct sdma_peripheral_config {
>      +       int n_fifos_src;
>      +       int n_fifos_dst;
>      +       bool sw_done;
>      +};
>      +
>       #endif
> 
>    Hi Sascha
>    This is our internal definition for this sdma_peripheral_config.
>    Could you please adopt this?

This structure is completely internal to the kernel and can be adjusted
when we need it. I don't see a reason to add unused fields to it just to
be compatible with a downstream kernel.

Sascha

>    /**
>     * struct sdma_audio_config - special sdma config for audio case
>     * @src_fifo_num: source fifo number for mcu_2_sai/sai_2_mcu script
>     *                For example, if there are 4 fifos, sdma will fetch
>     *                fifos one by one and roll back to the first fifo after
>     *                the 4th fifo fetch.
>     * @dst_fifo_num: similar as src_fifo_num, but dest fifo instead.
>     * @src_fifo_off: source fifo offset, 0 means all fifos are continuous, 1
>     *                means 1 word offset between fifos. All offset between
>     *                fifos should be same.
>     * @dst_fifo_off: dst fifo offset, similar as @src_fifo_off.
>     * @words_per_fifo: numbers of words per fifo fetch/fill, 0 means
>     *                  one channel per fifo, 1 means 2 channels per fifo..
>     *                  If 'src_fifo_num =  4' and 'chans_per_fifo = 1', it
>     *                  means the first two words(channels) fetch from fifo1
>     *                  and then jump to fifo2 for next two words, and so on
>     *                  after the last fifo4 fetched, roll back to fifo1.
>     * @sw_done_sel: software done selector, PDM need enable software done
>    feature
>     *               in mcu_2_sai/sai_2_mcu script.
>     *               Bit31: sw_done eanbled or not
>     *               Bit16~Bit0: selector
>     *               For example: 0x80000000 means sw_done enabled for done0
>     *                            sector which is for PDM on i.mx8mm.
>     */
>    struct sdma_audio_config {
>            u8 src_fifo_num;
>            u8 dst_fifo_num;
>            u8 src_fifo_off;
>            u8 dst_fifo_off;
>            u8 words_per_fifo;
>            u32 sw_done_sel;
>    };
>    best regards
>    wang shengjiu
>     
> 
> References
> 
>    Visible links
>    1. mailto:s.hauer@pengutronix.de
>    2. mailto:s.hauer@pengutronix.de

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
