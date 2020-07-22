Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB9229692
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F5DC1665;
	Wed, 22 Jul 2020 12:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F5DC1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595414833;
	bh=jqIBmIiEcLfmSZAhOs+Woe34hM6/UsuoZpx6jiraNjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOuEPtFAeRNt/cVCGtSaGSZac4uYBMdbbrNKF9/o74iYlG/T9vTOTLmwuNkPmMnZ7
	 SGeST33mGfJNmHZiApsdt6242bED6IY1/caBMFxYOEoIawkzjvqtRTfOCL7ujz7OC+
	 lyt4x3Bd7GJjnoOeFAg14TVvgjWXcM+cgetFEvtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF35F800CE;
	Wed, 22 Jul 2020 12:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2992DF8014C; Wed, 22 Jul 2020 12:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BF97F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF97F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="PQrxNAfJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595414725; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=L/nok2zwYApKKFOOLAMzwlNRkNWlD/HVZfZXAgUTZSw=;
 b=PQrxNAfJ9gL8nwdDDC64DETZe3QesC4HDZNW3b0PEgJ7VZS6dGrOeqh+mcLgDDU/IAlz5QDW
 TsdIsV5/ZW8volZOyvjdeXdxn5bYT8HsIMVkvCOsxd2XFY6rG6cu6lK72b5ne9fBYH8JMvvO
 FuaYYG1HDF2UMTEzRuFWFQlNMQw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f1818b5e32d449b31512b0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:45:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 70E5EC4339C; Wed, 22 Jul 2020 10:45:09 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6553C433C9;
 Wed, 22 Jul 2020 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6553C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v3 8/8] dt-bindings: sound: lpass-cpu: Move to yaml format
To: Rob Herring <robh@kernel.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-9-git-send-email-rohitkr@codeaurora.org>
 <20200713225328.GA778183@bogus>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <9a72a266-d861-a4a5-bf9c-4f1437c4b50e@codeaurora.org>
Date: Wed, 22 Jul 2020 16:14:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713225328.GA778183@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
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

Thanks Rob for the review. Posted v4 with fixes.

