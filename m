Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B149A23C404
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 05:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A5F1665;
	Wed,  5 Aug 2020 05:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A5F1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596598503;
	bh=IZMBop0eL2jVvQ/7DQLxvagtM4yrPmLwihQvJjVlrHA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ifa5wLo7I3PJLtNsmrMt7ZcYgp+pcxZH4/SvzAuq42RHZf/6cXUeCsKqq7qz8k3k/
	 1LF/zSGlbHaqlNcbz5i+67UdA99lOWkVfk4g4FuhpuHs/EErGo9gGfoNX5gyA7Dujb
	 RUrEjucDNakILMcQknmZZIvDkC5UUbXqsZYkU+oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D826F80234;
	Wed,  5 Aug 2020 05:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D6EF80218; Wed,  5 Aug 2020 05:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EF75F80124
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 05:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EF75F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="pmAlKtw3"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596598388; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yvOK0+u7lVBiPDKYRJ21zelCk8/i+fOYdyMyODCybYU=;
 b=pmAlKtw3iwqPPkluUrd6oxnWJZjPNYaT6BgZqmc2fpq6EI0Z0bKoZmReTtVgPMo7CIHlRwhS
 UCYbFYjMJ811Tl1ssEkiqpbljMZBZBArRwjcwJ8s06xt39mniC4cM5uNzLNinLQ2fd9KwakW
 +I+MYqGGEpaLTb/NFSarZITpqmE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f2a28732c24b37bbebc4ea4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 Aug 2020 03:33:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CA2CCC433C9; Wed,  5 Aug 2020 03:33:06 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D703FC433C6;
 Wed,  5 Aug 2020 03:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D703FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v4 12/12] dt-bindings: sound: lpass-cpu: Move to yaml
 format
To: Rob Herring <robh@kernel.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
 <20200723171629.GA547775@bogus>
 <d00456e3-00e1-e373-760c-8292d6e7dd1b@codeaurora.org>
 <CAL_Jsq+DwA8=iRfMgUGM+H5_CrRRb7xa7DFdAWFOCATR9+=+Rw@mail.gmail.com>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <60076588-f340-ddf0-c0a8-36a95e3cdbae@codeaurora.org>
Date: Wed, 5 Aug 2020 09:02:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+DwA8=iRfMgUGM+H5_CrRRb7xa7DFdAWFOCATR9+=+Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


