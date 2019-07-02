Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88545CBFA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 10:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF561695;
	Tue,  2 Jul 2019 10:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF561695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562055832;
	bh=LbQUql35kpcPjXD4mNhcv29oZQNTEWb97VEdE+sa66I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4NBth3MeegdbqR16Gjj1rjwS6JJOdKcuFeqOLl7pz4l+e17Iy+P00UNzmHFZQGlL
	 JpM4Achpnou2YPXNnM4/NlEpBZLYLl4Hzw6Azmxr/Vu4CQM6FAvbIwy3rnPlLbVnJr
	 pf0hZDT3DkZjEreZEify6WrDk5oV5Wn12MHga/Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E44F800C9;
	Tue,  2 Jul 2019 10:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DDCFF800C9; Tue,  2 Jul 2019 10:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC68F800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 10:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC68F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QDE4lDiH"
Received: by mail-wr1-x444.google.com with SMTP id e3so7142494wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=npK20M4VjgRq8bweyVfDmxYuK/3oR7Zc4HxgTAOxcqU=;
 b=QDE4lDiHJUMLEnF5ZiGmGwnAjKcFsLz0g7kuRJXlBy0qd0j80HVGb4RjGm8VYTR+dH
 xuTtJuu7t6EsfUFrxGaKMmWYjpYutbhZFLfjfyUN2MnSDD2QULDY5EhmojzlUVKB3KjR
 /HO475AdE8D0WOYYCsK0XrORwUrvRnVXXZAGFK06rmBbLbdGC2xHMZo793IyfOgFWN1Q
 mmc/5TM1UyQYsDGjHaka+j4f/XXUGEhjZS7jhJuef/HFbUIEi8NYrTz+0m59ZH8tIwG3
 9K5X3N8WPJvs2ghje0N4nnPF8Zd1QB/HP3my3eVW3NZGFyd7546K5GyWqPC/1sw9C6OS
 gSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=npK20M4VjgRq8bweyVfDmxYuK/3oR7Zc4HxgTAOxcqU=;
 b=TBaZG0oPc61BEjovTUZAt1IxeRCiJOZ3ro2bYsvcloS9zuOR+7iSQt6qjGQZp59oK9
 ZVXYKuEwHQTe+touvKvEV0ugJ7YcqThM1e1DLxwIUUor8EDISHko0DCTUJ+h8RackUkf
 qo7eB7Ji/C75srJOuUph9/BGs3CJU1CwWftqCfw2kO7m8hofISQDDmHFxeM9xD/mcV/T
 9MUbUVqGjZh/lke+vDWRbG1bgCQ7RJ2nd757y6/1f3thLQ7BtOB6uzqJr5Xk/xo6qZvL
 A1r2kM82buhrtid2fyQkSWHhvmLvdw5/efZKNSRbXkG9/U4a47aQo2azYRMTimrkMeez
 4qPw==
X-Gm-Message-State: APjAAAVOAZYyspX07gspQ9K2vAgkXhR0Nfasd/ns4FP5mDNnqRmZSq2M
 rnADCreeoQwpU1RCoxPRY6HuFA==
X-Google-Smtp-Source: APXvYqwevDSd+3eE4DJi0D0ipmYNR9B2qOUnZJQVIAPek/FAfF+1wQicHfJKOQPBQDQ1R3DWnHdT9w==
X-Received: by 2002:adf:dc81:: with SMTP id r1mr22261339wrj.298.1562055722799; 
 Tue, 02 Jul 2019 01:22:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id l124sm2121489wmf.36.2019.07.02.01.22.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 01:22:02 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-2-srinivas.kandagatla@linaro.org>
 <20190701061155.GJ2911@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ce1e445e-3254-1308-8752-2cb56a7e0cc6@linaro.org>
Date: Tue, 2 Jul 2019 09:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701061155.GJ2911@vkoul-mobl>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 1/5] dt-bindings: soundwire: add slave
	bindings
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

Thanks Vinod for taking time to review,

On 01/07/2019 07:11, Vinod Koul wrote:
> On 11-06-19, 11:40, Srinivas Kandagatla wrote:
>> This patch adds bindings for Soundwire Slave devices which includes how
>> SoundWire enumeration address is represented in SoundWire slave device
>> tree nodes.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/soundwire/bus.txt     | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/bus.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/bus.txt b/Documentation/devicetree/bindings/soundwire/bus.txt
>> new file mode 100644
>> index 000000000000..19a672b0d528
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/bus.txt
> 
> The bindings are for slave right and the file is bus.txt?

I tried to follow what I have done for SLIMBus.
Do you prefer them to be documented in slave.txt?

> 
>> @@ -0,0 +1,48 @@
>> +SoundWire bus bindings.
>> +
>> +SoundWire is a 2-pin multi-drop interface with data and clock line.
>> +It facilitates development of low cost, efficient, high performance systems.
>> +
>> +SoundWire controller bindings are very much specific to vendor.
>> +
>> +Child nodes(SLAVE devices):
>> +Every SoundWire controller node can contain zero or more child nodes
>> +representing slave devices on the bus. Every SoundWire slave device is
>> +uniquely determined by the enumeration address containing 5 fields:
>> +SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
>> +for a device. Addition to below required properties, child nodes can
>> +have device specific bindings.
>> +
>> +Required property for SoundWire child node if it is present:
>> +- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
>> +		  SoundWire Enumeration address comprising SoundWire
>> +		  Version, Manufacturer ID, Part ID and Class ID,
>> +		  shall be in lower-case hexadecimal with leading
>> +		  zeroes suppressed.
>> +		  Version number '0x10' represents SoundWire 1.0
>> +		  Version number '0x11' represents SoundWire 1.1
>> +		  ex: "sdw10,0217,2010,0"
> 
> any reason why we want to code version number and not say sdw,1.0,...
> and so on?

For consistency reasons, as other info in hex.

> 
>> +
>> +- sdw-instance-id: Should be ('Instance ID') from SoundWire
>> +		  Enumeration Address. Instance ID is for the cases
>> +		  where multiple Devices of the same type or Class
>> +		  are attached to the bus.
> 
> instance id is part of the 48bit device id, so wont it make sense to add
> that to compatible as well?
> 
So we could have multiple instance of same IP, so adding this to 
compatible string does not make sense! As driver has to list all the 
possible compatible strings.

>> +
>> +SoundWire example for Qualcomm's SoundWire controller:
>> +
>> +soundwire@c2d0000 {
>> +	compatible = "qcom,soundwire-v1.5.0"
>> +	reg = <0x0c2d0000 0x2000>;
>> +
>> +	spkr_left:wsa8810-left{
>> +		compatible = "sdw10,0217,2010,0";
>> +		sdw-instance-id = <1>;
>> +		...
>> +	};
>> +
>> +	spkr_right:wsa8810-right{
>> +		compatible = "sdw10,0217,2010,0";
>> +		sdw-instance-id = <2>;
>> +		...
>> +	};
>> +};
>> -- 
>> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
