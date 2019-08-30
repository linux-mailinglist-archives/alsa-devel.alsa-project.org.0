Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35AA31D4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 10:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652091666;
	Fri, 30 Aug 2019 10:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652091666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567152457;
	bh=AjmuiLxKX0+9PSavO1TWiNxEy/Kfc9aAbWu6uyVjBhg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7wLbAUGbYrDvS2Ntl7uWqbA4Oim9UaEJb26S3onkh0cK9paiGlBgk07n7CQ4j3q4
	 fIOUHR/aOS5ccOvXL2ZElD2doggzcVeXe5d5XE4q46JUqLZK03aXGU3DxzLvwCpu5E
	 4WK4eQ3Q6P0ORwZ4e45Vgf7cGFtvkfDzu0uyHQ20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB21FF80369;
	Fri, 30 Aug 2019 10:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C8DF80369; Fri, 30 Aug 2019 10:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E76F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 10:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E76F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cqARl1b8"
Received: by mail-wr1-x443.google.com with SMTP id t16so5992877wra.6
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ljpav7cp0jQCcXvbtu+znGOpg/cjpMnD8tVzcIJZM3U=;
 b=cqARl1b8o1qWpahsIaOF3U049kFqLEgTCiSqSir1tjOVGr12xcRjsf3fLLdFFzPahH
 /c2+z82jmorUf+NUTiTTMdcAwc7XojOAlTCA2zEg/+ioO9jEBu5Yifhq8pm/grtMxxxS
 vp029MRA0gVO8xvPQmGyX5Xec3c3losomUo9DIE+sYzKSd0/sxvTXI0kI6ItuCv8lPa4
 79FqueXiTnc33GKkIYg6I03vvVhEfKIjoeU9S1iiBuAYtE+jyKHrRpWJWZHoiwCotB7/
 hc12QzIrcdHkNjQtX14XrE2LT+VujJlyhb00rKG9oQNRbemqmtA/3l/XNlp/iO/oJwuP
 1gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ljpav7cp0jQCcXvbtu+znGOpg/cjpMnD8tVzcIJZM3U=;
 b=Gj5JQh8oIwpFSfqLrZbleQJqX7PYjFI5ByeXZ7JrpnsGL4+ag8TPiBQ6ShIwxQfwh7
 DHGdBlCrVBam2e+D19KqVBgfmYBlidXirGwmfDag7pyBCFhPeyrQIF9kwKb2QmTcn9kI
 VU0xoi8h4Eb7wvKa+l7EOvqgQd7grjDqsEdHiz1wfkrijTidq+NsowyfVbcwXcup72RK
 TTzwuFQYtVqoCNucgNgaM7yAke+hXPAxNQwfDTc4qLmQqC0gIsar4reSZe7tG73w93Ba
 Tp7Cieg2edgOobi+HL8JbP8wOlWVUlP5Qg4ep8fwQbTcR/Pdplgo6j5ouyY2y+pgtFqo
 CQTQ==
X-Gm-Message-State: APjAAAU0zsKctLqfC9WZQ6T0p6t1v1v1o+yG8ybOUAZOwekPqP+4aBoo
 benzraHhrTBwFL8uUrqzlCCl/g==
X-Google-Smtp-Source: APXvYqxTJNG20RJIdTPA3YfkECo8o2rMaAsKPaXHCnjnxBnsTCuivMK2A/r9MzNhLc6cP34/tDa1Pw==
X-Received: by 2002:adf:db03:: with SMTP id s3mr17762359wri.214.1567152346692; 
 Fri, 30 Aug 2019 01:05:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t8sm11299633wra.73.2019.08.30.01.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 01:05:45 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, robh+dt@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-5-srinivas.kandagatla@linaro.org>
 <20190823072831.GE2672@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2bf2d158-4028-8a5f-2c13-cab12ac165eb@linaro.org>
Date: Fri, 30 Aug 2019 09:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823072831.GE2672@vkoul-mobl>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 4/5] dt-bindings: soundwire: add
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

Hi Rob,

