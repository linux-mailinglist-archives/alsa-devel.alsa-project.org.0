Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9746E22A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 06:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AA4623E0;
	Thu,  9 Dec 2021 06:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AA4623E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639029035;
	bh=kK/h+NSEFYzg44ULry5GUHoFGQnU/GHJzyuxxwIzZQc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAPLEPfZnGxAzoxeqYKhe9yeDu1bK/NmsdoLcJds3dVXt8oCmdSlgCM0fHiUZJ9qQ
	 9aoTOgI/peSAcCuQsLm9iAGm0QkgS60am9VwARKqClqlRfRq/K84qea+9MmnnEiaIX
	 0B2EDv5fzCCRgAQ6Ox8DiKhEUctc2HllsgfV3IaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9561BF802A9;
	Thu,  9 Dec 2021 06:49:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68B2EF8028D; Thu,  9 Dec 2021 06:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE3BF800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 06:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE3BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ITeY9XQJ"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B95n9QI054338;
 Wed, 8 Dec 2021 23:49:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639028949;
 bh=3DzJ5UfTbjOyfKamsLgBOyMkZhB6TUL60sGkvETPZm4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ITeY9XQJRzzelezhViOi+Fk2Xp7xyDTwYTSPuxE9K9mkOeJeL+39V9ybyw0kPjUM1
 nVRpPx17xZUyUoDrCIdcGM74dwgUAjbPolswAN5mZzKjDRZ68+6hGI53umAIR/3/Bo
 dOVgSf9M15pH21HW+P+LWkWtnepvzNrZhRy4viDg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B95n8kn040541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Dec 2021 23:49:09 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Dec 2021 23:49:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Dec 2021 23:49:08 -0600
Received: from [172.24.145.75] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B95n6S9013694;
 Wed, 8 Dec 2021 23:49:06 -0600
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 <robh+dt@kernel.org>
References: <20211203120243.24173-1-j-choudhary@ti.com>
 <ed6c9be9-32d3-719a-ee0d-608b228f36b3@gmail.com>
 <20449d7b-0524-a8df-7852-a4c495157682@ti.com>
 <b6af56f1-7e6b-81ca-7bae-8f2a2dfaf0eb@gmail.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <5c032067-3396-dcf2-5f1a-09aca6f8e647@ti.com>
Date: Thu, 9 Dec 2021 11:19:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b6af56f1-7e6b-81ca-7bae-8f2a2dfaf0eb@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 08/12/21 1:14 am, Péter Ujfalusi wrote:

> 
> I'm fine if the port remains here
> 
>> Peter,
>> Any other changes I should make?
> 
> Not much, this already looking good.
> I would fix the dts files which generates warning/error with this yaml
> as they are incorrect.
> 

One patch has already been sent for the typo error in the dts file which
generates a warning:
https://lore.kernel.org/all/20211125105326.17000-1-j-choudhary@ti.com/

The 'num-serializer' issue needs to be fixed.

-Jayesh