On 8/3/2020 11:52 PM, Rob Herring wrote:
> On Mon, Aug 3, 2020 at 2:28 AM Rohit Kumar <rohitkr@codeaurora.org> wrote:
>> Thanks Rob for reviewing
>>
>> On 7/23/2020 10:46 PM, Rob Herring wrote:
>>> On Wed, Jul 22, 2020 at 04:01:55PM +0530, Rohit kumar wrote:
>>>> Update lpass-cpu binding with yaml formats.
>>>>
>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>> ---
>>>>    .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 ---------------
>>>>    .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 +++++++++++++++++++++
>>>>    2 files changed, 185 insertions(+), 130 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>> deleted file mode 100644
>>>> index c21392e..00000000
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>> +++ /dev/null
>>>> @@ -1,130 +0,0 @@
>>>> -* Qualcomm Technologies LPASS CPU DAI
>>>> -
>>>> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>>>> -
>>>> -Required properties:
>>>> -
>>>> -- compatible                : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>>> -                      "qcom,lpass-cpu-sc7180"
>>>> -- clocks            : Must contain an entry for each entry in clock-names.
>>>> -- clock-names               : A list which must include the following entries:
>>>> -                            * "ahbix-clk"
>>>> -                            * "mi2s-osr-clk"
>>>> -                            * "mi2s-bit-clk"
>>>> -                    : required clocks for "qcom,lpass-cpu-apq8016"
>>>> -                            * "ahbix-clk"
>>>> -                            * "mi2s-bit-clk0"
>>>> -                            * "mi2s-bit-clk1"
>>>> -                            * "mi2s-bit-clk2"
>>>> -                            * "mi2s-bit-clk3"
>>>> -                            * "pcnoc-mport-clk"
>>>> -                            * "pcnoc-sway-clk"
>>>> -                    : required clocks for "qcom,lpass-cpu-sc7180"
>>>> -                            * "audio-core"
>>>> -                            * "mclk0"
>>>> -                            * "mi2s-bit-clk0"
>>>> -                            * "mi2s-bit-clk1"
>>>> -                            * "pcnoc-sway-clk"
>>>> -                            * "pcnoc-mport-clk"
>>>> -
>>>> -- interrupts                : Must contain an entry for each entry in
>>>> -                      interrupt-names.
>>>> -- interrupt-names   : A list which must include the following entries:
>>>> -                            * "lpass-irq-lpaif"
>>>> -- pinctrl-N         : One property must exist for each entry in
>>>> -                      pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
>>>> -                      for details of the property values.
>>>> -- pinctrl-names             : Must contain a "default" entry.
>>>> -- reg                       : Must contain an address for each entry in reg-names.
>>>> -- reg-names         : A list which must include the following entries:
>>>> -                            * "lpass-lpaif"
>>>> -- #address-cells    : Must be 1
>>>> -- #size-cells               : Must be 0
>>>> -
>>>> -
>>>> -
>>>> -Optional properties:
>>>> -
>>>> -- qcom,adsp         : Phandle for the audio DSP node
>>>> -
>>>> -By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
>>>> -The SD lines to use can be configured by adding subnodes for each of the DAIs.
>>>> -
>>>> -Required properties for each DAI (represented by a subnode):
>>>> -- reg                       : Must be one of the DAI IDs
>>>> -                      (usually part of dt-bindings header)
>>>> -- qcom,playback-sd-lines: List of serial data lines to use for playback
>>>> -                      Each SD line should be represented by a number from 0-3.
>>>> -- qcom,capture-sd-lines     : List of serial data lines to use for capture
>>>> -                      Each SD line should be represented by a number from 0-3.
>>>> -
>>>> -Note that adding a subnode changes the default to "no lines configured",
>>>> -so both playback and capture lines should be configured when a subnode is added.
>>>> -
>>>> -Examples:
>>>> -1)
>>>> -
>>>> -lpass@28100000 {
>>>> -    compatible = "qcom,lpass-cpu";
>>>> -    clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
>>>> -    clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
>>>> -    interrupts = <0 85 1>;
>>>> -    interrupt-names = "lpass-irq-lpaif";
>>>> -    pinctrl-names = "default", "idle";
>>>> -    pinctrl-0 = <&mi2s_default>;
>>>> -    pinctrl-1 = <&mi2s_idle>;
>>>> -    reg = <0x28100000 0x10000>;
>>>> -    reg-names = "lpass-lpaif";
>>>> -    qcom,adsp = <&adsp>;
>>>> -
>>>> -    #address-cells = <1>;
>>>> -    #size-cells = <0>;
>>>> -
>>>> -    /* Optional to set different MI2S SD lines */
>>>> -    dai@3 {
>>>> -            reg = <MI2S_QUATERNARY>;
>>>> -            qcom,playback-sd-lines = <0 1>;
>>>> -    };
>>>> -};
>>>> -
>>>> -2)
>>>> -
>>>> -#include <dt-bindings/sound/sc7180-lpass.h>
>>>> -
>>>> -lpass_cpu: lpass {
>>>> -    compatible = "qcom,lpass-cpu-sc7180";
>>>> -
>>>> -    reg = <0 0x62F00000 0 0x29000>;
>>>> -
>>>> -    iommus = <&apps_smmu 0x1020 0>;
>>>> -
>>>> -    power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>>>> -    clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
>>>> -            <&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
>>>> -            <&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
>>>> -            <&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
>>>> -            <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
>>>> -            <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
>>>> -    clock-names = "pcnoc-sway-clk", "audio-core",
>>>> -                    "mclk0", "pcnoc-mport-clk",
>>>> -                    "mi2s-bit-clk0", "mi2s-bit-clk1";
>>>> -    interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
>>>> -    interrupt-names = "lpass-irq-lpaif";
>>>> -
>>>> -
>>>> -    #sound-dai-cells = <1>;
>>>> -
>>>> -    #address-cells = <1>;
>>>> -    #size-cells = <0>;
>>>> -
>>>> -    mi2s-primary@0 {
>>>> -            reg = <MI2S_PRIMARY>;
>>>> -            qcom,playback-sd-lines = <1>;
>>>> -            qcom,capture-sd-lines = <0>;
>>>> -    };
>>>> -
>>>> -    mi2s-secondary@1 {
>>>> -            reg = <MI2S_SECONDARY>;
>>>> -            qcom,playback-sd-lines = <0>;
>>>> -    };
>>>> -};
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>>> new file mode 100644
>>>> index 00000000..03c598f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>>> @@ -0,0 +1,185 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> If all the authors are QCom or Linaro please dual license.
>> Ok
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm LPASS CPU dai driver bindings
>>>> +
>>>> +maintainers:
>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> +  - Rohit kumar <rohitkr@codeaurora.org>
>>>> +
>>>> +description: |
>>>> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
>>>> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
>>>> +  configure Low-Power Audio Interface(LPAIF) core registers across different
>>>> +  IP versions.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: qcom,lpass-cpu
>>>> +        description: For IPQ806x
>>>> +
>>>> +      - const: qcom,apq8016-lpass-cpu
>>>> +        description: For APQ8016
>>>> +
>>>> +      - const: qcom,lpass-cpu-sc7180
>>>> +        description: For SC7180
>>> Use enum rather than oneOf+const
>> Sure
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description: LPAIF core registers
>>>> +
>>>> +  clocks:
>>>> +    minItems: 3
>>>> +    maxItems: 6
>>>> +
>>>> +  clock-names:
>>>> +    minItems: 3
>>>> +    maxItems: 6
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +    description: LPAIF DMA buffer interrupt
>>>> +
>>>> +  qcom,adsp:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: Phandle for the audio DSP node
>>>> +
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +    description: Phandle to apps_smmu node with sid mask
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#sound-dai-cells':
>>>> +    const: 1
>>>> +
>>>> +patternProperties:
>>>> +  "(^mi2s-[0-9a-f]$|mi2s)":
>>>> +    type: object
>>>> +    description: Required properties for each DAI
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description: Must be one of the DAI ID
>>>> +
>>>> +    required:
>>>> +      - reg
>>>> +
>>>> +
>>> Extra blank line.
>> Ok
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - '#sound-dai-cells'
>>> Add:
>>>
>>> additionalProperties: false
>> If I am adding this, I am getting below error:
>>
>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml:
>> lpass@62f00000: '#address-cells', '#size-cells' do not match any of the
>> regexes: '(^mi2s-[0-9a-f]$|mi2s)', 'pinctrl-[0-9]+'
>>
>>
>> I think  this is coming because we have not mentioned mi2s-primary@0 in
>> required fields.
>> The field name is variable based on the interface to which peripheral is
>> connected to.
>> It can be either of primary/secondary/tertiary/quaternary. Can you
>> please suggest how to
>> avoid this error?
> No, the error is because you didn't list '#address-cells' and
> '#size-cells' as properties.
Thanks Rob for the input. Posted v5 patches with the change.
>
> Rob

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

