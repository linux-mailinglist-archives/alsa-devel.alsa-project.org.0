Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B090D82F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 18:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA12EA4B;
	Tue, 18 Jun 2024 18:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA12EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718726831;
	bh=ej9CJG6O1s5bXy2f7PT1FQmimnDOu7MWnSDO5jqF7lE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s2YKmbRN618Kc+Mwky3/oIL/U/t7iLW6U2DOHhVhHCJKmASpCD34ZpQqm13+w4ubs
	 RU3bNr7xLadjlDkhVlj3XSMiO0sFfEF03Qv0yB/8CzcB/CPeUazxBf6bthn+L2SDbE
	 wDXhMH/4KqUEYrgHiBe75AT59K3htKRIChgzZ03g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA08F805AE; Tue, 18 Jun 2024 18:06:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBAFAF805B0;
	Tue, 18 Jun 2024 18:06:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1C64F8023A; Tue, 18 Jun 2024 18:06:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3992DF801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 18:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3992DF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jW7tpBvd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45I9ShoU030546;
	Tue, 18 Jun 2024 11:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+thUlenwK1uXI7DaaZQZ4MsBnxIoisz/NpS8YS1va7s=; b=
	jW7tpBvd0murd5sYfF3vv/xToTNAZI/H9+gIGy37Ii3z3CSYj1ktjZT2x67v6No7
	gQF8psTJ0+seTgF9wSz/VAXE15qfn/aipkENDMxjVaoMRY+2RBH8NDtBJNEteWG6
	5pUr4vl1Q8DACI0sRbPZtWIr0M1RvSNy5WGz2eJK4GvWhR9XaKFIaw7+8dzvtdE8
	4PyYx8k96ThjY+6qi23gJZrTMe0yhWmK4f7BveJ17yNly76lA43uvY3k50F47ars
	cK5okCJl3wftfdy8LLt4QECRE1jlogRHmXBiWbQr8UmOUXlk3UAxrDDPg/vUREek
	Y8mvplwrCufwKICsOR3N6g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by3nmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 11:06:19 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:06:01 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 17:06:01 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B0EBB820248;
	Tue, 18 Jun 2024 16:06:01 +0000 (UTC)
Message-ID: <7032b425-c2e3-4258-92f9-8035b354ea8b@opensource.cirrus.com>
Date: Tue, 18 Jun 2024 17:06:01 +0100
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
 <007b01dac0c5$7807ac30$68170490$@opensource.cirrus.com>
 <f04958f0-b9e9-4f80-8a83-af9740fa83a0@opensource.cirrus.com>
 <a2946d8a-1ead-4514-b1a4-9c04e37cd8a8@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <a2946d8a-1ead-4514-b1a4-9c04e37cd8a8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FXReiKs950989sBZlAs2sjIeNIKvS5xH
X-Proofpoint-GUID: FXReiKs950989sBZlAs2sjIeNIKvS5xH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: O65RHJ7VV2JVAWDBQVHBZHO5AQIITT7U
X-Message-ID-Hash: O65RHJ7VV2JVAWDBQVHBZHO5AQIITT7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O65RHJ7VV2JVAWDBQVHBZHO5AQIITT7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/06/2024 17:00, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 03:54:04PM +0100, Richard Fitzgerald wrote:
> 
>> So 0 is invalid. Question is: is it also valid to pass -ve errors, or is
>> 0 the _only_ invalid value?
> 
> Negative values should be fine.
In that case this patch is necessary so we reject negative values
as not an IRQ. Otherwise we'll try to request a non-existant IRQ and
fail with an error.
