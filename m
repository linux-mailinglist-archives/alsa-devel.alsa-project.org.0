Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820F5BADD1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5B01A94;
	Fri, 16 Sep 2022 15:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5B01A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663333684;
	bh=Sggz3bZvmVqoKCGkqAdjT6VuoNSrxS8ha2vkD0v6WuI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PnvEWxbzSMcICqbAdV7mj/8KZJB97f2U2sHBTtVDUL8oq4H7e497Y3MVwUAaSyK+K
	 s/QwIbZGCQG3diwTYKMlTOWMnztv2ZDlXK8jMsFbrTZTvimt0gH3NE1J6ICzROLVRl
	 tB3JTQetRFqo1yA0CDq4HduOPz4Lzo9RkFpdyJ2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8EBCF8024C;
	Fri, 16 Sep 2022 15:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D4E9F802BE; Fri, 16 Sep 2022 15:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC391F8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC391F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WmiEwXzw"
Received: by mail-wm1-x336.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so19848049wmk.3
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2e3L0ED1BDpFLdmTFeqIIUKU3RqfHrrBxYTQB/sNCko=;
 b=WmiEwXzwWnQ7UhY4icQ+KagCVvewZf1BCWbBhzAwP1xnI7f2tTG51N/2zJzL1WOCaR
 9aiKuOvqAtqtWM2TmvB6sphGRbKpypjiXP2xf0Oguf5qD1YpKuPiehKdu/cx8lnE3gSu
 4Wm8hfai1x6u8g2wF2fwP63cTurPQ4AA1zOnW9KRXPLYl3lFwmci6Ry3V6aM+6HXqs0H
 NeNmCgewC1WV22suOCH3lAqR6oPUeqk4VFGIP9LHetVlUc3Dmj5McMfTD94JwuJiEtRW
 GZMbedYUVdldxNrRt7/dYsxbSVbFiV8iDzn7iKSJ5A6sJilWkEcgUZ+JybSqHWI2oiCe
 oRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2e3L0ED1BDpFLdmTFeqIIUKU3RqfHrrBxYTQB/sNCko=;
 b=ZjbTbjBO2rYSD7SsckDKYLs816Tkwth2N4dGIVWfcAPdb2QUyrqiDf0BXJogplN5kO
 /xZz8ArmK0Gq6V/rCougb4ZIe/vcxHvewT0fgkvWN8reA8ijAcjAu6IWgyAG9IlKL2Gg
 d0ALn7eg34+dAK41Veq61ovUObsp4e86aSZaSAMzaP/TfXlgc30H1GwNSYGrBixmeZPz
 pkCPDao+/11GxcALSS0dqEqm4nGbrt4+eH7+4kxzWLNPYV/ZJ7+MZpCneUyt/Ujw8rlh
 GcBNI9Bhj4NSHWbBWmELkJb85gzCyMBkbU5gMqVgRITzuELOb3urE2azAX2xgcsmuKfC
 K4/g==
X-Gm-Message-State: ACgBeo3g8khyDSjA0RNYe+u0GYjWKGhL08UU6aCe18VSIwk6nAuoTI6C
 KEjwh/F5i2wkpCqi+HSLCy2RBQ==
X-Google-Smtp-Source: AA6agR5UFLsDdB3qilLfFu+EUOFH0MP3U4bh23DIqC90LAY0sDX0eH8fz77Jqg/mU9Yy/mi+bZrsGQ==
X-Received: by 2002:a05:600c:2142:b0:3b4:92b6:73ba with SMTP id
 v2-20020a05600c214200b003b492b673bamr10433278wml.139.1663333616920; 
 Fri, 16 Sep 2022 06:06:56 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 y9-20020a05600c20c900b003a541d893desm2063106wmm.38.2022.09.16.06.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 06:06:56 -0700 (PDT)
Message-ID: <65f11ed1-f09f-e0a2-91f5-891394160c96@linaro.org>
Date: Fri, 16 Sep 2022 14:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] slimbus: qcom-ngd-ctrl: Make QMI message rules const
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Alex Elder <elder@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <20220912232526.27427-2-quic_jjohnson@quicinc.com>
 <20220912232526.27427-3-quic_jjohnson@quicinc.com>
 <20220912232526.27427-4-quic_jjohnson@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220912232526.27427-4-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
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



On 13/09/2022 00:25, Jeff Johnson wrote:
> Commit ff6d365898d ("soc: qcom: qmi: use con

SHA ID should be at least 12 chars long.

Same comment for all the patches in the series.


st for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const, so do that for qcom-ngd-ctrl.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Other than that it LGTM,
Once fixed:

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 0aa8408464ad..931ab6317467 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -220,7 +220,7 @@ struct slimbus_power_resp_msg_v01 {
>   	struct qmi_response_type_v01 resp;
>   };
>   
> -static struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
> +static const struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
>   	{
>   		.data_type  = QMI_UNSIGNED_4_BYTE,
>   		.elem_len   = 1,
> @@ -262,7 +262,7 @@ static struct qmi_elem_info slimbus_select_inst_req_msg_v01_ei[] = {
>   	},
>   };
>   
> -static struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
> +static const struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
>   	{
>   		.data_type  = QMI_STRUCT,
>   		.elem_len   = 1,
> @@ -284,7 +284,7 @@ static struct qmi_elem_info slimbus_select_inst_resp_msg_v01_ei[] = {
>   	},
>   };
>   
> -static struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
> +static const struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
>   	{
>   		.data_type  = QMI_UNSIGNED_4_BYTE,
>   		.elem_len   = 1,
> @@ -324,7 +324,7 @@ static struct qmi_elem_info slimbus_power_req_msg_v01_ei[] = {
>   	},
>   };
>   
> -static struct qmi_elem_info slimbus_power_resp_msg_v01_ei[] = {
> +static const struct qmi_elem_info slimbus_power_resp_msg_v01_ei[] = {
>   	{
>   		.data_type  = QMI_STRUCT,
>   		.elem_len   = 1,
