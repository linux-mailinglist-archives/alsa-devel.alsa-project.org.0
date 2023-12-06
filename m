Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780D806B09
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 10:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E53832;
	Wed,  6 Dec 2023 10:48:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E53832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701856100;
	bh=48rzpqL3wpszd83a4eOYDqhfLuXQgw1bfWK67+px5yw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aEOO3j44Ri3pjpovtgpshEIqYWkMdG8XqRr3IN90jVE0uvSzNkNmX4pLqDvSYLctL
	 vfRMJ3ARxQ3Xrhcy0oIHR++aPxb3BEzxAEhvxW3VnSxqU04F75hb/nFhlBGjhKnDue
	 W2Rb7Gi1B5O5SegSb3L/3L2/Pr8/Zyx5sjfhG8i8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCFEDF80571; Wed,  6 Dec 2023 10:47:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB2CF80578;
	Wed,  6 Dec 2023 10:47:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 861AAF8025F; Wed,  6 Dec 2023 10:47:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 20C98F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 10:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C98F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SIjaP9oi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B69KG8u027934;
	Wed, 6 Dec 2023 03:47:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=xwf0J6A6qpmUUuz
	iT0UIirzOtu7qCUvhgRiHPkXKvro=; b=SIjaP9oij6rZw1CeX/CbpiWbhwpQqx0
	qluiH3Y03LceLOA8HkwV1MiAvPUK2hp3ay/fKj+PJXNpAuEmvzqwDSD5ZJdNNvbV
	SMPejNPSg0oZbkdx7C+jaPAEp4m0lvoFVtyKmjPI5DLsGYW9rTPdRRXlDWd+Q1Tw
	Io9nq8aSodjrv7WGgntPpNOY8uPEpMhJavRnFQuM/PxFq0GjVmfg3WJQsv4qmCPn
	2unigXBtGhfi9SCyG+UMXbAyq3EU8vhnfOc2oU21ehEw+u5cYn2HzwfPri5V/uMR
	fsuvhmPTyBZeL99vNdIQQKnyLLdCZxA6e/WZTYSRj9JRswe2NHtBXSg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1w8g1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 03:47:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 09:47:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 09:47:01 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B6DD711D1;
	Wed,  6 Dec 2023 09:47:01 +0000 (UTC)
Date: Wed, 6 Dec 2023 09:47:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <perex@perex.cz>, <bard.liao@intel.com>, <mengdong.lin@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Message-ID: <20231206094701.GI14858@ediswmail.ad.cirrus.com>
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
 <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
 <20231205162838.GH14858@ediswmail.ad.cirrus.com>
 <8e3a9bc0-9f79-4419-a677-5f92f9bf04b7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8e3a9bc0-9f79-4419-a677-5f92f9bf04b7@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8muL5TDftWBxxKshFX5QwA4lduBrFFrc
X-Proofpoint-ORIG-GUID: 8muL5TDftWBxxKshFX5QwA4lduBrFFrc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZFJHTS4ZZRMETMWHLYY4HCLVIASYH5RN
X-Message-ID-Hash: ZFJHTS4ZZRMETMWHLYY4HCLVIASYH5RN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFJHTS4ZZRMETMWHLYY4HCLVIASYH5RN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 05, 2023 at 11:11:03AM -0600, Pierre-Louis Bossart wrote:
> On 12/5/23 10:28, Charles Keepax wrote:
> > On Tue, Dec 05, 2023 at 09:25:27AM -0600, Pierre-Louis Bossart wrote:
> >> On 12/5/23 08:24, Charles Keepax wrote:
> >>> +	EnableSequence [
> >>> +		cset "name='AMP1 Speaker Switch' 1"
> >>> +		cset "name='AMP2 Speaker Switch' 1"
> >>> +		cset "name='AMP3 Speaker Switch' 1"
> >>> +		cset "name='AMP4 Speaker Switch' 1"
> >>> +	]
> >>
> >> If we only need an on/off switch, I wonder if this can be made
> >> conditional, i.e. enable/disable a control if it exists. That would
> >> scale to various numbers of amplifiers without a need to add a 2-amp, 6
> >> or 8-amp configuration.
> > 
> > I think that is possible, would you lean towards modifying
> > HiFi.conf to only include a single file for cs35l56, or would you
> > lean more towards having each cs35l56-x.conf file include a
> > single base file?
> 
> I wasn't referring to partitioning of files, rather the conditional UCM
> syntax,
> 
> Condition {
> 	Type ControlExists
> 	Control "name='AMP4 Speaker Switch'"
> }
> 

I get that, but once you have added those you still have the
issue HiFi.conf will load the speaker use-case as follows:

False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"

Meaning the number of amps will be part of the file name
requested. So my question was how you wanted to deal with that?
Personally I would lean towards just having all the
cs35l56-8.conf, cs35l56-6.conf etc. include a cs35l56-base.conf.
Its slightly more files, but feels a bit less crufty than having
a special case for cs35l56 to not include the number of amps in
the filename.

Thanks,
Charles
