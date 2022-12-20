Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D651FA1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:26:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6441420F8;
	Tue, 20 Dec 2022 12:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6441420F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671535600;
	bh=eoAh/hLbc/J0WsUfemJCZhW9/bbEX4qEp7Nv6wfCG5w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u13SvniApteed6kWoU/KQ9UoMu38gJzbjzn3FTS7ntNLI6B7kzvll1a1cGU6zuRRE
	 q8bJTeQdy3SaqtHSvvk5fm/cgWzA75SyRS92NaYnTpTKECmPGRrY4ALSNKiNKoMZRH
	 z2oHVUKgFUB5vVL+XIXblb43E+Hieqe5dIkcR/gA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08921F801C0;
	Tue, 20 Dec 2022 12:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B5AEF8032B; Tue, 20 Dec 2022 12:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out29-104.mail.aliyun.com (out29-104.mail.aliyun.com
 [115.124.29.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 524D1F801C0
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 524D1F801C0
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09785591|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0147832-0.000278321-0.984938;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.QZp78RS_1671535520; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QZp78RS_1671535520) by smtp.aliyun-inc.com;
 Tue, 20 Dec 2022 19:25:29 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Date: Tue, 20 Dec 2022 19:25:20 +0800
Message-Id: <20221220112520.314802-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <777fea54-9396-05c2-d0a8-e614224a3133@linaro.org>
References: <777fea54-9396-05c2-d0a8-e614224a3133@linaro.org>
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
Cc: zhaolei@awinic.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, wangweidong.a@awinic.com, tiwai@suse.com,
 duanyibo@awinic.com, robh+dt@kernel.org, liweilei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, broonie@kernel.org,
 zhangjianming@awinic.com, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/12/2022 08:26, wangweidong.a@awinic.com wrote:
> On Thu, Dec 8, 2022 at 6:28 AM <wangweidong.a@awinic.com> wrote:
>>
>> From: Weidong Wang <wangweidong.a@awinic.com>
>>
>> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
>> controlled using I2C.
> 
>> blank line
> 
>> Pretty sure I said this before, but resend to the DT list if you want
>> this reviewed.
> 
> Thank you for your advice, but could you please tell me how to resend it to the DT list

> Use scripts/get_maintainers.pl and send to all maintainers, reviewers
> and lists. Not to some subset, based on your preference.

Thank you very much, I will change it in patch v7

> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> new file mode 100644
>> index 000000000000..b72c9177ebb7
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
>> +  - Stephan Gerhold <stephan@gerhold.net>
>> +
>> +description:
>> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
>> +  digital Smart K audio amplifier with an integrated 10.25V
>> +  smart boost convert.
>> +
>> +allOf:
>> +  - $ref: name-prefix.yaml#
> 
>> I think this file has now been renamed upstream.
> 
> Thank you for your advice, but could you please describe why

> Why? To better reflect the contents.

Thank you very much for your reply.
But I don't understand why this file has now been renamed upstream.

Best regards

Weidong Wang
