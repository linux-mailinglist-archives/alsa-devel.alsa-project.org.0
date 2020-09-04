Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC025D6F8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 13:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0775A1B02;
	Fri,  4 Sep 2020 13:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0775A1B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599217472;
	bh=Q7ONTmdE5O3zyLoRbKjUDWi27jlQPvzVzwB8xEHuo3M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vv9+QeH00MiJmkz0ly4yPjlliEN5BnGC30v8/uvHMx2OGeoNEMiGYrC4o966882aA
	 +bXU/gNa/6gYNWu9Qxd9zgluggYAqSMlPgdATVKPAT5MoHSEoRIZ9w1OBVWOmH0pGa
	 XEEG0yVhyEzcdmnkSkhdqdFmtPJ61uL446NeZV4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA5BF80257;
	Fri,  4 Sep 2020 13:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C8CF8024A; Fri,  4 Sep 2020 13:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EEA6F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 13:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEA6F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="kXB43n87"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="YIP2kujt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599217355;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=Q7ONTmdE5O3zyLoRbKjUDWi27jlQPvzVzwB8xEHuo3M=;
 b=kXB43n87Orn/9OQb0pADGqQfwQz9Rk7J0lM0ZXlA5FX4UmY1pWDvvdg1VRI6Ft+K
 Cvq6H8MWSnPGA5WNJ5cGvKLuMOElfV2Wt+3ok2vvIm2h0wB1k8yeNOMBwnGcB+N2Za6
 qnEpZvrkVW1LtOvR+PEEFkC6QgLuU518KsbaKYRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599217355;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=Q7ONTmdE5O3zyLoRbKjUDWi27jlQPvzVzwB8xEHuo3M=;
 b=YIP2kujta/7HoBz7KpcaIastdkB0nZmXGfIwbjRkK29sDB2c8Y0lwTVSEFybFxZm
 bVEYopwGeHg3dLzKXvMqE7RuWTZyD3RC74QVI+eg3Nw2ljiRmq4UbGafvg7ApKXYF63
 IUuU0q4DdescQHb/rTOr5/KGcq4zup5tW7uDPsbE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1056C43222
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-3-git-send-email-srivasam@codeaurora.org>
 <0aa914dd-6a6e-208d-d29f-214a84dfd8a2@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <0101017458c84b59-6e3b362d-ba24-4f71-ad32-cfaca8649db1-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2020 11:02:35 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <0aa914dd-6a6e-208d-d29f-214a84dfd8a2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.04-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks Srinivas For Review!!!

On 9/4/2020 4:11 PM, Srinivas Kandagatla wrote:
>
>
> On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Adds bindings for lpass hdmi interface
>> which can support audio path over dp.
>>
>> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 
>> ++++++++++++++++++++--
>>   1 file changed, 47 insertions(+), 4 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 09c9bd2..7c2ac0c 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -22,6 +22,7 @@ properties:
>>         - qcom,lpass-cpu
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>> +      - qcom,sc7180-lpass-hdmi
>
> Why do we need a new compatible per interface, IMO, you should just 
> use the existing compatible.
> Or please explain the reasons why we need this?
Two compatible strings are used because iommu's are different for I2S 
and HDMI.
>
>>       reg:
>>       maxItems: 1
>> @@ -60,10 +61,12 @@ properties:
>>       const: 0
>>     patternProperties:
>> -  "(^mi2s-[0-9a-f]$|mi2s)":
>> +  "^dai@[0-9a-f]$":
>>       type: object
>> -    description: Required properties for each DAI
>> -
>> +    description: |
>> +      LPASS CPU dai node for each I2S device. Bindings of each node
>> +      depends on the specific driver providing the functionality and
>> +      properties.
>>       properties:
>>         reg:
>>           maxItems: 1
>> @@ -145,6 +148,22 @@ allOf:
>>           - iommus
>>           - power-domains
>>   +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sc7180-lpass-hdmi
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: pcnoc-sway-clk
>> +            - const: audio-core
>> +            - const: pcnoc-mport-clk
>> +      required:
>> +        - iommus
>> +        - power-domains
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/sound/sc7180-lpass.h>
>> @@ -178,12 +197,36 @@ examples:
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>               /* Optional to set different MI2S SD lines */
>> -            mi2s-primary@0 {
>> +            dai@mi2s-primary {
>>                   reg = <MI2S_PRIMARY>;
>>                   qcom,playback-sd-lines = <1>;
>>                   qcom,capture-sd-lines = <0>;
>>               };
>>           };
>> +
>> +        lpassh@62d87000 {
>> +            compatible = "qcom,sc7180-lpass-hdmi";
>> +
>> +            reg = <0 0x62d87000 0 0x68000>;
>> +
>> +            iommus = <&apps_smmu 0x1032 0>;
>> +
>> +            power-domains = <&lpass_hm 0>;
>> +
>> +            clocks = <&gcc 131>,
>> +                 <&lpasscc 6>,
>> +                 <&lpasscc 10>;
>> +
>> +            clock-names = "pcnoc-sway-clk", "audio-core",
>> +                          "pcnoc-mport-clk";
>> +
>> +            #sound-dai-cells = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            interrupts = <0 268 1>;
>> +        };
>>       };
>>     ...
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

