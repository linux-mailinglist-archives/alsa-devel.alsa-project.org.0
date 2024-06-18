Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E590D844
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 18:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67272A4D;
	Tue, 18 Jun 2024 18:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67272A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718726923;
	bh=yhY+yhNuhzV8JcsD1wggApPMn0SgSn2LCJATgteCg2w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uaqh3M7V78caaKKRNn2MH5K3TbhL4VZrMj9fawsIlENGcueq7zj7rGRLazgSQ4ANF
	 mKj4NsptrULmuKMVycy5i7VxTn8udUse00JdYGyg0YcUfbJxiPrUkDWuycioLZmoYK
	 wpnkVQtqI+xObwlPHWIiULtiiMMO/LFTUFVD/53Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A016F805AC; Tue, 18 Jun 2024 18:08:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55EBF805A9;
	Tue, 18 Jun 2024 18:08:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AE1EF8023A; Tue, 18 Jun 2024 18:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C452F801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C452F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RJ8tiCGq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45I58k5G021062;
	Tue, 18 Jun 2024 11:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cLMCJLpV9wdh2VF9wEnp5mIrYOMRWX08/KC4Xg9ztoo=; b=
	RJ8tiCGqpXMLc0fkWTw5C77L+anhwySW8KUAWHElzlZzg0KglZVeX0J8eQxZtg/i
	ZuHF8vcQgunP5IOTuEBZNMA5fZ9M4Fnhq7zmeNMi/XWtaHmY3z4UdRCah03TBlCO
	najozzq2Wvg1I2RpFY1uVhwoIhWyMmmKqEAC3vE0zYCT2UB3bHijxXaU8zOzN0FH
	wY3IND03om7MZ6Wj8eBCWsdesoN2LyaQJYsJxeBrz3XNiFsyfi16wXPER6EgCf7I
	twVDGv9enEte6TCkcRADR3QL4MSuEWDMVG8Wg2kbnxOxwWr53ytWfCHSVDjVlP6N
	QURPP94xAJcot3TcHvkjPw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by3nqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 11:08:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:07:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 17:07:59 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E66D5820248;
	Tue, 18 Jun 2024 16:07:59 +0000 (UTC)
Message-ID: <9743c769-2aea-4b5a-90fc-30f79867ec5f@opensource.cirrus.com>
Date: Tue, 18 Jun 2024 17:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
To: Mark Brown <broonie@kernel.org>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
 <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
 <dfa7d5d7-2501-4c5f-a6e2-792c7aeb9bb3@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <dfa7d5d7-2501-4c5f-a6e2-792c7aeb9bb3@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UaEanV-Hg3BbgB7qFmaFbiOM4g9li3Va
X-Proofpoint-GUID: UaEanV-Hg3BbgB7qFmaFbiOM4g9li3Va
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2XMW4WKWYG5DMPBZT5LUARVPJZNAN6MW
X-Message-ID-Hash: 2XMW4WKWYG5DMPBZT5LUARVPJZNAN6MW
X-MailFrom: prvs=38996f7837=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XMW4WKWYG5DMPBZT5LUARVPJZNAN6MW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/06/2024 16:58, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 03:33:59PM +0100, Richard Fitzgerald wrote:
>> On 17/06/2024 15:04, Mark Brown wrote:
> 
>>> Have all architectures removed 0 as a valid IRQ?
> 
>>  From discussion threads we can find 0 might still used on x86 for a
>> legacy device.
> 
> Some of the arm platforms were also an issue in the past, though
> possibly they've all been modernised by now.  Don't know about other
> older architectures.
> 
>> But the conversations we can find on this don't seem to exclude passing
>> a negative error number, just that 0 can normally be assumed invalid.
> 
> Yes, the question was specifically about the assumption that 0 is
> invalid.  The status of 0 is kind of a mess, people keep assuming that
> it isn't valid and it just depends if users of platforms which try to
> use 0 trip up over it.  Sometimes people work on trying to eliminate
> uses of 0 but it tends to get you into older code nobody wants to touch.
> 
>> The kerneldoc for SPI says:
> 
>>   * @irq: Negative, or the number passed to request_irq() to receive
>>   *	interrupts from this device.
> 
> Which includes the 0 as valid thing...
The statement of truth from Linus Torvalds et al. seems to be that 0 is
invalid except on x86. And on x86 it is specifically reserved for a
legacy timer IRQ so it can't be anything else.
