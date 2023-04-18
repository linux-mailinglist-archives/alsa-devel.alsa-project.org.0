Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7446E5E41
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 12:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9830E11;
	Tue, 18 Apr 2023 12:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9830E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681812566;
	bh=irLIcW8upGXeXeu0H5UNe5qfe28jCtKR8WN4aMsrm+w=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Daua0uUBvW53ckzBr3yVG1MbxBYUeBXb9kCceyDM/ucKZNoy6KeiADvu2ckIy2fDf
	 tQuPG1qxVOjdAi8FLzduHwP1AXryuFIkEdn84h0rT1UABbK2tXN5LLxocDOyQHciuj
	 YI16dUobzvY4LPihA6wBZ6yAZ9lsVsvp+bsYyIjc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43843F80149;
	Tue, 18 Apr 2023 12:08:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA96F80155; Tue, 18 Apr 2023 12:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FBF8F800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 12:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBF8F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TCQn6SEN
Received: by mail-ej1-x62d.google.com with SMTP id sz19so14655982ejc.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681812506; x=1684404506;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJbsS52QI8BD8L7bxBieLvqoLUvDI9qlj6d+AdrgnkE=;
        b=TCQn6SENxKUiWDWhguKUbbm85cwuKKTE9nnZAIR/Az6QKtuen7UP9nz99yiKw2fk6/
         M40Q+mSYpF79fJAmx4BiBvn8UnFwwBOKTWa6by7ikSUGkANCZK++4uN84cyPVGTO+3Wq
         8Okguo4CcwVG9g5fxTvXY62p0SsHDpjl7CimpY1v8v6nHfr14xiprIfCt1eYJse7Zgio
         PxRpzBMrqlr/Td7rn6epU70Y/9U1oWiehSlji7ARMgDPqkwAPYba6l7+0XL6IBCPIM2N
         NEkQOMxAszEyhiCCV3Mqa0Zw+rdcM1q8lYGCz5uLvS42mTtzI0MusuYtqMr5PyP1QUPk
         UnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681812506; x=1684404506;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJbsS52QI8BD8L7bxBieLvqoLUvDI9qlj6d+AdrgnkE=;
        b=KS+pxfmCDp9CLwqzOpuL+HLE1ydqcYsLxCv21hRi9OmCY8KsbgUB70TUuKkcBbPT+4
         SrxqnkcQwwf9ssue0KBelNiSaT7zUj9/aJG5PskagBkkrL5d7lsXg8TVavgtMT/I2Mz0
         bYzsTWw770EuucqL19wyuCknlndDnRlibPMajbiPVGIE0y+e6u6A80OATRjxfxt/a6T2
         sJn1iTi+5tSkm2l5OJU0BmM69XVqlRHmDE6QTyPsuFfiXXnflJqXWPMotya7TQzbDbLq
         Qy1pgPNePxF5+e+VoHKFiMln7JL0w6oDVk9IRIAVc+m07pL60ujpSWlPPIrIZW8mCbRY
         2j1g==
X-Gm-Message-State: AAQBX9eCdTVcwLCXFIWgngUw46JTYXsl9GvKw6YQOAH2qq0sJONQFbXC
	0NYbfg+aVO06wXF3H7gW7MH7FQ==
X-Google-Smtp-Source: 
 AKy350bK/PoL+9j3PyVEjxvyP7zDgA8zwSdAmWINjdewHtyntiM5Dg7QeddoYymo3qIPHQ/t62hoRA==
X-Received: by 2002:a17:906:7fd0:b0:94e:fe21:baf with SMTP id
 r16-20020a1709067fd000b0094efe210bafmr12821705ejs.21.1681812505857;
        Tue, 18 Apr 2023 03:08:25 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 w3-20020a170906b18300b0094b5ce9d43dsm7836225ejy.85.2023.04.18.03.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:08:25 -0700 (PDT)
Message-ID: <b06da452-1cd3-a8f0-36a9-9ee7c8a6527f@linaro.org>
Date: Tue, 18 Apr 2023 11:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/7] soundwire: qcom: allow 16-bit sample interval for
 ports
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
 <20230418095447.577001-4-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230418095447.577001-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KPPDOGFRSFFAVSM2BJIDMBAKTBBQZMKT
