Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2290E5403
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 20:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C90D1897;
	Fri, 25 Oct 2019 20:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C90D1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572029779;
	bh=Mwo5DXXTSCIHtwFsPKws37mMSKr755C2UnuE3AtMLxY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQJCjpYGqi9wXBqVGWw2voF5VL0bgm7NX0qYjyujK6/RCvpNOM2iLNrAzC+y2Ans4
	 K2XiFFt1Q8wuUTyBIQeOy3OohWJUhQI0SUIUfDp7uCwNk/fxsY/0WRGGbYeC8q36UP
	 PZRIB0ujdjtUDJ8hBsCc9GZXWEsHyoSsg+Stu1Eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EACF8036F;
	Fri, 25 Oct 2019 20:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF9AF8036F; Fri, 25 Oct 2019 20:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ADB1F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 20:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ADB1F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AYNQKFuM"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9PIsPoD056018;
 Fri, 25 Oct 2019 13:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572029665;
 bh=FLX9YTlnOmPjDE4LUCISATxKh1PlXKd/tzy6B7pJbFo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=AYNQKFuMB28Njq4pqE6ZKmeBISIjfIXytFN/nRerRPHcfpj+YwdYNAloWEm8ZqN0h
 BlZHyC/DsSSmPiZHRt/Q8Ch32dxZQR1dUOa17aFKhTGduH7LfnFQgXUoQ8ftHVXeBu
 u78w1Dbw5pPsA398z4S6fbMOJWNaCgfdeme2Jugo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9PIsPCi011901
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Oct 2019 13:54:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 25
 Oct 2019 13:54:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 25 Oct 2019 13:54:14 -0500
Received: from [192.168.2.10] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PIsMam024051;
 Fri, 25 Oct 2019 13:54:23 -0500
To: Tony Lindgren <tony@atomide.com>
References: <20191025130528.3556-1-peter.ujfalusi@ti.com>
 <20191025171733.GW5607@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <50a5a6a2-0bc9-6184-cc47-6229199debd7@ti.com>
Date: Fri, 25 Oct 2019 21:55:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025171733.GW5607@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, jarkko.nikula@bitmer.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: ti: omap-mcpdm: Add support for
 pdmclk clock handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/25/19 8:17 PM, Tony Lindgren wrote:
> Hi,
> 
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [191025 13:05]:
>> McPDM module receives it's functional clock from external source. This
>> clock is the pdmclk provided by the twl6040 audio IC. If the clock is not
>> available all register accesses to McPDM fails and the module is not
>> operational.
>>
>> this has been lurking in my next-wip branch for some time...
>> It might not needed anymore as I have not heard about issues with McPDM for a
>> while.
>>
>> It was dropped back then because some core parts were not picked in time and
>> this caused some issues, but can not find the exact reason
> 
> Yes it's a strange solution to clock the internal mcpdm module
> externally :)

Strange is a bit of understatement ;)

> AFAIK it's now already handled properly by ti-sysc. We have a common
> omap4-mcpdm.dtsi configure mcpdm clock forthe module, then ti-sysc
> driver defers probe until the mcpdm clock is available. And for omap5
> we have omap5-board-common.dtsi configure it.

I see that the

clocks = <&twl6040>;
clock-names = "pdmclk";

are added to the mcpdm node (some patch from me, some new). But the
McPDM driver itself never requests this clock w/o this patch.

> So probably the only thing omap-mcpdm.c driver needs to do is to
> call PM runtime functions, maybe it's already doing that.

Yes, it has support for pm_runtime.

Looking at ti-sci I think I know why it works. ti-sci will get the
'pdmclk' as a clock for the device and going to manage it because the
SYSC_QUIRK_EXT_OPT_CLOCK is set for McPDM.
So pm_runtime is going to handle the clock coming from twl6040.

And now I remember to test these ti-sci changes :o
I wonder why I have not dropped this patch back then from my wip branch.

Let's just ignore this patch.

- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
