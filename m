Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D980850C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 10:58:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631DF83A;
	Thu,  7 Dec 2023 10:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631DF83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701943080;
	bh=cod6wYv9nnWe7Gc8X+kiXgnwpo2dZV7vFtL+t3fm03I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WSN8yuT5Ufmlbt5qmtKbhJieB5zCidWzQo4V0rKoTFXfbeyjA7/asjrbmsy3mMhHO
	 d4MIBs+zqC/D8U3WbtlmXsu+Cxq68DwUSiI+jnqrHjM+N0oS/8xTDebAnyqg+Oji8S
	 U8S8K0+KM/trpzp6jDardh1ZWz0wO8GTBRdNaz9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1910DF8057B; Thu,  7 Dec 2023 10:57:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF725F80557;
	Thu,  7 Dec 2023 10:57:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8236FF8025A; Thu,  7 Dec 2023 10:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABE76F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 10:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE76F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PEFsuTdW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B77t62c008108;
	Thu, 7 Dec 2023 03:57:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=YfcKoMvuZAqNLAn
	yxZ2fOjLzUfDc02Fc//KegTYWIjA=; b=PEFsuTdWLACwvne3fGlh57/tFr+H/As
	9+RvkEK55kATV/opuP9btxiKSH70zfMUvpq7xzuZ/rydDXKbX070crL6Xt8JJ1zY
	//abrf4n1VEpVSGxciwxencCbn0Zvvo63n91qIXoRPnDJ5+3JBk1iDsfRA88WU2J
	BJhKvBbpMahTT/SE0rnf1ZX91gNm3YJqTgdqxL2/BhO/NcPDkuG9coIsFe6s0oPc
	95Fbzw2EbSKYTPKMZU2xD2sVwo6QCWUI3ebC+N1sdm1dikApI1e8tgmYuzINm5c9
	7LhWzMu6r8LwhBtPD02LQjYVSp4Ua1bPjuAmhFMsXnmzMchlydW9Dbw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47sy5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 03:57:07 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 09:57:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 7 Dec 2023 09:57:05 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 65B3D11AB;
	Thu,  7 Dec 2023 09:57:05 +0000 (UTC)
Date: Thu, 7 Dec 2023 09:57:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v3 2/2] sof-soundwire: Add basic support
 for basic cs35l56 configurations
Message-ID: <20231207095705.GN14858@ediswmail.ad.cirrus.com>
References: <20231206164612.1362203-1-ckeepax@opensource.cirrus.com>
 <20231206164612.1362203-2-ckeepax@opensource.cirrus.com>
 <f0174ff1-3ee0-4e83-9a4d-c414922c0471@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f0174ff1-3ee0-4e83-9a4d-c414922c0471@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8mkFOZbywJNokJkMxP4uv_aA2kdDL-hv
X-Proofpoint-ORIG-GUID: 8mkFOZbywJNokJkMxP4uv_aA2kdDL-hv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X2AJA7M646L4D6WUYSYRHKZOKFXQQVTA
X-Message-ID-Hash: X2AJA7M646L4D6WUYSYRHKZOKFXQQVTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2AJA7M646L4D6WUYSYRHKZOKFXQQVTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 06:46:18PM +0100, Jaroslav Kysela wrote:
> On 06. 12. 23 17:46, Charles Keepax wrote:
> >cs35l56 is a boosted speaker amp, add UCM support for configurations
> >with up to 8 amps.
> >
> >Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >---
> >
> >Changes since v2:
> >  - Rebased on top of conversion of the Realtek amps.
> >  - Add a macro for each amp to simplify things a bit.
> 
> Thanks. This patch was inspiration for me. Could you check
> modifications in
> https://github.com/alsa-project/alsa-ucm-conf/pull/370 ? We can use

Some comments on the Github, would you rather I submitted my
patches through a github pull request as well? I am happy using
either that or email to submit the patches, so if you have a
preference I will do that.

Thanks,
Charles
