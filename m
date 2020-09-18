Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D82704D8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214B3169E;
	Fri, 18 Sep 2020 21:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214B3169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456524;
	bh=ZR7M7zQyOKcNT8YRZT1I+IPq01wJDvlFNvzVuNNQbzA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFK18YzdmpeHSG5JYwqIA/oxk2S+2+IQOYg9bATqls8vY0w9FWQexpdaLCOdTzoH6
	 OZ8HdKBHZuyKNpshyTSdmo6yVqMQ479y1swuy/WbiGR9Ntd+7cfWc9+gLg3X+kfjOU
	 w41d0+ERL9JF7tYzopVD1UO6dj2UrG5iQO80eoVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D89DF8015C;
	Fri, 18 Sep 2020 21:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7BB6F8015A; Fri, 18 Sep 2020 21:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60489F80150
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60489F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dKhxMio8"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJDbN2086743;
 Fri, 18 Sep 2020 14:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600456417;
 bh=AHq/5X/zt7ouB8G4cT7Ae9eA79pwUrSvwVhNR0JQuWk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dKhxMio8DpXhdFrvlOPT7PeTHaFsgOu/ybn/oNVNgrpXqJlPChoqCEPDAe8J+Jj7C
 O2YCzNyAwei+j4Ngx/eF1qYv7AkXCqS/o0ZnOZGMttn06jcaW6REb+6oz02zoQsus6
 EsAyMoOUZqp4mHTVv5w+lk5olvoOfM1hXPUQYuVQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJDbPs110407;
 Fri, 18 Sep 2020 14:13:37 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:13:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:13:36 -0500
Received: from [10.250.35.164] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJDamK028660;
 Fri, 18 Sep 2020 14:13:36 -0500
Subject: Re: [PATCH] dt-bindings: tas2770: Fix I2C addresses for the TAS2770
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <20200918164320.11577-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <bcae2b35-8b64-6736-4fc1-23cfa5912924@ti.com>
Date: Fri, 18 Sep 2020 14:13:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918164320.11577-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

All

On 9/18/20 11:43 AM, Dan Murphy wrote:
> The I2C addresses listed in the yaml are not correct. The addresses can
> range from 0x41 through 0x48 based on register configurations. Fix the
> example and the description.

Please ignore this patch I added this patch intp a different patch 
series because there were just that many fixes.

https://lore.kernel.org/patchwork/project/lkml/list/?series=463738

Dan

