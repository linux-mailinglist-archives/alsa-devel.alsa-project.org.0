Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3911B86EB
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 16:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 334E71699;
	Sat, 25 Apr 2020 16:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 334E71699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587823643;
	bh=dxqBVpddA3C7Z+EQvFDadf6RrRuDX8J8Vkdks5x8/G8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAXcNXUEGMGXdpf8BBrOs4ndTSamC40ORU2b7Mo5T0CJYiNpxNodAYPhO3XpO1Lnd
	 GJH6km6GE/Mho+DIDY6O3PfSErtCISmYYfYt0jNh32V5ON0ksHLY61s7mk6jaSGBOQ
	 p+W9KQqegs/v4r4NhPjV+fAKI/z4Q0Djl56epb8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18069F801ED;
	Sat, 25 Apr 2020 16:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 201B3F80105; Sat, 25 Apr 2020 16:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1521DF80159
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 16:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1521DF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="XmO3sWTJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587823533; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oICXBIpep/D27htpZFSqCDakeFrEc4RwdE0UEWchpXA=;
 b=XmO3sWTJNZsEzQEw/MiEPfj2ou1mtwyYlxc4K7NqS5Flp10bcGbeyMUur22ry646zGnHJCKw
 sbIaCGJ9BuiifFaLZHftOHmg9qsjfMaltrSWApk86L21eyOlzw+baGwkfIXTqfVVD/hqqZOQ
 hpFt4rOTbfibaiMG+v+pvc3QJds=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea443a3.7fb1f6723a78-smtp-out-n04;
 Sat, 25 Apr 2020 14:05:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02B18C433CB; Sat, 25 Apr 2020 14:05:23 +0000 (UTC)
Received: from [10.86.13.83]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E854CC433D2;
 Sat, 25 Apr 2020 14:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E854CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH 01/11] Documentation: device-tree: sound: Update lpass-cpu
 driver binding
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, broonie@kernel.org, devicetree@vger.kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-2-git-send-email-ajitp@codeaurora.org>
 <f0ce184d-ad24-fe4a-8ad1-b9a9bf47f33b@linaro.org>
From: Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <05b9ba59-5361-be93-d4d9-e5b52708f151@codeaurora.org>
Date: Sat, 25 Apr 2020 19:35:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f0ce184d-ad24-fe4a-8ad1-b9a9bf47f33b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com
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

On 4/16/2020 1:23 PM, Srinivas Kandagatla wrote:
>
>
> On 11/04/2020 09:02, Ajit Pandey wrote:
>> Done the required cleanups to update lpass-cpu binding with newer
>> yaml formats.
>>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>
>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 158 
>> ---------------------
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 103 
>> ++++++++++++++
>>   2 files changed, 103 insertions(+), 158 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> deleted file mode 100644
>> index a49b878..00000000
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> +++ /dev/null
>> @@ -1,158 +0,0 @@
>> -* Qualcomm Technologies LPASS CPU DAI binding
>> -
>> -Low-Power Audio SubSystem (LPASS) consist of MI2S interfaces for 
>> audio data
>> -transfer on external codec. LPASS cpu driver is a common code to 
>> configure
>> -MI2S related CPU dai's across different version of LPASS architecture.
>> -
>> -- compatible:
>> -    Usage: required
>> -    Value type: <stringlist>
>> -    Definition: compatible string corresponds to lpass variants driver
>> -            must be "qcom, lpass-cpu-sc7180" for sc7180 lpass
> This patch will not apply on mainline, looks like this was done on top 
> of your local repo, please fix this!
>
> Best thing would be rebase patches top of 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-next
Sure I'll rebase on top of mentioned tip during v2 patch chain submission
>
> Secondly, Split this patch into two,
> 1> converting in to yaml
> 2> adding new changes
> so that it will be easy to see what exactly changed.
>
> thanks,
> srini
>
I've not added any newer properties here just changed it to yaml format only

Thanks & Regards

Ajit