On 23/08/2019 08:28, Vinod Koul wrote:
> On 13-08-19, 09:35, Srinivas Kandagatla wrote:
>> This patch adds bindings for Qualcomm soundwire controller.
>>
>> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
>> either integrated as part of WCD audio codecs via slimbus or
>> as part of SOC I/O.
> 
> Rob.. ?
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
>>   1 file changed, 167 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt

Do you see any issues with the these bindings?

--srini
>> new file mode 100644
>> index 000000000000..436547f3b155
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> @@ -0,0 +1,167 @@
>> +Qualcomm SoundWire Controller Bindings
>> +
>> +
>> +This binding describes the Qualcomm SoundWire Controller along with its
>> +board specific bus parameters.
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
>> +		    Example:
>> +			"qcom,soundwire-v1.3.0"
>> +			"qcom,soundwire-v1.5.0"
>> +			"qcom,soundwire-v1.6.0"
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: the base address and size of SoundWire controller
>> +		    address space.
>> +
>> +- interrupts:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should specify the SoundWire Controller IRQ
>> +
>> +- clock-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: should be "iface" for SoundWire Controller interface clock
>> +
>> +- clocks:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should specify the SoundWire Controller interface clock
>> +
>> +- #sound-dai-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be 1 for digital audio interfaces on the controller.
>> +
>> +- qcom,dout-ports:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be count of data out ports
>> +
>> +- qcom,din-ports:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be count of data in ports
>> +
>> +- qcom,ports-offset1:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should specify payload transport window offset1 of each
>> +		    data port. Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-offset2:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should specify payload transport window offset2 of each
>> +		    data port. Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-sinterval-low:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be sample interval low of each data port.
>> +		    Out ports followed by In ports. Used for Sample Interval
>> +		    calculation.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-word-length:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be size of payload channel sample.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-block-pack-mode:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be 0 or 1 to indicate the block packing mode.
>> +		    0 to indicate Blocks are per Channel
>> +		    1 to indicate Blocks are per Port.
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-block-group-count:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be in range 1 to 4 to indicate how many sample
>> +		    intervals are combined into a payload.
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-lane-control:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be in range 0 to 7 to identify which	data lane
>> +		    the data port uses.
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-hstart:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be number identifying lowerst numbered coloum in
>> +		    SoundWire Frame, i.e. left edge of the Transport sub-frame
>> +		    for each port. Values between 0 and 15 are valid.
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,ports-hstop:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be number identifying highest numbered coloum in
>> +		    SoundWire Frame, i.e. the right edge of the Transport
>> +		    sub-frame for each port. Values between 0 and 15 are valid.
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +- qcom,dports-type:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: should be one of the following types
>> +		    0 for reduced port
>> +		    1 for simple ports
>> +		    2 for full port
>> +		    Out ports followed by In ports.
>> +		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> +Note:
>> +	More Information on detail of encoding of these fields can be
>> +found in MIPI Alliance SoundWire 1.0 Specifications.
>> +
>> += SoundWire devices
>> +Each subnode of the bus represents SoundWire device attached to it.
>> +The properties of these nodes are defined by the individual bindings.
>> +
>> += EXAMPLE
>> +The following example represents a SoundWire controller on DB845c board
>> +which has controller integrated inside WCD934x codec on SDM845 SoC.
>> +
>> +soundwire: soundwire@c85 {
>> +	compatible = "qcom,soundwire-v1.3.0";
>> +	reg = <0xc85 0x20>;
>> +	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
>> +	clocks = <&wcc>;
>> +	clock-names = "iface";
>> +	#sound-dai-cells = <1>;
>> +	qcom,dports-type = <0>;
>> +	qcom,dout-ports	= <6>;
>> +	qcom,din-ports	= <2>;
>> +	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
>> +	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
>> +	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
>> +
>> +	/* Left Speaker */
>> +	left{
>> +		....
>> +	};
>> +
>> +	/* Right Speaker */
>> +	right{
>> +		....
>> +	};
>> +};
>> -- 
>> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
