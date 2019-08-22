Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C89907A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACA3166B;
	Thu, 22 Aug 2019 12:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACA3166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566468840;
	bh=NOEvqOrrU3I6B7ZnOrWqHSvcql2BKjjD0X17bScsfXw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EMDKcUaawlAyZl3Jg7Vi0/Yq+IwLlK4Tbyqvn8flt3GI41g7l8YmZvUMFziwLW4px
	 2+uvgZnH01/Cp1GvMLDi+yxR/8z3fk/hvpqoCxaoFbxIeRSO4qcdRS87/lha0jvTV0
	 RaDQgUM268hE8jy3yXHxCE/JMBaLVLF3EOEV8nK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0931F8036D;
	Thu, 22 Aug 2019 12:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0BBEF800BF; Thu, 22 Aug 2019 12:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31044F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 12:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31044F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VgOU7tWz"
Received: by mail-wm1-x342.google.com with SMTP id 10so5026403wmp.3
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0wHYij0xMMbdONxhmt2Q6DoydIxVDY+xQcUzVqKt+3s=;
 b=VgOU7tWz9tj2ZdvC4hTvHdDaQeGT2Si9AZVE8FGa92l8Oqtw3XYoZkoc96vdmoLdwG
 6TLN0rXhF0HlZDEryfz+wuT6E51l6pbx4Lf9TVcLUd06F/yHq01QI5omfVdWK3HPxT/F
 ExM9NolGj7qcF7ZhmHYoy6SZ8+UzqDCfc/F2KM0bpe/QmgNyg6OFQ6Ut5AonVM2upk4L
 uTEf4SMluqVUX0JjgTH6DS5X7IHsLnkjFboNrZCxS1in6ghFay4ibpKZ0lJQLIUexKs8
 14HBW067R2l0VDDAnUk0xHLo79dXLaE+oecNJBZjoZyFZvbHb9LoS62NzVMlobfZHEVk
 gVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0wHYij0xMMbdONxhmt2Q6DoydIxVDY+xQcUzVqKt+3s=;
 b=TT5US/M50J0BdH5bHLCQdsFfODKkmwzgqeIWvqeLC67IdlKchD/unvQRXAa+T360pv
 i5nhnYhhRFMUHqtUFzcBHRFxevrJUpdog3yxaipcooox6pJwIfH24vSJm2Wzr5dN/1Fs
 NVvJdnI7KPOXzX8fddBLRiYGejLrHz4qORYxGhENXOVsk8aTmccvNzPyH1j5bgeyA/RF
 kSoDHk9wgOF6CLrnI/g1LegRWOEoY++3zeBwm3ZR5kdtpLsNnTgZLnvTtjBsFk2SLBxo
 lPYA5IGHoNohOOSGdAkyYwre6oJ+VLuCZVrP4TDqbjtBKwXjBie0lKIw1x7lx/VFYZar
 yWrA==
X-Gm-Message-State: APjAAAWfmkw1ycAJXlC+WhqoM6myK7YowW5Rb6V8MX4akFttfnpbWQOM
 cEAT1VRO6SJHHntbe1M3E780cw==
X-Google-Smtp-Source: APXvYqzzdoD/tdJWCm9pMx3HqDlxZuqqt0CYYFgVGFGn8E/l9KoCM2HsQQahV6f7pF/TvpSlqT7Klg==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr5588534wmi.50.1566468729143;
 Thu, 22 Aug 2019 03:12:09 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u186sm8418829wmu.26.2019.08.22.03.12.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 03:12:08 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
Date: Thu, 22 Aug 2019 11:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821214436.GA13936@bogus>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
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



On 21/08/2019 22:44, Rob Herring wrote:
> On Fri, Aug 09, 2019 at 02:34:04PM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings for Soundwire Slave devices that includes how
>> SoundWire enumeration address and Link ID are used to represented in
>> SoundWire slave device tree nodes.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
> 
> Can you convert this to DT schema given it is a common binding.
> 

I will give that a go in next version!

> What does the host controller look like? You need to define the node
> hierarchy. Bus controller schemas should then include the bus schema.
> See spi-controller.yaml.

Host controller is always parent of these devices which is represented 
in the example.

In my previous patches, i did put this slave bindings in bus.txt, but 
Vinod suggested to move it to slave.txt.

Are you suggesting to add two yamls here, one for slave and one for bus
Or just document this in one bus bindings?


> 
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
>> new file mode 100644
>> index 000000000000..201f65d2fafa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
>> @@ -0,0 +1,51 @@
>> +SoundWire slave device bindings.
>> +
>> +SoundWire is a 2-pin multi-drop interface with data and clock line.
>> +It facilitates development of low cost, efficient, high performance systems.
>> +
>> +SoundWire slave devices:
>> +Every SoundWire controller node can contain zero or more child nodes
>> +representing slave devices on the bus. Every SoundWire slave device is
>> +uniquely determined by the enumeration address containing 5 fields:
>> +SoundWire Version, Instance ID, Manufacturer ID, Part ID
>> +and Class ID for a device. Addition to below required properties,
>> +child nodes can have device specific bindings.
>> +
>> +Required properties:
>> +- compatible:	 "sdw<LinkID><VersionID><InstanceID><MFD><PID><CID>".
>> +		  Is the textual representation of SoundWire Enumeration
>> +		  address along with Link ID. compatible string should contain
>> +		  SoundWire Link ID, SoundWire Version ID, Instance ID,
>> +		  Manufacturer ID, Part ID and Class ID in order
>> +		  represented as above and shall be in lower-case hexadecimal
>> +		  with leading zeroes. Vaild sizes of these fields are
>> +		  LinkID is 1 nibble,
>> +		  Version ID is 1 nibble
>> +		  Instance ID in 1 nibble
>> +		  MFD in 4 nibbles
>> +		  PID in 4 nibbles
>> +		  CID is 2 nibbles
>> +
>> +		  Version number '0x1' represents SoundWire 1.0
>> +		  Version number '0x2' represents SoundWire 1.1
> 
> This can all be a regex.
> 
>> +		  ex: "sdw0110217201000" represents 0 LinkID,
>> +		  SoundWire 1.0 version slave with Instance ID 1.
>> +		  More Information on detail of encoding of these fields can be
>> +		  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
>> +
>> +SoundWire example for Qualcomm's SoundWire controller:
>> +
>> +soundwire@c2d0000 {
>> +	compatible = "qcom,soundwire-v1.5.0"
>> +	reg = <0x0c2d0000 0x2000>;
>> +
>> +	spkr_left:wsa8810-left{
>> +		compatible = "sdw0110217201000";
>> +		...
>> +	};
>> +
>> +	spkr_right:wsa8810-right{
>> +		compatible = "sdw0120217201000";
> 
> The normal way to distinguish instances is with 'reg'. So I think you
> need 'reg' with Instance ID moved there at least. Just guessing, but
> perhaps Link ID, too? And for 2 different classes of device is that
> enough?

In previous bindings ( https://lists.gt.net/linux/kernel/3403276 ) we 
did have instance-id as different property, however Pierre had some good 
suggestion to make it align with _ADR encoding as per MIPI DisCo spec.

Do you still think that we should split the instance id to reg property?

Thanks,
srini

> 
> Rob
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