>> -            must be "qcom,apq8016-lpass-cpu" for apq8016 lpass
>> -- reg:
>> -    Usage: required
>> -    Value type: <prop-encoded-array>
>> -    Definition: must specify the base address and size of the LPAIF 
>> CORE
>> -            region of lpass variant.
>> -- reg-names:
>> -    Usage: required
>> -    Value type: <stringlist>
>> -    Definition: must be "lpass-lpaif"
>> -
>> -- iommus:
>> -        Usage: required for "qcom, lpass-cpu-sc7180" compatible string
>> -        Value type: <prop-encoded-array>
>> -        Definition: sid mask for lpaif memory region to apps_smmu
>> -                    must be <&apps_smmu 0x1020 0>
>> -
>> -- power-domains:
>> -    Usage: required for "qcom, lpass-cpu-sc7180" compatible string
>> -    Value type: <phandle>
>> -    Definition: reference to power-domains
>> -            must be <&lpass_hm LPASS_CORE_HM_GDSCR>
>> -
>> -- clocks:
>> -        Usage: required
>> -    Value type: <phandle>
>> -    Definition: reference to the clocks that match clock-names
>> -
>> -- clock-names:
>> -    Usage: required
>> -    Value type: <stringlist>
>> -    Definition: The clocks needed depend on the compatible string:
>> -    qcom,lpass-cpu-apq8016:
>> -        must be "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk0",
>> -        mi2s-bit-clk1", "mi2s-bit-clk2", "mi2s-bit-clk3",
>> -        "pcnoc-mport-clk", "pcnoc-sway-clk"
>> -    qcom, lpass-cpu-sc7180:
>> -        must be "noc", "audio-core", "mclk0", "sysnoc_mport",
>> -        "pri_ibit", "sec_ibit"
>> -
>> -- #sound-dai-cells
>> -    Usage: required
>> -    Value type: <u32>
>> -    Definition: Must be 1
>> -
>> -- interrupts:
>> -    Usage: required
>> -    Value type: <prop-encoded-array>
>> -    Definition: reference to the interrupts that match interrupt-names
>> -
>> -- interrupt-names:
>> -    Usage: required
>> -    Value type: <stringlist>
>> -    Definition: must be "lpass-irq-lpaif"
>> -
>> -- qcom,adsp:
>> -        Usage: optional
>> -        Value type: <phandle>
>> -    Definition: Phandle for the audio DSP node
>> -
>> -= MI2S DAIs (Digial Audio Interface)
>> -"dais" child node of the lpass node. It represents mi2s dais, each 
>> mi2s dai is
>> -subnode of "dais" representing board specific dai setup & required 
>> dai clocks.
>> -"dais" node should have following properties.
>> -
>> -- id:
>> -    Usage: required for mi2s interface
>> -    Value type: <u32>
>> -    Definition: Must be dai id defined in lpass bindings like 
>> MI2S_PRIMARY
>> -
>> -- qcom,bitclk-name:
>> -    Usage: required for mi2s interface
>> -    Value type: <stringlist>
>> -    Definition: bitclk name corresponds to MI2S of lpass version
>> -
>> -- qcom,mclk-name:
>> -        Usage: optional for mi2s interface
>> -        Value type: <stringlist>
>> -        Definition: external mclk name corresponds to MI2S of lpass 
>> version
>> -
>> -- qcom,osrclk-name:
>> -        Usage: optional for mi2s interface
>> -        Value type: <stringlist>
>> -        Definition: osrclk name corresponds to MI2S of lpass version
>> -
>> -- qcom,spkmode-mask:
>> -        Usage: optional for mi2s interface
>> -        Value type: <u32>
>> -        Definition: board specific property to change default 
>> spkmode mask
>> -                    of MI2S dai based on dataline connection on board.
>> -
>> -- qcom,micmode-mask:
>> -        Usage: optional for mi2s interface
>> -        Value type: <u32>
>> -        Definition: board specific property to change default 
>> micmode mask
>> -                    of MI2S dai based on dataline connection on board.
>> -
>> -- qcom,loopback-mask:
>> -        Usage: optional for mi2s interface
>> -        Value type: <u32>
>> -        Definition: board specific property to change default 
>> loopback mask
>> -                    of MI2S dai as per requirement.
>> -
>> -- qcom,wssrc-mask:
>> -        Usage: optional for mi2s interface
>> -        Value type: <u32>
>> -        Definition: board specific property to change default wssrc 
>> mask
>> -                    of MI2S dai based as per requirement.
>> -
>> -Example:
>> -
>> -lpass_cpu: lpass {
>> -    compatible = "qcom, lpass-cpu-sc7180";
>> -
>> -    reg = <0 0x62F00000 0 0x29000>;
>> -    reg-names = "lpass-lpaif";
>> -
>> -    iommus = <&apps_smmu 0x1020 0>;
>> -
>> -    power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> -
>> -    clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
>> -         <&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
>> -         <&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
>> -         <&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
>> -         <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
>> -         <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
>> -
>> -    clock-names = "noc", "audio-core", "mclk0", "sysnoc_mport",
>> -              "pri_ibit", "sec_ibit";
>> -
>> -    #sound-dai-cells = <1>;
>> -
>> -    interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
>> -    interrupt-names = "lpass-irq-lpaif";
>> -
>> -    prim-mi2s@0 {
>> -        id = <MI2S_PRIMARY>;
>> -        qcom,bitclk-name = "pri_ibit";
>> -        qcom,mclk-name = "mclk0";
>> -    };
>> -
>> -    sec-mi2s@1 {
>> -        id = <MI2S_SECONDARY>;
>> -        qcom,bitclk-name = "sec_ibit";
>> -    };
>> -};
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> new file mode 100644
>> index 00000000..a87a406
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm LPASS CPU dai driver bindings
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +  - Ajit Pandey <ajitp@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of 
>> MI2S interface
>> +  for audio data transfer on external codecs. LPASS cpu driver is a 
>> module to
>> +  configure Low-Power Audio Interface(LPAIF) core registers across 
>> different
>> +  IP versions.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,lpass-cpu
>> +      - qcom,apq8016-lpass-cpu
>> +
>> +  reg:
>> +    items:
>> +      - description: LPAIF core registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: lpass-lpaif
>> +
>> +  clocks:
>> +    items:
>> +      - description: AHBIX core clock for IPQ806X
>> +      - description: oscillator clock for MI2S external interfaces
>> +      - description: Bit clock for single MI2S dai in IPQ806X
>> +      - description: Bit clock for MI2S_PRIMARY dai interface
>> +      - description: Bit clock for MI2S_SECONDARY dai interface
>> +      - description: Bit clock for MI2S_TERTIARY dai interface
>> +      - description: Bit clock for MI2S_QUATERNARY dai interface
>> +      - description: NOC MPORT clock of LPASS core
>> +      - description: NOC SWAY clock of LPASS core
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ahbix-clk
>> +      - const: mi2s-osr-clk
>> +      - const: mi2s-bit-clk
>> +      - const: mi2s-bit-clk0
>> +      - const: mi2s-bit-clk1
>> +      - const: mi2s-bit-clk2
>> +      - const: mi2s-bit-clk3
>> +      - const: pcnoc-mport-clk
>> +      - const: pcnoc-sway-clk
>> +
>> +  interrupts:
>> +    items:
>> +      - description: LPAIF DMA buffer interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: lpass-irq-lpaif
>> +
>> +  qcom,adsp:
>> +    maxItems: 1
>> +    description: Phandle for the audio DSP node
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - sound-dai-cells
>> +
>> +optional:
>> +  - qcom,adsp
>> +
>> +examples:
>> +  lpass@28100000 {
>> +    compatible = "qcom,lpass-cpu";
>> +    clocks = <&lcc AHBIX_CLK>,
>> +         <&lcc MI2S_OSR_CLK>,
>> +         <&lcc MI2S_BIT_CLK>;
>> +
>> +    clock-names = "ahbix-clk",
>> +              "mi2s-osr-clk",
>> +              "mi2s-bit-clk";
>> +
>> +    interrupts = <0 85 1>;
>> +    interrupt-names = "lpass-irq-lpaif";
>> +
>> +    reg = <0x28100000 0x10000>;
>> +    reg-names = "lpass-lpaif";
>> +    #sound-dai-cells = <1>;
>> +    qcom,adsp = <&adsp>;
>> +
>>
