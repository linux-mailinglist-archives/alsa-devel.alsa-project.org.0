Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947B380D7B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB626176D;
	Fri, 14 May 2021 17:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB626176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621006878;
	bh=hG8R/elFDDyjsIJg7d353jD+t6nXEtGCpG9Gm+2T2wQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tz0/E4cUrizuptDB3q0pJJ74F/i3afjB3DLmf5OWGUKAgZKOGdCGyHLF/z4Xm2irz
	 AH0WnsGRom/LwF0buM4dRrXslV2vWER8989Iotwsp1NxPISIVnffS5bJeXNanVXkbd
	 5WVFpwDzTGitaGAx/UVaoHPsaXOo8dRRswYJB6Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 497D7F8026B;
	Fri, 14 May 2021 17:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC264F80163; Tue, 11 May 2021 16:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 743F5F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743F5F800E9
Received: from [77.244.183.192] (port=61918 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1lgT4h-0009Q7-5U; Tue, 11 May 2021 16:09:27 +0200
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
To: Rob Herring <robh@kernel.org>
References: <20210510204524.617390-1-robh@kernel.org>
 <d3aae746-284b-b0bc-0d52-a76c361d3592@lucaceresoli.net>
 <CAL_JsqLhwifngoNK0ciO=yuVqpEbMGOSWMHyT=5DcYcO9jcuCw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2b09c4ed-758d-6eed-8fc1-39653d10e844@lucaceresoli.net>
Date: Tue, 11 May 2021 16:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLhwifngoNK0ciO=yuVqpEbMGOSWMHyT=5DcYcO9jcuCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Fri, 14 May 2021 17:39:48 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alex Elder <elder@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

Hi Rob,

On 11/05/21 15:44, Rob Herring wrote:
> On Tue, May 11, 2021 at 2:20 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> Hi,
>>
>> On 10/05/21 22:45, Rob Herring wrote:
>>> Users of common properties shouldn't have a type definition as the
>>> common schemas already have one. A few new ones slipped in and
>>> *-names was missed in the last clean-up pass. Drop all the unnecessary
>>> type references in the tree.
>>>
>>> A meta-schema update to catch these is pending.
>>>
>>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
>>> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>> Cc: Jonathan Cameron <jic23@kernel.org>
>>> Cc: Lars-Peter Clausen <lars@metafoo.de>
>>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Cc: Georgi Djakov <djakov@kernel.org>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>> Cc: Jakub Kicinski <kuba@kernel.org>
>>> Cc: Sebastian Reichel <sre@kernel.org>
>>> Cc: Orson Zhai <orsonzhai@gmail.com>
>>> Cc: Baolin Wang <baolin.wang7@gmail.com>
>>> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
>>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
>>> Cc: Odelu Kukatla <okukatla@codeaurora.org>
>>> Cc: Alex Elder <elder@kernel.org>
>>> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: alsa-devel@alsa-project.org
>>> Cc: linux-iio@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-input@vger.kernel.org
>>> Cc: linux-pm@vger.kernel.org
>>> Cc: netdev@vger.kernel.org
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml    | 2 --
>>>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml         | 1 -
>>>  Documentation/devicetree/bindings/input/input.yaml              | 1 -
>>>  Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml   | 1 -
>>>  Documentation/devicetree/bindings/net/qcom,ipa.yaml             | 1 -
>>>  .../devicetree/bindings/power/supply/sc2731-charger.yaml        | 2 +-
>>>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml          | 2 +-
>>>  7 files changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> index c268debe5b8d..28675b0b80f1 100644
>>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>>> @@ -60,7 +60,6 @@ properties:
>>>      maxItems: 2
>>>
>>>    idt,xtal-load-femtofarads:
>>> -    $ref: /schemas/types.yaml#/definitions/uint32
>>>      minimum: 9000
>>>      maximum: 22760
>>>      description: Optional load capacitor for XTAL1 and XTAL2
>>> @@ -84,7 +83,6 @@ patternProperties:
>>>          enum: [ 1800000, 2500000, 3300000 ]
>>>        idt,slew-percent:
>>>          description: The Slew rate control for CMOS single-ended.
>>> -        $ref: /schemas/types.yaml#/definitions/uint32
>>>          enum: [ 80, 85, 90, 100 ]
>>
>> Ok, but shouldn't "percent" be listed in
>> Documentation/devicetree/bindings/property-units.txt?
> 
> It is in the schema already[1].

Sure, but having an incomplete file in the kernel is poorly useful, if
not misleading. What about any of these options:

- add to property-units.txt the missing units
- delete property-units.txt from the kernel sources
- replace the entire content of property-units.txt with a link to the
  schema file, stating it is the authoritative and complete source

I would feel a lot better with any of these. I can prepare the patch too.

-- 
Luca
