Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0862114E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A4085D;
	Tue,  8 Nov 2022 13:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A4085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911660;
	bh=JXZhNwZskk0Qwu89THel15JJaa/esrVFLZu3olOEGjI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+q2L6+/Wxj/0zwlvMiTYdk3V7XhPPxgUz6a+GQlerP5dO6SbFN2eaLvgDQNEEDe1
	 0MrizFNkua4NxWTknO4RorJ6B0Ks09AZw3VbmqzOrJbhJm+NyjI+JYjzKCq03qv/jW
	 vlaNchcEIgvZ+9iGV1csTqPv985G+7ThLIVE642U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A821F804E6;
	Tue,  8 Nov 2022 13:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5E8EF8025D; Tue,  8 Nov 2022 13:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B2F1F8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B2F1F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EFACJzEA"
Received: by mail-lf1-x12f.google.com with SMTP id c1so19425454lfi.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ec4qBSZkRiXSLaWs7CwYWDreZtQ9OjryTN/TEu/9Uc=;
 b=EFACJzEA+ZYzeeFJrlOfvGYFj9+XMKM1DMV/pjLx4Fz1ohge68gODDobxmUbGHs+AF
 beD3cNOlxprwZF1/TKgrXzQAkZuEoWLqdKMiviTavQ78Tz6VK87GJuFFaSgeiiKyVAL9
 ZkeQeQa0QFi9jFdZVfa3yxLMFrpxL0HCldfObgsuMiTrd0iE7fl+5oAITyCZlKilaN7K
 K06eAo0SaIvotVAQ+kk82RKj5ltaNYVFIGilVrmuU2QZYZH7oImqDQaMFl1Q+wMEtGxh
 z6IdVZ4b9U3meddyjjgfDdJt7c+Jusv6BXwXDfWTMTKxFWrzkOYSdOUJT7jFD1f/xdGy
 4O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ec4qBSZkRiXSLaWs7CwYWDreZtQ9OjryTN/TEu/9Uc=;
 b=PQq6/yF10+Hb8yDynlaosrVF4s5Xsmoivya3e5U2HeC/+eiRz1Rs7vFJIi+SJtNHgw
 fE/yncdwWMMeZ1NftBm8VKV1xOPSEybjGTTkzqvHCyoxu0LBQb7WXQrJe00A8926KXeL
 mTNeCu+jJHfe9fQ4cHOEQp8VP57YK+o66dN62pRPQYVAtxSxeRdaaC+KXFToLxL9JYwV
 tpeeEFV1frhD5cSuE+bSLXPMMAzkI5Qm8ntGl7H8KB3XuS0fRnhQ+PqVnHJvImlZxnaj
 mhzan4lCformE25Yml49yYt4MQo0xJs3UXDc0HmE5dk/h9J5AqROwIvK1Mr2P5Q6Tfa9
 y39g==
X-Gm-Message-State: ACrzQf27O+xRj69JlVhyhPvlYpMBWlp1GV9IyM2URlXADQxFJ5iUT5CQ
 YCr9YEv97Yst7aJOx51DVKgTKQ==
X-Google-Smtp-Source: AMsMyM4mBDv4HO3daS3jFbUT6KUf6TGTzBSDBCFvSnnC2MJTh7duW7vsuNT9IGMI0K111dDpylA/cA==
X-Received: by 2002:a05:6512:3d26:b0:4a2:a591:a45e with SMTP id
 d38-20020a0565123d2600b004a2a591a45emr21504975lfv.115.1667911599389; 
 Tue, 08 Nov 2022 04:46:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a2ea22e000000b0026e8dd02eacsm1705056ljm.16.2022.11.08.04.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:46:38 -0800 (PST)
Message-ID: <eb2b7f21-5103-b30d-4a7b-bb4988f6024f@linaro.org>
Date: Tue, 8 Nov 2022 13:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: Update soundwire slave node names
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
 <1667911156-19238-2-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1667911156-19238-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 08/11/2022 13:39, Srinivasa Rao Mandadapu wrote:
> Update soundwire slave nodes of WSA speaker to match with

s/slave/secondary/

> dt-bindings pattern properties regular expression.
> 
> This modifiction is required to avoid dtbs-check errors

s/modifiction/modification/

> occurred with qcom,soundwire.yaml.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

