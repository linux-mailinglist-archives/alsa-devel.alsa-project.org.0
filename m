Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F1218932
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7477016A5;
	Wed,  8 Jul 2020 15:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7477016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594215351;
	bh=LLBn5xQBoKaghB5VUaR314z31kRbWiI11rWASMQl+88=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmqrIHa1wfUwjJoKVvY1X1+wUpoH4mc0BgfJ0w+VzSuLsl/NTifQCI45S3xak67II
	 IGzVv2Ma5JuqPrw/j2vA+VT4ebfA1kSbEt7e7pegRRNaoROhMg4VttT+rMfi00If9N
	 IXpxUyEOm/4CQ3g8/ZUtQEYFLrxf897Ydfgy/7V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A9DF80258;
	Wed,  8 Jul 2020 15:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE92F8015C; Wed,  8 Jul 2020 15:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FAB2F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAB2F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="F+6LQUKl"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068DRjZY011083; Wed, 8 Jul 2020 15:34:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=yLQyONm0OZ3tpaysk6y1/Tkb1PKTErxNitHpKeaMJiU=;
 b=F+6LQUKl0v3IRItP9iY+weKyyx0Uj7xxK/zIexSzaZkncqX5ITkYjCSpDzfOgVXxKwh2
 uupHtqOtsZ/n1op0CvB0E7n3j9zDdaX9FTPIauuQ8Z9hr1VfP2vXKa1QjYRN3/yizQL0
 Yupbm9KTiF02FT5zWndOFV8BYEzXgtzryU/scHQtvTu105kYDE4v52a4hvQAzFTbA4uS
 psM5cwxZeer2E9QibAZAr3N0Vp0c7BoNUPqD7d3uqXAZ7euK41F9iKgio5LbYeHefk8A
 qFtqhSbjz+a1oeXoiA5EISj/WoNCjzhR9hQwHVmwULJp7tVX7tRDgxEsIk/+HOtKgzIG 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322fhv7tru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 15:34:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7633810002A;
 Wed,  8 Jul 2020 15:34:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66B392BF9B7;
 Wed,  8 Jul 2020 15:34:44 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jul
 2020 15:34:42 +0200
Subject: Re: [PATCH v2 20/28] ASoC: sti: uniperif: Mark 'uni_tdm_hw' as
 __maybe_unused
To: Lee Jones <lee.jones@linaro.org>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
 <20200707143742.2959960-21-lee.jones@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <fdb3fb06-d710-5c4b-6b85-fc9bb90b891b@st.com>
Date: Wed, 8 Jul 2020 15:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707143742.2959960-21-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_11:2020-07-08,
 2020-07-08 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



On 7/7/20 4:37 PM, Lee Jones wrote:
> Only 2 of the 3 source files which include this headerfile actually
> reference 'uni_tdm_hw'.  The other source file 'sti_uniperif.c' sees
> as it as being unused.  Mark it as __maybe_unused to show that this
> behaviour is not only known, it's intentional.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  sound/soc/sti/uniperif.h:1351:38: warning: ‘uni_tdm_hw’ defined but not used [-Wunused-const-variable=]
>  1351 | static const struct snd_pcm_hardware uni_tdm_hw = {
>  | ^~~~~~~~~~
> 
> Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks
Arnaud
> ---
>  sound/soc/sti/uniperif.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
> index 2dc2da5d458bd..e22d045d5cd99 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -1348,7 +1348,7 @@ struct sti_uniperiph_data {
>  	struct sti_uniperiph_dai dai_data;
>  };
>  
> -static const struct snd_pcm_hardware uni_tdm_hw = {
> +static const struct snd_pcm_hardware __maybe_unused uni_tdm_hw = {
>  	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
>  		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_MMAP |
>  		SNDRV_PCM_INFO_MMAP_VALID,
> 
