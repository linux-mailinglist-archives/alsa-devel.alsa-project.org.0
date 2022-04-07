Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE54F76C6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:06:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58500174A;
	Thu,  7 Apr 2022 09:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58500174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649315163;
	bh=Yi5ywt6yEIomD3NlhRqxwQdS7ErGkhZq72f4qhtQQz0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPNtW5ANS5EQpqkH+FswYgo0f6EVURqgE18BO+3F2kbheqi4BcSz/oeNoaVB/JYyU
	 AQ4vg8TcpNMmzsFONNrnJa2SZHk6IrS7BBxBLfRNDZzZqtmUckequDe2Ee1gqZ1Hu+
	 voSaCxice54G3WTuUzNcnAl4VRcbY6JrUCY1h9As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A31D4F80141;
	Thu,  7 Apr 2022 09:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CFA5F8012A; Thu,  7 Apr 2022 09:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A6B0F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6B0F80085
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMCK-0002PS-Os; Thu, 07 Apr 2022 09:04:52 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMCK-00043z-0E; Thu, 07 Apr 2022 09:04:52 +0200
Date: Thu, 7 Apr 2022 09:04:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 14/20] ASoC: fsl_micfil: Drop get_pdm_clk()
Message-ID: <20220407070451.GY4012@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-15-s.hauer@pengutronix.de>
 <CAA+D8AMMDF1eL_sdE_zF-52ZoaxyWjAtCOQyOZ71+ozzfqf1qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMMDF1eL_sdE_zF-52ZoaxyWjAtCOQyOZ71+ozzfqf1qg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:04:04 up 7 days, 19:33, 61 users, load average: 0.26, 0.73, 0.52
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

On Thu, Apr 07, 2022 at 11:41:52AM +0800, Shengjiu Wang wrote:
>    On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      get_pdm_clk() calculates the PDM clock based on the quality setting,
>      but really the PDM clock is independent of the quality, it's always
>      rate * 4 * micfil->osr. Just drop the function and do the calculation
>      in the caller.
> 
>      Signed-off-by: Sascha Hauer <[2]s.hauer@pengutronix.de>
>      ---
>       sound/soc/fsl/fsl_micfil.c | 38 +-------------------------------------
>       1 file changed, 1 insertion(+), 37 deletions(-)
> 
>      diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
>      index 4b4b7fbbf5c4f..8335646a84d17 100644
>      --- a/sound/soc/fsl/fsl_micfil.c
>      +++ b/sound/soc/fsl/fsl_micfil.c
>      @@ -111,42 +111,6 @@ static const struct snd_kcontrol_new
>      fsl_micfil_snd_controls[] = {
>                           snd_soc_get_enum_double, snd_soc_put_enum_double),
>       };
> 
>      -static inline int get_pdm_clk(struct fsl_micfil *micfil,
>      -                             unsigned int rate)
>      -{
>      -       u32 ctrl2_reg;
>      -       int qsel;
>      -       int bclk;
>      -       int osr = MICFIL_OSR_DEFAULT;
>      -
>      -       regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
>      -       qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
>      -
>      -       switch (qsel) {
>      -       case MICFIL_QSEL_HIGH_QUALITY:
>      -               bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
>      -               break;
>      -       case MICFIL_QSEL_MEDIUM_QUALITY:
>      -       case MICFIL_QSEL_VLOW0_QUALITY:
>      -               bclk = rate * 4 * osr * 1; /* kfactor = 1 */
>      -               break;
>      -       case MICFIL_QSEL_LOW_QUALITY:
>      -       case MICFIL_QSEL_VLOW1_QUALITY:
>      -               bclk = rate * 2 * osr * 2; /* kfactor = 2 */
>      -               break;
>      -       case MICFIL_QSEL_VLOW2_QUALITY:
>      -               bclk = rate * osr * 4; /* kfactor = 4 */
>      -               break;
>      -       default:
>      -               dev_err(&micfil->pdev->dev,
>      -                       "Please make sure you select a valid
>      quality.\n");
>      -               bclk = -1;
>      -               break;
>      -       }
>      -
>      -       return bclk;
>      -}
>      -
>       static inline int get_clk_div(struct fsl_micfil *micfil,
>                                    unsigned int rate)
>       {
>      @@ -155,7 +119,7 @@ static inline int get_clk_div(struct fsl_micfil
>      *micfil,
> 
>              mclk_rate = clk_get_rate(micfil->mclk);
> 
>      -       clk_div = mclk_rate / (get_pdm_clk(micfil, rate) * 2);
>      +       clk_div = mclk_rate / (rate * micfil->osr * 8);
> 
>    Where is micfil->osr assigned a value?

Should be MICFIL_OSR_DEFAULT instead.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
