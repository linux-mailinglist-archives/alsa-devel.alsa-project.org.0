Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662D529D04C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 15:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FD882A;
	Wed, 28 Oct 2020 15:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FD882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603895153;
	bh=v6j9TIrYw/yus17uV+HiU/xnLDn0T0PsY6xcqficZF0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuEzVJLjXgKuxZHvVytzD4/3NNuOKKfxnY1Otz9I9Iy3nVpzpYj8uOyF+Rkae1t3B
	 hYICC2NcRBrJWkTWlOcDUN6xTxj1C3j4GpE4D1kvcDYPBLsnXUbwQCbcH2DNiD9d8K
	 YnbXIim92n6wULhylnLtx+CU2/qIUOebQpn/b3NQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B89EF80249;
	Wed, 28 Oct 2020 15:24:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A8D1F80212; Wed, 28 Oct 2020 15:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8591BF800E1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 15:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8591BF800E1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kXmN0-0006sW-JS; Wed, 28 Oct 2020 14:24:10 +0000
Subject: Re: [PATCH] ASoC: qcom: sm8250: Fix array out of bounds access
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201028142001.22431-1-srinivas.kandagatla@linaro.org>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <4fc6b58a-e3e6-b57e-7ae7-16fd32392bcb@canonical.com>
Date: Wed, 28 Oct 2020 14:24:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201028142001.22431-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
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

On 28/10/2020 14:20, Srinivas Kandagatla wrote:
> Static analysis Coverity had detected a potential array out-of-bounds
> write issue due to the fact that MAX AFE port Id was set to 16 instead
> of using AFE_PORT_MAX macro.
> 
> Fix this by properly using AFE_PORT_MAX macro.
> 
> Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 7d43de6d909f..52c40512102f 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -13,12 +13,11 @@
>  
>  #define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
> -#define MAX_SDW_STREAMS		16
>  
>  struct sm8250_snd_data {
> -	bool stream_prepared[MAX_SDW_STREAMS];
> +	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
> -	struct sdw_stream_runtime *sruntime[MAX_SDW_STREAMS];
> +	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>  };
>  
>  static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> 

Thanks, looks good to me.

Reviewed-by: Colin Ian King <colin.king@canonical.com>
