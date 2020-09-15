Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0A26AD01
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 21:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287A71683;
	Tue, 15 Sep 2020 21:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287A71683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600196869;
	bh=Ao1EEjbySbGDfqz/yMgDK7uIIQmqhNdczkDQhw9oTzg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7iW3n1RGClh+VlNfidrtCieYulnuITvRSrNCRmfKX1Qd41shvXPL77DgfioXAidk
	 r21FT8PlnlYRdHMI4uR3t/Ne+HSv4tb5Zwu5J/YbKsEzlSmMdICevcqbesGQ+gSMJ1
	 dG1pKUQ9NYPRhQ+3+vgVqQa2jpe/HbgQqwngjjC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38537F800F1;
	Tue, 15 Sep 2020 21:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8F81F80212; Tue, 15 Sep 2020 21:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A8FF800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 21:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A8FF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VcqG6mYy"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ5pRn058642;
 Tue, 15 Sep 2020 14:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600196751;
 bh=FwOp1+5tY+FzI+nWDtzQ/kM21d7eLdPx/kZA6dPG+Rk=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=VcqG6mYy7tqwIB8G28svBpcMM2FbvJFBSCBgmQLAi4Hi5IbNgT6FHWGI3FFZJ2eo8
 Mq64x9ulrjuMzFQrFmo1X82smEKecxdpzfTu0AgQnh81mWfE4k15mzNWqPtIfoFMBk
 uRNr5ioCDWXky4tFxBNC6UznhMvLgQ3cEFtdg1MM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ5pnO038065;
 Tue, 15 Sep 2020 14:05:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 14:05:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 14:05:51 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ5okH006371;
 Tue, 15 Sep 2020 14:05:50 -0500
Subject: Re: [PATCH v2 2/3] ASoC: tlv320adcx140: Add support for configuring
 GPIO pin
From: Dan Murphy <dmurphy@ti.com>
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
 <20200911080753.30342-2-camel.guo@axis.com>
 <da35edb3-bc41-967c-d530-4df4363ddddf@ti.com>
Message-ID: <6833eff3-39d3-f707-d0e6-c0db9f86157c@ti.com>
Date: Tue, 15 Sep 2020 14:05:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da35edb3-bc41-967c-d530-4df4363ddddf@ti.com>
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

On 9/15/20 1:41 PM, Dan Murphy wrote:
> Camel
>
> On 9/11/20 3:07 AM, Camel Guo wrote:
>> From: Camel Guo <camelg@axis.com>


One other thing for the device tree you need to add Rob Herring and 
devicetree@vger.kernel.org