X-Message-ID-Hash: KPPDOGFRSFFAVSM2BJIDMBAKTBBQZMKT
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPPDOGFRSFFAVSM2BJIDMBAKTBBQZMKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/04/2023 10:54, Krzysztof Kozlowski wrote:
> The port sample interval was always 16-bit, split into low and high
> bytes.  This split was unnecessary, although harmless for older devices
> because all of them used only lower byte (so values < 0xff).  With
> support for Soundwire controller on Qualcomm SM8550 and its devices,
> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
> to allow 16-bit sample intervals.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> Changes since v2:
> 1. Use uint16 for qcom,ports-sinterval.
> 2. Add tags.
> 
> Changes since v1:
> 1. Drop unneeded semicolon.
> ---
>   drivers/soundwire/qcom.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index c296e0bf897b..d051dc408532 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -95,6 +95,7 @@
>   #define SWRM_DP_BLOCK_CTRL2_BANK(n, m)	(0x1130 + 0x100 * (n - 1) + 0x40 * m)
>   #define SWRM_DP_PORT_HCTRL_BANK(n, m)	(0x1134 + 0x100 * (n - 1) + 0x40 * m)
>   #define SWRM_DP_BLOCK_CTRL3_BANK(n, m)	(0x1138 + 0x100 * (n - 1) + 0x40 * m)
> +#define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
>   #define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
>   #define SWR_MSTR_MAX_REG_ADDR		(0x1740)
>   
> @@ -131,7 +132,7 @@ enum {
>   };
>   
>   struct qcom_swrm_port_config {
> -	u8 si;
> +	u16 si;
>   	u8 off1;
>   	u8 off2;
>   	u8 bp_mode;
> @@ -806,12 +807,20 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
>   
>   	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
>   	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
> -	value |= pcfg->si;
> +	value |= pcfg->si & 0xff;
>   
>   	ret = ctrl->reg_write(ctrl, reg, value);
>   	if (ret)
>   		goto err;
>   
> +	if (pcfg->si > 0xff) {
> +		value = (pcfg->si >> 8) & 0xff;
> +		reg = SWRM_DP_SAMPLECTRL2_BANK(params->port_num, bank);
> +		ret = ctrl->reg_write(ctrl, reg, value);
> +		if (ret)
> +			goto err;
> +	}
> +
>   	if (pcfg->lane_control != SWR_INVALID_PARAM) {
>   		reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
>   		value = pcfg->lane_control;
> @@ -1185,7 +1194,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   	struct device_node *np = ctrl->dev->of_node;
>   	u8 off1[QCOM_SDW_MAX_PORTS];
>   	u8 off2[QCOM_SDW_MAX_PORTS];
> -	u8 si[QCOM_SDW_MAX_PORTS];
> +	u16 si[QCOM_SDW_MAX_PORTS];
>   	u8 bp_mode[QCOM_SDW_MAX_PORTS] = { 0, };
>   	u8 hstart[QCOM_SDW_MAX_PORTS];
>   	u8 hstop[QCOM_SDW_MAX_PORTS];
> @@ -1193,6 +1202,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   	u8 blk_group_count[QCOM_SDW_MAX_PORTS];
>   	u8 lane_control[QCOM_SDW_MAX_PORTS];
>   	int i, ret, nports, val;
> +	bool si_16 = false;
>   
>   	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
>   
> @@ -1236,9 +1246,14 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   		return ret;
>   
>   	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
> -					si, nports);
> -	if (ret)
> -		return ret;
> +					(u8 *)si, nports);
> +	if (ret) {
> +		ret = of_property_read_u16_array(np, "qcom,ports-sinterval",
> +						 si, nports);
> +		if (ret)
> +			return ret;
> +		si_16 = true;
> +	}
>   
>   	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
>   					bp_mode, nports);
> @@ -1266,7 +1281,10 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   
>   	for (i = 0; i < nports; i++) {
>   		/* Valid port number range is from 1-14 */
> -		ctrl->pconfig[i + 1].si = si[i];
> +		if (si_16)
> +			ctrl->pconfig[i + 1].si = si[i];
> +		else
> +			ctrl->pconfig[i + 1].si = ((u8 *)si)[i];
>   		ctrl->pconfig[i + 1].off1 = off1[i];
>   		ctrl->pconfig[i + 1].off2 = off2[i];
>   		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
