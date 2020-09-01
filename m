Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B03258D5C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C29B179F;
	Tue,  1 Sep 2020 13:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C29B179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598959486;
	bh=6lc8AOIxQaWAqkTCg0KZdf8W6u0jyi4qjd/xMZyZOoM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNokQ5PJuItO38FugtDVW1WUtlUDjPv8sxoEbSd+SWpYjquJufcwe382++TKiaf2p
	 LVShDfdhguFYfpvjBGpK2INvUrGZK4qD/v6phHdywJ0iZXF+3kGzvUyw0MRJYwgEhi
	 U8c2uGqHcoP53EvHWwhVcfgISVjUc1jYO314rIuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5309BF801EB;
	Tue,  1 Sep 2020 13:23:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E02F1F80217; Tue,  1 Sep 2020 13:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E68F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E68F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J9Is2TM3"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081BMlwr066864;
 Tue, 1 Sep 2020 06:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598959367;
 bh=6lc8AOIxQaWAqkTCg0KZdf8W6u0jyi4qjd/xMZyZOoM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=J9Is2TM39XtwqTfxN/+j+uUdd5Zk9U9xSrewcxongeE/OP+48uK8f6FIWYPpWDNEs
 Fies7Sa+STz1Gql1B2xdfj39MqZflk+a/orGBbjGt9UDZzsXzmL6GwI1Z4+4+tq3FO
 xvXK0ZRsWTYudwAINjUrYdGxn8l4m0un5sS8ejQ0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 081BMlhZ107840
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Sep 2020 06:22:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 06:22:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 06:22:47 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081BMkXv065418;
 Tue, 1 Sep 2020 06:22:46 -0500
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix accessing uninitialized
 abcx140->dev
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
References: <20200901072710.2031-1-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <daa7dd49-7a5a-a366-4f88-93d256ff9d99@ti.com>
Date: Tue, 1 Sep 2020 06:22:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901072710.2031-1-camel.guo@axis.com>
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

On 9/1/20 2:27 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> in adcx140_i2c_probe, adcx140->dev is accessed before its
> initialization. This commit fixes this bug.

s/abc/adc in the subject

and

s/in/In

Also please add a Fixes tag.

Otherwise

Acked-by: Dan Murphy <dmurphy@ti.com>

