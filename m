Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D155827DC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 15:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DEF1632;
	Wed, 27 Jul 2022 15:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DEF1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658929192;
	bh=rf97L+bvUBMhH3RKjeDSDJTG1OTaJ3XhNU8sEQQYtKY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFxjEMAWj5Hp+MdmzzQhYkTdSnyNxfUS4lzdwLgfyzQew1mhkTiVXR5RSvwpLH3W5
	 pJuwS/AiAYXNS7BSybg/pSKhAdmbxveCBBFBKrp4r1AhuHLvzHMFIpzs4IFLaezZxj
	 BZwke9Hz7YKRtQtNGA95vSwAv0zUO+dDaYLiGI2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC925F80171;
	Wed, 27 Jul 2022 15:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81E71F8015B; Wed, 27 Jul 2022 15:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08926F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 15:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08926F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Lvq+H6p+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658929126; x=1690465126;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4fzlMdFpCX30nlloAxt/drB1D1zwZCDcg/D581dbx7o=;
 b=Lvq+H6p+lnsmTq5QobkQ4XR/lxJUxxOwc8O7rS1RxzrUuDOxLhfAoTcs
 ioN/YvoeFhnHF2EQB5q1/DEtSf3FH+sVRd+t9XFToxSQoaSs8hA7E6n6o
 +OrrE9UZCZ9uAjjKDsmUQmOZZ/g3WSbjedCpKLsYGoz7oS2ygG0Yllk0B A=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 27 Jul 2022 06:38:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 06:38:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Jul 2022 06:38:41 -0700
Received: from [10.216.8.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Jul
 2022 06:38:38 -0700
Message-ID: <08899e74-9d1e-52a6-722a-c802ba429662@quicinc.com>
Date: Wed, 27 Jul 2022 19:08:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: codecs: va-macro: use fsgen as clock
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, <broonie@kernel.org>
References: <20220727124749.4604-1-srinivas.kandagatla@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <20220727124749.4604-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

Thanks for the Patch Srini!!!

On 7/27/2022 6:17 PM, Srinivas Kandagatla wrote:
> VA Macro fsgen clock is supplied to other LPASS Macros using proper
> clock apis, however the internal user uses the registers directly without
> clk apis. This approch has race condition where in external users of
> the clock might cut the clock while VA macro is actively using this.
>
> Moving the internal usage to clk apis would provide a proper refcounting
> and avoid such race conditions.
>
> This issue was noticed while headset was pulled out while recording is
> in progress and shifting record patch to DMIC.
>
> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
This is verified on SC7280 based platform.

Tested-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

>   sound/soc/codecs/lpass-va-macro.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index d18b56e60433..1ea10dc70748 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -199,6 +199,7 @@ struct va_macro {
>   	struct clk *mclk;
>   	struct clk *macro;
>   	struct clk *dcodec;
> +	struct clk *fsgen;
>   	struct clk_hw hw;
>   	struct lpass_macro *pds;
>   
> @@ -467,9 +468,9 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		return va_macro_mclk_enable(va, true);
> +		return clk_prepare_enable(va->fsgen);
>   	case SND_SOC_DAPM_POST_PMD:
> -		return va_macro_mclk_enable(va, false);
> +		clk_disable_unprepare(va->fsgen);
>   	}
>   
>   	return 0;
> @@ -1473,6 +1474,12 @@ static int va_macro_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_clkout;
>   
> +	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
> +	if (IS_ERR(va->fsgen)) {
> +		ret = PTR_ERR(va->fsgen);
> +		goto err_clkout;
> +	}
> +
>   	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
>   					      va_macro_dais,
>   					      ARRAY_SIZE(va_macro_dais));
