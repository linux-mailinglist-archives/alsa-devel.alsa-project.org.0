Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ECB90B2EE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 16:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA65847;
	Mon, 17 Jun 2024 16:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA65847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718636090;
	bh=8oz61KWwx6qENWt5I3pmMWNMNjv+GnIgq4rfWORK2Ks=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N3bHRNC1xSf83AHmFSeq087+i7Z2c1tqo8ezruHbCC9R4FSZFA1ULe8SY0wqd1H+t
	 AOe+gPiNWWjQ9GecC3Udews7+RBJctR+zSHFsS6mfT1c4Ekm+x10sl/gowk7z40LuG
	 ZuqxXPvudlBn8zXidqss2Jwp8wRDg4k/lC+8up0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7F1F805B5; Mon, 17 Jun 2024 16:54:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0D3F805B1;
	Mon, 17 Jun 2024 16:54:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A1D9F8023A; Mon, 17 Jun 2024 16:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CB0FF8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 16:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB0FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K4cnZyR6
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45H5aOP3023213;
	Mon, 17 Jun 2024 09:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=U4Zcc5B6sZapyPApYGDjLIIl5Wrww3U183306p+JLwY=; b=
	K4cnZyR69TYqf7B21jLk2FGNqTw+ymA07UWw0Ke2XrA23e7KoYq2AjkQEWLQYPS3
	30kKZjbIsP7FzIbjTYNeuTwEG/YDgAWZHcg50iKIWdFwaGAkqoRhyRb4JhoI7ukF
	k5QN7vqIn3lOrkgVD6CcEqNk67GL7QIXkFM5JSRWNZA6o2TyII9mYU2/DBLZQuu3
	7FP74T7D4n6hURaOVvBm6Tdu0aqZ+Zw7Y8iS+PpsZ93pRw1dqboBAok6ZmKl9Xla
	hf2O+nv/llcg5lPr+BeevW0z2zAjDNW5HLTHarfzMsyfxgswsewbbmKGUNB9h8n0
	w6xa9hiIXpHEC1D2oELQvA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by1tuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:54:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 15:54:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 15:54:04 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AD2FB820248;
	Mon, 17 Jun 2024 14:54:04 +0000 (UTC)
Message-ID: <f04958f0-b9e9-4f80-8a83-af9740fa83a0@opensource.cirrus.com>
Date: Mon, 17 Jun 2024 15:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
To: Simon Trimmer <simont@opensource.cirrus.com>,
        'Mark Brown'
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
 <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
 <007b01dac0c5$7807ac30$68170490$@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <007b01dac0c5$7807ac30$68170490$@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OnFXQ3XDq3MuxA7uOj9oWBSc-IXlVLcw
X-Proofpoint-GUID: OnFXQ3XDq3MuxA7uOj9oWBSc-IXlVLcw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VKSKM2C3GBOG5Z247MWGADN7PD6IGZ2N
X-Message-ID-Hash: VKSKM2C3GBOG5Z247MWGADN7PD6IGZ2N
X-MailFrom: prvs=38987c7648=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKSKM2C3GBOG5Z247MWGADN7PD6IGZ2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/06/2024 15:48, Simon Trimmer wrote:
>> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Sent: Monday, June 17, 2024 3:34 PM
>> On 17/06/2024 15:04, Mark Brown wrote:
>>> On Mon, Jun 17, 2024 at 02:53:38PM +0100, Simon Trimmer wrote:
>>>> IRQ lookup functions such as those in ACPI can return error values when
>>>> an IRQ is not defined. The i2c core driver converts the error codes to
> a
>>>> value of 0 and the SPI bus driver passes them unaltered to client
> device
>>>> drivers.
>>>>
>>>> The cs35l56 driver should only accept positive non-zero values as IRQ
>>>> numbers.
>>>
>>> Have all architectures removed 0 as a valid IRQ?
>>
>>   From discussion threads we can find 0 might still used on x86 for a
>> legacy device.
>> But the conversations we can find on this don't seem to exclude passing
>> a negative error number, just that 0 can normally be assumed invalid.
>>
>> The kerneldoc for SPI says:
>>
>>    * @irq: Negative, or the number passed to request_irq() to receive
>>    *	interrupts from this device.
> 
> Yes and the threads of these lore links in these commits are rather feisty
> 
> ce753ad1549c platform: finally disallow IRQ0 in platform_get_irq() and its
> ilk
> a85a6c86c25b driver core: platform: Clarify that IRQ 0 is invalid
> 
> 
So 0 is invalid. Question is: is it also valid to pass -ve errors, or is
0 the _only_ invalid value?
