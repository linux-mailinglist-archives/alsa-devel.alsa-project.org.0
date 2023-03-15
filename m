Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BEA6BB552
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:56:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9781257;
	Wed, 15 Mar 2023 14:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9781257
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678888590;
	bh=8CDPF7XpTM1afI5JDMkWW9CKasVWRKOOB3yNUU8wxi8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Y046yGWqT3Cv6vCYS39Ly6Z1Fw9UXYB6etnKhNWl9JbDiDLWI5T7b4sM/Qc3EWhDH
	 G0d3DlIPvOk0lQV0eM7h/wQj/aeDaI7A76IpO11YGBbF9URfJVR73ly1ifVL79COJ0
	 b0QoUOjFoUhuldKLXyJNZ88jxKMXaFTRCJlb9M8w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05080F8032D;
	Wed, 15 Mar 2023 14:55:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 173DBF80425; Wed, 15 Mar 2023 14:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34E66F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E66F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AFOfedjg
Received: by mail-ed1-x52d.google.com with SMTP id fd5so42003840edb.7
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678888530;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FL2PPYlA0uRNBqiWUXPuYQTCMqk2pdi/oLiMTHLvsic=;
        b=AFOfedjgXSfHm0FNU0hZ/CmUqoER/e89nK2ng2txWLf8ICWj/nGtq3b/d4mfuSpGrW
         O1HFmqgN3bjP55Fw9LczQKBO9y8ysPn/4E8XIHPMmsTLH1Qj5KfsMERSzXpwkAdcfU0+
         5U9ovU2dPH8JnPl0IcdTabZ9/22tWBkASeY1GS1lkgwoKk2gacKxD7jUcduxW7/cpSJj
         Qe3KUT1L/bLAGL+r9ZXuv4kMKRLdDGBmsOjCuHO702yfNuh926onLw1V2+7WWmOAJknY
         JNoZnJBvuEF4gn4pVRVZnFzYrnj6wEgUb4LD91L/gVfUfTMdgGI7ojADK+oQMceGPboA
         +7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888530;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FL2PPYlA0uRNBqiWUXPuYQTCMqk2pdi/oLiMTHLvsic=;
        b=uPr9RQjf0NwQhrlwgdzKCs10IP7MxJVbuyzAt+MkahCE5lMBV0eB9+VHbbma29fLrd
         mYTjV00waCwUsDPNTLEpR8M4yad1THrpbSEZU3FxnKvO9yb0gpYn/ITXVu7p64SLRnRF
         kKkyQKdgmmYgZJWctHOTDMwsdCkdJxmz6UkexC5UGygyWWXHDIdPiRfznWH+J4Ck8Wto
         Sfsj3h9gySBGcvDD2fBIk7EeLFuWqkkHT0U8eJGtf5tqTJit2tCnfJS7ZTLFBLcxqI3K
         hmemvjdcnlplpFANwpJgePdVPwvGmYCo2vrwXWrpKflTQmCWkZiz4NZJcuMQ8i6NPjif
         MhBg==
X-Gm-Message-State: AO0yUKXPOtc7VXpPnmHuOu166Ys9XvHjiQMnGvmAWVJBf0CkfP6QOqbk
	egkeauhTX2tL21xq+2v79BK4bQ==
X-Google-Smtp-Source: 
 AK7set9f42lDPAauaA03LEFsdxyf5keK13/YIZ6Me3D3oy6UAB45VczN3jJ7dfbB7drXgjK46lX3aQ==
X-Received: by 2002:a17:906:3986:b0:91f:32f9:82f0 with SMTP id
 h6-20020a170906398600b0091f32f982f0mr6253293eje.29.1678888530287;
        Wed, 15 Mar 2023 06:55:30 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 ot10-20020a170906ccca00b008e51a1fd7bfsm2580448ejb.172.2023.03.15.06.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:55:29 -0700 (PDT)
Message-ID: <7de97b6f-1318-5c40-2e42-3cc4774c9905@linaro.org>
Date: Wed, 15 Mar 2023 13:55:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] soundwire: qcom: define hardcoded version magic
 numbers
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FNICPWPZSWONUYXWFR6UTJHS6VYMEGYY
X-Message-ID-Hash: FNICPWPZSWONUYXWFR6UTJHS6VYMEGYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNICPWPZSWONUYXWFR6UTJHS6VYMEGYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 22/02/2023 14:44, Krzysztof Kozlowski wrote:
> Use a define instead of hard-coded register values for Soundwire
> hardware version number, because it is a bit easier to read and allows
> to drop explaining comment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Thanks Krzysztof,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   drivers/soundwire/qcom.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index ba502129150d..79bebcecde6d 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -28,6 +28,9 @@
>   #define SWRM_LINK_MANAGER_EE					0x018
>   #define SWRM_EE_CPU						1
>   #define SWRM_FRM_GEN_ENABLED					BIT(0)
> +#define SWRM_VERSION_1_3_0					0x01030000
> +#define SWRM_VERSION_1_5_1					0x01050001
> +#define SWRM_VERSION_1_7_0					0x01070000
>   #define SWRM_COMP_HW_VERSION					0x00
>   #define SWRM_COMP_CFG_ADDR					0x04
>   #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
> @@ -351,8 +354,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>   	/* Its assumed that write is okay as we do not get any status back */
>   	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
>   
> -	/* version 1.3 or less */
> -	if (swrm->version <= 0x01030000)
> +	if (swrm->version <= SWRM_VERSION_1_3_0)
>   		usleep_range(150, 155);
>   
>   	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> @@ -695,7 +697,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
>   	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>   
> -	if (ctrl->version >= 0x01070000) {
> +	if (ctrl->version >= SWRM_VERSION_1_7_0) {
>   		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>   				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> @@ -704,8 +706,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   	}
>   
>   	/* Configure number of retries of a read/write cmd */
> -	if (ctrl->version >= 0x01050001) {
> -		/* Only for versions >= 1.5.1 */
> +	if (ctrl->version >= SWRM_VERSION_1_5_1) {
>   		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
>   				SWRM_RD_WR_CMD_RETRIES |
>   				SWRM_CONTINUE_EXEC_ON_CMD_IGNORE);
> @@ -1239,7 +1240,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>   	ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
>   					bp_mode, nports);
>   	if (ret) {
> -		if (ctrl->version <= 0x01030000)
> +		if (ctrl->version <= SWRM_VERSION_1_3_0)
>   			memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>   		else
>   			return ret;
> @@ -1442,7 +1443,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	pm_runtime_enable(dev);
>   
>   	/* Clk stop is not supported on WSA Soundwire masters */
> -	if (ctrl->version <= 0x01030000) {
> +	if (ctrl->version <= SWRM_VERSION_1_3_0) {
>   		ctrl->clock_stop_not_supported = true;
>   	} else {
>   		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
> @@ -1527,7 +1528,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>   	} else {
>   		reset_control_reset(ctrl->audio_cgcr);
>   
> -		if (ctrl->version >= 0x01070000) {
> +		if (ctrl->version >= SWRM_VERSION_1_7_0) {
>   			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>   			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>   					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
