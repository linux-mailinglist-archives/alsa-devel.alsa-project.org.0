Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E228FD96
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 07:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB90D1789;
	Fri, 16 Oct 2020 07:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB90D1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602825387;
	bh=58G5hh5VTCRWNjS2NbwxGT+Sa6kUqX0udY4utQfHKx4=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iAx/CbilbKtg+83LT+1ietl7otnT41n35BohJFje/NqlCtCTBlV/4lZXCu2WKx0pp
	 iiONF8oBQkKbkQtS9OiafM1RG2A7vAn2O1QxCeAti3o4pWcohq+dEAPIT5yxTvhKeA
	 pHxUgkPaIr/2ke9nTbqEEgrK/u2Cdulw27sr82mA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B5DF80115;
	Fri, 16 Oct 2020 07:14:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82975F80217; Fri, 16 Oct 2020 07:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E9FFF80115
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 07:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9FFF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="rkMkit/d"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f892c2b0000>; Thu, 15 Oct 2020 22:14:19 -0700
Received: from [10.25.98.225] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 05:14:19 +0000
Subject: Re: [PATCH v3 09/13] ASoC: dt-bindings: tegra: Add schema for audio
 graph card
From: Sameer Pujar <spujar@nvidia.com>
To: Rob Herring <robh@kernel.org>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-10-git-send-email-spujar@nvidia.com>
 <20201006203433.GA2786434@bogus>
 <a5bc07d8-fb2e-e86e-f0d3-be19166ad7bb@nvidia.com>
Message-ID: <acbcd136-a933-e5e0-863b-f435dafe1697@nvidia.com>
Date: Fri, 16 Oct 2020 10:44:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5bc07d8-fb2e-e86e-f0d3-be19166ad7bb@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602825259; bh=58G5hh5VTCRWNjS2NbwxGT+Sa6kUqX0udY4utQfHKx4=;
 h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=rkMkit/dwJWZjwBML9DdGRm+RNMv9B5Kz7OUNznxWxt1JLSqpH5lHP4OWCQNRdJf5
 AvU6R5Buf8OP2UclEUIXoAAcYfYNqtLZCpZxiqF4Vr/t5ZyBOAvFO259diZQnwxnJ5
 PJmLj17dQgUYtijjaRy7Do2j9Vh9oOKDAwkbsfnwQXY5XW5giTTuJZEAV4eRyc43/w
 0jw6nBHxUXE6faiST7IY30d425/tOOWm01PXWSimZhXK8ylwk0U93tJCaanvdekoBw
 EpmB7r5c/s+z2Wtg7z5FB+uZ+rhTx9Y7nKpHbzotX2CXRHWigkuDKq9OxDo6w9Dp0e
 lqPyJ9p8O8KmQ==
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, tiwai@suse.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, devicetree@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


>>> Add YAML schema for Tegra audio graph sound card DT bindings. It=20
>>> uses the
>>> same DT bindings provided by generic audio graph driver. Along with=20
>>> this
>>> few standard clock DT bindings are added which are specifically=20
>>> required
>>> for Tegra audio.
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> ---
>>> =C2=A0 .../sound/nvidia,tegra-audio-graph-card.yaml | 70=20
>>> ++++++++++++++++++++++
>>> =C2=A0 1 file changed, 70 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.y=
aml
>>>
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card=
.yaml=20
>>> b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card=
.yaml=20
>>>
>>> new file mode 100644
>>> index 0000000..b73fbe5
>>> --- /dev/null
>>> +++=20
>>> b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card=
.yaml
>>> @@ -0,0 +1,70 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:=20
>>> http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Audio Graph based Tegra sound card driver
>>> +
>>> +description: |
>>> +=C2=A0 This is based on generic audio graph card driver along with=20
>>> additional
>>> +=C2=A0 customizations for Tegra platforms. It uses the same bindings w=
ith
>>> +=C2=A0 additional standard clock DT bindings required for Tegra.
>>> +
>>> +=20
>>> See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>>> +
>>> +maintainers:
>>> +=C2=A0 - Jon Hunter <jonathanh@nvidia.com>
>>> +=C2=A0 - Sameer Pujar <spujar@nvidia.com>
>>> +
>>> +properties:
>>> +=C2=A0 compatible:
>>> +=C2=A0=C2=A0=C2=A0 oneOf:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: nvidia,tegra210-audio-graph-ca=
rd
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: nvidia,tegra186-audio-graph-ca=
rd
>>> +
>>> +=C2=A0 clocks:
>>> +=C2=A0=C2=A0 minItems: 2
>>> +
>>> +=C2=A0 clock-names:
>>> +=C2=A0=C2=A0 minItems: 2
>>> +=C2=A0=C2=A0 items:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - const: pll_a
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - const: plla_out0
>>> +
>>> +=C2=A0 assigned-clocks:
>>> +=C2=A0=C2=A0=C2=A0 minItems: 1
>>> +=C2=A0=C2=A0=C2=A0 maxItems: 3
>>> +
>>> +=C2=A0 assigned-clock-parents:
>>> +=C2=A0=C2=A0=C2=A0 minItems: 1
>>> +=C2=A0=C2=A0=C2=A0 maxItems: 3
>>> +
>>> +=C2=A0 assigned-clock-rates:
>>> +=C2=A0=C2=A0=C2=A0 minItems: 1
>>> +=C2=A0=C2=A0=C2=A0 maxItems: 3
>>> +
>>> +required:
>>> +=C2=A0 - compatible
>>> +=C2=A0 - clocks
>>> +=C2=A0 - clock-names
>>> +=C2=A0 - assigned-clocks
>>> +=C2=A0 - assigned-clock-parents
>> Where's the graph? You need to define the ports and reference the common
>> schema.
>
> I am looking to reference the bindings used in below doc which is not=20
> yet in YAML format. Only additional properties I listed here.
> {LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>
> Should I keep this doc to *.txt format as well and later move to YAML=20
> or is there a way to reference *.txt doc here?

The dependency here is like below,
Tegra audio graph card -> generic audio graph card=20
(audio-graph-card.txt) -> graph (graph.txt)

I plan to convert dependencies to json-schema in next revision and then=20
refer these for Tegra audio graph card.

