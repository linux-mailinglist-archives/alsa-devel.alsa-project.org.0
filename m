Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFF2934B6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 08:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8C81718;
	Tue, 20 Oct 2020 08:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8C81718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603174712;
	bh=DBYf4+L+FbaWOZZbUBJaKLw6THB4gZNGms9iTIfwVTA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZTp6MFmWqiQK7C8L+jHJK3+5PCWzzhmUC9aX/Po7I9s6ahqM0HEGdkDhnTJpGyYQ
	 dYH6vVGYHgczKS1q7u6PUU9h5cPRag5t7cMA6EsC9F+h1D+b9NmGRGGcLRHQwj4tcm
	 nXWYOFTfxBf34yHx8DPCPYoPtba/XRnPKC/X4eAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0EF7F8010F;
	Tue, 20 Oct 2020 08:16:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27AE3F801F2; Tue, 20 Oct 2020 08:16:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6787F80090
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 08:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6787F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Tl1oa9Fc"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8e806b0000>; Mon, 19 Oct 2020 23:15:07 -0700
Received: from [10.25.98.225] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 06:16:27 +0000
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
To: Rob Herring <robh@kernel.org>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-12-git-send-email-spujar@nvidia.com>
 <20201019221612.GA3690258@bogus>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <f6d098fa-cbc2-7563-a68c-5d00d71d128f@nvidia.com>
Date: Tue, 20 Oct 2020 11:46:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019221612.GA3690258@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603174507; bh=JgtKQCdBHhWAi0Jahdr1f3uSUYWL0dxtVotsA8MMHMg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Tl1oa9FcQuGR29PHRl92SYgAMkqyMK8MYNkdkrOOd98+Z7K8GhczOMW5ZuFFd2sJD
 01ghxx9Me82onlUp7nh4sNKZ4sW1ROkAt7mxLN1wxYS3SJJg1xHlpGIcygDEM2uY3z
 AJLNg86cFbCSsQ8BCngjDaiYQMRIS0XD/eo3zsw8o+ocmz4VVOV/jCe89bQarLxvgX
 7PZVnihrMwPl2hdWBBWrBVyRcf2bLZiaeAVWJRCjR3t26mNmGDlI+RgwZ/2fct5zg2
 lKlkMw5xxi6EINEhBEfgtUXn9a7TpjRW1ImKMOSHNYMH+ZF77POzINwYtgCHAAI3u3
 fJ1iBa4Q/oqRw==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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


>> Add YAML schema for Tegra audio graph sound card DT bindings. It uses th=
e
>> same DT bindings provided by generic audio graph driver. Along with this
>> few standard clock DT bindings are added which are specifically required
>> for Tegra audio.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++=
++++++++
>>   1 file changed, 158 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a-audio-graph-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-=
graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audi=
o-graph-card.yaml
>> new file mode 100644
>> index 0000000..284d185
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-c=
ard.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.=
yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Audio Graph based Tegra sound card driver
>> +
>> +description: |
>> +  This is based on generic audio graph card driver along with additiona=
l
>> +  customizations for Tegra platforms. It uses the same bindings with
>> +  additional standard clock DT bindings required for Tegra.
>> +
>> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.y=
aml
> You should be able to just $ref this at the top level.

I am seeing one problem while using $ref like below.
allOf:
 =C2=A0 - $ref: /schemas/sound/audio-graph-card.yaml

I see below while running doc validator.
"Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.exam=
ple.dt.yaml:=20
tegra_sound: compatible:0: 'audio-graph-card' was expected"

Is there a way to avoid this?

>
>> +
>> +maintainers:
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Sameer Pujar <spujar@nvidia.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nvidia,tegra210-audio-graph-card
>> +          - nvidia,tegra186-audio-graph-card
>> +

>> +  dais:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
>> +
>> +  label:
>> +    $ref: /schemas/sound/simple-card.yaml#/properties/label
>> +
>> +  pa-gpios:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
>> +
>> +  widgets:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
>> +
>> +  routing:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
>> +
>> +  mclk-fs:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
>> +
>> +  prefix:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
> And drop all of these.

Could not re-use because of above compatible problem. Also require some=20
additional properties for Tegra.

>> +
>> +  clocks:
>> +   minItems: 2
>> +
>> +  clock-names:
>> +   minItems: 2
> Don't need this.

This is required for Tegra audio graph card to update clock rates at=20
runtime.

>
>> +   items:
>> +     - const: pll_a
>> +     - const: plla_out0
>> +
>> +  assigned-clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-parents:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-rates:
>> +    minItems: 1
>> +    maxItems: 3
>> +

It is required for initialisation of above clocks with specific rates.

>> +  ports:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
>> +
>> +patternProperties:
>> +  "^port(@[0-9a-f]+)?$":
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
> And these can be dropped. Unless what each port is is Tegra specific.

May be I can drop this if I could just directly include=20
audio-graph-card.yaml and extend required properties for Tegra.
