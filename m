Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F32610FA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 13:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC8F1747;
	Tue,  8 Sep 2020 13:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC8F1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599565884;
	bh=JrBoVhNV7B7vmQHoVtXsDQHzdprj36P7cc3O/gwQ5/I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8rkKjIzs8/SA18GMFODhGbI0H3RhKdmoq/8KR/rOjbYKMHlw/1pbrvMrbAbBhQ08
	 i/NCrwabbZoIMtA0/SXlgvubZ4Zh0H1OD67l9wGyJe39Bq1O1egDMCVOEPbI1Cr0Em
	 5OEHKNc0ABiP01TS+Rd9ZFDcl3Gq5N9x3rx1WUqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD43F801F2;
	Tue,  8 Sep 2020 13:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34175F80264; Tue,  8 Sep 2020 13:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2783FF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2783FF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AkZy7eEY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088BnQVV020100;
 Tue, 8 Sep 2020 06:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599565766;
 bh=pjSPFy6J/xMzAIHU07RF4zz0lm6CxM/QscpYWUYAJXk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=AkZy7eEY6cVcc/50fxETiY40qYgi9DiA/hglZeheNUlEZoXUK1RQk8oOOP65xqUty
 F0QD3IDsGXUHvgl8vcpVbypAd3bvYF7dxFlnaO7YeGs42MhnN5jy4SnJ8KRlRAhFlt
 kiwfewEccFkhcz2ExW9F7dAr+iKvLq4Dqf4hPkhw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BnQZd033773;
 Tue, 8 Sep 2020 06:49:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 06:49:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 06:49:25 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BnPP2040200;
 Tue, 8 Sep 2020 06:49:25 -0500
Subject: Re: [PATCH 2/2] ASoC: tlv320adcx140: Wake up codec before accessing
 register
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200908083521.14105-1-camel.guo@axis.com>
 <20200908083521.14105-2-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <89f8cce0-2407-15f5-a8e5-0aa17a2eb2c4@ti.com>
Date: Tue, 8 Sep 2020 06:49:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908083521.14105-2-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

Camel

On 9/8/20 3:35 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> According to its datasheet, after reset this codec goes into sleep
> mode. In this mode, any register accessing should be avoided except for
> exiting sleep mode. Hence this commit moves SLEEP_CFG access before any
> register accessing.

This is interesting because our HW team suggested putting the device 
into sleep mode when doing register writes/reads because they were 
finding abnormalities in the register settings when the device is active.

I have a local patch that changes this as well that the HW team requested.

Mark

Let me run this by the HW team first before applying this patch.

Dan

