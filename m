Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7234E40E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 11:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE511671;
	Tue, 30 Mar 2021 11:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE511671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617095422;
	bh=/muBztoqgyj2B/v8tTF7VIZmUUCWIyLb987NotxvEAs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvqVxIS/HYl7gADT3GpBG43YkMTBLr+I3sWCVEoSGXnILeeZTgHb1aiXw9zf5aZic
	 8iAwbIQB2B4o+TKYPTTKogD8DVRIdaK7c6RpHbb6Y8KGcUEPiIW9tsEzH9GItDhB8R
	 68fqQc7a9A6SUwCCsq3PJqtpS18/rFvE697aFpkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D94F7F8027D;
	Tue, 30 Mar 2021 11:08:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67A55F8027B; Tue, 30 Mar 2021 11:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73CBF800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 11:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73CBF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wR0tOtbZ"
Received: by mail-ej1-x631.google.com with SMTP id a7so23709494ejs.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/eqR/g4dGWafdF3bo4TemakWiaBabfCWwqaWK3tpTqo=;
 b=wR0tOtbZAeOW2MSbinTo9CpuzhtzAXmX8ZZBPgjlR91ZplMhIzXsACCNLyxMYieomd
 prJMQNmN1r0Dd+S1o3J9udQW8C7q1ksTs1c8pVtBVnLTSSdTYrLOrP3KEDER8/M6AbwW
 1iMODhiXBA0GwTF+AoIUsljoCDlFekdZKLNBdhBBTMpaTt/VAuksij/5d8InA88gGoHt
 qzLd5eO6fQ2Dqhxz4qd36ku0diQ3XMK+jImcdW1e12DKCoAA0VUoJY6BDlm9cOItue+N
 dkV1PiOvOlXm83KJACv8ORzrxwqu5MF2PDh3cl7E79GS691haPEIlDgpVyoc2GvbjjSz
 XhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/eqR/g4dGWafdF3bo4TemakWiaBabfCWwqaWK3tpTqo=;
 b=L8vk0dvs9gtlMjrGPxejVMimSFPCSF/dDYxwfwrdca/NY21nmciDZFS8iqdlGCCADW
 QKeydEJmS6DdLy6WrXnKziNEKovYP9TPh8lC6MDJ0WoqZ0oh3fPpNiM1mu2fbW6G06kZ
 l8j3iPCk51BStypSrJdSWou/TJJ04AJeUldUJcxGUOyLyWovbA/tH2i2wSxt9U05apRg
 NWcPFsM1JS8MnPsHPcU1DNvcKu0Oxl5aNbNnEw4X/iAywa6DSck+kHPqXhT2BHJljf6S
 3guf/PQ4iVyYyJi+0vlEu+ERVLwpxPIc2JNaVYYUkcmkfODTmxBTpqJ6Wer2H/yCbtdq
 7eZQ==
X-Gm-Message-State: AOAM532OXXtbaOrO1RQ/zZVhb2kRqrmrCmdu3oPtzBg2nevhOY2kXVVB
 /QSsVpqTFCw+gOB/mKiChAOcMFe/ehuNKA==
X-Google-Smtp-Source: ABdhPJz/7asF1GdAVv322WqculaCFkc4tIsDjNj4rHsPiY0qx06pw6nY9zvYgztYrCvtTeVw6SGGOQ==
X-Received: by 2002:a17:906:f9d8:: with SMTP id
 lj24mr32579966ejb.200.1617095313267; 
 Tue, 30 Mar 2021 02:08:33 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i10sm9652676ejv.106.2021.03.30.02.08.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:08:32 -0700 (PDT)
Subject: Re: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0f41669c-c8e5-a2e2-f6ce-cdff066b26f3@linaro.org>
Date: Tue, 30 Mar 2021 10:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Takashi Iwai <tiwai@suse.com>
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

Thanks Dmitry for looking at this,

