Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECE1E63B1
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 16:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2583C16B3;
	Thu, 28 May 2020 16:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2583C16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590675729;
	bh=fTIoCVGbCcB0dN3Buh8tkWou/9udvwCb/4NMva1261s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ee9btPz9XhvrEHTlZwLDQUPjWRC0RkR43V3WkBPRSZo1gNtiXMq9KYfcGvlS0Vm3e
	 36TuvjzXj+XfcmpEKbMV4CzC9a+XxkR4qPDPUzOOyGYCjj6uL3khtjSriGCdC6hXra
	 RLxiLMTKB6s3iF41cwkvWGheoRmgo2OqNtEc035Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C526FF8015C;
	Thu, 28 May 2020 16:20:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11740F80150; Thu, 28 May 2020 16:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D2F9F800FF
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 16:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2F9F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GrU5OrO4"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SEK9x2058714;
 Thu, 28 May 2020 09:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590675609;
 bh=giCOpDS6bO2ay1fMfMqMlDIeUNjJc+xqzMLgnM4de2E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GrU5OrO4T18LMXnpAo/1aJbOjKUKljKi0ymTnur31JUZkV+anrJjyQ1UptVQyAJNT
 C/f+8f9VVA/ZMOHp/p9UlpVzDQdcmw75ZVOGNEmRtZEOkTemueiSkTQDRCpqO2tcw5
 TIqp/PiKYZS1mmK2NUiGYF69mi/C0IxGgbVsiO3M=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SEK9Db019516
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 May 2020 09:20:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 09:20:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 09:20:08 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SEK41L054935;
 Thu, 28 May 2020 09:20:05 -0500
Subject: Re: [PATCH 1/2] dt-bindings: sound: tlv320adcx140: Add GPI config
 property
To: Rob Herring <robh@kernel.org>
References: <20200526200917.10385-1-dmurphy@ti.com>
 <20200528140525.GA4166160@bogus>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <23500301-1076-ac47-327e-f7731525657c@ti.com>
Date: Thu, 28 May 2020 09:20:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528140525.GA4166160@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org
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

Rob

On 5/28/20 9:05 AM, Rob Herring wrote:
> On Tue, May 26, 2020 at 03:09:16PM -0500, Dan Murphy wrote:
>> Add an array property that configures the General Purpose Input (GPI)
>> register.  The device has 4 GPI pins and each pin can be configured in 1
>> of 7 different ways.
> Dan seems to have trouble running get_maintainers.pl and Cc'ing the DT
> list. Running 'make dt_binding_check' also seems to be a problem. Now
> linux-next has these warnings:

I don't have an issue with doing get_maintainers.  All the maintainers 
listed were added to the patch.

And devicetree@vger.kernel.org was cc'd.

I will fix this warning.

Dan


