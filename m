Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5777D4DA0A9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 17:59:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E49D191C;
	Tue, 15 Mar 2022 17:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E49D191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647363567;
	bh=zM0lubq46pAS3qfMjZ/ip7toEV0EVU15WBDNObOZH1A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cuUI/uLz7aEQUwuQPNinaZUYuXXBvb3DZRS+kzK32dSN9h6QIKhXvnrr7PSZA6uqc
	 iGrYYR8FInvkOeDajWeupWaoCahFXE0B3tMYqObZJ3Hxbtjf0VkTxX/+g0Laasg521
	 hRrqdyMkOXamxlziG7EN17QE7ybOjl24acouYuHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8967EF80095;
	Tue, 15 Mar 2022 17:58:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5C2F80212; Tue, 15 Mar 2022 17:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C01F8012C
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 17:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C01F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="1nlh45Ik"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22FFqNIg026979;
 Tue, 15 Mar 2022 17:58:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=caahflL2f4uKgikEHbofBQ5amNr4llMFHImCxFrJh4s=;
 b=1nlh45Ik5bA2fFamcqJbVMDTgFXVklS/wYIU6TGQzgvNU7t2icEOLcGQe8IbvQ3L7Efr
 xHBhdxb87w5PTw/Qgo6w61BGrSbG+/bUbsmJ/mtyKaMcZzrt2Hp/ffeJio/wNvISPLmb
 hf1Za0xXuuqhOiOksGPnq/qCKb2IaAp1jwlUbBCmSxypYrjhRaiMqFGjiBSUzGKAq/t/
 U1fRyioOLLnvEgyFYjxL33L7ghaLXqrSOq1Dvtb0L/Ma4JJ3f5zsJCYnDEYtMIPlkQOs
 3Biu6rgTB/1UmVtkc9JVhx0xdrF13IwHaDJHo9LoiLifkv+VLvlKzi49vLjuRBRBxojV hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3etj2amhhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:58:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05716100034;
 Tue, 15 Mar 2022 17:58:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1F95231DDF;
 Tue, 15 Mar 2022 17:58:21 +0100 (CET)
Received: from [10.211.6.120] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Mar
 2022 17:58:21 +0100
Message-ID: <fceeff3f-7b70-15ad-1833-9d6ae9aa2776@foss.st.com>
Date: Tue, 15 Mar 2022 17:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220315164158.19804-1-tiwai@suse.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220315164158.19804-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_08,2022-03-15_01,2022-02-23_01
Cc: alsa-devel@alsa-project.org, Daniel Palmer <daniel@0x0f.com>
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



On 3/15/22 17:41, Takashi Iwai wrote:
> This is essentially a revert of the commit dc865fb9e7c2 ("ASoC: sti:
> Use snd_pcm_stop_xrun() helper"), which converted the manual
> snd_pcm_stop() calls with snd_pcm_stop_xrun().
> 
> The commit above introduced a deadlock as snd_pcm_stop_xrun() itself
> takes the PCM stream lock while the caller already holds it.  Since
> the conversion was done only for consistency reason and the open-call
> with snd_pcm_stop() to the XRUN state is a correct usage, let's revert
> the commit back as the fix.
> 
> Fixes: dc865fb9e7c2 ("ASoC: sti: Use snd_pcm_stop_xrun() helper")
> Reported-by: Daniel Palmer <daniel@0x0f.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/20220315091319.3351522-1-daniel@0x0f.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thanks for the fix!

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Regards,
Arnaud

> ---
>  sound/soc/sti/uniperif_player.c | 6 +++---
>  sound/soc/sti/uniperif_reader.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
> index 2ed92c990b97..dd9013c47664 100644
> --- a/sound/soc/sti/uniperif_player.c
> +++ b/sound/soc/sti/uniperif_player.c
> @@ -91,7 +91,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
>  			SET_UNIPERIF_ITM_BCLR_FIFO_ERROR(player);
>  
>  			/* Stop the player */
> -			snd_pcm_stop_xrun(player->substream);
> +			snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
>  		}
>  
>  		ret = IRQ_HANDLED;
> @@ -105,7 +105,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
>  		SET_UNIPERIF_ITM_BCLR_DMA_ERROR(player);
>  
>  		/* Stop the player */
> -		snd_pcm_stop_xrun(player->substream);
> +		snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
>  
>  		ret = IRQ_HANDLED;
>  	}
> @@ -138,7 +138,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
>  		dev_err(player->dev, "Underflow recovery failed\n");
>  
>  		/* Stop the player */
> -		snd_pcm_stop_xrun(player->substream);
> +		snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
>  
>  		ret = IRQ_HANDLED;
>  	}
> diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
> index 136059331211..065c5f0d1f5f 100644
> --- a/sound/soc/sti/uniperif_reader.c
> +++ b/sound/soc/sti/uniperif_reader.c
> @@ -65,7 +65,7 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
>  	if (unlikely(status & UNIPERIF_ITS_FIFO_ERROR_MASK(reader))) {
>  		dev_err(reader->dev, "FIFO error detected\n");
>  
> -		snd_pcm_stop_xrun(reader->substream);
> +		snd_pcm_stop(reader->substream, SNDRV_PCM_STATE_XRUN);
>  
>  		ret = IRQ_HANDLED;
>  	}
