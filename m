Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1C4F76E3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F80416C1;
	Thu,  7 Apr 2022 09:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F80416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649315401;
	bh=rKImBfnpqvsHeFOIJzB0wwSu/+x9V1MD1lVsK77lX1Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfosdBC2wgqM7YC6evoJvgG5Qf8uu7RiU5MBra3T2ZjC8vpSjLyjMB991bKPg6b52
	 YzmVOI4RDJsG3bLqsuwx5r0x5oZsPlDWdQxZvCBT/OL/+VT3A+oYVZEyOyNJmlegtI
	 er9zs6smnr31UjHKEj5SYtamykiznKxERvC9bVa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB84F80085;
	Thu,  7 Apr 2022 09:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A2FDF8024C; Thu,  7 Apr 2022 09:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15492F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15492F80085
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMGC-00030f-DQ; Thu, 07 Apr 2022 09:08:52 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMGB-0004DK-Vx; Thu, 07 Apr 2022 09:08:51 +0200
Date: Thu, 7 Apr 2022 09:08:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 15/20] ASoC: fsl_micfil: simplify clock setting
Message-ID: <20220407070851.GZ4012@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-16-s.hauer@pengutronix.de>
 <CAA+D8AOWVaaAEvR-tK=fL9KL463-NwKGvtdPOXcs0AZ0WOgZDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AOWVaaAEvR-tK=fL9KL463-NwKGvtdPOXcs0AZ0WOgZDA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:07:10 up 7 days, 19:36, 62 users, load average: 0.14, 0.46, 0.44
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

On Thu, Apr 07, 2022 at 01:09:37PM +0800, Shengjiu Wang wrote:
>    On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      The reference manual has this for calculating the micfil internal clock
>      divider:
> 
>               MICFIL Clock rate
>      clkdiv = -----------------
>               8 * OSR * outrate
> 
>      (with OSR == Oversampling Rate, outrate == output sample rate)
> 
>      The driver first sets the MICFIL Clock rate to (outrate * 1024) and then
>      calculates back the clkdiv value from the above calculation.
> 
>      Simplify this by using a fixed clkdiv value of 8 and set the MICFIL
>      Clock rate to (outrate * clkdiv * OSR * 8).
> 
>      While at it drop disabling the clock before setting its rate. The MICFIL
>      module is disabled when the rate is changed and it is also resetted
>      before it is started again, so I doubt it's necessary to disable the
>      clock.
> 
>      Signed-off-by: Sascha Hauer <[2]s.hauer@pengutronix.de>
>      ---
>       sound/soc/fsl/fsl_micfil.c | 45 ++++----------------------------------
>       1 file changed, 4 insertions(+), 41 deletions(-)
> 
>      diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
>      index 8335646a84d17..fd3b168a38661 100644
>      --- a/sound/soc/fsl/fsl_micfil.c
>      +++ b/sound/soc/fsl/fsl_micfil.c
>      @@ -111,19 +111,6 @@ static const struct snd_kcontrol_new
>      fsl_micfil_snd_controls[] = {
>                           snd_soc_get_enum_double, snd_soc_put_enum_double),
>       };
> 
>      -static inline int get_clk_div(struct fsl_micfil *micfil,
>      -                             unsigned int rate)
>      -{
>      -       long mclk_rate;
>      -       int clk_div;
>      -
>      -       mclk_rate = clk_get_rate(micfil->mclk);
>      -
>      -       clk_div = mclk_rate / (rate * micfil->osr * 8);
>      -
>      -       return clk_div;
>      -}
>      -
>       /* The SRES is a self-negated bit which provides the CPU with the
>        * capability to initialize the PDM Interface module through the
>        * slave-bus interface. This bit always reads as zero, and this
>      @@ -147,24 +134,6 @@ static int fsl_micfil_reset(struct device *dev)
>              return 0;
>       }
> 
>      -static int fsl_micfil_set_mclk_rate(struct fsl_micfil *micfil,
>      -                                   unsigned int freq)
>      -{
>      -       struct device *dev = &micfil->pdev->dev;
>      -       int ret;
>      -
>      -       clk_disable_unprepare(micfil->mclk);
>      -
>      -       ret = clk_set_rate(micfil->mclk, freq * 1024);
>      -       if (ret)
>      -               dev_warn(dev, "failed to set rate (%u): %d\n",
>      -                        freq * 1024, ret);
>      -
>      -       clk_prepare_enable(micfil->mclk);
>      -
>      -       return ret;
>      -}
>      -
>       static int fsl_micfil_startup(struct snd_pcm_substream *substream,
>                                    struct snd_soc_dai *dai)
>       {
>      @@ -238,13 +207,12 @@ static int fsl_micfil_trigger(struct
>      snd_pcm_substream *substream, int cmd,
>       static int fsl_set_clock_params(struct device *dev, unsigned int rate)
>       {
>              struct fsl_micfil *micfil = dev_get_drvdata(dev);
>      -       int clk_div;
>      +       int clk_div = 8;
>              int ret;
> 
>      -       ret = fsl_micfil_set_mclk_rate(micfil, rate);
>      -       if (ret < 0)
>      -               dev_err(dev, "failed to set mclk[%lu] to rate %u\n",
>      -                       clk_get_rate(micfil->mclk), rate);
>      +       ret = clk_set_rate(micfil->mclk, rate * clk_div * micfil->osr *
>      8);
> 
>    Please make sure micfil->osr is assigned.

Should also be MICFIL_OSR_DEFAULT instead. The micfil->osr field sneaked
in during development and I decided against it finally.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
