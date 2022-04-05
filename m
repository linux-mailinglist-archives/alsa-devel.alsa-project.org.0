Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92CD4F3CDF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C0B18A4;
	Tue,  5 Apr 2022 19:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C0B18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649180001;
	bh=Da6YW7ygWaEuklSxuYdsfPnTi0OQwxW/GGZ7tT2lWds=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvpfOyMIUW+wRI/1ZWASO+HP42lMdeLpSeBNcsWDrlK0OfGB0AaatesJn2bRRx1T6
	 a3iARyZ0Chol4XvNL8Oc1JIpYCoH2B9r8y/LkAsz7acsoTcLqUPGUfxjwa+jR87mL8
	 uqwB/mbwKqV6DHQPy/izs7GX04VV92JdixCAUEi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F13ABF8016B;
	Tue,  5 Apr 2022 19:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6C60F8012C; Tue,  5 Apr 2022 19:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B76A5F8016A
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B76A5F8016A
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nbn1n-0005q6-Lf; Tue, 05 Apr 2022 19:31:39 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nbn1l-0004Ld-6t; Tue, 05 Apr 2022 19:31:37 +0200
Date: Tue, 5 Apr 2022 19:31:37 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
Message-ID: <20220405173137.GR4012@pengutronix.de>
References: <20220405155731.745413-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405155731.745413-1-a.fatoum@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:31:02 up 6 days, 6:00, 66 users, load average: 0.28, 0.18, 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
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

On Tue, Apr 05, 2022 at 05:57:31PM +0200, Ahmad Fatoum wrote:
> Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
> bclk:mclk ratio support") led to the bypass never happening
> as (ratio = 1) was caught in the existing if (ratio & 1) continue;
> check. The correct check sequence instead is:
> 
>  - skip all ratios lower than one and higher than 512
>  - skip all odd ratios except for 1:1
>  - skip 1:1 ratio if and only if !support_1_1_ratio
> 
> And for all others, calculate the appropriate divider. Adjust the
> code to facilitate this.
> 
> Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a992d51568cc..50c377f16097 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
>  			continue;
>  		if (ratio == 1 && !support_1_1_ratio)
>  			continue;
> -		else if (ratio & 1)
> +		if ((ratio & 1) && ratio > 1)
>  			continue;
>  
>  		diff = abs((long)clk_rate - ratio * freq);
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
