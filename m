Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF0402DCC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 19:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B842C170E;
	Tue,  7 Sep 2021 19:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B842C170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631036408;
	bh=+TgRjW0n0fsVeVC1J77jBVcftWB795k6d7I7Mu9WHhU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTUSRRmhKlXWGOwSIXlA8m5++lyxMAcPaUOwUu0Ip/6O9gLZTysRJqjyZRWioJpH6
	 oHT0wthkNQ6L2InBf/x4egmqIK7cvyuRHGp8ynHjJmhu2p+vf/5pDGYD3/tXlBDBzX
	 St/iCBjk1rZGZ9TdqPKRU89hUzqhW+tbSaupsTtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7EEF80253;
	Tue,  7 Sep 2021 19:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25BCDF80224; Tue,  7 Sep 2021 19:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CA0FF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 19:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA0FF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="U678eO8Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1874qJKh017115; 
 Tue, 7 Sep 2021 12:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=V9h5ArY6BsEPAXth9XnyAdsJ+HccuJZG6ERCOcyPcyE=;
 b=U678eO8Y5VdF6DjED737jbhfiz+yDo7hAdhXPRwAjANwUBbGp0VaS7jXlT1x4Kout0Q9
 x1adXEzFFQa0pc4jNWv3824kSVJT0AZp9Q+TgLDpMQsPnA5KWHtJUWzGClPyN86ekiN3
 O54eJ7BX00N1C5DdxImUrdJDIUIQIIkbTOEKfH5tcodeoQMhRfqvklvpn9R4P6rjMC0K
 Ls7r+F6AB54Uj7E4c9vjc0vHNf0cFO96UXCFDNjhDsaOsbTJrCXKVdzJDbK3V98K42IJ
 c+9u+XHIxLGDeABtto03ZaJ0B6gEkE6VgaSP5S++djCp+DTL4MDgKbQGQZcOAPBgE4fT 8w== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3awurmgymu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Sep 2021 12:38:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 7 Sep
 2021 18:38:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 7 Sep 2021 18:38:39 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com [141.131.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 567472BA;
 Tue,  7 Sep 2021 17:38:32 +0000 (UTC)
Subject: Re: [PATCH v6 2/2] ASoC: cs35l41: Add bindings for CS35L41
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210903212659.2011303-1-drhodes@opensource.cirrus.com>
 <20210903212659.2011303-3-drhodes@opensource.cirrus.com>
 <20210906094322.GN9223@ediswmail.ad.cirrus.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <5b39e0aa-09e8-0bcc-2234-87d35aea109e@opensource.cirrus.com>
Date: Tue, 7 Sep 2021 12:38:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906094322.GN9223@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 71Pe65Urja5HRyasABLP9A91cta_9oLs
X-Proofpoint-ORIG-GUID: 71Pe65Urja5HRyasABLP9A91cta_9oLs
X-Proofpoint-Spam-Reason: safe
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
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

On 9/6/21 4:43 AM, Charles Keepax wrote:
> On Fri, Sep 03, 2021 at 04:26:59PM -0500, David Rhodes wrote:
>> +  cirrus,classh-bst-max-limit:
>> +    description:
>> +      Value set to the BST_CTL_LIM_EN field.
>> +      A value of 1 will limit the Class-H voltage to the value in the
>> +      'boost-ctl-millivolt' property.
>> +      0 = No Class-H limit (default)
>> +      1 = Class-H limited to 'boost-ctl-millivolt' value
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
>> +    minimum: 0
>> +    maximum: 1
> 
> There is no boost-ctl-millivolt property however. Apart from
> tidying up that loose end I think the series looks ok to me
> though.
> 
> Thanks,
> Charles
> 

Yes, I missed this while moving the boost properties. 
classh-bst-max-limit should be removed since it doesn't work without 
boost-ctl-millivolt. boost-peak-milliamp is more appropriate for 
limiting the boost, and will remain a required property.

Thanks,
David
