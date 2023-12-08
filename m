Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4D80A2C7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 13:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED30083B;
	Fri,  8 Dec 2023 13:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED30083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702037154;
	bh=4eFpStMF1jVizONtNGiUa7ya+nOEDJ0bzDnmGYz6OEU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fOJA+eYbUUvPhnhcOuPIzHGINGJ71TpXMn3izN1llmTzWwRWz1CO47k38WL0UjeiL
	 ZRANv5VEQefpz4ZqaCVpPsk4U4ALKAlgvDFwXnK9LQINK+3UMmH4LeuAYWSPj4KU3y
	 QVAPvUCqn5a+gwCM+kyIYkmdl+UUIjqxyIveGuJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2430CF8057D; Fri,  8 Dec 2023 13:05:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE501F80570;
	Fri,  8 Dec 2023 13:05:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E57C4F8024E; Fri,  8 Dec 2023 13:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0575F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 13:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0575F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=A368pSqZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B88l9jb023016;
	Fri, 8 Dec 2023 06:00:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=9GW5kseewsSdimO
	HjjCyZGMTY+S2hWZScdFmdQ7AWEA=; b=A368pSqZMbZCrOl5tt1F3rS0OCS4dcG
	hBErgWoJJlbMvzbS1/wADkxOegnhfv0wesXqs247k4D+f1JWkXNVUVcz6KBN6iKb
	xfTEnaWKgH7Lq5EdM1jsiRHoIwP53U22nW4e5YFexyYj7q4gbWUdOlFcNSRd5ndb
	KjnSpfiF4/20qa08aGZDCOc8FxE4Ukp+jWDBpkeyZHWvf6E198wXx2UFDxt9mcWx
	imaPZRMzCiY14NHkeJTo8evz3rhJXHlYD+PY7sf1uQDWnVBT9aJtR+QORqlQJwaX
	euXsV8BRtHsfEy/Hyh2gldcthhL6O9FZ8rEVDBhin3p1Cm+AMfUhCGQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1wbepk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:00:28 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 12:00:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 8 Dec 2023 12:00:27 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E8F85468;
	Fri,  8 Dec 2023 12:00:26 +0000 (UTC)
Date: Fri, 8 Dec 2023 12:00:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add basic support
 for cs42l43
Message-ID: <20231208120026.GO14858@ediswmail.ad.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
 <20231207095524.GM14858@ediswmail.ad.cirrus.com>
 <d3ed56d5-2b1a-4626-8b18-0f9c8bb48c73@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d3ed56d5-2b1a-4626-8b18-0f9c8bb48c73@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: mSAo7EtdsRd586E-xyb8i_OpAHRsx3jH
X-Proofpoint-ORIG-GUID: mSAo7EtdsRd586E-xyb8i_OpAHRsx3jH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: H4ASUFUOSUVCSZHKEMQQOFNMNRZBOHUD
X-Message-ID-Hash: H4ASUFUOSUVCSZHKEMQQOFNMNRZBOHUD
X-MailFrom: prvs=77069abca2=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4ASUFUOSUVCSZHKEMQQOFNMNRZBOHUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 07, 2023 at 02:56:17PM +0100, Jaroslav Kysela wrote:
> On 07. 12. 23 10:55, Charles Keepax wrote:
> >On Wed, Dec 06, 2023 at 06:26:17PM +0100, Jaroslav Kysela wrote:
> >>On 06. 12. 23 17:46, Charles Keepax wrote:
> >Oh, I was not aware we could do that. I would yes much rather
> >handle the switches and volumes in this way. I will see if I can
> >figure it out, but if you had any good examples that already
> >exist that would really be handy?
> 
> You may look for "LibraryConfig.remap.Config" and
> "Include.ctl-remap.File" strings in .conf files.

Apologies still struggling to get this working. I think there must
some important boiler plate or limitation I am missing. Would really
appreciate if you could have a look at this and let me know if it
looks sane. I am starting out with just the simplest thing I can
think of, just trying to rename a control:

LibraryConfig.remap.Config {
	ctl.default.remap {
		"name='cs42l43 PDM2 Switch'" "name='cs42l43 Decimator 3 Switch'"
	}
}

SectionDevice."Mic"
{
	Comment "Microphones"

	EnableSequence
	[
		cset "name='cs42l43 PDM2 Switch' 1"
	]

	DisableSequence
	[
		cset "name='cs42l43 PDM2 Switch' 0"
	]

	Value
	{
		CapturePriority 100
		CapturePCM "hw:${CardId},4"
	}
}

Everything works as expected if I use "cs42l43 Decimator 3 Switch"
directly in the use-case, however if I use "cs42l43 PDM2 Switch"
I get the error:

ALSA lib main.c:826:(execute_sequence) unable to execute cset 'name='cs42l43 PDM2 Switch' 0'
ALSA lib main.c:2573:(set_verb_user) error: failed to initialize new use case: HiFi

The LibraryConfig bit doesn't seem to cause any errors in its own
right, but the error messae suggests to me it didn't add the alias
for the control. I have tried a lot of variations on the code,
but I can't seem to locate what I am doing wrong.

Also if there are any docs I should read happy to go there first?

Thanks,
Charles
