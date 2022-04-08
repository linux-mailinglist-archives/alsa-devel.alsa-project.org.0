Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD164F8EEB
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 08:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34DC1893;
	Fri,  8 Apr 2022 08:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34DC1893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649400125;
	bh=jErAkC91mXqXRNw55bI2zPATMO3AnLXcNNZvW18W1KA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOgAVkFVOepFhv/YvQN25HCRuq3Rq1ujLibSb7OeTovbpVMAytAviDPiPVr7qyBYR
	 JnJ3UEnZ+nVjfycyvIVFZ+UxGok6QFeOwbkg4qfXi1ZdVSXH97XwiKx4WttIV3KWYg
	 dFx3Qn+km9FmwGTugGuC6NqMBB8UG4O71KBTFwPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D31F80054;
	Fri,  8 Apr 2022 08:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44893F8014E; Fri,  8 Apr 2022 08:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C626F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 08:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C626F80054
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nciId-00037y-2D; Fri, 08 Apr 2022 08:40:51 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nciIb-0004Cp-Hy; Fri, 08 Apr 2022 08:40:49 +0200
Date: Fri, 8 Apr 2022 08:40:49 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v4 21/21] ASoC: fsl_micfil: Remove debug message
Message-ID: <20220408064049.GM4012@pengutronix.de>
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-22-s.hauer@pengutronix.de>
 <CAA+D8AMyvOpy9x0sAok6z=wRVhTScJ0xeFOHuCHK_fEWzxYwbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMyvOpy9x0sAok6z=wRVhTScJ0xeFOHuCHK_fEWzxYwbA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:38:51 up 8 days, 19:08, 50 users, load average: 0.06, 0.11, 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Fri, Apr 08, 2022 at 01:21:41PM +0800, Shengjiu Wang wrote:
>    On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      The micfil driver prints out the IRQ numbers for each interrupt at error
>      level. This information is useful for debugging at best, remove it.
> 
>      Signed-off-by: Sascha Hauer <[2]s.hauer@pengutronix.de>
>      ---
> 
>      Notes:
>          Changes since v3:
>          - new patch
> 
>       sound/soc/fsl/fsl_micfil.c | 1 -
>       1 file changed, 1 deletion(-)
> 
>      diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
>      index 8f0ab61fd1b07..be669523a4bf7 100644
>      --- a/sound/soc/fsl/fsl_micfil.c
>      +++ b/sound/soc/fsl/fsl_micfil.c
>      @@ -597,7 +597,6 @@ static int fsl_micfil_probe(struct platform_device
>      *pdev)
>              /* get IRQs */
>              for (i = 0; i < MICFIL_IRQ_LINES; i++) {
>                      micfil->irq[i] = platform_get_irq(pdev, i);
>      -               dev_err(&pdev->dev, "GET IRQ: %d\n", micfil->irq[i]);
> 
>    dev_err to dev_dbg, is it better?

I don't think so. You can see the interrupts in /proc/interrupts and
currently the interrupts are not even used in the driver.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
