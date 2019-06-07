Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24538AB5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 14:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254DE15E5;
	Fri,  7 Jun 2019 14:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254DE15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559911936;
	bh=49msPqBaFozBgl3RPdtyuHpqzvHrJp3DEBZp/5mIAug=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXB36xgUgeatICxRh6fQ2/WYTo2W3esVQC6T9mfR+L1J+6gQh6fUcilMgJUApn7Yw
	 fj+gHoGkWluupqSUeI76QrQ2fbSjsicDOJkjbeFeulmFVhmWy1B/D/6da/IHxcDlIG
	 4FI5FtqEPRxE/iqSW7j9Z37HX6Q5yyhsSqah0MPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7EEF896DE;
	Fri,  7 Jun 2019 14:50:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C87BF896CE; Fri,  7 Jun 2019 14:50:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21970F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 14:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21970F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 05:50:23 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2019 05:50:23 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 76DB058044F;
 Fri,  7 Jun 2019 05:50:22 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f2ea97b2-935d-0c7d-cb55-6e16a19c2060@linux.intel.com>
Date: Fri, 7 Jun 2019 07:50:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607085643.932-6-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
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

On 6/7/19 3:56 AM, Srinivas Kandagatla wrote:
> This patch adds bindings for Qualcomm soundwire controller.
> 
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   .../bindings/soundwire/qcom,swr.txt           | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,swr.txt

you seem to use the 'swr' prefix in this patch. Most implementers use 
'sdw', and that's the default also used in the MIPI DisCo spec for 
properties. Can we align on the same naming conventions?

> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,swr.txt b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
> new file mode 100644
> index 000000000000..eb84d0f4f36f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
> @@ -0,0 +1,62 @@
> +Qualcomm SoundWire Controller
> +
> +This binding describes the Qualcomm SoundWire Controller Bindings.
> +
> +Required properties:
> +
> +- compatible:		Must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
> +	 		example:
> +			"qcom,soundwire-v1.3.0"
> +			"qcom,soundwire-v1.5.0"
> +			"qcom,soundwire-v1.6.0"
> +- reg:			SoundWire controller address space.
> +- interrupts:		SoundWire controller interrupt.
> +- clock-names:		Must contain "iface".
> +- clocks:		Interface clocks needed for controller.
> +- #sound-dai-cells:	Must be 1 for digital audio interfaces on the controllers.
> +- #address-cells:	Must be 1 for SoundWire devices;
> +- #size-cells:		Must be <0> as SoundWire addresses have no size component.
> +- qcom,dout-ports: 	Must be count of data out ports
> +- qcom,din-ports: 	Must be count of data in ports
> +- qcom,ports-offset1:	Must be frame offset1 of each data port.
> +			Out followed by In. Used for Block size calculation.
> +- qcom,ports-offset2: 	Must be frame offset2 of each data port.
> +			Out followed by In. Used for Block size calculation.
> +- qcom,ports-sinterval-low: Must be sample interval low of each data port.
> +			Out followed by In. Used for Sample Interval calculation.

These definitions are valid only for specific types of ports, I believe 
here it's a 'reduced' port since offset2 is not required for simpler 
ports and you don't have Hstart/Hstop.

so if you state that all of these properties are required, you are 
explicitly ruling out future implementations of simple ports or will 
have to redefine them later.

Also the definition 'frame offset1/2' is incorrect. the offset is 
defined within each Payload Transport Window - not each frame - and its 
definition depends on the packing mode used, which isn't defined or 
stated here.

And last it looks like you assume a fixed frame shape - likely 50 rows 
by 8 columns, it might be worth adding a note on the max values for 
offset1/2 implied by this frame shape.

> +
> += SoundWire devices
> +Each subnode of the bus represents SoundWire device attached to it.
> +The properties of these nodes are defined by the individual bindings.
> +
> += EXAMPLE
> +The following example represents a SoundWire controller on DB845c board
> +which has controller integrated inside WCD934x codec on SDM845 SoC.
> +
> +soundwire: soundwire@c85 {
> +	compatible = "qcom,soundwire-v1.3.0";
> +	reg = <0xc85 0x20>;
> +	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
> +	clocks = <&wcc>;
> +	clock-names = "iface";
> +	#sound-dai-cells = <1>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	qcom,dout-ports	= <6>;
> +	qcom,din-ports	= <2>;
> +	qcom,ports-sinterval-low =/bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
> +	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
> +	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
> +
> +	/* Left Speaker */
> +	wsa8810@1{
> +		....
> +		reg = <1>;
> +	};
> +
> +	/* Right Speaker */
> +	wsa8810@2{
> +		....
> +		reg = <2>;
> +	};
> +};
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
