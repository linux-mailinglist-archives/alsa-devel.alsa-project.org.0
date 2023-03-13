Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4176C1EB5
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 18:58:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425027F4;
	Mon, 20 Mar 2023 18:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425027F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335113;
	bh=yuv2ulXUrmpEyOm6gVj0QeNPqAyo9LVJeJdN++764Ko=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=GtQyZqunPoGTzMUs77GAS28S6jf0JuVbL1f+qTIGImFHXOIHA5HhIjjDdnXMLr5xe
	 ehC1L3qq8IKVBCI+xFKoj1oTFmCbT3TJtAwi9vyXGvSIEXmKq8Ix2JbgVMglc78wNc
	 1+qGztNhgwv72LXCeO07JJXcB/8KJfW1A61jA2D4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8ECF80534;
	Mon, 20 Mar 2023 18:56:53 +0100 (CET)
Date: Mon, 13 Mar 2023 14:18:38 -0500
Subject: Re: [PATCH v2 4/5] ASoC: cs35l45: DSP Support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
 <20230303192151.2437221-4-vkarpovi@opensource.cirrus.com>
 <20230306092652.GP68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230306092652.GP68926@ediswmail.ad.cirrus.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:56:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TUXAVFTMRL22S5XZ6M4UT5NTQDVYBSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167933501291.26.9635059961059142466@mailman-core.alsa-project.org>
From: Vlad Karpovich via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB55F80423; Mon, 13 Mar 2023 20:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73C0FF80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 20:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C0FF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GV22hERH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DJIaXY028587;
	Mon, 13 Mar 2023 14:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=W3+h24RT/FRIvh+nJCCJR20X1RVO9zAXsfV4MTdzZI0=;
 b=GV22hERHQJLFdjfYMI7lx/nZlPB965e/7DcEMnWPynNUSno1og247tNYtaL7P86nW82v
 8VYy7MOBw/IN4MkICBg/UmUSai9jDUIzlH1EJaK7XhfwoTbyyWY+nbAmqLpPGv+Jn9Hv
 WJQ+Fx+Qj2gtrJ9BckHYkwPJJtD6o5WdTC/iKiKWYdAdmG+61N2+yBiLTKqny9egWJGF
 4OcJe5fqX7k6IceGKZM+YsFBaxnHYNeGv3oFMLGQ3BsIkf/u2Qyw/qtWgVH1mLqLBO2n
 Yqieem/opCtAmGn3ABvEk7aw/wtte1KIUDG1lrBYr39GSRq7KF37L1xgB8VPndV78lk2 dA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p8qx7bb1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 14:18:43 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 13 Mar
 2023 14:18:40 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 13 Mar 2023 14:18:40 -0500
Received: from [141.131.206.93] (vkarpovich-ThinkStation-P620.ad.cirrus.com
 [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 43D51B06;
	Mon, 13 Mar 2023 19:18:39 +0000 (UTC)
Message-ID: <b2473ea8-c0cb-42c9-6350-dafd737d94e8@opensource.cirrus.com>
Date: Mon, 13 Mar 2023 14:18:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] ASoC: cs35l45: DSP Support
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
 <20230303192151.2437221-4-vkarpovi@opensource.cirrus.com>
 <20230306092652.GP68926@ediswmail.ad.cirrus.com>
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <20230306092652.GP68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SgijGJeA_QZlYJrQ_FuYwRxbMiylpvwB
X-Proofpoint-GUID: SgijGJeA_QZlYJrQ_FuYwRxbMiylpvwB
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8436dd91fc=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5TUXAVFTMRL22S5XZ6M4UT5NTQDVYBSJ
X-Message-ID-Hash: 5TUXAVFTMRL22S5XZ6M4UT5NTQDVYBSJ
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:56:48 +0000
CC: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TUXAVFTMRL22S5XZ6M4UT5NTQDVYBSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 3/6/23 03:26, Charles Keepax wrote:
> On Fri, Mar 03, 2023 at 01:21:50PM -0600, Vlad Karpovich wrote:
>> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
>>
>> The CS35L45 digital core incorporates one programmable DSP block,
>> capable of running a wide range of audio enhancement and speaker
>> and battery protection functions.
>>
>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>> ---
>> +#define CS35L45_DAC_MUX_ROUTE(name) \
>> +	{ name" Source", "ASP_RX1",	"ASP_RX1" }, \
>> +	{ name" Source", "ASP_RX2",	"ASP_RX2" }, \
>> +	{ name" Source", "DSP_TX1",	"DSP1" }, \
>> +	{ name" Source", "DSP_TX2",	"DSP1" }
>> +
>> +
> Minor nit, double blank line here.
Thanks. I will fix it
> But otherwise looks pretty good to me:
>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Thanks,
> Charles
