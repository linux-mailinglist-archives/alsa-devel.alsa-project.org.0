Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7239B463
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 09:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E6E1715;
	Fri,  4 Jun 2021 09:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E6E1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622793286;
	bh=BjAHNIGu2zVeNWRWcUdWJs2polwxs8hyyVaVHOeaV9s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6YLrFY2JS4LEi+uoRVHt1m9C9UGjv05w3DguQB6o7nVMUk6X8yWh9/PcWFNDirKF
	 hx5fYHHqT5cX7UK36pkRUEefKV4zHu06lTGeqIDb2xeBU8ANODAOhyIr4bjmBEB+sO
	 nob684fN9Jl+iZRvTA9LD1SOZFNGmhUNj1DsCEzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948C1F80424;
	Fri,  4 Jun 2021 09:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0724F802C4; Fri,  4 Jun 2021 09:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0048.hostedemail.com
 [216.40.44.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2130F80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 09:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2130F80103
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 50185100E7B45;
 Fri,  4 Jun 2021 07:53:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id E7B5F13D95; 
 Fri,  4 Jun 2021 07:53:05 +0000 (UTC)
Message-ID: <a0452dc7da2c46e3e764bdd5fd9b94dc96d96912.camel@perches.com>
Subject: Re: [PATCH v2][next] ASoC: ti: davinci-mcasp: Fix fall-through
 warning for Clang
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Ujfalusi
 <peter.ujfalusi@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Date: Fri, 04 Jun 2021 00:53:04 -0700
In-Reply-To: <20210604072714.GA244640@embeddedor>
References: <20210604072714.GA244640@embeddedor>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: wnokseunpwwmwmz5szxdzhpi4q1ds8kd
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: E7B5F13D95
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19tZSFvwatUPABPDfgJt6R0uDBPN0xZpRo=
X-HE-Tag: 1622793185-488135
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Fri, 2021-06-04 at 02:27 -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a fallthrough; statement.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - Use fallthrough; instead of break;
>  - Update changelog text.
>  Link: https://lore.kernel.org/linux-hardening/25941c37-6e38-88ae-3afe-4f5af44380d3@gmail.com/
[]
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
[]
> @@ -2317,6 +2317,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  		break;
>  	default:
>  		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
> +		fallthrough;
>  	case -EPROBE_DEFER:
>  		goto err;
>  	}

While this is OK, perhaps the below would be clearer and a more common style
as it doesn't intermix default: with logging output and a case label.
---
 sound/soc/ti/davinci-mcasp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b94220306d1a8..1059a696ff90e 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2305,6 +2305,9 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		goto err;
 
 	ret = davinci_mcasp_get_dma_type(mcasp);
+	if (ret == -EPROBE_DEFER)
+		goto err;
+
 	switch (ret) {
 	case PCM_EDMA:
 		ret = edma_pcm_platform_register(&pdev->dev);
@@ -2317,7 +2320,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
-	case -EPROBE_DEFER:
 		goto err;
 	}
 

