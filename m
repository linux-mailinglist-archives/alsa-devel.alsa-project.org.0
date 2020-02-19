Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D5165180
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170BE16B6;
	Wed, 19 Feb 2020 22:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170BE16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582147125;
	bh=O16WBUAOGciWUuhDocKaq7dVvFRE194g+h16gYIHkwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=safx0sqS/DKHt0lV/+TRTPXzJzApTyTGm4Mc2I1MrcqNZZrudWJQEO6Se2cNoWuX4
	 u9pou7SMvxL2MhTejyB2o6uIGuQbevVXKQl4uhgeyhdQu+k8IFOiMd1WDTwG81uXcU
	 pJnsWG6YIdmWnjNBgjBz4v+uqwm/3jVTfvSoIy4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C4BF8025F;
	Wed, 19 Feb 2020 22:17:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7DFF80273; Wed, 19 Feb 2020 22:17:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4690F801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 22:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4690F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JnEKz4/D"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JLGphA114842;
 Wed, 19 Feb 2020 15:16:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582147011;
 bh=hELP/UVWF2wnG4khdI+ML3nj51J78zGR6XNDM5je6Hg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JnEKz4/DGmVnBOrxNaZHZuiGPeUqqqq/31MYe4eTb7lpWgkFhcm6pOU6VaKgC+UkK
 oWOPnZZO0Ykef9kve5EubrsJ+i1D0o7yPRdEgi4KFkXq2hYfGNWG77GEPb/ji4KIJL
 1sW3BQR4PQMMX1Z4y8hUTo5cgI4FDB2vIbWPDl5w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JLGp1U062825
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Feb 2020 15:16:51 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 15:16:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 15:16:51 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JLGp5o045264;
 Wed, 19 Feb 2020 15:16:51 -0600
Subject: [RFC] Volume control across multiple registers
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
References: <20200219134622.22066-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <2f74b971-4a6a-016f-8121-4da941eeccef@ti.com>
Date: Wed, 19 Feb 2020 15:11:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219134622.22066-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hello!

I am trying to figure out how to control the volume of a speaker device 
with full volume control spread out across 4 8bit registers.

The standard TLV calls only allow a single register for volume control.  
But I have 4 I need to touch to get a full range of volume from 0dB to 
-110dB.

I was looking at using the DAPM calls and use PGA_E and define an event 
but there really is no good way to get the current volume setting.

I don't see any example of this in any current driver.

Any guidance is appreciated.

Dan

