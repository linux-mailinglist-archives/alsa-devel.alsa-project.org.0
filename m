Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F754F77D6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF821175E;
	Thu,  7 Apr 2022 09:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF821175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649317212;
	bh=78pzlQ08sg0pHsQGBDxeQT1WirYg/utwdHA/i5TvxAE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTE94ygF1vS+noCw7sy/ZiZ0n4tC5O+GJDnBD54bPYGh163y2QtGFkEE7GXjOskhM
	 NmqlG3fgNCNklZQZaa8tCITrqc+m1XBFBDv3/aYYH7mmXq49jla78DN4LlcY4W18Fc
	 4EQiH+uXrRc/xyGSZFEy16SFRa3lRcm1qAg0iQqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 612EEF8026A;
	Thu,  7 Apr 2022 09:39:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A761F8024C; Thu,  7 Apr 2022 09:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B473F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B473F8012A
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMjN-0008Ay-8r; Thu, 07 Apr 2022 09:39:01 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMjL-0005lq-5S; Thu, 07 Apr 2022 09:38:59 +0200
Date: Thu, 7 Apr 2022 09:38:59 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 05/19] ASoC: fsl_micfil: use GENMASK to define
 register bit fields
Message-ID: <20220407073859.GB4012@pengutronix.de>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-6-s.hauer@pengutronix.de>
 <CAA+D8APTMSLSCb386XvN3bu+uq3F1VK9NopJYpgumDF=TCCgEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APTMSLSCb386XvN3bu+uq3F1VK9NopJYpgumDF=TCCgEw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:28:01 up 7 days, 19:57, 63 users, load average: 0.14, 0.16, 0.18
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

On Thu, Apr 07, 2022 at 10:08:38AM +0800, Shengjiu Wang wrote:
>    On Mon, Mar 28, 2022 at 7:28 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      Use GENMASK along with FIELD_PREP and FIELD_GET to access bitfields in
>      registers to straighten register access and to drop a lot of defines.
> 
>      Signed-off-by: Sascha Hauer <[2]s.hauer@pengutronix.de>
>      ---
> 
>      Notes:
>          Changes since v1:
>          - add missing include linux/bitfield.h
> 
>       sound/soc/fsl/fsl_micfil.c |  52 ++++++-------
>       sound/soc/fsl/fsl_micfil.h | 147 ++++++++-----------------------------
>       2 files changed, 58 insertions(+), 141 deletions(-)
> 
>      diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
>      index 878d24fde3581..cfa8af668d921 100644
>      --- a/sound/soc/fsl/fsl_micfil.c
>      +++ b/sound/soc/fsl/fsl_micfil.c
>      @@ -1,6 +1,7 @@
>       // SPDX-License-Identifier: GPL-2.0
>       // Copyright 2018 NXP
> 
>      +#include <linux/bitfield.h>
>       #include <linux/clk.h>
>       #include <linux/device.h>
>       #include <linux/interrupt.h>
>      @@ -116,23 +117,22 @@ static inline int get_pdm_clk(struct fsl_micfil
>      *micfil,
>              int bclk;
> 
>              regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
>      -       osr = 16 - ((ctrl2_reg & MICFIL_CTRL2_CICOSR_MASK)
>      -                   >> MICFIL_CTRL2_CICOSR_SHIFT);
>      -       qsel = ctrl2_reg & MICFIL_CTRL2_QSEL_MASK;
>      +       osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
>      +       qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
> 
>              switch (qsel) {
>      -       case MICFIL_HIGH_QUALITY:
>      +       case MICFIL_QSEL_HIGH_QUALITY:
>                      bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
>                      break;
>      -       case MICFIL_MEDIUM_QUALITY:
>      -       case MICFIL_VLOW0_QUALITY:
>      +       case MICFIL_QSEL_MEDIUM_QUALITY:
>      +       case MICFIL_QSEL_VLOW0_QUALITY:
>                      bclk = rate * 4 * osr * 1; /* kfactor = 1 */
>                      break;
>      -       case MICFIL_LOW_QUALITY:
>      -       case MICFIL_VLOW1_QUALITY:
>      +       case MICFIL_QSEL_LOW_QUALITY:
>      +       case MICFIL_QSEL_VLOW1_QUALITY:
>                      bclk = rate * 2 * osr * 2; /* kfactor = 2 */
>                      break;
>      -       case MICFIL_VLOW2_QUALITY:
>      +       case MICFIL_QSEL_VLOW2_QUALITY:
>                      bclk = rate * osr * 4; /* kfactor = 4 */
>                      break;
>              default:
>      @@ -244,8 +244,8 @@ static int fsl_micfil_trigger(struct
>      snd_pcm_substream *substream, int cmd,
>                       * 11 - reserved
>                       */
>                      ret = regmap_update_bits(micfil->regmap,
>      REG_MICFIL_CTRL1,
>      -                                        MICFIL_CTRL1_DISEL_MASK,
>      -                                        (1 <<
>      MICFIL_CTRL1_DISEL_SHIFT));
>      +                               MICFIL_CTRL1_DISEL,
>      +                               FIELD_PREP(MICFIL_CTRL1_DISEL,
>      MICFIL_CTRL1_DISEL_DMA));
> 
>    Alignment should match open parenthesis?

Generally yes, but in this case this would introduce an additional
linebreak inside the FIELD_PREP macro which reduces readability:

Instead of:

	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
			MICFIL_CTRL1_DISEL,
			FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DMA));

We would have:

	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
				 MICFIL_CTRL1_DISEL,
				 FIELD_PREP(MICFIL_CTRL1_DISEL,
				 MICFIL_CTRL1_DISEL_DMA));

> 
>                      ret = regmap_update_bits(micfil->regmap,
>      REG_MICFIL_CTRL1,
>      -                                        MICFIL_CTRL1_DISEL_MASK,
>      -                                        (0 <<
>      MICFIL_CTRL1_DISEL_SHIFT));
>      +                               MICFIL_CTRL1_DISEL,
>      +                               FIELD_PREP(MICFIL_CTRL1_DISEL,
>      MICFIL_CTRL1_DISEL_DISABLE));
> 
>    Alignment should match open parenthesis? 

Same here.

>     
> 
>                      if (ret) {
>                              dev_err(dev, "failed to update DISEL bits\n");
>                              return ret;
>      @@ -300,8 +300,8 @@ static int fsl_set_clock_params(struct device *dev,
>      unsigned int rate)
> 
>              /* set CICOSR */
>              ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>      -                                MICFIL_CTRL2_CICOSR_MASK,
>      -                                MICFIL_CTRL2_OSR_DEFAULT);
>      +                                MICFIL_CTRL2_CICOSR,
>      +                                FIELD_PREP(MICFIL_CTRL2_CICOSR,
>      MICFIL_CTRL2_CICOSR_DEFAULT));
> 
>     Alignment should match open parenthesis? 

This is fixed in one of the next patches where the '|=' is replaced with '='.
It reduces the number of lines changed in that patch, so I think this is ok
here.

> 
>              if (ret)
>                      dev_err(dev, "failed to set CICOSR in reg 0x%X\n",
>                              REG_MICFIL_CTRL2);
>      @@ -312,7 +312,8 @@ static int fsl_set_clock_params(struct device *dev,
>      unsigned int rate)
>                      ret = -EINVAL;
> 
>              ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>      -                                MICFIL_CTRL2_CLKDIV_MASK, clk_div);
>      +                                MICFIL_CTRL2_CLKDIV,
>      +                                FIELD_PREP(MICFIL_CTRL2_CLKDIV,
>      clk_div));
> 
>    Alignment should match open parenthesis?

Ditto.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
