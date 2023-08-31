Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CB791723
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 150E5A4A;
	Mon,  4 Sep 2023 14:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 150E5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830850;
	bh=bz3V/EyLgfL23DZaVfKZ/qv6E7Au5iTDNPzKtvGcP/g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nwZUWoAafnOY6eB4JVQFgs8F936FLEGywfccXvsvksHLX2zedwRyUnaqykT9seNTi
	 AgfgmwWUclDYIg/Rjyy6u3uoVTHwSRokkywaw9YT8nVz1WTQ0Jm4vc6sBmf8awlm+P
	 gceYtFp381ILkzUsyGrQTTlwBEQMczZpRn7G6VfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A84F8057C; Mon,  4 Sep 2023 14:32:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B4CAF80571;
	Mon,  4 Sep 2023 14:32:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E8FF80155; Thu, 31 Aug 2023 18:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D85E0F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 18:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85E0F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=K9n+ai4I
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37VF9loi009908;
	Thu, 31 Aug 2023 11:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=bz3V/EyLgfL23DZaVfKZ/qv6E7Au5iTDNPzKtvGcP/g=; b=
	K9n+ai4Ijb2tPM6j4UmzEAb//C0l49yHS23KoHHMspuWYaz07g0Fqm2Es8EIjBCP
	A5clXWWFgidz25jbG5ph4mBibKwSW1JPIUSMvs79tuUy7j7iDEeOG+K5OkRmE8PW
	WJtVhh9nl7s1DdqHh7wRQsXMDU9pF2DKlXHOKTAgZxsCsX+gqKfbCJGjcdEVFtj8
	Uk1hTtJzfWOtIHpGIZQ0pxdEHr1ySMLMzZuvJ1Tix/UaP4LxThjqjAIE4ceqKup8
	O0CFp6nDWBG7lWw5Z/oRrfp2Bm65EjwINyd5Ad05VM2EdCW7yjyLLZm9BRHadF72
	iiHzPmMvXh9Cj53bHmPrpQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyen1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 11:08:04 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 31 Aug
 2023 17:08:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 31 Aug 2023 17:08:02 +0100
Received: from [141.131.145.49] (vkarpovich-ThinkStation-P620.ad.cirrus.com
 [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE36511D4;
	Thu, 31 Aug 2023 16:08:00 +0000 (UTC)
Message-ID: <f3514c7b-ad99-b77b-fc61-87fdce7e414b@opensource.cirrus.com>
Date: Thu, 31 Aug 2023 11:08:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
CC: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
 <737c4114-5b54-444c-8a6a-de4e98566513@sirena.org.uk>
 <5B0EB2A2-2048-4A71-A4A9-D5167C7AB5EC@opensource.cirrus.com>
 <d97094c6-1534-05ad-0452-c627d7c45802@opensource.cirrus.com>
 <def16e52-3ba9-475d-9d8f-63513c47a392@sirena.org.uk>
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <def16e52-3ba9-475d-9d8f-63513c47a392@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qOpifSmRjr64Zloc_0OawHLTEoqigudO
X-Proofpoint-GUID: qOpifSmRjr64Zloc_0OawHLTEoqigudO
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4607c60d60=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DE2TX6MMXIA6RIFSMNWWY6VDZTCPLJ7L
X-Message-ID-Hash: DE2TX6MMXIA6RIFSMNWWY6VDZTCPLJ7L
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:32:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DE2TX6MMXIA6RIFSMNWWY6VDZTCPLJ7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/31/23 11:05, Mark Brown wrote:
> On Thu, Aug 31, 2023 at 04:22:52PM +0100, Richard Fitzgerald wrote:
>
>> I think Mark's comment is that the Signed-off-by chain doesn't match
>> the patch author. The s-o-b order implies that Ricardo wrote it and
>> Vlad is upstreaming it - but in that case this email should start with
>> a From: line to say that the author is Ricardo.
> Yes, that's what I'm querying.
Ok. I will update the author
