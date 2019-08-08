Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F131D86668
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 18:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E36084F;
	Thu,  8 Aug 2019 17:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E36084F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565280044;
	bh=WV8nE34lE4JrF352EYDA1KFu98Wlv6snw+S6C2pxKII=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jY4+6kZEJTKMJxJQ+Pibf1UZayLSqX/y1GtctENGOSIqK/XrjxzjCfWjBEMT45Fnf
	 uYRNvgfoaDWhGdCBA3nNq8CMBlQdRDQ5tacb3TBk3tCsNzITlJtqs7LoqzloU2dx6D
	 KjqP34YARjU56ymbAnw/EV2Bldz6EpVxNnO00DOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A8DF80534;
	Thu,  8 Aug 2019 17:59:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 614E7F80534; Thu,  8 Aug 2019 17:58:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC220F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 17:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC220F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 08:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="169029082"
Received: from mcasscle-mobl1.amr.corp.intel.com (HELO [10.251.13.192])
 ([10.251.13.192])
 by orsmga008.jf.intel.com with ESMTP; 08 Aug 2019 08:58:49 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
Date: Thu, 8 Aug 2019 10:58:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
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


> +++ b/Documentation/devicetree/bindings/soundwire/slave.txt
> @@ -0,0 +1,46 @@
> +SoundWire slave device bindings.
> +
> +SoundWire is a 2-pin multi-drop interface with data and clock line.
> +It facilitates development of low cost, efficient, high performance systems.
> +
> +SoundWire slave devices:
> +Every SoundWire controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SoundWire slave device is
> +uniquely determined by the enumeration address containing 5 fields:
> +SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
> +for a device. Addition to below required properties, child nodes can
> +have device specific bindings.

In case the controller supports multiple links, what's the encoding then?
in the MIPI DisCo spec there is a linkId field in the _ADR encoding that 
helps identify which link the Slave device is connected to

> +
> +Required property for SoundWire child node if it is present:
> +- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
> +		  SoundWire Enumeration address comprising SoundWire
> +		  Version, Manufacturer ID, Part ID and Class ID,
> +		  shall be in lower-case hexadecimal with leading
> +		  zeroes suppressed.
> +		  Version number '0x10' represents SoundWire 1.0
> +		  Version number '0x11' represents SoundWire 1.1
> +		  ex: "sdw10,0217,2010,0"
> +
> +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> +		  Enumeration Address. Instance ID is for the cases
> +		  where multiple Devices of the same type or Class
> +		  are attached to the bus.

so it is actually required if you have a single Slave device? Or is it 
only required when you have more than 1 device of the same type?

FWIW in the MIPI DisCo spec we kept the instanceID as part of the _ADR, 
so it's implicitly mandatory (and ignored by the bus if there is only 
one device of the same time)

> +
> +SoundWire example for Qualcomm's SoundWire controller:
> +
> +soundwire@c2d0000 {
> +	compatible = "qcom,soundwire-v1.5.0"
> +	reg = <0x0c2d0000 0x2000>;
> +
> +	spkr_left:wsa8810-left{
> +		compatible = "sdw10,0217,2010,0";
> +		sdw-instance-id = <1>;
> +		...
> +	};
> +
> +	spkr_right:wsa8810-right{
> +		compatible = "sdw10,0217,2010,0";
> +		sdw-instance-id = <2>;

Isn't the MIPI encoding reported in the Dev_ID0..5 registers 0-based?

> +		...
> +	};
> +};
> 

And now that I think of it, wouldn't it be simpler for everyone if we 
aligned on that MIPI DisCo public spec? e.g. you'd have one property 
with a 64-bit number that follows the MIPI spec. No special encoding 
necessary for device tree cases, your DT blob would use this:

soundwire@c2d0000 {
	compatible = "qcom,soundwire-v1.5.0"
	reg = <0x0c2d0000 0x2000>;

	spkr_left:wsa8810-left{
		compatible = "sdw0000100217201000"
	}

	spkr_right:wsa8810-right{
		compatible = "sdw0000100217201100"
	}
}

We could use parentheses if it makes people happier, but the information 
from the MIPI DisCo spec can be used as is, and provide a means for spec 
changes via reserved bits.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
