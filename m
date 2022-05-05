Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C0951B97F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 09:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BBF21713;
	Thu,  5 May 2022 09:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BBF21713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651737091;
	bh=8dNuoh6SLylvxcZb3aIIezwYFrh+1vb4aKJVCYBOKxc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucir8izCrFLS1Y8ULm1zsa7iSctgD7pd0n3OcEJ8m4j9J4SgrluA3S0r9u3xWmBha
	 RVVcs37KZa3lyT4WzyPHmmm+6tZFvf+WYWttfpSuIE2Q9+p6vef8daRdGboVNy57B1
	 wfzhgF/9TMD5vVJCSiYIjFNhjIBaXYSH4aAA4vbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0752F800D3;
	Thu,  5 May 2022 09:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFE3F800D3; Thu,  5 May 2022 09:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 661D2F800F0
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 09:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 661D2F800F0
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmWFe-0005Nb-AM; Thu, 05 May 2022 09:50:18 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmWFd-0000oa-KA; Thu, 05 May 2022 09:50:17 +0200
Date: Thu, 5 May 2022 09:50:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: fix the naming style for mask definition
Message-ID: <20220505075017.GJ4012@pengutronix.de>
References: <1651736047-28809-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651736047-28809-1-git-send-email-shengjiu.wang@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:49:44 up 35 days, 20:19, 82 users,  load average: 0.27, 0.17, 0.11
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org
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

On Thu, May 05, 2022 at 03:34:07PM +0800, Shengjiu Wang wrote:
> Remove the _SHIFT for the mask definition.
> 
> Fixes: 17f2142bae4b ("ASoC: fsl_micfil: use GENMASK to define register bit fields")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

>  sound/soc/fsl/fsl_micfil.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index 08901827047d..053caba3caf3 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -74,9 +74,9 @@
>  #define MICFIL_FIFO_STAT_FIFOX_UNDER(ch)	BIT((ch) + 8)
>  
>  /* MICFIL HWVAD0 Control 1 Register -- REG_MICFIL_VAD0_CTRL1*/
> -#define MICFIL_VAD0_CTRL1_CHSEL_SHIFT	GENMASK(26, 24)
> -#define MICFIL_VAD0_CTRL1_CICOSR_SHIFT	GENMASK(19, 16)
> -#define MICFIL_VAD0_CTRL1_INITT_SHIFT	GENMASK(12, 8)
> +#define MICFIL_VAD0_CTRL1_CHSEL		GENMASK(26, 24)
> +#define MICFIL_VAD0_CTRL1_CICOSR	GENMASK(19, 16)
> +#define MICFIL_VAD0_CTRL1_INITT		GENMASK(12, 8)
>  #define MICFIL_VAD0_CTRL1_ST10		BIT(4)
>  #define MICFIL_VAD0_CTRL1_ERIE		BIT(3)
>  #define MICFIL_VAD0_CTRL1_IE		BIT(2)
> @@ -106,7 +106,7 @@
>  
>  /* MICFIL HWVAD0 Zero-Crossing Detector - REG_MICFIL_VAD0_ZCD */
>  #define MICFIL_VAD0_ZCD_ZCDTH		GENMASK(25, 16)
> -#define MICFIL_VAD0_ZCD_ZCDADJ_SHIFT	GENMASK(11, 8)
> +#define MICFIL_VAD0_ZCD_ZCDADJ		GENMASK(11, 8)
>  #define MICFIL_VAD0_ZCD_ZCDAND		BIT(4)
>  #define MICFIL_VAD0_ZCD_ZCDAUT		BIT(2)
>  #define MICFIL_VAD0_ZCD_ZCDEN		BIT(0)
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
