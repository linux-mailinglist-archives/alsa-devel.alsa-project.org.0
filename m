Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175450B88F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041D716F2;
	Fri, 22 Apr 2022 15:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041D716F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634441;
	bh=hitR8afuryPjSvr6VIcVMWcp/x8MYszP3S0RRqrfwNA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtW8BaskkdfbiybbbzPbnyi5EzA8kZd5jfXs/Wa7g09WqIlSZNNh4tD/iLhF4oC1m
	 ztQR5KqzxjTuUjDa9xUdl0wYAUgsno6p0JMS1JxuyvYaVvespZHEqv6s7ht+8/j7bQ
	 2VbwjOu6f/ZB9msDNQO7A+lsuR6e8s+DvoSqWCAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10226F8051A;
	Fri, 22 Apr 2022 15:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39BAFF8032D; Thu, 21 Apr 2022 15:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516A1F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516A1F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IlKi3DBH"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LDnPct064964;
 Thu, 21 Apr 2022 08:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650548965;
 bh=sOz3H5JVFZa8DXo43LjtHrPf7nI/khmshY2meABrkFQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=IlKi3DBHGtzAgBYQLAsXVp1JMjJvok3pPIWUXfGXmPonilChCKKCwa0bI8C/hSX0B
 VRBO8rftr9ZGNLprfjducb/NvIqC8WxohZA793oKR+uuRxdyfpcB2xKnMuLTjPPLzc
 8dE0XefoWFF377o6OHtFFJqGS0VbEbNR3otANW0c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LDnPKu096354
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Apr 2022 08:49:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 08:49:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 08:49:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LDnNEs035425;
 Thu, 21 Apr 2022 08:49:23 -0500
Date: Thu, 21 Apr 2022 08:49:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 0/3] Enable audio output on AM62-SK
Message-ID: <20220421134923.5n546sckyfugfyp4@matador>
References: <20220421132224.8601-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220421132224.8601-1-j-luthra@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:39 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On 18:52-20220421, Jai Luthra wrote:
> This patch series adds support for audio output via headphone jack on the 
> AM62-SK board. The jack is wired to TLV320AIC3106 (codec), which is 
> connected to McASP (serializer).
> 
> The same 3.5mm jack can be used for combined playback+recording, but audio 
> input is currently disabled on McASP until further testing and debugging.
> 
> Please apply this series on top of 
> https://lore.kernel.org/all/20220415131917.431137-1-vigneshr@ti.com/ 
> 
> Jai Luthra (1):
>   arm64: dts: ti: am625-sk: Add audio output support
> 
> Jayesh Choudhary (2):
>   arm64: dts: ti: k3-am62-main: Add McASP nodes
>   ASoC: ti: davinci-mcasp: Add dma-type for bcdma
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 51 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts   | 89 ++++++++++++++++++++++++
>  sound/soc/ti/davinci-mcasp.c             |  2 +
>  3 files changed, 142 insertions(+)
> 


Please split this series up. Send out the sound/soc/ti/davinci-mcasp.c patch as it's own.

dts changes are their own series.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
