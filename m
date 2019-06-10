Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77143B04C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCBD16B6;
	Mon, 10 Jun 2019 10:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCBD16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560154595;
	bh=e0ENMPA+kS1HRg6cVWqN2s/fdHe+mQiT+kSukACxzok=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocY8N9fQ4HCCxNhvlTAVOKkSFd55LhZPCbkLseLwiTEYB3+9JnFtf8qJVjYTX7zKP
	 HgzdbdfUTkMTYCA5mSdhxcipbxM+xEEHnFAqhqfTF90cx+WqdJSOg5K8hZqSK09nAd
	 SUiw6loG45avx65XpCFLCVlMc0OCSQcW+D88F8iM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6675F8070E;
	Mon, 10 Jun 2019 10:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEF2F896E0; Mon, 10 Jun 2019 10:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19DC6F80791
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DC6F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="itjfuEoX"
Received: by mail-wr1-x442.google.com with SMTP id f9so8149248wre.12
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FoeVTYzF5ZDi2tID72FryeJ/j+o8r81eaeVqgETUoko=;
 b=itjfuEoXOvXwxbRwuF6HrhTmMzpt6ljGh0o24LPk+N83H/V44mafKAvoTtxvdP14KI
 LJFlVdi880AiwQnNR9viKWtZQ/ad5i6A238QtGDRjDfySmXGFr6sRkq82+fKocOAZg5N
 4FziCyWxT7dEY3/oADWNFmOvqND8lybwrvWtQqEOafXloTjd6s9k1YaLHjevxD08LR1U
 kDfqayPy7cM7+IajIExVAVT7g1tOUDCkmPYDVnR1yGcu5rH0JH6gGpihkAiIv3xsatlv
 isLSXUYnVtLdBH7SmW7QVjYbO/Md30vYrs7/2WQEtnGwzMYCg1yf40HuHbDIHbr5Q6Pu
 IzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FoeVTYzF5ZDi2tID72FryeJ/j+o8r81eaeVqgETUoko=;
 b=LKRBU4BjtnIIb/ZTjpeZZO/W4sQxditNuP6jZ9XLDJnehVDe/T/6XWSddEAMRctRZB
 h3swVpWtTp+UR5YXYPeOUQfN3MWCjD0olMwiO3KWJFYpfjoWlKfa3JXXmLAwSlm2nNoP
 qCW4n9QpAElwCDKFOnOiS8g4ecSQyZESoVaCpnTI8y9WsOYdY+wM33dIlj0gLqNbgtQB
 QeFOcYuujPFqGvy4Eafw/fnj1AJxQ7jtCP6yVEeL2ed9hsvRUImTU59WkJlktcT1E8ID
 9RhssuU08agdi7LNv3NgXer6mtzDu9JGdPtvimQHqKP/x/OobGazJ+10yl1QsVwtVL0/
 vDrw==
X-Gm-Message-State: APjAAAWNIXd7WzrpNATqfsxN6MpjEB3zj07RbsYvwIDbRH8Sry9ixVSF
 y+GWQkEW5qVGesZUAiaZlIZTcw==
X-Google-Smtp-Source: APXvYqy9NQENDTf7h9IM9Fr1WLtg2wN5q3OPNu/X/z7kY2UX4lC5AHdyFIKS7VcslrPFuacPBM++HA==
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr16647979wrj.314.1560154480327; 
 Mon, 10 Jun 2019 01:14:40 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f2sm17310279wrq.48.2019.06.10.01.14.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 01:14:39 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-6-srinivas.kandagatla@linaro.org>
 <20190610045150.GJ9160@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f1e68207-caa2-02e0-19af-ac5763c86e41@linaro.org>
Date: Mon, 10 Jun 2019 09:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610045150.GJ9160@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 5/6] dt-bindings: soundwire: add
 bindings for Qcom controller
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



On 10/06/2019 05:51, Vinod Koul wrote:
> On 07-06-19, 09:56, Srinivas Kandagatla wrote:
>> This patch adds bindings for Qualcomm soundwire controller.
>>
>> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
>> either integrated as part of WCD audio codecs via slimbus or
>> as part of SOC I/O.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/soundwire/qcom,swr.txt           | 62 +++++++++++++++++++
> 
> So I was expecting to see bus support patches for OF first. I think you
> have missed those changes. Please do include those in v2 with bindings
> and OF support for bus.

I was planning to post bus bindings along with soundwire slave bindings 
of WSA881x driver!
I will be sending this soon!

> 
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,swr.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,swr.txt b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
>> new file mode 100644
>> index 000000000000..eb84d0f4f36f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
>> @@ -0,0 +1,62 @@
>> +Qualcomm SoundWire Controller
>> +
>> +This binding describes the Qualcomm SoundWire Controller Bindings.
>> +
>> +Required properties:
>> +
>> +- compatible:		Must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
>> +	 		example:
>> +			"qcom,soundwire-v1.3.0"
>> +			"qcom,soundwire-v1.5.0"
>> +			"qcom,soundwire-v1.6.0"
>> +- reg:			SoundWire controller address space.
>> +- interrupts:		SoundWire controller interrupt.
>> +- clock-names:		Must contain "iface".
>> +- clocks:		Interface clocks needed for controller.
>> +- #sound-dai-cells:	Must be 1 for digital audio interfaces on the controllers.
>> +- #address-cells:	Must be 1 for SoundWire devices;
>> +- #size-cells:		Must be <0> as SoundWire addresses have no size component.
>> +- qcom,dout-ports: 	Must be count of data out ports
>> +- qcom,din-ports: 	Must be count of data in ports
> 
> On these I think we should have specified dpn properties as specified in
> DisCo, but then looking at spec we do not define that for master, but
> bus seems to have it.
> 
> Pierre do you why master does not have dpn properties in DisCo?
> 
>> +- qcom,ports-offset1:	Must be frame offset1 of each data port.
>> +			Out followed by In. Used for Block size calculation.
>> +- qcom,ports-offset2: 	Must be frame offset2 of each data port.
>> +			Out followed by In. Used for Block size calculation.
>> +- qcom,ports-sinterval-low: Must be sample interval low of each data port.
>> +			Out followed by In. Used for Sample Interval calculation.
> 
> These are software so do not belong here
These are board-specfic properties w.r.t this controller ports 
configuration.
I don't see any other option to specify this?
Do you have any alternative suggestions?

--srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
