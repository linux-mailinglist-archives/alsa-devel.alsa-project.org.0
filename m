Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67A2079C7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 19:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753091884;
	Wed, 24 Jun 2020 18:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753091884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593018010;
	bh=oSkAex/whT7zakybIwOa/Q7RpzjmuHo+CQQxuaaPnFE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiiOBrzpSu+gE9jyqcOiIlKc+dYyxI7STSjtCogZwuQwkMQWkEqAyJVyRhRhvWcWv
	 LpirJ45vra23cAh7MvD9Iw7sWAM8dNheIpt0a8rIOKXuAh7fUOuQh+Ixh89bkyLTR2
	 lzrbfweEf5Jwkac27VGsCEIBpHtpqwzklvasknZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2117F80162;
	Wed, 24 Jun 2020 18:58:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABD23F8015B; Wed, 24 Jun 2020 18:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2828F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 18:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2828F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fchGKA38"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OGwK22116650;
 Wed, 24 Jun 2020 11:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593017900;
 bh=1bCCG3caD2sEg6qKGWI/2Xon9AP/3Rs9Tep0MMhKNyI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fchGKA38CXQUP7iDyyGdGNLVtQi1y++syqLRo4u0NBdkO8Aq1PwcPfq/2hfFdSdBz
 ICbpWJGi7uNSCEXVt6XOhq+nxLuI9pE8WYZyhPCVFoE2ufsoIgaGGuLPj0wKdy8ng2
 Jt+4ukQeedooST/j+nZakDToc/gpsQOBWlZfBSms=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05OGwKoL125387
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 11:58:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 11:58:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 11:58:20 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OGwJ5b062239;
 Wed, 24 Jun 2020 11:58:19 -0500
Subject: Re: [PATCH v5 3/7] ASoC: tas2562: Fix format issue for extra space
 before a comma
To: Mark Brown <broonie@kernel.org>
References: <20200624161459.19248-1-dmurphy@ti.com>
 <20200624161459.19248-4-dmurphy@ti.com> <20200624162917.GK5472@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c4a26be8-88cc-1dfa-61e0-844b9c19eb52@ti.com>
Date: Wed, 24 Jun 2020 11:58:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624162917.GK5472@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, devicetree@vger.kernel.org
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

Mark

On 6/24/20 11:29 AM, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 11:14:55AM -0500, Dan Murphy wrote:
>> Fix the issue found that there is an extra space before a comma in the
>> volume control.
>>
>> Fixes: bf726b1c86f2c ("ASoC: tas2562: Add support for digital volume control")
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   arch/arm/boot/compressed/fdt.h             |   66 +
>>   arch/arm/boot/compressed/libfdt.h          | 2072 ++++++++++++++++++++
>>   arch/arm/boot/compressed/libfdt_internal.h |  173 ++
>>   sound/soc/codecs/tas2562.c                 |    2 +-
> I'm guessing those libfdt changes weren't supposed to be here?

No they were not those must have been added when I verified the build.

Dan

