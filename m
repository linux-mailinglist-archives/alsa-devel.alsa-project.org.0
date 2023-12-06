Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57690806BF5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 11:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C64843;
	Wed,  6 Dec 2023 11:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C64843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701858743;
	bh=NFl+mbvoMNS8wxDmYEmoRjRp6vkU1UnB6ICLcnAM5qg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L3l/jjI5qqlX+KCC+ms0tHeFp9C7Ff93K1xA3J5m4rb5CpCpjZ9mb1IOGPnSWoqRH
	 sTW+b+7T1HJ4Zfs3m/QwdzTs0kcxA2C13A956fCWZYsmFBr3GpNwI3wR9mTL0GzcKg
	 3yMcDjAXQgQAMtchO/7aRS+lRHiCbXamCAZX69pI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 542A1F80563; Wed,  6 Dec 2023 11:31:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAEE4F80571;
	Wed,  6 Dec 2023 11:31:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB70F8024E; Wed,  6 Dec 2023 11:31:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 914DEF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 11:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914DEF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UNymrqhC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B66wlV2008583;
	Wed, 6 Dec 2023 04:31:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Q8Prs/h/LBZBHu2
	X26279ScnMXUVfG2/uY3JmTlxO2Y=; b=UNymrqhCUIB6lNf8Lcwa+uSo7o/a4ON
	gw55wyL5yqG1ICr2zg2KKAH3R93cNLbzavKK3bb0LNrVL0x4FT5tLaAK9SVsut6b
	DOT2hKCSfQ3nX337s+82moxiGV0yoQwrcbXd+zrSnfVxkrV/XWnG01Xh0kXoUral
	9yLRF2jnNCB2yizvvmhgjkePTfib9CDYcGx/tAtxRvGADQbXKtKn63CXfABU12ar
	EKhQ6xEdF+woTN9knAdlfUmMQDoCxk9UuTTqe38/A+kBLE3c4VbnpC62WWOihSfO
	NGiqlU3ucJRijjCPMQNPhapsrYjqMJMaJnXhpqUAIYKy3tAp4koK2bQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47rhfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 04:31:07 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 10:31:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 6 Dec 2023 10:31:05 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1D718468;
	Wed,  6 Dec 2023 10:31:05 +0000 (UTC)
Date: Wed, 6 Dec 2023 10:31:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <bard.liao@intel.com>, <mengdong.lin@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Message-ID: <20231206103105.GJ14858@ediswmail.ad.cirrus.com>
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
 <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
 <20231205162838.GH14858@ediswmail.ad.cirrus.com>
 <8e3a9bc0-9f79-4419-a677-5f92f9bf04b7@linux.intel.com>
 <20231206094701.GI14858@ediswmail.ad.cirrus.com>
 <4b1f9979-2dc4-400e-a283-714d466ab666@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b1f9979-2dc4-400e-a283-714d466ab666@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: dMMKqCmyrgMpfIJbvsu78EBkZ5Kv6DsX
X-Proofpoint-ORIG-GUID: dMMKqCmyrgMpfIJbvsu78EBkZ5Kv6DsX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UJS7Z4PSRHEVICDYDWBEBQRRL366BLTQ
X-Message-ID-Hash: UJS7Z4PSRHEVICDYDWBEBQRRL366BLTQ
X-MailFrom: prvs=77042597b4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJS7Z4PSRHEVICDYDWBEBQRRL366BLTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 11:09:29AM +0100, Jaroslav Kysela wrote:
> On 06. 12. 23 10:47, Charles Keepax wrote:
> >On Tue, Dec 05, 2023 at 11:11:03AM -0600, Pierre-Louis Bossart wrote:
> >>On 12/5/23 10:28, Charles Keepax wrote:
> >>>On Tue, Dec 05, 2023 at 09:25:27AM -0600, Pierre-Louis Bossart wrote:
> >>>>On 12/5/23 08:24, Charles Keepax wrote:
> >I get that, but once you have added those you still have the
> >issue HiFi.conf will load the speaker use-case as follows:
> >
> >False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"
> 
> This is a good question. From the maintainer POV, I would prefer to
> use conditionals (join the common code) also for other codecs, so I
> vote to remove SpeakerAmps1 substitution from the filename for all
> codecs.

Ok I think for now I will add a conditional to drop the
SpeakerAmps1 just for the cs35l56, there are 3 realtek devices that
also use this stuff. They look slightly more complex than the
Cirrus case, although maybe doable with conditionals. But I will
leave those for people with the hardware to look at.

Thanks,
Charles
