Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0960F4C6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9902A3191;
	Thu, 27 Oct 2022 12:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9902A3191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866037;
	bh=oyc4PjKzd64qt8yr4qwKao1yolfIh1KjcWGzW/iUeVg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aH38kjWJxq+wkHkC7JDC2wY/nYl1hl/OOnxEaQn+K2LYLGxFn6Ww2UDuQCHXn2Q9L
	 32iEnT/gxhXEX1f+zxTD47hLBwKOFwLgJNCiga4WNlr3isMs0PkCuHrUlG27KK4a/U
	 D7akFytjrhpprbwtYKamL+aqh0289FlsYBJFyFjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE44EF80496;
	Thu, 27 Oct 2022 12:19:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515D5F8025E; Thu, 27 Oct 2022 12:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D48C8F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48C8F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gKA2dW3f"
Received: by mail-wm1-x336.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so792916wmb.3
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3v8EBCOL/pBarxV0ODSGCNmHcX5fEuS/fZKHlL3Tpw=;
 b=gKA2dW3fJ2rFkjzoulrUEa0ZDzOT0UEWyrFD/SIlWhEb6Whcmyl6CQAToGDwyRWYIJ
 L256X0v3MeZ37S0/8KOzsxMjhEGFBmJJDa3AxZR6Q2WocPGUKDteY2MxuuKoDQdgzV/M
 5HMuHkRSrZgeZFcaC9hGoL/xffJEUk944P8pq6u/+WeCzeApEbiuAX7XQWGNkpbo3PoL
 ymvNPOx4jvD+0ZlMbF1UJPli0/VxcBsd6pf4ScXWLGf8clXlSjovCcPOLlrO9+85LmpL
 ysiq4xEo4G50hftAGd4vfdz3bH9w49ipcSdKOwEX4oZbEiSZJF9QmdTGDZE9Gun1Lkur
 uEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3v8EBCOL/pBarxV0ODSGCNmHcX5fEuS/fZKHlL3Tpw=;
 b=0Sgto6Hrtzp7tDSB/Ry31NsZSh39sU74brvK1X1rc2i2Sj7aAkUlj6U/B1u/PUMxL5
 6FetfcEGHZG8xyprXd6+4GlTVEAgOacLGlYxcfdNp+eJPvNMEqDm8Lzv+wDa/ikiGlF5
 RVmGk315dclkGnqJSpZG7Bj7tpYvYzfJUxd7EvsjgAOdXiqJ1eXGINPPVtg2ndNO39y9
 j3TK2YsHpRH1rhwQ92IwxcUdoq8wN5otdnmtiBrJnj866l/Bzdyg+z/R+DN8C0f1BSSn
 S5kP0RD3ECA6fj/jW0EPbmQwgBkWRog3XTBLwoCT+QtuOTCe/094lstnTmswcgBSgmNE
 D1Rw==
X-Gm-Message-State: ACrzQf170e1nC5b9IwN8YpdlxYQIOw/EeI8vj7nqAMzNHe6xJtcRzX6S
 cLogJ2xI8uXUD5EPeaKurB6daQ==
X-Google-Smtp-Source: AMsMyM7Z0QwLULgwz0dq3qhv6BQb+6iwiHd/mM4Ad8Zaf10YeEBPSMLE6J0xqkKIeai1eHLPuCoM9g==
X-Received: by 2002:a05:600c:1c9d:b0:3c5:8081:1fc4 with SMTP id
 k29-20020a05600c1c9d00b003c580811fc4mr5425907wms.161.1666865974182; 
 Thu, 27 Oct 2022 03:19:34 -0700 (PDT)
Received: from [192.168.1.194] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a5f3f5883dsm4703642wmq.17.2022.10.27.03.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 03:19:33 -0700 (PDT)
Message-ID: <619a829e-d902-eba9-537e-176a8acb149c@linaro.org>
Date: Thu, 27 Oct 2022 11:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] soundwire: qcom: add support for v1.7 Soundwire
 Controller
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
 <20221026110210.6575-7-srinivas.kandagatla@linaro.org>
 <e3ebba30-65ec-183a-eb91-c5147c28441d@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e3ebba30-65ec-183a-eb91-c5147c28441d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

Hi Pierre,

On 26/10/2022 21:14, Pierre-Louis Bossart wrote:
> 
>> @@ -1582,6 +1597,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
>>   	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>>   	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>>   	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>> +	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
> 
> is this line intentional, it looks odd that 1.7 is compatible with 1.5,
> but 1.6 isn't?
This is more around the data rather than compatible, 1.6 data is marked 
with sw_clk_gate_required = true which is not the case with 1.7.

from 1.5 we use same frame shape info for 1.6, 1.7, except that 1.6 had 
this sw_clk_gate_required flag set.

--srini

> 
