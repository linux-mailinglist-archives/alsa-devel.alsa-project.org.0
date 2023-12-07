Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B7808504
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 10:56:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8988E850;
	Thu,  7 Dec 2023 10:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8988E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701942996;
	bh=ELn6tskRuIXZ0MjD6/C3JdIPTc/pBmm7kVdi2o6BHXM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QXmisQBiu7NFiaFxEYqjV5v4Tj27ZLzTS8KBsNy4tgSQnFl6oVOC8EIRzgKXV8deo
	 UQsZplm7G7rDrE9OgA9rEVYnd62076CRq3BpOGsTdkBC8vzC97bNZrAQgJi8RJHaM8
	 qIDBN8UGMOvNSP+ErBizKpwAZifA+N1rIFQObBLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92332F80580; Thu,  7 Dec 2023 10:56:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A523F80571;
	Thu,  7 Dec 2023 10:56:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFFFEF8024E; Thu,  7 Dec 2023 10:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 572ECF800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 10:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572ECF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BUnUcoO1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B76OS40010941;
	Thu, 7 Dec 2023 03:55:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=KjBSDNXSl6eV2Hf
	IoeGoQGj1lBr4vKGApGNShpRSW74=; b=BUnUcoO1gDm/jm3k1o59+hGlfH8cSmp
	X/oq+nPhWTC3Fky+Yq6NrtyyrsdpS8dHoUB/nqK4rTNiFYUmcRv8/8xZ6154L/pt
	9IdwKupuJmwVvWO5YIwVxvx08oyUPih55EM4hFK07Zvu5W2qFMp9l91efPaPXFP/
	rByTtO/2bBFqdEit6ItQnYeG2Juxkqs8P5i2/RI6QBpYvSx8ncFOwPOLiYGadi2m
	xhiNTvrquiyNsQMdee9u+mA+Rd696ku9uSYHA6vB0urCU9HmnANPtDN0NLnriQNc
	geM+TOomIPX1ffzhwmM+GlYQBijMXDzHMY59xU5P2+wErg0UTZVFoEg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47sy3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 03:55:27 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 09:55:24 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 7 Dec 2023 09:55:24 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A97B111AB;
	Thu,  7 Dec 2023 09:55:24 +0000 (UTC)
Date: Thu, 7 Dec 2023 09:55:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Add basic support
 for cs42l43
Message-ID: <20231207095524.GM14858@ediswmail.ad.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <adef7c2f-7c52-46b4-b595-cbf8970b273b@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: DbXeBGWCK9lm-9fgHV7TEEnqculmgzFm
X-Proofpoint-ORIG-GUID: DbXeBGWCK9lm-9fgHV7TEEnqculmgzFm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QCVBVHAGIHP363WMR2PCH6M3NGZKZR34
X-Message-ID-Hash: QCVBVHAGIHP363WMR2PCH6M3NGZKZR34
X-MailFrom: prvs=770564f238=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCVBVHAGIHP363WMR2PCH6M3NGZKZR34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 06:26:17PM +0100, Jaroslav Kysela wrote:
> On 06. 12. 23 17:46, Charles Keepax wrote:
> >cs42l43 is a codec device, add basic support for it. Including a dual
> >channel DMIC input, stereo headphones, and a mono headset microphone.
> >
> >Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >---
> >+	Value {
> >+		CapturePriority 100
> >+		CapturePCM "hw:${CardId},4"
> >+	}
> >+}
> 
> Just curious: Why dmic input does not have Decimator switch/volume
> controls like Headset output?
> 
> We can combine mono controls to one stereo in latest UCM.

Oh, I was not aware we could do that. I would yes much rather
handle the switches and volumes in this way. I will see if I can
figure it out, but if you had any good examples that already
exist that would really be handy?

Thanks,
Charles
