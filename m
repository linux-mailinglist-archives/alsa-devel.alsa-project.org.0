Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4690509F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 12:44:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CC3DE5;
	Wed, 12 Jun 2024 12:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CC3DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718189053;
	bh=ysAXpRLhIcT/GOAm7v/+Clr4iJrJuvUTzEBkH6BAlaE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N5UGchQuTNDTNHXwmnZDWhrcynYRq50F3lfxm7KEGxku0qov0cNYX/L4uSblO6SZo
	 DokBqnaO+xQcip061TMAPmjPrgHSpSMFTFQW66uR4PjSB1RRPp114hADlqGFSqvMtb
	 uPPEZ0d0uKV8sXqt0jRjVcBvTNQbuFuma1owUZZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CA0CF8010C; Wed, 12 Jun 2024 12:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B973F805B3;
	Wed, 12 Jun 2024 12:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CC2DF8057A; Wed, 12 Jun 2024 12:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60900F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 12:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60900F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FDP387qa
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45C30uPm015315;
	Wed, 12 Jun 2024 05:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GB7rgou2Iel3eL2Pod465DGSIZnJ8g2kdqSbhokKaDo=; b=
	FDP387qawdvdjsY/G6Px6OYneGHTYH3KsLCn1IlrgtmL1dl/co5vN79AI/prskd7
	JB8UrhAbzj0aRJY6G/vfZg8fhp5xS0MJvhF89Qiaed5XEFXz5UHo+Kj1jZoGt8z0
	vdc+/H/z55mIuDnRnS+szx6/G2NlO0rGKbcfVb3nhIY1BftE7B5AOKP/ZIiURhPs
	DquddngIVGznY4waLw/vyuN9LzWMIgaG8WfrfniVA+uB5l9L62O/hPzQWYO+7pi5
	/X7m6cfzXrQxjx+BE0WRvRjX8VFT/wPUvw/WtJfA+hR2u/ErHMYrVRGVTXAKTNib
	ya9yYJMuB6qWoFGDpJ4qng==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhuvrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:42:17 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 11:42:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 12 Jun 2024 11:42:15 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 941D2820248;
	Wed, 12 Jun 2024 10:42:15 +0000 (UTC)
Message-ID: <92f2d6c6-2d63-42eb-ae91-59a14831145a@opensource.cirrus.com>
Date: Wed, 12 Jun 2024 11:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
 <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
 <36219997-397b-4a26-96ee-7527fb6eb024@opensource.cirrus.com>
 <Zml2FfjbO4Vgk0jy@finisterre.sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Zml2FfjbO4Vgk0jy@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G7tYJZmFjGeC2vFlZ_S6TRIyENKswo-P
X-Proofpoint-ORIG-GUID: G7tYJZmFjGeC2vFlZ_S6TRIyENKswo-P
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FF6WX4IMYBBITAEKV32EEDZ66FMVTNU6
X-Message-ID-Hash: FF6WX4IMYBBITAEKV32EEDZ66FMVTNU6
X-MailFrom: prvs=3893b14233=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FF6WX4IMYBBITAEKV32EEDZ66FMVTNU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 11:19, Mark Brown wrote:
> On Wed, Jun 12, 2024 at 10:19:06AM +0100, Richard Fitzgerald wrote:
>> On 11/06/2024 17:12, Mark Brown wrote:
> 
>>> This doesn't seem particularly different to any other unhelpful chip
>>> default, I'm not sure why it'd be so urgent that we'd hard code a
> 
>> I'm not sure I understand the objection here. Are you objecting to the
>> patch itself, or that I marked it as a Fixes?
> 
> Both I guess, but mainly the patch itself - we generally have an
> extremely high bar for setting defaults different to the chip defaults
> to avoid issues with differing use cases.

But that's somewhat part of the problem. There's no such thing as a chip
default for the cs35l56 because for Windows reasons the firmware patches
up all the registers on boot to setup a hardcoded use-case configuration
so that the Windows SDCA drivers can be generic and don't need knowledge
of chip-specific registers. The firmware is customized per end-product,
so the initial register state can vary.

The driver currently attempts to sync-up the mixer registers with what
the firmware set them to, which means that the initial starting state
of the ALSA controls can vary between products using the cs35l56, and
in theory even between revisions of the firmware if there was a need
to change the routing setup for Windows. We don't really need to do
that on Linux - it has a use-case manager and ALSA controls for this
stuff, and the code to do all the syncing-up adds a lot of driver
complexity. We want to remove that complexity, and instead patch the
registers back to silicon defaults - obliterate the Windows use-case
setup and use standard Linux mechanisms to setup what is required.

However, the mixer settings were already causing a bunch of log
warnings. So I decided to split this fix off so it's not dependent on a
big code revert.

I can send a V2 of this patch with this long explanation of the
background. I didn't put it all in V1 because it never occurred to me
that defaulting the mixer sources would be controversial.
