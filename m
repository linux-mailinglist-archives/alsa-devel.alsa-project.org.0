Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D993610C2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:08:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5C71671;
	Thu, 15 Apr 2021 19:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5C71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618506505;
	bh=iW6Xo6L2a9SPFpsijg/pCSrFlVqUFM1mm+nEQ4XR98s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsPb4nNYpTVUddCzSS5Vw1kLVAFKL6dH3m/isTTAaPr60LIn6EqhxYD0ifQxPYxYh
	 npAQ5Q/WP7Yi5dUA5PHpQKKa+BZQer9JWA62i4fGL/AY0q0WLp0DW0E/RYE+7utV1F
	 DJypXZWYFTWpwXJ2rjkmCg+/yVWd2t3fSUqt4ZOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3423DF800FF;
	Thu, 15 Apr 2021 19:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4FEEF8022B; Thu, 15 Apr 2021 19:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0C6F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0C6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SeU4I60J"
Received: by mail-ed1-x52a.google.com with SMTP id h10so28930294edt.13
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qiaTdRxVP+PjHJWnCOqI9pORWv0g/7bqvQKS7jz0//U=;
 b=SeU4I60J41yRkWpulsHcyPQ0lGGZjLMdyTuau+HGDQ2VjSz3SciXMHUC3QvsZbqVcZ
 voda+hYW9t0JiCwoD+6pWkUmyxu8t2ZvdA/PN+qMiHpbrhnM+z79QAtyGCb9577D4F/5
 cb8mDEjiHuRcGGOQl8CsUsHU8dKj4L/bTu8JwtubTZWnlJ10yUV9DMW9zk7oyUTfilo1
 PB96VLQ5miWm6uBcSkcY8dsCa9J0GgeCuRyJETl9c6vJAtiTh6alxsYKQ7tEbzHCPbv7
 V8YMGaYrHRewcISh9agCA2zc5m6KwvJEMnVq5HSSWud0g0I+Sf58ew0RLoRfmX/dGO6f
 uHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qiaTdRxVP+PjHJWnCOqI9pORWv0g/7bqvQKS7jz0//U=;
 b=WFwtHJHkn5VjPIgvK71X8WjyvZHrZLzDrO+S0pnfav7OGWEvbc5lWeX9huowjIazDv
 bVJ/gy+Cqcj/eHv82XP4b3sEthNyMdzwA1mGfhk7yOPMqJiSJ/h+6VmCl1KDN+wnEtSb
 Aqg3CB3MyHWZvkbeYqnPU8MfcSDgPe12YjAQn6OJeQWRcejRZDNnpd22DPAG7eHzAk6Y
 YSMXeN8kWMT9qV1ZGwULOtRR4MDPPvQQyaC8Bz1S40MtfbJ5e4d5aZq2HXYEjlP7Cf2V
 OG4baWpcMQkxKRwQaU2uy8Pd7q06VbNkjG9GKiZrU1mODXpjktNs4YlXDGnJmfkPVCJj
 nCQQ==
X-Gm-Message-State: AOAM5320ybjfWVOLh6QpdmGgkV0GfVAyV3VN117baQV/AUXT9c0JEasD
 X0+GfpRhUwt9nYT0ZsCXtMuf5g==
X-Google-Smtp-Source: ABdhPJxnIwBJcv7n1yI2CZjRa7oKLiVaHxuL6ZCvd/+6CoD3FiDgjO1KW9xeG7XlP6U3ppCryqzvfQ==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr5643684edr.41.1618506409735;
 Thu, 15 Apr 2021 10:06:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id cq26sm3046543edb.60.2021.04.15.10.06.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 10:06:49 -0700 (PDT)
Subject: Re: [PATCH v4 1/9] ASoC: dt-bindings: wcd938x: add bindings for
 wcd938x
To: Rob Herring <robh@kernel.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
 <20210414154845.21964-2-srinivas.kandagatla@linaro.org>
 <20210415162947.GA1511094@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <019aa3c0-56ce-de17-4d64-be6dbc0a3a65@linaro.org>