On 7/14/2020 4:23 AM, Rob Herring wrote:
> On Wed, Jul 08, 2020 at 10:38:16AM +0530, Rohit kumar wrote:
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Update lpass-cpu binding with yaml formats.
>>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  80 -----------
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 154 +++++++++++++++++++++
>>   2 files changed, 154 insertions(+), 80 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> deleted file mode 100644
>> index 04e34cc..00000000
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> +++ /dev/null
>> @@ -1,80 +0,0 @@
>> -* Qualcomm Technologies LPASS CPU DAI
>> -
>> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>> -
>> -Required properties:
>> -
>> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>> -			  "qcom,lpass-cpu-sc7180"
>> -- clocks		: Must contain an entry for each entry in clock-names.
>> -- clock-names		: A list which must include the following entries:
>> -				* "ahbix-clk"
>> -				* "mi2s-osr-clk"
>> -				* "mi2s-bit-clk"
>> -			: required clocks for "qcom,lpass-cpu-apq8016"
>> -				* "ahbix-clk"
>> -				* "mi2s-bit-clk0"
>> -				* "mi2s-bit-clk1"
>> -				* "mi2s-bit-clk2"
>> -				* "mi2s-bit-clk3"
>> -				* "pcnoc-mport-clk"
>> -				* "pcnoc-sway-clk"
>> -
>> -- interrupts		: Must contain an entry for each entry in
>> -			  interrupt-names.
>> -- interrupt-names	: A list which must include the following entries:
>> -				* "lpass-irq-lpaif"
>> -- pinctrl-N		: One property must exist for each entry in
>> -			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
>> -			  for details of the property values.
>> -- pinctrl-names		: Must contain a "default" entry.
>> -- reg			: Must contain an address for each entry in reg-names.
>> -- reg-names		: A list which must include the following entries:
>> -				* "lpass-lpaif"
>> -- #address-cells	: Must be 1
>> -- #size-cells		: Must be 0
>> -
>> -
>> -
>> -Optional properties:
>> -
>> -- qcom,adsp		: Phandle for the audio DSP node
>> -
>> -By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
>> -The SD lines to use can be configured by adding subnodes for each of the DAIs.
>> -
>> -Required properties for each DAI (represented by a subnode):
>> -- reg			: Must be one of the DAI IDs
>> -			  (usually part of dt-bindings header)
>> -- qcom,playback-sd-lines: List of serial data lines to use for playback
>> -			  Each SD line should be represented by a number from 0-3.
>> -- qcom,capture-sd-lines	: List of serial data lines to use for capture
>> -			  Each SD line should be represented by a number from 0-3.
>> -
>> -Note that adding a subnode changes the default to "no lines configured",
>> -so both playback and capture lines should be configured when a subnode is added.
>> -
>> -Example:
>> -
>> -lpass@28100000 {
>> -	compatible = "qcom,lpass-cpu";
>> -	clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
>> -	clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
>> -	interrupts = <0 85 1>;
>> -	interrupt-names = "lpass-irq-lpaif";
>> -	pinctrl-names = "default", "idle";
>> -	pinctrl-0 = <&mi2s_default>;
>> -	pinctrl-1 = <&mi2s_idle>;
>> -	reg = <0x28100000 0x10000>;
>> -	reg-names = "lpass-lpaif";
>> -	qcom,adsp = <&adsp>;
>> -
>> -	#address-cells = <1>;
>> -	#size-cells = <0>;
>> -
>> -	/* Optional to set different MI2S SD lines */
>> -	dai@3 {
>> -		reg = <MI2S_QUATERNARY>;
>> -		qcom,playback-sd-lines = <0 1>;
>> -	};
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> new file mode 100644
>> index 00000000..9c350bc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -0,0 +1,154 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm LPASS CPU dai driver bindings
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +  - Rohit kumar <rohitkr@codeaurora.org>
>> +
>> +description:
>> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
>> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
>> +  configure Low-Power Audio Interface(LPAIF) core registers across different
>> +  IP versions.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,lpass-cpu
>> +      - qcom,apq8016-lpass-cpu
>> +      - qcom,lpass-cpu-sc7180
>> +
>> +  reg:
>> +    items:
>> +      - description: LPAIF core registers
> Just: 'maxItems: 1' for a single entry.
pl
>
>> +
>> +  reg-names:
>> +    items:
>> +      - const: lpass-lpaif
> Not all that useful with only 1.
ok .. Removed in v4.
>
>> +
>> +  clocks:
>> +    items:
>> +      - description: AHBIX core clock
>> +      - description: oscillator clock for MI2S external interfaces
>> +      - description: Bit clock for single MI2S dai
>> +      - description: Bit clock for MI2S_PRIMARY dai interface
>> +      - description: Bit clock for MI2S_SECONDARY dai interface
>> +      - description: Bit clock for MI2S_TERTIARY dai interface
>> +      - description: Bit clock for MI2S_QUATERNARY dai interface
>> +      - description: NOC MPORT clock of LPASS core
>> +      - description: NOC SWAY clock of LPASS core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ahbix-clk
>> +      - const: mi2s-osr-clk
>> +      - const: mi2s-bit-clk
>> +      - const: mi2s-bit-clk0
>> +      - const: mi2s-bit-clk1
>> +      - const: mi2s-bit-clk2
>> +      - const: mi2s-bit-clk3
>> +      - const: pcnoc-mport-clk
>> +      - const: pcnoc-sway-clk
>> +
>> +  interrupts:
>> +    items:
>> +      - description: LPAIF DMA buffer interrupt
> maxItems: 1
ok
>
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: lpass-irq-lpaif
>> +
>> +  qcom,adsp:
>> +    maxItems: 1
>> +    description: Phandle for the audio DSP node
> Needs a type $ref. And if just a phandle, 'maxItems: 1' is not
> appropriate.
>
>> +
>> +  iommus:
>> +    maxItems: 1
>> +    description: Phandle to apps_smmu node with sid mask
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description: Phandle for power domain node
> Drop. That's every 'power-domains' property.
ok
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  child-node:
> I'm sure I said this on some review recently, but you are defining a
> child node named 'child-node'. You need this under patternProperties
> with the actual child node name.
Done in v4.
>
>> +    description: Required properties for each DAI
>> +    type: object
>> +    properties:
>> +      reg:
>> +        description: Must be one of the DAI ID
>> +                     (Usually part of dtbindings header)
> Ideally, you'd define the range of values here.
>
>> +      qcom,playback-sd-lines:
>> +        description: List of serial data lines to use for playback
>> +                     Each SD line should be represented by a number from 0-3.
> Needs a type $ref and 0-3 should be expressed as a schema.
>
> 'make dt_binding_check' should complain about this. You did run that,
> right?
Actually I reposted the Ajit's patch. Fixed all issues in v4.
>> +      qcom,capture-sd-lines :
>> +        description: List of serial data lines to use for capture
>> +                     Each SD line should be represented by a number from 0-3.
> ditto
>
>> +    required:
>> +      -reg
> space     ^
>
>> +    # Note that adding a subnode changes the default to "no lines configured",
>> +    # so both playback and capture lines should be configured when a subnode
>> +    # is added.
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - sound-dai-cells
> Not a valid property.
>
>> +
>> +optional:
>> +  - qcom,adsp
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,lpass-cpu-sc7180
>> +
>> +then:
>> +  required:
>> +    - iommus
>> +    - power-domains
>> +
>> +examples:
>> +  lpass@28100000 {
> This is not valid. 'examples' should be a list.
>
>> +	compatible = "qcom,lpass-cpu";
>> +	clocks = <&lcc AHBIX_CLK>,
>> +		 <&lcc MI2S_OSR_CLK>,
>> +		 <&lcc MI2S_BIT_CLK>;
> The example will not build because the includes are missing.
>
>> +
>> +	clock-names = "ahbix-clk",
>> +		      "mi2s-osr-clk",
>> +		      "mi2s-bit-clk";
>> +
>> +	interrupts = <0 85 1>;
>> +        interrupt-names = "lpass-irq-lpaif";
>> +
>> +	iommus = <&apps_smmu 0x1020 0>;
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> +
>> +	reg = <0x28100000 0x10000>;
>> +	reg-names = "lpass-lpaif";
>> +	#sound-dai-cells = <1>;
>> +	qcom,adsp = <&adsp>;
>> +
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* Optional to set different MI2S SD lines */
>> +	mi2s-quaternary@3 {
>> +		reg = <MI2S_QUATERNARY>;
>> +		qcom,playback-sd-lines = <0 1>;
>> +  };
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

