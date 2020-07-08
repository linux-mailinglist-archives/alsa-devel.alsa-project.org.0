Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD721834F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 11:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F251678;
	Wed,  8 Jul 2020 11:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F251678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594199644;
	bh=GcKC1lWnDh4KC3ruzVAqCPlYFlTP/4F42dtF8lKhQ50=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBIiqx/Ym/90G47v0JIHeeJB3poUyixL60JJ7pkp0L6L/C9FYPnHnqnqW+ayU/Ydp
	 E9/sYPO1Ntn2XUGPl+r9qXnnvQoDRUfWfeTtaKPs0Dyz0mIR320LhWk2ZGbwtwurjS
	 4KXPb39PnvyhiBI8U2qpcQQR6oju6PA1z4tuybKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4389BF80115;
	Wed,  8 Jul 2020 11:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64DFAF8015A; Wed,  8 Jul 2020 11:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C218F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 11:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C218F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="TO0IWmej"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06898mX7031611; Wed, 8 Jul 2020 11:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iawSYaeSKNtVm44sgn49UhCmyo15meIegOqh6x74E2M=;
 b=TO0IWmejSbgi7SHJXFFD9ycY1Yz2bJiFrKk55e7vIsjjYRhwXn01v/NE2Fg6D1XxVL0c
 cZcHuW4kzDK+uLzkp3S3d7vB9C3sL2wEHr9JnbiBsBboeaLC3kRpPNGJ4dpZOuY5ulQ5
 JG5Oiz+KAFYspXbJXwZe5SEaDp41aEJJY+GjCoWe/XCM7yWQkUNZDrzdZiWMl0FeRAI0
 RghVB+2dhAf4tPKbOpJakxQGR7BmLt4s33BDj7vvbl9w0krkboSbqKP+dWD6cj5dVXNF
 AjAws0bd/3lFDpzkFW2WK9DMR7X/8ts7aDSyyZlC/LF8iXVzRHycrestry/rhxC/hUXb BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322f80xfwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 11:12:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 470B910002A;
 Wed,  8 Jul 2020 11:12:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A8062222A6;
 Wed,  8 Jul 2020 11:12:00 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jul
 2020 11:11:58 +0200
Subject: Re: [PATCH v3 06/10] ASoC: sti: uniperif: fix 'defined by not used'
 warning
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200707191615.98296-7-pierre-louis.bossart@linux.intel.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <a376393a-6a17-2836-204b-0d4ff60729c0@st.com>
Date: Wed, 8 Jul 2020 11:11:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707191615.98296-7-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
Cc: "tiwai@suse.de" <tiwai@suse.de>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

Hi Pierre-Louis,

On 7/7/20 9:16 PM, Pierre-Louis Bossart wrote:
> Fix W=1 warning. The table uni_tdm_hw is declared in a header included
> by multiple C file. This isn't really a good practice but for now
> using __maybe_unused makes the following warning go away.
> 
> sound/soc/sti/sti_uniperif.c:12:
> sound/soc/sti/uniperif.h:1351:38: warning: ‘uni_tdm_hw’ defined but
> not used [-Wunused-const-variable=]
>  1351 | static const struct snd_pcm_hardware uni_tdm_hw = {
>       |                                      ^~~~~~~~~~
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks for the patch, 
Seems that the same patch has already been proposed by Lee: 
https://www.spinics.net/lists/arm-kernel/msg820327.html

Regards,
Arnaud

> ---
>  sound/soc/sti/uniperif.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
> index 2dc2da5d458b..a16adeb7c1e9 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -1348,7 +1348,7 @@ struct sti_uniperiph_data {
>  	struct sti_uniperiph_dai dai_data;
>  };
>  
> -static const struct snd_pcm_hardware uni_tdm_hw = {
> +static __maybe_unused const struct snd_pcm_hardware uni_tdm_hw = {
>  	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
>  		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_MMAP |
>  		SNDRV_PCM_INFO_MMAP_VALID,
> 