Date: Thu, 15 Apr 2021 18:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210415162947.GA1511094@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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



On 15/04/2021 17:29, Rob Herring wrote:
>> +    codec {
>> +        compatible = "qcom,wcd9380-codec";
>> +        reset-gpios = <&tlmm 32 0>;
>> +        #sound-dai-cells = <1>;
>> +        qcom,tx-device = <&wcd938x_tx>;
>> +        qcom,rx-device = <&wcd938x_rx>;
>> +        qcom,micbias1-microvolt = <1800000>;
>> +        qcom,micbias2-microvolt = <1800000>;
>> +        qcom,micbias3-microvolt = <1800000>;
>> +        qcom,micbias4-microvolt = <1800000>;
>> +        qcom,mbhc-hphl-switch;
>> +        qcom,mbhc-ground-switch;
>> +        qcom,mbhc-button0-vthreshold-microvolt = <75000>;
>> +        qcom,mbhc-button1-vthreshold-microvolt = <150000>;
>> +        qcom,mbhc-button2-vthreshold-microvolt = <237000>;
>> +        qcom,mbhc-button3-vthreshold-microvolt = <500000>;
>> +        qcom,mbhc-button5-vthreshold-microvolt = <500000>;
>> +        qcom,mbhc-button6-vthreshold-microvolt = <500000>;
>> +        qcom,mbhc-button7-vthreshold-microvolt = <500000>;
>> +    };
>> +
>> +    /* ... */
>> +
>> +    soundwire@3230000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03230000 0x2000>;
>> +        wcd938x_tx: codec@0,3 {
>> +            compatible = "sdw20217010d00";
>> +            reg  = <0 3>;
>> +            qcom,direction = "tx";
>> +            qcom,port-mapping = <2 3 4 5>;
>> +        };
>> +
>> +        wcd938x_rx: codec@0,4 {
>> +            compatible = "sdw20217010d00";
>> +            reg  = <0 4>;
>> +            qcom,direction = "rx";
>> +            qcom,port-mapping = <1 2 3 4 5>;
>> +        };

> This is a single device, right? We shouldn't need 3 nodes to describe

Just realized that the example is bit misleading here.
It should look like:

  codec {
         compatible = "qcom,wcd9380-codec";
         reset-gpios = <&tlmm 32 0>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd938x_tx>;
         qcom,rx-device = <&wcd938x_rx>;
         qcom,micbias1-microvolt = <1800000>;
         qcom,micbias2-microvolt = <1800000>;
         qcom,micbias3-microvolt = <1800000>;
         qcom,micbias4-microvolt = <1800000>;
         qcom,mbhc-hphl-switch;
         qcom,mbhc-ground-switch;
         qcom,mbhc-button0-vthreshold-microvolt = <75000>;
         qcom,mbhc-button1-vthreshold-microvolt = <150000>;
         qcom,mbhc-button2-vthreshold-microvolt = <237000>;
         qcom,mbhc-button3-vthreshold-microvolt = <500000>;
         qcom,mbhc-button5-vthreshold-microvolt = <500000>;
         qcom,mbhc-button6-vthreshold-microvolt = <500000>;
         qcom,mbhc-button7-vthreshold-microvolt = <500000>;
     };


soundwire-controller@3230000 {
	reg = <0 0x3230000 0 0x2000>;
	compatible = "qcom,soundwire-v1.5.1";
	wcd938x_tx: codec@0,3 {
		compatible = "sdw20217010d00";
		reg  = <0 3>;
		qcom,direction = "tx";
		qcom,port-mapping = <2 3 4 5>;
	};
};


soundwire-controller@3210000 {
	reg = <0 0x3210000 0 0x2000>;
	compatible = "qcom,soundwire-v1.5.1";
	 wcd938x_rx: codec@0,4 {
		compatible = "sdw20217010d00";
		reg  = <0 4>;
		qcom,direction = "rx";
		qcom,port-mapping = <1 2 3 4 5>;
	};
};


--srini