On 27/03/2021 09:28, Dmitry Baryshkov wrote:
> Q6afe-clocks driver can get reprobed. For example if the APR services
> are restarted after the firmware crash. However currently Q6afe-clocks
> driver will oops because hw.init will get cleared during first _probe
> call. Rewrite the driver to fill the clock data at runtime rather than
> using big static array of clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   sound/soc/qcom/qdsp6/q6afe-clocks.c | 209 ++++++++++++++--------------
>   sound/soc/qcom/qdsp6/q6afe.c        |   2 +-
>   sound/soc/qcom/qdsp6/q6afe.h        |   2 +-
>   3 files changed, 108 insertions(+), 105 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
> index f0362f061652..9431656283cd 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
> @@ -11,33 +11,29 @@
>   #include <linux/slab.h>
>   #include "q6afe.h"
>   
> -#define Q6AFE_CLK(id) &(struct q6afe_clk) {		\
> +#define Q6AFE_CLK(id) {					\
>   		.clk_id	= id,				\
>   		.afe_clk_id	= Q6AFE_##id,		\
>   		.name = #id,				\
> -		.attributes = LPASS_CLK_ATTRIBUTE_COUPLE_NO, \
>   		.rate = 19200000,			\
> -		.hw.init = &(struct clk_init_data) {	\
> -			.ops = &clk_q6afe_ops,		\
> -			.name = #id,			\
> -		},					\
>   	}
>   
> -#define Q6AFE_VOTE_CLK(id, blkid, n) &(struct q6afe_clk) { \
> +#define Q6AFE_VOTE_CLK(id, blkid, n) {			\
>   		.clk_id	= id,				\
>   		.afe_clk_id = blkid,			\
> -		.name = #n,				\
> -		.hw.init = &(struct clk_init_data) {	\
> -			.ops = &clk_vote_q6afe_ops,	\
> -			.name = #id,			\
> -		},					\
> +		.name = n,				\
>   	}
>   
> -struct q6afe_clk {
> -	struct device *dev;
> +struct q6afe_clk_init {
>   	int clk_id;
>   	int afe_clk_id;
>   	char *name;
> +	int rate;
> +};
> +
> +struct q6afe_clk {
> +	struct device *dev;
> +	int afe_clk_id;
>   	int attributes;
>   	int rate;
>   	uint32_t handle;
> @@ -48,8 +44,7 @@ struct q6afe_clk {
>   
>   struct q6afe_cc {
>   	struct device *dev;
> -	struct q6afe_clk **clks;
> -	int num_clks;
> +	struct q6afe_clk *clks[Q6AFE_MAX_CLK_ID];
>   };
>   
>   static int clk_q6afe_prepare(struct clk_hw *hw)
> @@ -105,7 +100,7 @@ static int clk_vote_q6afe_block(struct clk_hw *hw)
>   	struct q6afe_clk *clk = to_q6afe_clk(hw);
>   
>   	return q6afe_vote_lpass_core_hw(clk->dev, clk->afe_clk_id,
> -					clk->name, &clk->handle);
> +					clk_hw_get_name(&clk->hw), &clk->handle);
>   }
>   
>   static void clk_unvote_q6afe_block(struct clk_hw *hw)
> @@ -120,84 +115,76 @@ static const struct clk_ops clk_vote_q6afe_ops = {
>   	.unprepare	= clk_unvote_q6afe_block,
>   };
>   
> -static struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
> -	[LPASS_CLK_ID_PRI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
> -	[LPASS_CLK_ID_PRI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
> -	[LPASS_CLK_ID_SEC_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
> -	[LPASS_CLK_ID_SEC_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
> -	[LPASS_CLK_ID_TER_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
> -	[LPASS_CLK_ID_TER_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
> -	[LPASS_CLK_ID_QUAD_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUAD_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_IBIT] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_EBIT] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
> -	[LPASS_CLK_ID_SPEAKER_I2S_OSR] =
> -				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
> -	[LPASS_CLK_ID_QUI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
> -	[LPASS_CLK_ID_SEN_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
> -	[LPASS_CLK_ID_SEN_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
> -	[LPASS_CLK_ID_INT0_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT1_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT2_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT3_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT4_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT5_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
> -	[LPASS_CLK_ID_INT6_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
> -	[LPASS_CLK_ID_QUI_MI2S_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> -	[LPASS_CLK_ID_PRI_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
> -	[LPASS_CLK_ID_PRI_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
> -	[LPASS_CLK_ID_SEC_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
> -	[LPASS_CLK_ID_SEC_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
> -	[LPASS_CLK_ID_TER_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
> -	[LPASS_CLK_ID_TER_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
> -	[LPASS_CLK_ID_QUAD_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
> -	[LPASS_CLK_ID_QUAD_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
> -	[LPASS_CLK_ID_QUIN_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
> -	[LPASS_CLK_ID_QUIN_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
> -	[LPASS_CLK_ID_QUI_PCM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
> -	[LPASS_CLK_ID_PRI_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
> -	[LPASS_CLK_ID_PRI_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
> -	[LPASS_CLK_ID_SEC_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
> -	[LPASS_CLK_ID_SEC_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
> -	[LPASS_CLK_ID_TER_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
> -	[LPASS_CLK_ID_TER_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
> -	[LPASS_CLK_ID_QUAD_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
> -	[LPASS_CLK_ID_QUAD_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
> -	[LPASS_CLK_ID_QUIN_TDM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
> -	[LPASS_CLK_ID_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
> -	[LPASS_CLK_ID_MCLK_2] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
> -	[LPASS_CLK_ID_MCLK_3] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
> -	[LPASS_CLK_ID_MCLK_4] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
> -	[LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE] =
> -		Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
> -	[LPASS_CLK_ID_INT_MCLK_0] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
> -	[LPASS_CLK_ID_INT_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
> -	[LPASS_CLK_ID_WSA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
> -	[LPASS_CLK_ID_WSA_CORE_NPL_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_VA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> -	[LPASS_CLK_ID_TX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
> -	[LPASS_CLK_ID_TX_CORE_NPL_MCLK] =
> -			Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_RX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
> -	[LPASS_CLK_ID_RX_CORE_NPL_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
> -	[LPASS_CLK_ID_VA_CORE_2X_MCLK] =
> -				Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
> -	[LPASS_HW_AVTIMER_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
> -						 Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
> -						 "LPASS_AVTIMER_MACRO"),
> -	[LPASS_HW_MACRO_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
> -						Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
> -						"LPASS_HW_MACRO"),
> -	[LPASS_HW_DCODEC_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
> -					Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
> -					"LPASS_HW_DCODEC"),
> +static const struct q6afe_clk_init q6afe_clks[] = {
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
> +	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
> +	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
> +	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
> +	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
> +	Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
> +		       Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
> +		       "LPASS_AVTIMER_MACRO"),
> +	Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
> +		       Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
> +		       "LPASS_HW_MACRO"),
> +	Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
> +		       Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
> +		       "LPASS_HW_DCODEC"),
>   };
>   
>   static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
> @@ -207,7 +194,7 @@ static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
>   	unsigned int idx = clkspec->args[0];
>   	unsigned int attr = clkspec->args[1];
>   
> -	if (idx >= cc->num_clks || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
> +	if (idx >= Q6AFE_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
>   		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
>   		return ERR_PTR(-EINVAL);
>   	}
> @@ -230,20 +217,36 @@ static int q6afe_clock_dev_probe(struct platform_device *pdev)
>   	if (!cc)
>   		return -ENOMEM;
>   
> -	cc->clks = &q6afe_clks[0];
> -	cc->num_clks = ARRAY_SIZE(q6afe_clks);
> +	cc->dev = dev;
>   	for (i = 0; i < ARRAY_SIZE(q6afe_clks); i++) {
> -		if (!q6afe_clks[i])
> -			continue;
> +		unsigned int id = q6afe_clks[i].clk_id;
> +		struct clk_init_data init = {
> +			.name =  q6afe_clks[i].name,
> +		};
> +		struct q6afe_clk *clk;
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		clk->dev = dev;
> +		clk->afe_clk_id = q6afe_clks[i].afe_clk_id;
> +		clk->rate = q6afe_clks[i].rate;
> +		clk->hw.init = &init;
> +
> +		if (clk->rate)
> +			init.ops = &clk_q6afe_ops;
> +		else
> +			init.ops = &clk_vote_q6afe_ops;
>   
> -		q6afe_clks[i]->dev = dev;
> +		cc->clks[id] = clk;
>   
> -		ret = devm_clk_hw_register(dev, &q6afe_clks[i]->hw);
> +		ret = devm_clk_hw_register(dev, &clk->hw);
>   		if (ret)
>   			return ret;
>   	}
>   
> -	ret = of_clk_add_hw_provider(dev->of_node, q6afe_of_clk_hw_get, cc);
> +	ret = devm_of_clk_add_hw_provider(dev, q6afe_of_clk_hw_get, cc);
>   	if (ret)
>   		return ret;
>   
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index cad1cd1bfdf0..4327b72162ec 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1681,7 +1681,7 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>   EXPORT_SYMBOL(q6afe_unvote_lpass_core_hw);
>   
>   int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
> -			     char *client_name, uint32_t *client_handle)
> +			     const char *client_name, uint32_t *client_handle)
>   {
>   	struct q6afe *afe = dev_get_drvdata(dev->parent);
>   	struct afe_cmd_remote_lpass_core_hw_vote_request *vote_cfg;
> diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
> index 22e10269aa10..3845b56c0ed3 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.h
> +++ b/sound/soc/qcom/qdsp6/q6afe.h
> @@ -236,7 +236,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
>   			  int clk_root, unsigned int freq);
>   int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
> -			     char *client_name, uint32_t *client_handle);
> +			     const char *client_name, uint32_t *client_handle);
>   int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>   			       uint32_t client_handle);
>   #endif /* __Q6AFE_H__ */
> 
