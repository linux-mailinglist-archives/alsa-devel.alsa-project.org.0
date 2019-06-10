Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2983B6A2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 16:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 555FC15E2;
	Mon, 10 Jun 2019 15:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 555FC15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560175241;
	bh=aaVwrKLEf57luzzSm2Bmh82MaPftIK72HKoZ2nVeA8M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FlG2qlpFJGgw4Puj0lwC0Z4aPHWhwDFQBYRvCI6vKG5bHq2SgfNjGD3xDYAus9D6i
	 3X+f5uSoyVgMMo0v+PfhgSgaMjnJ/nDo5cketASgDixHc8w+6P/rPuj8NUULrPmcw2
	 dQrihHaFF+mURtZoVfIk7AAYQf2k4ptBY3SO2CiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F13F896EA;
	Mon, 10 Jun 2019 15:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E37EAF896E0; Mon, 10 Jun 2019 15:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DE61F896C7
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 15:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE61F896C7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 06:58:47 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jun 2019 06:58:47 -0700
Received: from achugh-mobl.amr.corp.intel.com (unknown [10.254.100.69])
 by linux.intel.com (Postfix) with ESMTP id 6192E5800FF;
 Mon, 10 Jun 2019 06:58:46 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-6-srinivas.kandagatla@linaro.org>
 <20190610045150.GJ9160@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c6829f76-f119-31d5-c3eb-506e2d50f298@linux.intel.com>
Date: Mon, 10 Jun 2019 08:58:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610045150.GJ9160@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 broonie@kernel.org
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

Because there are no DP0 or DPn registers defined for Masters in the 
SoundWire 1.x spec. DisCo is about specifying properties for standard 
registers, when they are not standard vendor extensions need to come 
into play.

> 
>> +- qcom,ports-offset1:	Must be frame offset1 of each data port.
>> +			Out followed by In. Used for Block size calculation.
>> +- qcom,ports-offset2: 	Must be frame offset2 of each data port.
>> +			Out followed by In. Used for Block size calculation.
>> +- qcom,ports-sinterval-low: Must be sample interval low of each data port.
>> +			Out followed by In. Used for Sample Interval calculation.
> 
> These are software so do not belong here

Not necessarily. They define the allocation expected on that link and I 
see no problem specifying those values here. It's the moral equivalent 
of specifying which TDM slots and the bit depth of one slot you'd use 
for DSP_A/B.
And if you push back, then what would be your alternate proposal on 
where those values might be stored? This is a very specific usage of the 
link and it makes sense to me to have the information in firmware - 
exposed with properties - rather than hard-coded in a pretend bus 
allocation routine in the kernel. Either the allocation is fully dynamic 
and it's handled by the kernel or it's static and it's better to store 
it in firmware to deal with platform-to-platform variations.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
