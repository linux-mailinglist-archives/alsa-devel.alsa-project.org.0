Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADF65BEE6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 12:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53F5D694;
	Tue,  3 Jan 2023 12:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53F5D694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672745324;
	bh=tr1mK9A8nVNJ6yZwPcx9+WhvVvm/NuilBnIrYLrfOrk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rgrFXLbH7toub/O6mKFPXapWg6bR/0n2V15bW8POk0m5EF4M8Hvcn//miGFlxW/fM
	 T2KJVVa1MmPAPTjTob8AjT1If+lEIzT824RDCjbLZSAyre8nYn5HVNv0Vrbtok34Zj
	 2xmvo1PSYET5eYP8zmsYYo7Kbv5LVm6DJJMgfed0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48017F804AD;
	Tue,  3 Jan 2023 12:27:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EB60F8047B; Tue,  3 Jan 2023 12:27:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out29-177.mail.aliyun.com (out29-177.mail.aliyun.com
 [115.124.29.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D7DF800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 12:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D7DF800C0
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1034973|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.265725-0.00146619-0.732809;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=28; RT=28; SR=0; TI=SMTPD_---.QjR9KV8_1672745223; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QjR9KV8_1672745223) by smtp.aliyun-inc.com;
 Tue, 03 Jan 2023 19:27:10 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH V8 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Date: Tue,  3 Jan 2023 19:27:03 +0800
Message-Id: <20230103112703.382153-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <aa0de3c8-d783-f8cc-42a9-7988acd6ab87@linaro.org>
References: <aa0de3c8-d783-f8cc-42a9-7988acd6ab87@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, steve@sk2.org, tanureal@opensource.cirrus.com,
 cezary.rojewski@intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 zhuning0077@gmail.com, liweilei@awinic.com,
 pierre-louis.bossart@linux.intel.com, povik+lin@cutebit.org,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 stephan@gerhold.net, zhaolei@awinic.com, james.schulman@cirrus.com,
 rf@opensource.cirrus.com, robh+dt@kernel.org, shumingf@realtek.com,
 tiwai@suse.com, duanyibo@awinic.com, wangweidong.a@awinic.com,
 lgirdwood@gmail.com, yijiangtao@awinic.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Krzysztof

On 30/12/2022 10:34, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
>> controlled using I2C.
>> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> new file mode 100644
>> index 000000000000..b677427ebcd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Awinic AW883xx Smart Audio Amplifier
>> +
>> +maintainers:
>> +  - Stephan Weidong Wang <wangweidong.a@awinic.com>
>> +
>> +description:
>> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
>> +  digital Smart K audio amplifier with an integrated 10.25V
>> +  smart boost convert.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: awinic,aw883xx

> Now the question what does "xx" stand for? I cannot find such product on
> awinic website:
> https://www.awinic.com/En/Index/queryAll/wd/aw883xx.html

xx represents our company's aw88394 and aw88395 chips,Aw88395 chips can be found on 
https://www.awinic.com/cn/detail/index/catid/229/id/48/title/AW88395CSR.html
The aw88394 chip will be available on the website in the near future.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +

> Why there is no sound-dai-cells?

I'll add sound-dai-cells in patch v8

>> +  sound-name-prefix: true

> Drop it.

I will modify it on patch v8

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +
>> +additionalProperties: false

> Instead:
> unevaluatedProperties: false

> unless this is not a codec and sound-dai-cells cannot be used?

I will modify it on patch v8

>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        audio-codec@34 {
>> +            compatible = "awinic,aw883xx";
>> +            reg = <0x34>;
>> +            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;

> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

I will modify it on patch v8

Best regards,
Weidong Wang
