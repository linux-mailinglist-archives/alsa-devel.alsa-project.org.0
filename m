Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8E15A55A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 10:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89BD91676;
	Wed, 12 Feb 2020 10:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89BD91676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581501229;
	bh=3n/UiuMkVrjm54ExGHxmFG3Rr2Lwf4+yiToMsXZbFF0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyWTe3KFqB4XGmDpqcs5s0RSom1gpTVg2vyfUJhwqkzG9AdU0xWvjr/o3WvyixSNj
	 6X7Gn1K4XvvqaaK0k8N/VEu7mMgeUV/IQv2hhXNvzUawsjG72ZG2tG0E69KaBO/Wlv
	 8HlaXV9+Cq88wLSBErhZrBLw2nYOFPP0A0dkVgCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B28CF800E7;
	Wed, 12 Feb 2020 10:52:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24CF2F80157; Wed, 12 Feb 2020 10:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866FBF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866FBF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QYsqlI9C"
Received: by mail-wr1-x441.google.com with SMTP id z7so1367786wrl.13
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P1BE/J6k12sw+5b4sdZJAqIoEkv4CupE36M6VkS2iPk=;
 b=QYsqlI9CK3W1WYd+81VRLDbVrXSvTLcqcOtmxlp7DQqLG8nG/Imqsojr2LpIE7SoEf
 KmLq+Vx+nr7l8mAU5rSKGgywBXGYPFRXb55OR7wPtZ5D089rMiRwyn00uHzZFwZ26/aX
 E+LJIV2U5RWB9jFrn30qBqiZ5eBQavfsGrVkN8xD8N1XC4MiL0Dqk5DTSjJGAhVcCspk
 OxEnJpwgOBKG6+uvrk/6Zbh91r+M63HFYDQndyQaDLRNQhm2FLIpoJppJpsG3E374l4E
 3pq8uu3IAGg6FW2KVCkpM7eh8KDMrsKBA7vSRwrtqqVJq4/YwKNzU2R6l6tC3H6HiLFM
 1XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P1BE/J6k12sw+5b4sdZJAqIoEkv4CupE36M6VkS2iPk=;
 b=ZR4LB1BFM9UnvWHuG/YKkqYN8Df2rU57NPSjiGRF/8lm7dcYvSkjNcThmiIe/0SW8K
 YzNyxoNP9BUUWNBYGJTSfKsNlHXURsn/5soO9CE+xf47wfqaKs+cmnVWdd3iIufW6CsV
 irtgDP6pTyjUZy6O+3BevD6KmQBzn4N8mhkxKTlcWJGZc2KLKYt9Z0ktAN7AOtnZOuZs
 CdLtJ+IECwZXHFkE4LC/TPnkJ9gsaZ6lzA7M4qUCW2idYAv6iR5A5d013F6fpbmGBpmK
 2MgzTbXzCq/3oYms1ej0waSrJU/c1/5r/ZO0ayjYf++HsX9YbSWz807pTPDTONKpbQ9L
 /WeQ==
X-Gm-Message-State: APjAAAW4wxm4hqaxrU9qdZ6QY5ONzMsV7oWrnaJCNcfXQGPKsLxWrYAZ
 E48CY6B3jwdJumVWd3HeV+vqwQ==
X-Google-Smtp-Source: APXvYqzsQwheQau9uolf3pWBRAMxduG9Z1N4tSP3VvEA0X/qjSw6MaHP8j8sf7/aCCkRVNTE9MxaRQ==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr14099564wrb.407.1581501122445; 
 Wed, 12 Feb 2020 01:52:02 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id d9sm8887197wrx.94.2020.02.12.01.52.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Feb 2020 01:52:01 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-4-adam@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1875fb89-6a25-0d1a-c367-183ae6980ac8@linaro.org>
Date: Wed, 12 Feb 2020 09:52:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200212015222.8229-4-adam@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 3/6] ASoC: qdsp6: q6afe-dai: add support
 to pcm port dais
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/02/2020 01:52, Adam Serbinski wrote:
> +			ret = of_property_read_u32(node, "qcom,pcm-quantype",
> +						   &priv->quantype);
> +			if (ret) {
> +				dev_err(dev, "No quantype from DT\n");
> +				break;
> +			}
> +
> +			ret = of_property_read_variable_u32_array(node,
> +						"qcom,pcm-slot-mapping",
> +						priv->slot_number_mapping,
> +						1, AFE_MAX_PCM_SLOT_COUNT);

These new bindings needs to be documented in 
Documentation/devicetree/bindings/sound/qcom,q6afe.txt

--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
